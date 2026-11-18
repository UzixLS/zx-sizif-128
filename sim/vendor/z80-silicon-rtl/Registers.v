// ==============================================================================
//
// Project: Z80 NMOS Silicon-to-RTL CPU Core
//
// Description: Fully synchronous, cycle-accurate NMOS Z80 drop-in replacement.
//              Meticulously reconstructed and translated from a transistor-level
//              netlist into a clean, latch-free synchronous RTL design.
//
// Component: Registers.v (Register File)
//
// Version: 1.0.0
//
// Engineer: Andrey Titov (dr.Titus)
// Create Date: 2024-10-18
// Release Date: 2026-11-13
//
// References: 
//   - Project repository: https://github.com/dr-Titus/z80-silicon-rtl/ 
//
// Copyright (c) 2022-2026 Andrey Titov (dr.Titus). All rights reserved.
// This source code is licensed under the GNU General Public License v3 (GPL v3).
//
// ==============================================================================

//----------------------------------------------------------------------
//
//                          Модуль банка регистров                  
//
//----------------------------------------------------------------------
module Registers(                                               // Модуль банка регистров
    input       clk,                                            // Тактовый сигнал
    input       sel_af,                                         // Сигнал выбора регистра AF
    input       sel_af_,                                        // Сигнал выбора регистра AF'
    input       sel_hl,                                         // Сигнал выбора регистра HL
    input       sel_hl_,                                        // Сигнал выбора регистра HL'
    input       sel_de,                                         // Сигнал выбора регистра DE
    input       sel_de_,                                        // Сигнал выбора регистра DE'
    input       sel_bc,                                         // Сигнал выбора регистра BC
    input       sel_bc_,                                        // Сигнал выбора регистра BC'
    input       sel_ix,                                         // Сигнал выбора регистра IX
    input       sel_iy,                                         // Сигнал выбора регистра IY
    input       sel_sp,                                         // Сигнал выбора регистра SP
    input       sel_wz,                                         // Сигнал выбора регистра WZ
    input       sel_ir,                                         // Сигнал выбора регистра IR
    input       sel_pc,                                         // Сигнал выбора регистра PC
    
    input       sel_acc,                                        // Сигнал разьединения шин FBUS и HBUS
    input       join_rp,                                        // Сигнал обьединения основного банка регистров и банка регистров-указателей

    input       write_regh,                                     // Сигнал записи данных в старшую часть выбранного регистра с шины HBUS_IN
    input       write_regl,                                     // Сигнал записи данных в младшую часть выбранного регистра с шины HBUS_IN / FBUS_IN (только для F и F')
    input       write_pcr,                                      // Сигнал записи в регистр IR или PC
    input       read_regh,                                      // Сигнал чтения данных из старшей части выбранного регистра на шину HBUS_OUT
    input       read_regl,                                      // Сигнал чтения данных из младшей части выбранного регистра на шину HBUS_OUT / FBUS_OUT (только для F и F')

    input [7:0] data_in,                                        // Внешняя шина данных (ввод)
    input       sel_data_read,                                  // Сигнал чтения данных с внешней шины 

    input [7:0]   hbus_in,                                      // Шина данных для записи в регистры, старшая часть HBUS_IN
    input [7:0]   fbus_in,                                      // Шина данных для записи в регистры, младшая часть FBUS_IN (только для F и F')
    input [15:0]  pcrbus_in,                                    // Шина данных для записи в регистры IR и PC, или во все регистры при JOIN_RP = 1
    
    output [7:0]  hbus_out,                                     // Шина данных для чтения регистра, старшая часть HBUS_OUT
    output [7:0]  fbus_out,                                     // Шина данных для чтения регистра, младшая часть FBUS_OUT (только для F и F')
    output [15:0] pcrbus_out                                    // Шина данных для чтения регистров IR и PC, или всех регистров при JOIN_RP = 1
    );
     
    wire [7:0]  hmix_in;                                        // Шина мультиплексирования HBUS/DBUS
    wire [15:0] allbus;                                         // Шина обьединенного значения записи в два банка регистров
    wire [7:0]  regl;                                           // Внутренняя шина данных для записи регистров, младшая часть
    wire [7:0]  regh;                                           // Внутренняя шина данных для записи регистров, старшая часть
   
    wire [15:0] ptrmux_in;                                      // Шина для записи в регистры-указатели PTRMUX_IN
    wire [7:0]  ptrh;                                           // Половинки шины PTRMUX_IN
    wire [7:0]  ptrl;                                           //
    
    wire [15:0] regout;                                         // Шина результата чтения основных регистров
    wire [15:0] ptrout;                                         // Шина результата чтения регистров-указателей
    wire [15:0] regres;                                         // Шина результата прозрачного чтения основных регистров
    wire [15:0] ptrres;                                         // Шина результата прозрачного чтения регистров-указателей
    
    wire wr_regl;                                               // Сигнал записи в младшую половину регистра
    wire wr_regh;                                               // Сигнал записи в старшую половину регистра
    wire wr_ptrl;                                               // Сигнал записи в младшую половину регистра-указателя
    wire wr_ptrh;                                               // Сигнал записи в старшую половину регистра-указателя
     
    wire [15:0] allres;                                         // Шина обьединенного значения чтения из двух банков регистров
    wire [15:0] regbus_sum;                                     // Шина итогового значения для основных регистров
    
    reg [7:0] reg_a,                                            // Основной набор регистров, старший байт (High)
              reg_a_,                                           //
              reg_h,                                            //
              reg_h_,                                           //
              reg_d,                                            //
              reg_d_,                                           //
              reg_b,                                            //
              reg_b_,                                           //              
              reg_ixh,                                          //
              reg_iyh,                                          //
              reg_sph,                                          //
              reg_wzh;                                          //     
               
    reg [7:0] reg_f,                                            // Основной набор регистров, младший байт (Low)
              reg_f_,                                           //
              reg_l,                                            //
              reg_l_,                                           //
              reg_e,                                            //
              reg_e_,                                           //
              reg_c,                                            //
              reg_c_,                                           //              
              reg_ixl,                                          //
              reg_iyl,                                          //
              reg_spl,                                          //
              reg_wzl;                                          //                                       
   
    reg [7:0] reg_r,                                            // Набор регистров-указателей, младший байт (Low)
              reg_pcl;                                          //          
              
    reg [7:0] reg_i,                                            // Набор регистров-указателей, старший байт (High)
              reg_pch;                                          //                                   

//---------------------------------------------------------------------- Временная инициализация регистров

    initial
    begin
        reg_a   = 'h01;
        reg_h   = 'h02;
        reg_d   = 'h03;
        reg_b   = 'h04;
        reg_a_  = 'hE1;
        reg_h_  = 'hE2;
        reg_d_  = 'hE3;
        reg_b_  = 'hE4;
        reg_ixh = 'h05;
        reg_iyh = 'h06;
        reg_sph = 'h07;
        reg_wzh = 'h08;
        reg_r   = 'h09;
        reg_pch = 'h0A;
  
        reg_f   = 'h11;
        reg_l   = 'h12;
        reg_e   = 'h13;
        reg_c   = 'h14;
        reg_f_  = 'hF1;
        reg_l_  = 'hF2;
        reg_e_  = 'hF3;
        reg_c_  = 'hF4;
        reg_ixl = 'h15;
        reg_iyl = 'h16;
        reg_spl = 'h17;
        reg_wzl = 'h18;
        reg_i   = 'h19; 
        reg_pcl = 'h1A;  
        
    end


//---------------------------------------------------------------------- Запись в основной набор регистров
       
    assign hmix_in = sel_data_read ?                                    // Если активен сигнал чтения внешней шины данных SEL_DATA_READ,
                     data_in :                                          // то на шину HMIX_IN подается значение DATA_IN,
                     hbus_in;                                           // иначе на шину HMIX_IN подается значение HBUS_IN
    
	assign allbus = write_pcr ? pcrbus_in : {hmix_in, hmix_in};			// Если активна запись WRITE_PCR, то источником обьединенной шины является PCRBUS_IN,
																		// иначе источником является HMIX_IN
   
    assign regl = sel_acc ?                                             // Если активен SEL_ACC, то
                  fbus_in :                                             // на шину REGL выдается значение FBUS_IN,   
                  (join_rp ? allbus[7:0] : hmix_in);                    // иначе если не активен JOIN_RP, на шину REGL подается ALLBUS[7:0], иначе HMIX_IN

   
    assign regh = join_rp ?                                             // Если активен JOIN_RP,
                  allbus[15:8] :                                        // то на шину REGH подается значение ALLBUS[15:8],
                  hmix_in;                                              // иначе подается значение HMIX_IN
   
    assign wr_regl = (write_regl |                                      // Сигнал записи в младшую половину регистра
                     (write_pcr & join_rp));                            //
                     
    assign wr_regh = (write_regh |                                      // Сигнал записи в старшую половину регистра
                     (write_pcr & join_rp));                            //
   
    assign wr_ptrl = (write_pcr |                                       // Сигнал записи в младшую половину регистра-указателя
                     (write_regl & join_rp));                           //
                    
    assign wr_ptrh = (write_pcr |                                       // Сигнал записи в старшую половину регистра-указателя
                     (write_regh & join_rp));                           //
                   
   
   always @ (negedge clk)                                               // Запись в основной набор регистров, младшая часть (Low)
    begin
        if (wr_regl)                                                    // Если запись в младшую половину регистра, то
        begin
            if (sel_af)
                reg_f   <= regl;
            if (sel_af_)
                reg_f_  <= regl;
            if (sel_hl)
                reg_l   <= regl;
            if (sel_hl_)
                reg_l_  <= regl;
            if (sel_de)
                reg_e   <= regl;
            if (sel_de_)
                reg_e_  <= regl;
            if (sel_bc)
                reg_c   <= regl;
            if (sel_bc_)
                reg_c_  <= regl;
            if (sel_ix)
                reg_ixl <= regl;
            if (sel_iy)
                reg_iyl <= regl;
            if (sel_sp)
                reg_spl <= regl;
            if (sel_wz)
                reg_wzl <= regl;
        end
    end

    always @ (negedge clk)                                              // Запись в основной набор регистров, старшая часть (High)
    begin                                                               
        if (wr_regh)                                                    // Если запись в старпую половину регистра, то
        begin
            if (sel_af)
                reg_a   <= regh;
            if (sel_af_)
                reg_a_  <= regh;
            if (sel_hl)
                reg_h   <= regh;
            if (sel_hl_)
                reg_h_  <= regh;
            if (sel_de)
                reg_d   <= regh;
            if (sel_de_)
                reg_d_  <= regh;
            if (sel_bc)
                reg_b   <= regh;
            if (sel_bc_)
                reg_b_  <= regh;
            if (sel_ix)
                reg_ixh <= regh;
            if (sel_iy)
                reg_iyh <= regh;
            if (sel_sp)
                reg_sph <= regh;
            if (sel_wz)
                reg_wzh <= regh;
        end
    end

//---------------------------------------------------------------------- Запись в регистры-указатели
    
    assign ptrmux_in = join_rp ?                                        // Если активен JOIN_RP, то
                       allbus :                                         // на PTRMUX_IN подается ALLBUS,
                       pcrbus_in;                                       // иначе подается PCRBUS_IN
    
    assign ptrh = ptrmux_in[15:8];                                      // Определение половинок шины PTRMUX_IN
    assign ptrl = ptrmux_in[7:0];                                       //


    always @ (negedge clk)                                              // Запись в регистры-указатели, младшая часть (Low)
    begin
        if (wr_ptrl)                                                    // Если запись в младшую половину регистра-указателя, то
        begin
            if (sel_ir)
                reg_r   <= ptrl;
            if (sel_pc)
                reg_pcl <= ptrl;
        end
    end


    always @ (negedge clk)                                              // Запись в регистры-указатели, старшая часть (High)
    begin
        if (wr_ptrh)                                                    // Если запись в старшую половину регистра-указателя, то
        begin
            if (sel_ir)
                reg_i   <= ptrh; 
            if (sel_pc)
                reg_pch <= ptrh;
        end
    end
                                          
//---------------------------------------------------------------------- Формирование шин чтения регистров                                
      
    assign regout = ({reg_a,   reg_f}   & {16{sel_af}})  |              // Вывод обьединенного значения основного набора регистров на внутреннюю шину REGOUT
                    ({reg_a_,  reg_f_}  & {16{sel_af_}}) |              //
                    ({reg_h,   reg_l}   & {16{sel_hl}})  |              //
                    ({reg_h_,  reg_l_}  & {16{sel_hl_}}) |              //
                    ({reg_d,   reg_e}   & {16{sel_de}})  |              //
                    ({reg_d_,  reg_e_}  & {16{sel_de_}}) |              //
                    ({reg_b,   reg_c}   & {16{sel_bc}})  |              //
                    ({reg_b_,  reg_c_}  & {16{sel_bc_}}) |              //
                    ({reg_ixh, reg_ixl} & {16{sel_ix}})  |              // 
                    ({reg_iyh, reg_iyl} & {16{sel_iy}})  |              // 
                    ({reg_sph, reg_spl} & {16{sel_sp}})  |              // 
                    ({reg_wzh, reg_wzl} & {16{sel_wz}});                //       

    assign ptrout = ({reg_i,   reg_r}   & {16{sel_ir}}) |               // Вывод обьединенного значения регистров указателей на внутреннюю шину PTROUT
                    ({reg_pch, reg_pcl} & {16{sel_pc}});                //

                 
    assign regres[7:0]  = wr_regl ?                                     // Если идет запись в младшую часть регистра, то 
                          regl :                                        // включаем прозрачное чтение,
                          regout[7:0];                                  // иначе читаем регистр
    
    assign regres[15:8] = wr_regh ?                                     // Если идет запись в старшую часть регистра, то 
                          regh :                                        // включаем прозрачное чтение,
                          regout[15:8];                                 // иначе читаем регистр                    
                    
                                                         
    assign ptrres[7:0]  = wr_ptrl ?                                     // Если идет запись в младшую часть регистра-указателя, то 
                          ptrl :                                        // включаем прозрачное чтение,
                          ptrout[7:0];                                  // иначе читаем регистр-указатель                   
                        
    assign ptrres[15:8] = wr_ptrh ?                                     // Если идет запись в старшую часть регистра-указателя, то 
                          ptrh :                                        // включаем прозрачное чтение,
                          ptrout[15:8];                                 // иначе читаем регистр-указатель        
    
                                          
    assign allres = regres | ptrres;                                    // Шина обьединенного значения двух банков регистров

//---------------------------------------------------------------------- Вывод данных на шину PCRBUS_OUT 

    assign pcrbus_out = join_rp ?                                       // Если сигнал обьединения банков регистров JOIN_RP активен, то
                        allres :                                        // на шину PCRBUS_OUT выдается обьединенное значение REGRES и PTRRES,
                        ptrres;                                         // иначе на шину PCRBUS_OUT выдается значение PTRRES 
  
//---------------------------------------------------------------------- Вывод данных на шины HBUS_OUT/FBUS_OUT  
  
    assign regbus_sum = join_rp ?                                       // Если сигнал обьединения банков регистров JOIN_RP активен, то
                        allres :                                        // на шину REGBUS_SUM выдается обьединенное значение PTROUT и REGOUT,
                        regres;                                         // иначе на шину REGBUS_SUM выдается значение REGOUT  

  	assign fbus_out = regbus_sum[7:0];                                  // На шину FBUS_OUT всегда выдаем младшую часть REGBUS_SUM
                                                                                           
    assign hbus_out = (read_regh ?                                     // На шину HBUS_OUT выдается смесь данных с двух шин:
                       regbus_sum[15:8] : 0) |                         // Если активен READ_REGH, то данные со старшей части REGBUS_SUM,
                      ((read_regl & ~sel_acc) ?                        // Если активен READ_REGL и не активен SEL_ACC, то данные с младшей части REGBUS_SUM
                       regbus_sum[7:0] : 0);                           //
                                 
endmodule




