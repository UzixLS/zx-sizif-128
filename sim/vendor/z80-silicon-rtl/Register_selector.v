// ==============================================================================
//
// Project: Z80 NMOS Silicon-to-RTL CPU Core
//
// Description: Fully synchronous, cycle-accurate NMOS Z80 drop-in replacement.
//              Meticulously reconstructed and translated from a transistor-level
//              netlist into a clean, latch-free synchronous RTL design.
//
// Component: Register_selector.v (Register Selection Logic)
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
//                      Модуль выбора регистровых пар                   
//
//----------------------------------------------------------------------
module Register_selector(
    input        clk,                                           // Тактовый сигнал
    input        res,                                           // Сигнал сброса
    input [98:0] pla,                                           // Шина ПЛМ
    input [6:1]  t,                                             // Такты
    input [5:1]  m,                                             // Машинные циклы  
    input [2:0]  reg_n,                                         // Трехбитный код регистровой пары
    input        sel_reg_src,                                   // Сигнал выбора регистра-источника
    input        sel_reg_dst,                                   // Сигнал выбора регистра-приемника
    input        sel_pc_src,                                    // Сигнал выбора PC источником
    input        sel_pc_dst,                                    // Сигнал выбора PC приемником
    input        sel_acc,                                       // Сигнал выбора аккумулятора по умолчанию
    input        idx_set,                                       // Набор команд DD/FD (индексная адресация)
    input        grp_idx,                                       // Группа команд, работающая с индексной адресацией
    input        grp_wrdata,                                    // Группа команд, записывающих данные в память
    input        grp_dst_af,                                    // Группа команд с регистром-приемником AF
    input        grp_block,                                     // Группа блочных команд
    input        grp_m_hl,                                      // Группа команд, работающих с (HL)
    input        grp_sp,                                        // Группа команд, использующих стек (SP)
    input        grp_dir16,                                   	// Группа команд LD (nn),dd / LD dd,(nn)
    input        grp_store16,                                   // Группа команд LD (nn),dd 
    input        add_sub_hl,                                    // Группа команд ADD/SUB HL
    input        sel_rst_nmi_im1,                               // Группа команд RST/NMI/IM 1
    input        sel_im2,                                       // Сигнал прерывания IM2
   	input        join_rp,                                       // Сигнал обьединения основного банка регистров и банка регистров-указателей     
 
    output       sel_af,                                        // Сигнал выбора регистра AF
    output       sel_af_,                                       // Сигнал выбора регистра AF'
    output       sel_hl,                                        // Сигнал выбора регистра HL
    output       sel_hl_,                                       // Сигнал выбора регистра HL'
    output       sel_de,                                        // Сигнал выбора регистра DE
    output       sel_de_,                                       // Сигнал выбора регистра DE'
    output       sel_bc,                                        // Сигнал выбора регистра BC
    output       sel_bc_,                                       // Сигнал выбора регистра BC'
    output       sel_ix,                                        // Сигнал выбора регистра IX
    output       sel_iy,                                        // Сигнал выбора регистра IY
    output       sel_sp,                                        // Сигнал выбора регистра SP
    output       sel_wz,                                        // Сигнал выбора регистра WZ
    output       sel_pc,                                        // Сигнал выбора регистра PC    
    output       sel_ir                                        	// Сигнал выбора регистра IR
    );

    wire        req_af;                                         // Сигнал группы команд, запрашивающих регистр AF
    wire        req_hl;                                         // Сигнал группы команд, запрашивающих регистр HL
    wire        req_de;                                         // Сигнал группы команд, запрашивающих регистр DE
    wire        req_bc;                                         // Сигнал группы команд, запрашивающих регистр BC
    wire        req_sp;                                         // Сигнал группы команд, запрашивающих регистр SP
    wire        req_pc;                                         // Сигнал группы команд, запрашивающих регистр PC
    wire        req_dd;                                         // Сигнал группы команд, запрашивающих регистр HL/DE/BC/SP
    wire        req_qq;                                         // Сигнал группы команд, запрашивающих регистр HL/DE/BC/AF
    wire        req_idx;                                        // Сигнал группы команд, запрашивающих регистр IX/IY

    reg         switch_exaf = 1;                                // Триггер переключения банков AF (требует установки начального состояния)
    reg         switch_exx  = 1;                                // Триггер переключения банков HL/DE/BC (требует установки начального состояния)
    reg         switch_exde_base = 0;                           // Триггер переключения DE/HL для базового набора (требует установки начального состояния)
    reg         switch_exde_alt  = 0;                           // Триггер переключения DE/HL для альтернативного набора (требует установки начального состояния)
    reg         switch_idx;                                     // Триггер выбора набора регистров IX/IY 
                                          
    wire        sel_af_set;                                     // Промежуточные линии выбора регистровых пар 
    wire        sel_hl_set;                                     //
    wire        sel_de_set;                                     //
    wire        sel_bc_set;                                     //
    wire        sel_idx;                                        //
    wire        req_pair;                                       //
    wire        sel_hl_idx;                                     //
    wire        allow_idx;                                      //
    wire        mux_exx;                                        //
    wire        mux_hl;                                         //
    wire        mux_de;                                         //
    

//---------------------------------------------------------------------- Получение групповых сигналов

                                                                        // Сигнал группы команд, запрашивающих регистр HL/DE/BC/AF
    assign req_qq = (t[1] | t[3]) & (m[4] | m[5]) & pla[23];          	// POP dd / PUSH dd

                                                                        // Сигнал группы команд, запрашивающих регистр DE
    assign req_de = (m[3] & t[2] & pla[18]) |                           // LDI/LDD/LDIR/LDDR (Сохранить счетчик итераций BC)
                    (m[2] & t[3] & pla[18]);                            // LDI/LDD/LDIR/LDDR (Прочитать счетчик итераций BC)

                                                                        // Сигнал группы команд, запрашивающих регистр IX/IY
    assign req_idx = (m[2] & t[2] & grp_idx) |                          // Прочитать младший байт индексного указателя
                     (m[3] & t[3] & grp_idx);                           // Прочитать старший байт индексного указателя

    Dec_req_af dec_req_af(.pla(pla),                                    //
                          .t(t),                                        //           
                          .m(m),                                        //
                          .grp_dst_af(grp_dst_af),                      //
                          .grp_wrdata(grp_wrdata),                      //
                          .req_af(req_af));                             // Сигнал группы команд, запрашивающих регистр AF
                          
    Dec_req_hl dec_req_hl(.pla(pla),                                    //
                          .t(t),                                        //           
                          .m(m),                                        //
                          .grp_block(grp_block),                        //
                          .add_sub_hl(add_sub_hl),                      //
                          .grp_m_hl(grp_m_hl),                          //
                          .req_hl(req_hl));                             // Сигнал группы команд, запрашивающих регистр HL   

    Dec_req_bc dec_req_bc(.pla(pla),                                    //
                          .t(t),                                        //           
                          .m(m),                                        //
                          .grp_block(grp_block),                        //
                          .req_bc(req_bc));                             // Сигнал группы команд, запрашивающих регистр BC
                            
    Dec_req_sp dec_req_sp(.pla(pla),                                    //
                          .t(t),                                        //           
                          .m(m),                                        //
                          .grp_sp(grp_sp),                              //
                          .grp_wrdata(grp_wrdata),                      //
                          .sel_im2(sel_im2),                            //
                          .req_sp(req_sp));                             // Сигнал группы команд, запрашивающих регистр SP
   
    Dec_req_dd dec_req_dd(.pla(pla),                                    //
                          .t(t),                                        //           
                          .m(m),                                        //
                          .grp_dir16(grp_dir16),                    	//
                          .grp_store16(grp_store16),                    //
                          .add_sub_hl(add_sub_hl),                      //
                          .grp_wrdata(grp_wrdata),                      //
                          .req_dd(req_dd));                             // Сигнал группы команд, запрашивающих регистр HL/DE/BC/SP

    Dec_req_pc dec_req_pc(.pla(pla),                                    //
                          .t(t),                                        //           
                          .m(m),                                        //
                          .sel_rst_nmi_im1(sel_rst_nmi_im1),            //
                          .sel_im2(sel_im2),                            //
                          .grp_block(grp_block),                        //
                          .req_pc(req_pc));                             // Сигнал группы команд, запрашивающих регистр PC


//---------------------------------------------------------------------- Триггеры выбора набора регистров

    always @ (negedge clk)                                              // Триггер переключения банков регистров AF/AF' (/CLK)
    begin
        if (m[1] & t[1] & pla[39])                                      // EX AF,AF'
            switch_exaf <= ~switch_exaf;                              	// Поменять значение триггера на противоположное
    end

    always @ (negedge clk)                                              // Триггер переключения банков регистров HL/DE/BC /HL'/DE'/BC' (/CLK)
    begin
        if (m[1] & t[2] & pla[1])                                       // EXX
            switch_exx <= ~switch_exx;                                	// Поменять значение триггера на противоположное
    end

    always @ (negedge clk)                                              // Триггер переключения регистров DE/HL для основного набора (/CLK)
    begin
        if (m[1] & t[2] & pla[2] & switch_exx)                          // EX DE,HL
            switch_exde_base <= ~switch_exde_base;                    	// Поменять значение триггера на противоположное
    end

    always @ (negedge clk)                                              // Триггер переключения регистров DE/HL для альтернативного набора (/CLK)
    begin
        if (m[1] & t[2] & pla[2] & ~switch_exx)                       	// EX DE,HL
            switch_exde_alt <= ~switch_exde_alt;                      	// Поменять значение триггера на противоположное
    end
    
    always @ (negedge clk)                                              // Триггер выбора регистров IX/IY (/CLK)
    begin
        if (m[1] & t[2] & pla[3])                                       // DD/FD prefix
            switch_idx <= reg_n[2];                                     // Выбрать регистровую пару в зависимости от кода префикса DD/FD
    end


//---------------------------------------------------------------------- Логика выбора регистровых пар

    assign sel_af_set = ((((sel_reg_dst | sel_reg_src) & reg_n[0]) |    // Выбор регистровой пары AF
                           req_qq) & reg_n[1] & reg_n[2]) |             //       
                           sel_acc | req_af;                            //

    assign sel_af  = sel_af_set &  switch_exaf;                        	// Выбор регистровой пары AF/AF'
    assign sel_af_ = sel_af_set & ~switch_exaf;                       	//

    assign req_pair = sel_reg_dst | sel_reg_src | req_qq | req_dd;      // Выбор регистровой пары HL/DE/BC
    
    assign sel_de_set = (req_pair & reg_n[1] & ~reg_n[2]) |           	// Выбор регистровой пары DE
                        req_de;                                         //

    assign allow_idx = idx_set & ~grp_m_hl;                           	// Разрешить обращение к индексному регистру, если адресация не (ii+d)
    																	// (т.е. LD IX,nn - обращение к IX, а LD (IX+d),H, обращение к H

    assign sel_hl_idx = (req_pair & ~reg_n[1] & reg_n[2]) |           	// Выбор регистровой пары HL/IDX
                        req_hl;                                         //
                            
    assign sel_hl_set = sel_hl_idx & ~allow_idx;                      	// Выбор регистровой пары HL

    assign sel_bc_set = (req_pair & ~reg_n[1] & ~reg_n[2]) |        	// Выбор регистровой пары BC
                        req_bc;                                         //

    assign sel_idx = (sel_hl_idx & allow_idx) | req_idx;                // Выбор регистровой пары IX/IY

    assign mux_exx = (switch_exx ? switch_exde_base : switch_exde_alt); // Мультиплексор выбора наборов HL/DE/BC / HL'/DE'/BC'
    
    assign mux_hl = mux_exx ? sel_de_set : sel_hl_set;                  // Мультиплексор выбора HL/DE
    assign mux_de = mux_exx ? sel_hl_set : sel_de_set;                  //
                        
    assign sel_hl  = mux_hl &      switch_exx;                         	// Выбор регистровой пары HL/HL'
    assign sel_hl_ = mux_hl &     ~switch_exx;                        	//
    assign sel_de  = mux_de &      switch_exx;                         	// Выбор регистровой пары DE/DE'
    assign sel_de_ = mux_de &     ~switch_exx;                        	//
    assign sel_bc  = sel_bc_set &  switch_exx;                         	// Выбор регистровой пары BC/BC'
    assign sel_bc_ = sel_bc_set & ~switch_exx;                        	//

    assign sel_iy = sel_idx &  switch_idx;                             	// Выбор регистровой пары IX/IY
    assign sel_ix = sel_idx & ~switch_idx;                            	//
    
    assign sel_sp = (reg_n[1] & reg_n[2] & req_dd) |                    // Выбор регистровой пары SP
                    req_sp;                                             //
                    
    assign sel_pc = sel_pc_src | sel_pc_dst | req_pc;                   // Выбор регистровой пары PC               
                    
    assign sel_ir = (m[2] & t[3] & sel_im2) |                           // Выбор регистровой пары IR
                    (m[1] & t[4] & pla[4]) |                            // LD I/R,A / LD A,I/R                
                    ((t[2] | t[3]) & m[1]) |                            //
                    res;                                                //

    assign sel_wz = ~(req_pc | req_pair | req_sp | req_hl |             // Выбор регистровой пары WZ
                      req_de | req_idx  | req_bc | sel_ir |             //
                      sel_af_set);                                      // 
                                          			               			                 			  
endmodule




//----------------------------------------------------------------------

module Dec_req_sp(                                                      // Декодер группы команд, запрашивающих регистр SP
    input [98:0] pla,                                                   // Шина ПЛМ
    input [6:1]  t,                                                     // Такты
    input [5:1]  m,                                                     // Машинные циклы  
    input        grp_sp,                                                // Группа команд, использующих стек (SP)
    input        grp_wrdata,                                            // Группа команд, записывающих данные в память
    input        sel_im2,                                               // Сигнал прерывания IM 2
    output       req_sp                                                 // Сигнал группы команд, запрашивающих регистр SP
    );

    assign req_sp = ((grp_sp | pla[5]) & m[1] & t[5]) |                 // LD SP,HL
                    ((m[3] | m[4]) & t[2] & grp_sp) |                   //
                    (m[5] & t[2] & grp_sp & ~grp_wrdata) |            	//
                    (m[2] & t[2] & sel_im2) |                           //
                    ((t[4] | t[5]) & (m[1] | m[3]) & (grp_sp | sel_im2)); //

endmodule


//----------------------------------------------------------------------

module Dec_req_bc(                                                      // Декодер группы команд, запрашивающих регистр BC
    input [98:0] pla,                                                   // Шина ПЛМ
    input [6:1]  t,                                                     // Такты
    input [5:1]  m,                                                     // Машинные циклы  
    input        grp_block,                                             // Группа блочных команд
    output       req_bc                                                 // Сигнал группы команд, запрашивающих регистр BC
    );

    assign req_bc = (m[1] & t[5] & pla[21]) |                           // INI/IND/INIR/INDR
                    (m[2] & t[3] & pla[20]) |                           // OUTI/OUTD/OTIR/OTDR
                    (m[3] & (t[3] | t[4]) & grp_block) |                //
             ((pla[26] | pla[27] | pla[20] | pla[21]) & m[2] & t[1]) | 	// DJNZ e / IN r,(C) / OUT (C),r / OUTI/OUTD/OTIR/OTDR / INI/IND/INIR/INDR
             ((pla[26] | pla[27] | pla[20] | pla[21]) & m[1] & t[4]);  	// DJNZ e / IN r,(C) / OUT (C),r / OUTI/OUTD/OTIR/OTDR / INI/IND/INIR/INDR
                    
endmodule


//----------------------------------------------------------------------

module Dec_req_hl(                                                      // Декодер группы команд, запрашивающих регистр HL
    input [98:0] pla,                                                   // Шина ПЛМ
    input [6:1]  t,                                                     // Такты
    input [5:1]  m,                                                     // Машинные циклы  
    input        grp_block,                                             // Группа блочных команд
    input        add_sub_hl,                                            // Группа команд ADD/SUB HL
    input        grp_m_hl,                                              // Группа команд, работающих с (HL)
    output       req_hl                                                 // Сигнал группы команд, запрашивающих регистр HL
    );

    assign req_hl = (m[2] & t[2] & grp_block & ~pla[21]) |            	// INI/IND/INIR/INDR (Записать обновленный указатель в HL)
                    ((m[4] | m[5]) & t[3] & add_sub_hl) |               //
                    (m[4] & t[4] & add_sub_hl) |                        //
                    (m[3] & t[4] & pla[60]) |                           // RRD/RLD
                    (m[3] & t[2] & pla[21]) |                           // INI/IND/INIR/INDR
                    ((pla[17] | pla[21]) & m[2] & t[3]) |               // LD r/(HL),n / INI/IND/INIR/INDR
                    ((pla[60] | pla[5] | pla[6] | pla[18] |             // RRD/RLD / LD SP,HL / JP (HL) / LDI/LDD/LDIR/LDDR / 
                      pla[11] | add_sub_hl | grp_m_hl) & m[1] & t[4]) | // CPI/CPD/CPIR/CPDR
                    (m[1] & t[5] & pla[20]);                            // OUTI/OUTD/OTIR/OTDR
      
endmodule


//----------------------------------------------------------------------

module Dec_req_af(                                                      // Декодер группы команд, запрашивающих регистр AF
    input [98:0] pla,                                                   // Шина ПЛМ
    input [6:1]  t,                                                     // Такты
    input [5:1]  m,                                                     // Машинные циклы  
    input        grp_dst_af,                                            // Группа команд с регистром-приемником AF
    input        grp_wrdata,                                            // Группа команд, записывающих данные в память
    output       req_af                                                 // Сигнал группы команд, запрашивающих регистр AF
    );

    assign req_af = (m[1] & t[4] & pla[25]) |                           // RLCA/RRCA/RLA/RRA (Источник для сдвига регистр A)
                    (m[1] & t[2] & grp_dst_af) |                        // Сохранить результат в A 
                    ((pla[8] | pla[38] | pla[98]) & m[4] & t[1]) |      // LD (BC/DE),A / LD A,(BC/DE) / LD A,(nn) / LD (nn),A / OUT (n),A / IN A,(n) (Загрузить данные из A)
           ((pla[8] | pla[38] | pla[98]) & m[4] & t[3] & ~grp_wrdata); 	// LD A,(BC/DE) / LD A,(nn) / IN A,(n) (Записать данные в A)
                         
endmodule


//----------------------------------------------------------------------

module Dec_req_dd(                                                      // Декодер группы команд, запрашивающих регистр HL/DE/BC/SP
    input [98:0] pla,                                                   // Шина ПЛМ
    input [6:1]  t,                                                     // Такты
    input [5:1]  m,                                                     // Машинные циклы  
    input        grp_dir16,                                           	// Группа команд LD (nn),dd / LD dd,(nn)
    input        grp_store16,                                           // Группа команд LD (nn),dd 
    input        add_sub_hl,                                            // Группа команд ADD/SUB HL
    input        grp_wrdata,                                            // Группа команд, записывающих данные в память
    output       req_dd                                                 // Сигнал группы команд, запрашивающих регистр HL/DE/BC/SP
    );

    assign req_dd = ((m[2] | m[3]) & t[3] & pla[7]) |                   // LD dd,nn
                    ((t[4] | t[5]) & m[5]) |                            // 
                    ((t[4] | t[5]) & (pla[8] | pla[9]) & m[1]) |        // LD (BC/DE),A / LD A,(BC/DE) / INC/DEC dd
         ((m[4] | m[5]) & t[3] & grp_dir16 & ~grp_wrdata) |  		   	// LD dd,(nn)
         ((m[4] | m[5]) & t[1] & (grp_store16 | add_sub_hl | pla[10])); // LD (nn),dd / ADD/SBC HL,dd / EX (SP),HL
                    
endmodule


//----------------------------------------------------------------------

module Dec_req_pc(                                                      // Декодер группы команд, запрашивающих регистр PC
    input [98:0] pla,                                                   // Шина ПЛМ
    input [6:1]  t,                                                     // Такты
    input [5:1]  m,                                                     // Машинные циклы  
    input        sel_rst_nmi_im1,                                       // Группа команд RST/NMI/IM 1
    input        sel_im2,                                               // Сигнал прерывания IM 2
    input        grp_block,                                             // Группа блочных команд
    output       req_pc                                                 // Сигнал группы команд, запрашивающих регистр PC
    );

    assign req_pc = ((pla[24] | pla[42] | sel_rst_nmi_im1) & (m[4] | m[5]) & t[1]) | // CALL nn / CALL cc,nn
                    (m[4] & t[4] & grp_block) |                         //
                    ((m[2] | m[3]) & t[1] & sel_im2) |                  //
                    ((pla[26] | pla[47] | pla[48]) & m[2] & t[2]) |     // DJNZ e / JR e / JR NZ/Z/NC/C,e
                    ((pla[26] | pla[47] | pla[48]) & m[3] & t[3]);      // DJNZ e / JR e / JR NZ/Z/NC/C,e
                            
endmodule










