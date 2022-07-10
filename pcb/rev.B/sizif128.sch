EESchema Schematic File Version 4
LIBS:sizif128-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "ZX-SIZIF-128"
Date "2020-09-25"
Rev "B"
Comp "Uzix"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 "Easy-to-build minimalistic ZX Spectrum 128K clone with Pentagon timings"
$EndDescr
$Comp
L power:GND #PWR015
U 1 1 6150A2D5
P 10175 3100
F 0 "#PWR015" H 10175 2850 50  0001 C CNN
F 1 "GND" H 10180 2927 39  0001 C CNN
F 2 "" H 10175 3100 50  0001 C CNN
F 3 "" H 10175 3100 50  0001 C CNN
	1    10175 3100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR013
U 1 1 6150A2DB
P 10175 2800
F 0 "#PWR013" H 10175 2650 50  0001 C CNN
F 1 "+5V" H 10175 2950 39  0001 C CNN
F 2 "" H 10175 2800 50  0001 C CNN
F 3 "" H 10175 2800 50  0001 C CNN
	1    10175 2800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR039
U 1 1 5E4A4041
P 6425 4375
F 0 "#PWR039" H 6425 4125 50  0001 C CNN
F 1 "GND" H 6430 4202 39  0001 C CNN
F 2 "" H 6425 4375 50  0001 C CNN
F 3 "" H 6425 4375 50  0001 C CNN
	1    6425 4375
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR031
U 1 1 5E4A4047
P 6425 4075
F 0 "#PWR031" H 6425 3925 50  0001 C CNN
F 1 "+5V" H 6425 4225 39  0001 C CNN
F 2 "" H 6425 4075 50  0001 C CNN
F 3 "" H 6425 4075 50  0001 C CNN
	1    6425 4075
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR040
U 1 1 5E4A4053
P 6650 4375
F 0 "#PWR040" H 6650 4125 50  0001 C CNN
F 1 "GND" H 6655 4202 39  0001 C CNN
F 2 "" H 6650 4375 50  0001 C CNN
F 3 "" H 6650 4375 50  0001 C CNN
	1    6650 4375
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR032
U 1 1 5E4A4059
P 6650 4075
F 0 "#PWR032" H 6650 3925 50  0001 C CNN
F 1 "+5V" H 6650 4225 39  0001 C CNN
F 2 "" H 6650 4075 50  0001 C CNN
F 3 "" H 6650 4075 50  0001 C CNN
	1    6650 4075
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR041
U 1 1 5E51C91E
P 6875 4375
F 0 "#PWR041" H 6875 4125 50  0001 C CNN
F 1 "GND" H 6880 4202 39  0001 C CNN
F 2 "" H 6875 4375 50  0001 C CNN
F 3 "" H 6875 4375 50  0001 C CNN
	1    6875 4375
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR033
U 1 1 5E51C924
P 6875 4075
F 0 "#PWR033" H 6875 3925 50  0001 C CNN
F 1 "+5V" H 6875 4225 39  0001 C CNN
F 2 "" H 6875 4075 50  0001 C CNN
F 3 "" H 6875 4075 50  0001 C CNN
	1    6875 4075
	1    0    0    -1  
$EndComp
Wire Wire Line
	10350 975  10350 875 
Wire Wire Line
	10350 1075 10350 975 
Connection ~ 10350 975 
Text GLabel 5875 4200 2    39   Output ~ 0
VA6
Text GLabel 5875 4100 2    39   Output ~ 0
VA9
Text GLabel 5875 4500 2    39   Output ~ 0
TAPE_OUT
$Comp
L Device:CP C1
U 1 1 5D452FD1
P 10550 975
F 0 "C1" V 10400 975 39  0000 C CNN
F 1 "10u" V 10700 975 39  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 10588 825 50  0001 C CNN
F 3 "~" H 10550 975 50  0001 C CNN
	1    10550 975 
	0    -1   1    0   
$EndComp
Text GLabel 5875 4300 2    39   Input ~ 0
TAPE_IN0
$Comp
L Device:R R43
U 1 1 5D93D097
P 1275 7050
F 0 "R43" H 1150 7125 39  0000 C CNN
F 1 "1k" V 1275 7050 39  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 1205 7050 50  0001 C CNN
F 3 "~" H 1275 7050 50  0001 C CNN
	1    1275 7050
	-1   0    0    1   
$EndComp
$Comp
L 74xx:74HC04 U6
U 4 1 5D9B4031
P 975 6850
F 0 "U6" H 975 7143 39  0000 C CNN
F 1 "74HCU04" H 975 7068 39  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 975 6850 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 975 6850 50  0001 C CNN
	4    975  6850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R33
U 1 1 5D93D0A7
P 975 6450
F 0 "R33" V 1050 6450 39  0000 C CNN
F 1 "1M" V 975 6450 39  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 905 6450 50  0001 C CNN
F 3 "~" H 975 6450 50  0001 C CNN
	1    975  6450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1275 6450 1275 6850
Wire Wire Line
	1275 6450 1125 6450
Wire Wire Line
	675  6450 675  6850
Wire Wire Line
	825  6450 675  6450
Connection ~ 675  6850
Wire Wire Line
	1275 6850 1275 6900
Connection ~ 1275 6850
Connection ~ 1275 7250
Wire Wire Line
	1275 7250 1275 7300
Wire Wire Line
	1275 7250 1275 7200
Wire Wire Line
	1125 7250 1275 7250
Wire Wire Line
	675  7250 675  7300
Connection ~ 675  7250
Wire Wire Line
	825  7250 675  7250
Wire Wire Line
	675  6850 675  7250
Wire Wire Line
	675  7600 1275 7600
$Comp
L power:GND #PWR062
U 1 1 61657146
P 675 7600
F 0 "#PWR062" H 675 7350 50  0001 C CNN
F 1 "GND" H 680 7427 39  0001 C CNN
F 2 "" H 675 7600 50  0001 C CNN
F 3 "" H 675 7600 50  0001 C CNN
	1    675  7600
	1    0    0    -1  
$EndComp
Text GLabel 1875 6850 2    39   Output ~ 0
CLK14
$Comp
L Device:Crystal Y1
U 1 1 5A83A544
P 975 7250
F 0 "Y1" H 975 7475 39  0000 C CNN
F 1 "14MHz" H 975 7400 39  0000 C CNN
F 2 "Crystal:Crystal_HC49-U_Vertical" H 975 7250 50  0001 C CNN
F 3 "~" H 975 7250 50  0001 C CNN
	1    975  7250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R30
U 1 1 62BF8D48
P 2925 4550
F 0 "R30" V 2875 4325 39  0000 L CNN
F 1 "1k" V 2925 4500 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2855 4550 50  0001 C CNN
F 3 "~" H 2925 4550 50  0001 C CNN
	1    2925 4550
	0    -1   1    0   
$EndComp
Text GLabel 3250 4150 2    39   UnSpc ~ 0
VA9
Text GLabel 3250 4250 2    39   UnSpc ~ 0
VA10
Text GLabel 3250 4350 2    39   UnSpc ~ 0
VA11
Text GLabel 3250 4450 2    39   UnSpc ~ 0
VA12
Text GLabel 3250 4550 2    39   UnSpc ~ 0
VA13
$Comp
L Device:R R29
U 1 1 62BF8D42
P 2925 4450
F 0 "R29" V 2875 4225 39  0000 L CNN
F 1 "1k" V 2925 4400 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2855 4450 50  0001 C CNN
F 3 "~" H 2925 4450 50  0001 C CNN
	1    2925 4450
	0    -1   1    0   
$EndComp
$Comp
L Device:R R28
U 1 1 62BF8D3C
P 2925 4350
F 0 "R28" V 2875 4125 39  0000 L CNN
F 1 "1k" V 2925 4300 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2855 4350 50  0001 C CNN
F 3 "~" H 2925 4350 50  0001 C CNN
	1    2925 4350
	0    -1   1    0   
$EndComp
$Comp
L Device:R R25
U 1 1 62BF8D30
P 2925 4150
F 0 "R25" V 2875 3925 39  0000 L CNN
F 1 "1k" V 2925 4100 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2855 4150 50  0001 C CNN
F 3 "~" H 2925 4150 50  0001 C CNN
	1    2925 4150
	0    -1   1    0   
$EndComp
$Comp
L Device:R R27
U 1 1 62BF8D2A
P 2925 4250
F 0 "R27" V 2875 4025 39  0000 L CNN
F 1 "1k" V 2925 4200 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2855 4250 50  0001 C CNN
F 3 "~" H 2925 4250 50  0001 C CNN
	1    2925 4250
	0    -1   1    0   
$EndComp
Text GLabel 2650 4150 0    39   UnSpc ~ 0
A9
Text GLabel 2650 4250 0    39   UnSpc ~ 0
A10
Text GLabel 2650 4350 0    39   UnSpc ~ 0
A11
Text GLabel 2650 4450 0    39   UnSpc ~ 0
A12
Text GLabel 2650 4550 0    39   UnSpc ~ 0
A13
Wire Wire Line
	2775 4150 2650 4150
Wire Wire Line
	2650 4250 2775 4250
Wire Wire Line
	2775 4350 2650 4350
Wire Wire Line
	2775 4450 2650 4450
Wire Wire Line
	2650 4550 2775 4550
Wire Wire Line
	3075 4150 3250 4150
Wire Wire Line
	3075 4250 3250 4250
Wire Wire Line
	3075 4350 3250 4350
Wire Wire Line
	3075 4450 3250 4450
Wire Wire Line
	3075 4550 3250 4550
Text GLabel 2075 4150 2    39   BiDi ~ 0
VD1
Text GLabel 2075 3850 2    39   BiDi ~ 0
VD2
Text GLabel 2075 3550 2    39   BiDi ~ 0
VD3
Text GLabel 2075 3450 2    39   BiDi ~ 0
VD4
Text GLabel 2075 3650 2    39   BiDi ~ 0
VD5
Text GLabel 2075 3750 2    39   BiDi ~ 0
VD6
Text GLabel 2075 3950 2    39   BiDi ~ 0
VD7
Text GLabel 1075 3750 0    39   Input ~ 0
VA15
Text GLabel 1075 4750 0    39   Input ~ 0
VA2
Text GLabel 1075 4450 0    39   Input ~ 0
VA16
Text GLabel 1175 2300 0    39   Input ~ 0
RA14
Text GLabel 1075 3650 0    39   Input ~ 0
VA14
Text GLabel 1075 3950 0    39   Input ~ 0
VA13
Text GLabel 1075 4050 0    39   Input ~ 0
VA12
Text GLabel 1075 4150 0    39   Input ~ 0
VA11
Text GLabel 1075 5050 0    39   Input ~ 0
VA10
Text GLabel 1075 4850 0    39   Input ~ 0
VA9
Text GLabel 1075 4650 0    39   Input ~ 0
VA8
Text GLabel 1075 3850 0    39   Input ~ 0
VA7
Text GLabel 1075 4950 0    39   Input ~ 0
VA6
Text GLabel 1075 4550 0    39   Input ~ 0
VA5
Text GLabel 1075 4350 0    39   Input ~ 0
VA4
Text GLabel 1075 4250 0    39   Input ~ 0
VA3
Text GLabel 1075 3550 0    39   Input ~ 0
VA1
Text GLabel 1075 3450 0    39   Input ~ 0
VA0
Text GLabel 1175 900  0    39   Input ~ 0
A0
Text GLabel 1175 1000 0    39   Input ~ 0
A1
$Comp
L power:+5V #PWR046
U 1 1 6171D465
P 2225 4975
F 0 "#PWR046" H 2225 4825 50  0001 C CNN
F 1 "+5V" H 2225 5125 39  0001 C CNN
F 2 "" H 2225 4975 50  0001 C CNN
F 3 "" H 2225 4975 50  0001 C CNN
	1    2225 4975
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR050
U 1 1 6171D45F
P 2225 5275
F 0 "#PWR050" H 2225 5025 50  0001 C CNN
F 1 "GND" H 2230 5102 39  0001 C CNN
F 2 "" H 2225 5275 50  0001 C CNN
F 3 "" H 2225 5275 50  0001 C CNN
	1    2225 5275
	1    0    0    -1  
$EndComp
$Comp
L Device:C C14
U 1 1 6171D459
P 2225 5125
F 0 "C14" H 2125 5050 39  0000 C CNN
F 1 "100n" H 2100 5225 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 2263 4975 50  0001 C CNN
F 3 "~" H 2225 5125 50  0001 C CNN
	1    2225 5125
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR014
U 1 1 6169FCFB
P 2125 2625
F 0 "#PWR014" H 2125 2475 50  0001 C CNN
F 1 "+5V" H 2125 2775 39  0001 C CNN
F 2 "" H 2125 2625 50  0001 C CNN
F 3 "" H 2125 2625 50  0001 C CNN
	1    2125 2625
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR017
U 1 1 6169FCF5
P 2125 2925
F 0 "#PWR017" H 2125 2675 50  0001 C CNN
F 1 "GND" H 2130 2752 39  0001 C CNN
F 2 "" H 2125 2925 50  0001 C CNN
F 3 "" H 2125 2925 50  0001 C CNN
	1    2125 2925
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 6169FCEF
P 2125 2775
F 0 "C4" H 2025 2700 39  0000 C CNN
F 1 "100n" H 2025 2875 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 2163 2625 50  0001 C CNN
F 3 "~" H 2125 2775 50  0001 C CNN
	1    2125 2775
	-1   0    0    1   
$EndComp
Wire Wire Line
	875  2400 1175 2400
$Comp
L power:+5V #PWR07
U 1 1 65FFD594
P 725 2150
F 0 "#PWR07" H 725 2000 50  0001 C CNN
F 1 "+5V" H 740 2323 39  0001 C CNN
F 2 "" H 725 2150 50  0001 C CNN
F 3 "" H 725 2150 50  0001 C CNN
	1    725  2150
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR010
U 1 1 65FFD58E
P 725 2650
F 0 "#PWR010" H 725 2400 50  0001 C CNN
F 1 "GND" H 730 2477 39  0001 C CNN
F 2 "" H 725 2650 50  0001 C CNN
F 3 "" H 725 2650 50  0001 C CNN
	1    725  2650
	-1   0    0    -1  
$EndComp
$Comp
L Jumper:Jumper_3_Bridged12 JP1
U 1 1 65FFD588
P 725 2400
F 0 "JP1" V 725 2525 39  0000 C CNN
F 1 "Jumper_3_Bridged12" V 770 2467 39  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 725 2400 50  0001 C CNN
F 3 "~" H 725 2400 50  0001 C CNN
	1    725  2400
	0    -1   -1   0   
$EndComp
Text GLabel 1175 2600 0    39   Input ~ 0
nROMCS
Text GLabel 2075 4050 2    39   BiDi ~ 0
VD0
Text GLabel 2075 4550 2    39   Input ~ 0
nVRD
Text GLabel 2075 4650 2    39   Input ~ 0
nVWR
$Comp
L power:+5V #PWR030
U 1 1 604A57E2
P 2075 4450
F 0 "#PWR030" H 2075 4300 50  0001 C CNN
F 1 "+5V" H 2075 4600 39  0001 C CNN
F 2 "" H 2075 4450 50  0001 C CNN
F 3 "" H 2075 4450 50  0001 C CNN
	1    2075 4450
	0    1    -1   0   
$EndComp
Text GLabel 1975 1600 2    39   Output ~ 0
D7
Text GLabel 1975 1500 2    39   Output ~ 0
D6
Text GLabel 1975 1400 2    39   Output ~ 0
D5
Text GLabel 1975 1300 2    39   Output ~ 0
D4
Text GLabel 1975 1200 2    39   Output ~ 0
D3
Text GLabel 1975 1100 2    39   Output ~ 0
D2
Text GLabel 1975 1000 2    39   Output ~ 0
D1
Text GLabel 1975 900  2    39   Output ~ 0
D0
$Comp
L power:GND #PWR047
U 1 1 5A835143
P 1575 5250
F 0 "#PWR047" H 1575 5000 50  0001 C CNN
F 1 "GND" H 1580 5077 39  0001 C CNN
F 2 "" H 1575 5250 50  0001 C CNN
F 3 "" H 1575 5250 50  0001 C CNN
	1    1575 5250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR020
U 1 1 5A831FC4
P 1575 3250
F 0 "#PWR020" H 1575 3100 50  0001 C CNN
F 1 "+5V" H 1575 3400 39  0001 C CNN
F 2 "" H 1575 3250 50  0001 C CNN
F 3 "" H 1575 3250 50  0001 C CNN
	1    1575 3250
	1    0    0    -1  
$EndComp
Text GLabel 1175 2700 0    39   Input ~ 0
nRD
$Comp
L power:+5V #PWR04
U 1 1 5A827B63
P 1575 700
F 0 "#PWR04" H 1575 550 50  0001 C CNN
F 1 "+5V" H 1590 873 39  0001 C CNN
F 2 "" H 1575 700 50  0001 C CNN
F 3 "" H 1575 700 50  0001 C CNN
	1    1575 700 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR016
U 1 1 5A827A72
P 1575 2900
F 0 "#PWR016" H 1575 2650 50  0001 C CNN
F 1 "GND" H 1580 2727 39  0001 C CNN
F 2 "" H 1575 2900 50  0001 C CNN
F 3 "" H 1575 2900 50  0001 C CNN
	1    1575 2900
	1    0    0    -1  
$EndComp
Text GLabel 1175 2200 0    39   Input ~ 0
A13
Text GLabel 1175 2100 0    39   Input ~ 0
A12
Text GLabel 1175 2000 0    39   Input ~ 0
A11
Text GLabel 1175 1900 0    39   Input ~ 0
A10
Text GLabel 1175 1800 0    39   Input ~ 0
A9
Text GLabel 1175 1700 0    39   Input ~ 0
A8
Text GLabel 1175 1600 0    39   Input ~ 0
A7
Text GLabel 1175 1500 0    39   Input ~ 0
A6
Text GLabel 1175 1400 0    39   Input ~ 0
A5
Text GLabel 1175 1300 0    39   Input ~ 0
A4
Text GLabel 1175 1200 0    39   Input ~ 0
A3
Text GLabel 1175 1100 0    39   Input ~ 0
A2
Text GLabel 3975 4400 0    39   Output ~ 0
AY_BDIR
Text GLabel 3975 4300 0    39   Output ~ 0
AY_BC1
Text GLabel 3975 4500 0    39   Output ~ 0
AY_CLK
$Comp
L Memory_RAM:628128_DIP32_SSOP32 U5
U 1 1 5F9873DE
P 1575 4250
F 0 "U5" H 1200 5225 50  0000 C CNN
F 1 "628128" H 1850 5225 50  0000 C CNN
F 2 "Package_DIP:DIP-32_W15.24mm_Socket" H 1575 4250 50  0001 C CNN
F 3 "http://www.futurlec.com/Datasheet/Memory/628128.pdf" H 1575 4250 50  0001 C CNN
	1    1575 4250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR028
U 1 1 5F9B5057
P 2075 4350
F 0 "#PWR028" H 2075 4100 50  0001 C CNN
F 1 "GND" H 2080 4177 39  0001 C CNN
F 2 "" H 2075 4350 50  0001 C CNN
F 3 "" H 2075 4350 50  0001 C CNN
	1    2075 4350
	0    -1   -1   0   
$EndComp
$Comp
L Memory_EPROM:27C512 U1
U 1 1 5F9DF21D
P 1575 1800
F 0 "U1" H 1325 2875 50  0000 C CNN
F 1 "27C512" H 1775 2875 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_Socket" H 1575 1800 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/doc0015.pdf" H 1575 1800 50  0001 C CNN
	1    1575 1800
	1    0    0    -1  
$EndComp
Text GLabel 5875 4400 2    39   Output ~ 0
RA14
Text GLabel 10375 1875 0    39   Input ~ 0
BEEPER
Text GLabel 3975 4200 0    39   Input ~ 0
KD4
Text GLabel 3975 4100 0    39   Input ~ 0
KD2
Text GLabel 10925 975  2    39   Output ~ 0
SOUND
$Comp
L power:GND #PWR06
U 1 1 5E0C8FFE
P 10350 1475
F 0 "#PWR06" H 10350 1225 50  0001 C CNN
F 1 "GND" H 10355 1302 39  0001 C CNN
F 2 "" H 10350 1475 50  0001 C CNN
F 3 "" H 10350 1475 50  0001 C CNN
	1    10350 1475
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 6034FFAE
P 10550 1875
F 0 "R6" V 10575 1675 39  0000 L CNN
F 1 "4.7k" V 10550 1825 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 10480 1875 50  0001 C CNN
F 3 "~" H 10550 1875 50  0001 C CNN
	1    10550 1875
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10350 1175 10350 1075
Connection ~ 10350 1075
Wire Wire Line
	10350 875  10250 875 
Wire Wire Line
	10350 1075 10250 1075
Wire Wire Line
	10250 975  10350 975 
Wire Wire Line
	2650 4050 2775 4050
Wire Wire Line
	3075 4050 3250 4050
Connection ~ 5075 5000
Connection ~ 4575 5000
$Comp
L power:GND #PWR045
U 1 1 5CEE906F
P 4575 5000
F 0 "#PWR045" H 4575 4750 50  0001 C CNN
F 1 "GND" H 4580 4827 39  0001 C CNN
F 2 "" H 4575 5000 50  0001 C CNN
F 3 "" H 4575 5000 50  0001 C CNN
	1    4575 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5075 5000 4975 5000
Connection ~ 4975 5000
Wire Wire Line
	4975 5000 4875 5000
Connection ~ 4875 5000
Wire Wire Line
	5175 5000 5075 5000
Wire Wire Line
	5275 5000 5175 5000
Connection ~ 5175 5000
Wire Wire Line
	4875 5000 4775 5000
Connection ~ 4775 5000
Wire Wire Line
	4775 5000 4675 5000
Wire Wire Line
	4675 5000 4575 5000
Connection ~ 4675 5000
NoConn ~ 9950 2575
NoConn ~ 9950 2675
NoConn ~ 9950 2775
NoConn ~ 9950 2875
$Comp
L Device:R R1
U 1 1 5ABB8A0E
P 10100 875
F 0 "R1" V 10125 650 39  0000 L CNN
F 1 "1k" V 10100 825 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 10030 875 50  0001 C CNN
F 3 "~" H 10100 875 50  0001 C CNN
	1    10100 875 
	0    -1   -1   0   
$EndComp
NoConn ~ 9950 1225
$Comp
L Device:R R3
U 1 1 5ABB8ADC
P 10100 1075
F 0 "R3" V 10125 850 39  0000 L CNN
F 1 "1k" V 10100 1025 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 10030 1075 50  0001 C CNN
F 3 "~" H 10100 1075 50  0001 C CNN
	1    10100 1075
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R2
U 1 1 5ABB88D9
P 10100 975
F 0 "R2" V 10125 750 39  0000 L CNN
F 1 "1k" V 10100 925 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 10030 975 50  0001 C CNN
F 3 "~" H 10100 975 50  0001 C CNN
	1    10100 975 
	0    -1   -1   0   
$EndComp
NoConn ~ 9950 1375
NoConn ~ 9950 1475
NoConn ~ 9950 1575
NoConn ~ 9950 1675
NoConn ~ 9950 1775
NoConn ~ 9950 1875
NoConn ~ 9950 1975
NoConn ~ 9950 2075
NoConn ~ 9950 2175
NoConn ~ 9950 2275
NoConn ~ 9950 2375
NoConn ~ 9950 2475
$Comp
L my:logo LOGO2
U 1 1 5E9FA75D
P 2925 1350
F 0 "LOGO2" H 2925 1550 50  0001 C CNN
F 1 "logo" H 2925 1100 50  0001 C CNN
F 2 "my:dc_center_positive_big" H 2925 1150 50  0001 C CNN
F 3 "~" H 2955 1150 50  0001 C CNN
F 4 "DC" H 2875 1275 50  0000 L CNN "Desc"
	1    2925 1350
	1    0    0    -1  
$EndComp
$Comp
L my:logo LOGO1
U 1 1 5E9F134C
P 2925 900
F 0 "LOGO1" H 2925 1100 50  0001 C CNN
F 1 "logo" H 2925 650 50  0001 C CNN
F 2 "my:black-mage2" H 2925 700 50  0001 C CNN
F 3 "~" H 2955 700 50  0001 C CNN
F 4 "Logo" H 2825 800 50  0000 L CNN "Desc"
	1    2925 900 
	1    0    0    -1  
$EndComp
NoConn ~ 3975 2400
NoConn ~ 3975 1300
$Comp
L power:+5V #PWR05
U 1 1 5E0A8022
P 8350 1100
F 0 "#PWR05" H 8350 950 50  0001 C CNN
F 1 "+5V" H 8365 1265 39  0001 C CNN
F 2 "" H 8350 1100 50  0001 C CNN
F 3 "" H 8350 1100 50  0001 C CNN
	1    8350 1100
	0    1    -1   0   
$EndComp
Wire Wire Line
	8000 1225 8050 1225
Connection ~ 8000 1225
Wire Wire Line
	8000 1100 8050 1100
Wire Wire Line
	8000 1225 8000 1100
Wire Wire Line
	7950 1225 8000 1225
$Comp
L Device:R R4
U 1 1 5E086AD0
P 8200 1100
F 0 "R4" V 8275 1050 39  0000 L CNN
F 1 "1k" V 8200 1050 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 8130 1100 50  0001 C CNN
F 3 "~" H 8200 1100 50  0001 C CNN
	1    8200 1100
	0    -1   -1   0   
$EndComp
Text GLabel 7950 925  2    39   Input ~ 0
nRST
Text GLabel 3975 2700 0    39   Output ~ 0
nINT
Text GLabel 3975 2500 0    39   Input ~ 0
A15
Text GLabel 3975 2600 0    39   Input ~ 0
A14
Text GLabel 3975 3400 0    39   Input ~ 0
A0
Text GLabel 3975 3300 0    39   Input ~ 0
A1
Text GLabel 3975 2800 0    39   Input ~ 0
nRFSH
Text GLabel 3975 3000 0    39   Input ~ 0
nM1
Text GLabel 3975 3200 0    39   Input ~ 0
nMREQ
Text GLabel 3975 3100 0    39   Input ~ 0
nIORQ
Text GLabel 3975 3500 0    39   Input ~ 0
nWR
Text GLabel 3975 3600 0    39   Output ~ 0
nROMCS
Wire Wire Line
	2775 3750 2650 3750
$Comp
L Device:R R11
U 1 1 62BF8D60
P 2925 2750
F 0 "R11" V 2875 2525 39  0000 L CNN
F 1 "1k" V 2925 2700 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2855 2750 50  0001 C CNN
F 3 "~" H 2925 2750 50  0001 C CNN
	1    2925 2750
	0    -1   1    0   
$EndComp
$Comp
L Device:R R12
U 1 1 62BF8D5A
P 2925 2850
F 0 "R12" V 2875 2625 39  0000 L CNN
F 1 "1k" V 2925 2800 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2855 2850 50  0001 C CNN
F 3 "~" H 2925 2850 50  0001 C CNN
	1    2925 2850
	0    -1   1    0   
$EndComp
$Comp
L power:+5V #PWR012
U 1 1 5E2BAF18
P 8750 2175
F 0 "#PWR012" H 8750 2025 50  0001 C CNN
F 1 "+5V" H 8765 2340 39  0001 C CNN
F 2 "" H 8750 2175 50  0001 C CNN
F 3 "" H 8750 2175 50  0001 C CNN
	1    8750 2175
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR011
U 1 1 5E1BDB08
P 7950 2125
F 0 "#PWR011" H 7950 1975 50  0001 C CNN
F 1 "+5V" H 7950 2275 39  0001 C CNN
F 2 "" H 7950 2125 50  0001 C CNN
F 3 "" H 7950 2125 50  0001 C CNN
	1    7950 2125
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR019
U 1 1 5E1BD2B1
P 7950 3225
F 0 "#PWR019" H 7950 3075 50  0001 C CNN
F 1 "+5V" H 7950 3375 39  0001 C CNN
F 2 "" H 7950 3225 50  0001 C CNN
F 3 "" H 7950 3225 50  0001 C CNN
	1    7950 3225
	0    1    1    0   
$EndComp
Text GLabel 3975 3800 0    39   Input ~ 0
KD1
Text GLabel 3975 4000 0    39   Input ~ 0
KD3
Text GLabel 3975 3900 0    39   Input ~ 0
KD0
Text GLabel 3975 1400 0    39   Input ~ 0
CLK16
Text GLabel 3975 2200 0    39   Output ~ 0
CHROMA1
Text GLabel 3975 2300 0    39   Output ~ 0
CHROMA0
NoConn ~ 7950 2225
NoConn ~ 7950 3325
$Comp
L power:+5V #PWR03
U 1 1 5A823585
P 7250 625
F 0 "#PWR03" H 7250 475 50  0001 C CNN
F 1 "+5V" H 7265 790 39  0001 C CNN
F 2 "" H 7250 625 50  0001 C CNN
F 3 "" H 7250 625 50  0001 C CNN
	1    7250 625 
	-1   0    0    -1  
$EndComp
Text GLabel 6550 925  0    39   Output ~ 0
A0
Text GLabel 6550 1025 0    39   Output ~ 0
A1
Text GLabel 6550 1125 0    39   Output ~ 0
A2
Text GLabel 6550 1225 0    39   Output ~ 0
A3
Text GLabel 6550 1325 0    39   Output ~ 0
A4
Text GLabel 6550 1425 0    39   Output ~ 0
A5
Text GLabel 6550 1525 0    39   Output ~ 0
A6
Text GLabel 6550 1625 0    39   Output ~ 0
A7
Text GLabel 6550 1725 0    39   Output ~ 0
A8
Text GLabel 6550 1825 0    39   Output ~ 0
A9
Text GLabel 6550 1925 0    39   Output ~ 0
A10
Text GLabel 6550 2025 0    39   Output ~ 0
A11
Text GLabel 6550 2125 0    39   Output ~ 0
A12
Text GLabel 6550 2225 0    39   Output ~ 0
A13
Text GLabel 6550 2325 0    39   Output ~ 0
A14
Text GLabel 6550 2425 0    39   Output ~ 0
A15
Text GLabel 8050 1225 2    39   Input ~ 0
CLKCPU
Text GLabel 7950 1625 2    39   Input ~ 0
nINT
Text GLabel 7950 1925 2    39   Output ~ 0
nM1
Text GLabel 7950 2025 2    39   Output ~ 0
nRFSH
Text GLabel 7950 2625 2    39   Output ~ 0
nRD
Text GLabel 7950 2725 2    39   Output ~ 0
nWR
$Comp
L power:GND #PWR022
U 1 1 5A825FC1
P 7250 3625
F 0 "#PWR022" H 7250 3375 50  0001 C CNN
F 1 "GND" H 7255 3452 39  0001 C CNN
F 2 "" H 7250 3625 50  0001 C CNN
F 3 "" H 7250 3625 50  0001 C CNN
	1    7250 3625
	-1   0    0    -1  
$EndComp
Text GLabel 7950 2925 2    39   Output ~ 0
nIORQ
Text GLabel 7950 2825 2    39   Output ~ 0
nMREQ
Text GLabel 6550 2625 0    39   BiDi ~ 0
D0
Text GLabel 6550 2725 0    39   BiDi ~ 0
D1
Text GLabel 6550 2825 0    39   BiDi ~ 0
D2
Text GLabel 6550 2925 0    39   BiDi ~ 0
D3
Text GLabel 6550 3025 0    39   BiDi ~ 0
D4
Text GLabel 6550 3125 0    39   BiDi ~ 0
D5
Text GLabel 6550 3225 0    39   BiDi ~ 0
D6
Text GLabel 6550 3325 0    39   BiDi ~ 0
D7
$Comp
L CPU:Z80CPU U3
U 1 1 5A82BF7B
P 7250 2125
F 0 "U3" H 7750 3550 50  0000 C CNN
F 1 "Z84C0008PEC " H 6825 3550 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm_Socket" H 7250 2525 50  0001 C CNN
F 3 "www.zilog.com/manage_directlink.php?filepath=docs/z80/um0080" H 7250 2525 50  0001 C CNN
	1    7250 2125
	-1   0    0    -1  
$EndComp
Text GLabel 8750 2325 0    39   Input ~ 0
nRST
Text GLabel 3250 3450 2    39   UnSpc ~ 0
VA2
Wire Wire Line
	3075 3950 3250 3950
Wire Wire Line
	3075 3850 3250 3850
Wire Wire Line
	3075 3750 3250 3750
Wire Wire Line
	3075 3650 3250 3650
Wire Wire Line
	3075 3550 3250 3550
Wire Wire Line
	3075 3450 3250 3450
Wire Wire Line
	3075 3350 3250 3350
Wire Wire Line
	3075 3250 3250 3250
Wire Wire Line
	3075 3150 3250 3150
Wire Wire Line
	3075 3050 3250 3050
Wire Wire Line
	3075 2950 3250 2950
Wire Wire Line
	3075 2850 3250 2850
Wire Wire Line
	3075 2750 3250 2750
Wire Wire Line
	3075 2650 3250 2650
Wire Wire Line
	3075 2550 3250 2550
Wire Wire Line
	3075 2450 3250 2450
$Comp
L Device:R R24
U 1 1 62BF8D36
P 2925 4050
F 0 "R24" V 2875 3825 39  0000 L CNN
F 1 "1k" V 2925 4000 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2855 4050 50  0001 C CNN
F 3 "~" H 2925 4050 50  0001 C CNN
	1    2925 4050
	0    -1   1    0   
$EndComp
Text GLabel 2650 4050 0    39   UnSpc ~ 0
A8
Text GLabel 3250 4050 2    39   UnSpc ~ 0
VA8
Wire Wire Line
	2650 3950 2775 3950
Wire Wire Line
	2650 3850 2775 3850
Wire Wire Line
	2650 3650 2775 3650
Wire Wire Line
	2775 3550 2650 3550
Wire Wire Line
	2650 3450 2775 3450
Wire Wire Line
	2775 3350 2650 3350
Wire Wire Line
	2650 3250 2775 3250
Text GLabel 2650 3950 0    39   UnSpc ~ 0
A7
Text GLabel 2650 3850 0    39   UnSpc ~ 0
A6
Text GLabel 2650 3750 0    39   UnSpc ~ 0
A5
Text GLabel 2650 3650 0    39   UnSpc ~ 0
A4
Text GLabel 2650 3550 0    39   UnSpc ~ 0
A3
Text GLabel 2650 3450 0    39   UnSpc ~ 0
A2
Text GLabel 2650 3350 0    39   UnSpc ~ 0
A1
Text GLabel 2650 3250 0    39   UnSpc ~ 0
A0
Text GLabel 2650 3150 0    39   UnSpc ~ 0
D7
Wire Wire Line
	2775 3150 2650 3150
Wire Wire Line
	2650 3050 2775 3050
Wire Wire Line
	2775 2950 2650 2950
Wire Wire Line
	2650 2850 2775 2850
Wire Wire Line
	2650 2750 2775 2750
Wire Wire Line
	2650 2650 2775 2650
Wire Wire Line
	2650 2550 2775 2550
Wire Wire Line
	2775 2450 2650 2450
Text GLabel 2650 3050 0    39   UnSpc ~ 0
D6
Text GLabel 2650 2950 0    39   UnSpc ~ 0
D5
Text GLabel 2650 2850 0    39   UnSpc ~ 0
D4
Text GLabel 2650 2750 0    39   UnSpc ~ 0
D3
Text GLabel 2650 2650 0    39   UnSpc ~ 0
D2
Text GLabel 2650 2550 0    39   UnSpc ~ 0
D1
Text GLabel 2650 2450 0    39   UnSpc ~ 0
D0
$Comp
L Device:R R23
U 1 1 62BF8D4E
P 2925 3950
F 0 "R23" V 2875 3725 39  0000 L CNN
F 1 "1k" V 2925 3900 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2855 3950 50  0001 C CNN
F 3 "~" H 2925 3950 50  0001 C CNN
	1    2925 3950
	0    -1   1    0   
$EndComp
$Comp
L Device:R R22
U 1 1 62BF8D54
P 2925 3850
F 0 "R22" V 2875 3625 39  0000 L CNN
F 1 "1k" V 2925 3800 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2855 3850 50  0001 C CNN
F 3 "~" H 2925 3850 50  0001 C CNN
	1    2925 3850
	0    -1   1    0   
$EndComp
$Comp
L Device:R R13
U 1 1 62BF8D66
P 2925 2950
F 0 "R13" V 2875 2725 39  0000 L CNN
F 1 "1k" V 2925 2900 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2855 2950 50  0001 C CNN
F 3 "~" H 2925 2950 50  0001 C CNN
	1    2925 2950
	0    -1   1    0   
$EndComp
$Comp
L Device:R R14
U 1 1 62BF8D6C
P 2925 3050
F 0 "R14" V 2875 2825 39  0000 L CNN
F 1 "1k" V 2925 3000 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2855 3050 50  0001 C CNN
F 3 "~" H 2925 3050 50  0001 C CNN
	1    2925 3050
	0    -1   1    0   
$EndComp
$Comp
L Device:R R10
U 1 1 62BF8D72
P 2925 2650
F 0 "R10" V 2875 2425 39  0000 L CNN
F 1 "1k" V 2925 2600 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2855 2650 50  0001 C CNN
F 3 "~" H 2925 2650 50  0001 C CNN
	1    2925 2650
	0    -1   1    0   
$EndComp
$Comp
L Device:R R15
U 1 1 62BF8D78
P 2925 3150
F 0 "R15" V 2875 2925 39  0000 L CNN
F 1 "1k" V 2925 3100 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2855 3150 50  0001 C CNN
F 3 "~" H 2925 3150 50  0001 C CNN
	1    2925 3150
	0    -1   1    0   
$EndComp
$Comp
L Device:R R8
U 1 1 6205355E
P 2925 2450
F 0 "R8" V 2875 2225 39  0000 L CNN
F 1 "1k" V 2925 2400 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2855 2450 50  0001 C CNN
F 3 "~" H 2925 2450 50  0001 C CNN
	1    2925 2450
	0    -1   1    0   
$EndComp
$Comp
L Device:R R9
U 1 1 62053564
P 2925 2550
F 0 "R9" V 2875 2325 39  0000 L CNN
F 1 "1k" V 2925 2500 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2855 2550 50  0001 C CNN
F 3 "~" H 2925 2550 50  0001 C CNN
	1    2925 2550
	0    -1   1    0   
$EndComp
$Comp
L Device:R R21
U 1 1 6205356A
P 2925 3750
F 0 "R21" V 2875 3525 39  0000 L CNN
F 1 "1k" V 2925 3700 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2855 3750 50  0001 C CNN
F 3 "~" H 2925 3750 50  0001 C CNN
	1    2925 3750
	0    -1   1    0   
$EndComp
$Comp
L Device:R R20
U 1 1 62053570
P 2925 3650
F 0 "R20" V 2875 3425 39  0000 L CNN
F 1 "1k" V 2925 3600 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2855 3650 50  0001 C CNN
F 3 "~" H 2925 3650 50  0001 C CNN
	1    2925 3650
	0    -1   1    0   
$EndComp
$Comp
L Device:R R19
U 1 1 62053576
P 2925 3550
F 0 "R19" V 2875 3325 39  0000 L CNN
F 1 "1k" V 2925 3500 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2855 3550 50  0001 C CNN
F 3 "~" H 2925 3550 50  0001 C CNN
	1    2925 3550
	0    -1   1    0   
$EndComp
$Comp
L Device:R R18
U 1 1 6205357C
P 2925 3450
F 0 "R18" V 2875 3225 39  0000 L CNN
F 1 "1k" V 2925 3400 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2855 3450 50  0001 C CNN
F 3 "~" H 2925 3450 50  0001 C CNN
	1    2925 3450
	0    -1   1    0   
$EndComp
$Comp
L Device:R R17
U 1 1 62053582
P 2925 3350
F 0 "R17" V 2875 3125 39  0000 L CNN
F 1 "1k" V 2925 3300 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2855 3350 50  0001 C CNN
F 3 "~" H 2925 3350 50  0001 C CNN
	1    2925 3350
	0    -1   1    0   
$EndComp
$Comp
L Device:R R16
U 1 1 62053588
P 2925 3250
F 0 "R16" V 2875 3025 39  0000 L CNN
F 1 "1k" V 2925 3200 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2855 3250 50  0001 C CNN
F 3 "~" H 2925 3250 50  0001 C CNN
	1    2925 3250
	0    -1   1    0   
$EndComp
Text GLabel 3250 2450 2    39   UnSpc ~ 0
VD0
Text GLabel 3250 3950 2    39   UnSpc ~ 0
VA7
Text GLabel 3250 3850 2    39   UnSpc ~ 0
VA6
Text GLabel 3250 3750 2    39   UnSpc ~ 0
VA5
Text GLabel 3250 3650 2    39   UnSpc ~ 0
VA4
Text GLabel 3250 3550 2    39   UnSpc ~ 0
VA3
Text GLabel 3250 3350 2    39   UnSpc ~ 0
VA1
Text GLabel 3250 3250 2    39   UnSpc ~ 0
VA0
Text GLabel 3250 2550 2    39   UnSpc ~ 0
VD1
Text GLabel 3250 2650 2    39   UnSpc ~ 0
VD2
Text GLabel 3250 2750 2    39   UnSpc ~ 0
VD3
Text GLabel 3250 2850 2    39   UnSpc ~ 0
VD4
Text GLabel 3250 2950 2    39   UnSpc ~ 0
VD5
Text GLabel 3250 3050 2    39   UnSpc ~ 0
VD6
Text GLabel 3250 3150 2    39   UnSpc ~ 0
VD7
Text GLabel 3975 3700 0    39   Input ~ 0
nRD
Text GLabel 5875 3700 2    39   Output ~ 0
VA11
Text GLabel 5875 1900 2    39   Output ~ 0
VA16
Text GLabel 5875 3400 2    39   Output ~ 0
VA13
Text GLabel 5875 3000 2    39   Output ~ 0
VA14
Text GLabel 5875 3100 2    39   Output ~ 0
VA3
Text GLabel 5875 3500 2    39   Output ~ 0
VA2
Text GLabel 5875 1600 2    39   Output ~ 0
VA4
Text GLabel 5875 3300 2    39   Output ~ 0
VA7
Text GLabel 5875 1700 2    39   Output ~ 0
nVRD
Text GLabel 5875 2800 2    39   Output ~ 0
VA0
Text GLabel 5875 2900 2    39   Output ~ 0
VA1
Text GLabel 5875 2500 2    39   BiDi ~ 0
VD6
Text GLabel 3975 2000 0    39   Output ~ 0
Csync
Text GLabel 5875 3200 2    39   Output ~ 0
VA15
Text GLabel 5875 3900 2    39   Output ~ 0
VA8
Text GLabel 5875 2600 2    39   BiDi ~ 0
VD3
Text GLabel 5875 3600 2    39   Output ~ 0
VA12
Text GLabel 5875 4000 2    39   Output ~ 0
VA10
Text GLabel 5875 1800 2    39   Output ~ 0
VA5
Text GLabel 5875 2000 2    39   BiDi ~ 0
VD1
Text GLabel 5875 2300 2    39   BiDi ~ 0
VD2
Text GLabel 5875 2700 2    39   BiDi ~ 0
VD4
Text GLabel 5875 2400 2    39   BiDi ~ 0
VD5
Text GLabel 5875 2200 2    39   BiDi ~ 0
VD7
Text GLabel 3975 1200 0    39   Input ~ 0
nRST
$Comp
L sizif128-rescue:EPM7128SLC84-10N-EPM7128SLC84-10N U4
U 1 1 5C6203D6
P 4925 2800
F 0 "U4" H 4225 4875 50  0000 C CNN
F 1 "EPM7128SLC84-15N" H 5775 4875 50  0000 C CNN
F 2 "Package_LCC:PLCC-84_THT-Socket" H 4325 2500 50  0001 L BNN
F 3 "Unavailable" H 4725 2900 50  0001 L BNN
F 4 "EPM7128SLC84-10N" H 4575 3000 50  0001 L BNN "Field4"
F 5 "None" H 4825 2800 50  0001 L BNN "Field5"
F 6 "PLCC-84 Intel" H 4625 2700 50  0001 L BNN "Field6"
F 7 "Intel" H 4825 2600 50  0001 L BNN "Field8"
	1    4925 2800
	1    0    0    -1  
$EndComp
Connection ~ 5075 600 
Wire Wire Line
	4975 600  5075 600 
Wire Wire Line
	4875 600  4975 600 
Connection ~ 4975 600 
Connection ~ 4875 600 
Wire Wire Line
	4775 600  4875 600 
Wire Wire Line
	4675 600  4775 600 
Connection ~ 4775 600 
Wire Wire Line
	5175 600  5275 600 
Wire Wire Line
	5075 600  5175 600 
Connection ~ 5175 600 
Wire Wire Line
	4575 600  4675 600 
Connection ~ 4675 600 
Connection ~ 4575 600 
Text GLabel 3975 2900 0    39   Output ~ 0
CLKCPU
Text GLabel 5875 3800 2    39   Output ~ 0
nVWR
Text GLabel 5875 1400 2    39   Input ~ 0
TMS
Text GLabel 5875 1100 2    39   Input ~ 0
TCK
Text GLabel 5875 1300 2    39   Output ~ 0
TDO
Text GLabel 5875 1200 2    39   Input ~ 0
TDI
$Comp
L power:+5V #PWR01
U 1 1 5CE81107
P 4575 600
F 0 "#PWR01" H 4575 450 50  0001 C CNN
F 1 "+5V" H 4590 765 39  0001 C CNN
F 2 "" H 4575 600 50  0001 C CNN
F 3 "" H 4575 600 50  0001 C CNN
	1    4575 600 
	1    0    0    -1  
$EndComp
Text GLabel 3975 1600 0    39   Output ~ 0
BEEPER
Text GLabel 3975 2100 0    39   Output ~ 0
Blue
Text GLabel 3975 1700 0    39   Output ~ 0
Green
Text GLabel 3975 1900 0    39   Output ~ 0
Red
Text GLabel 3975 1800 0    39   Output ~ 0
Bright
Text GLabel 8750 2075 0    39   Input ~ 0
AY_BC1
Text GLabel 8750 1975 0    39   Input ~ 0
AY_BDIR
Text GLabel 3975 1100 0    39   Input ~ 0
CLK14
$Comp
L power:GND #PWR09
U 1 1 5ABCEA74
P 8750 1825
F 0 "#PWR09" H 8750 1575 50  0001 C CNN
F 1 "GND" H 8755 1652 39  0001 C CNN
F 2 "" H 8750 1825 50  0001 C CNN
F 3 "" H 8750 1825 50  0001 C CNN
	1    8750 1825
	0    1    1    0   
$EndComp
NoConn ~ 8750 2525
Text GLabel 8750 2425 0    39   Input ~ 0
AY_CLK
$Comp
L power:+5V #PWR08
U 1 1 5ABB2AE9
P 8750 1725
F 0 "#PWR08" H 8750 1575 50  0001 C CNN
F 1 "+5V" H 8765 1890 39  0001 C CNN
F 2 "" H 8750 1725 50  0001 C CNN
F 3 "" H 8750 1725 50  0001 C CNN
	1    8750 1725
	0    -1   -1   0   
$EndComp
Text GLabel 8750 1575 0    39   BiDi ~ 0
D7
Text GLabel 8750 1475 0    39   BiDi ~ 0
D6
Text GLabel 8750 1375 0    39   BiDi ~ 0
D5
Text GLabel 8750 1275 0    39   BiDi ~ 0
D4
Text GLabel 8750 1175 0    39   BiDi ~ 0
D3
Text GLabel 8750 1075 0    39   BiDi ~ 0
D2
Text GLabel 8750 975  0    39   BiDi ~ 0
D1
Text GLabel 8750 875  0    39   BiDi ~ 0
D0
$Comp
L power:GND #PWR018
U 1 1 5AB364EB
P 9350 3125
F 0 "#PWR018" H 9350 2875 50  0001 C CNN
F 1 "GND" H 9355 2952 39  0001 C CNN
F 2 "" H 9350 3125 50  0001 C CNN
F 3 "" H 9350 3125 50  0001 C CNN
	1    9350 3125
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR02
U 1 1 5AB361CA
P 9350 625
F 0 "#PWR02" H 9350 475 50  0001 C CNN
F 1 "+5V" H 9365 790 39  0001 C CNN
F 2 "" H 9350 625 50  0001 C CNN
F 3 "" H 9350 625 50  0001 C CNN
	1    9350 625 
	1    0    0    -1  
$EndComp
$Comp
L my:YM2149 U2
U 1 1 5AB2C535
P 9350 2025
F 0 "U2" H 8950 3325 51  0000 C CNN
F 1 "YM2149" H 9675 3325 51  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm_Socket" H 9350 3625 39  0001 C CNN
F 3 "" H 9350 3625 39  0001 C CNN
	1    9350 2025
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5E09CC70
P 10350 1325
F 0 "R5" H 10200 1325 39  0000 L CNN
F 1 "1k" V 10350 1300 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 10280 1325 50  0001 C CNN
F 3 "~" H 10350 1325 50  0001 C CNN
	1    10350 1325
	-1   0    0    1   
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 5ED79585
P 3150 1800
F 0 "H3" H 3250 1800 50  0001 L CNN
F 1 "MountingHole" H 3250 1755 50  0001 L CNN
F 2 "MountingHole:MountingHole_3mm" H 3150 1800 50  0001 C CNN
F 3 "~" H 3150 1800 50  0001 C CNN
	1    3150 1800
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 5ED6E047
P 2925 1800
F 0 "H2" H 3025 1800 50  0001 L CNN
F 1 "MountingHole" H 3025 1755 50  0001 L CNN
F 2 "MountingHole:MountingHole_3mm" H 2925 1800 50  0001 C CNN
F 3 "~" H 2925 1800 50  0001 C CNN
	1    2925 1800
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H1
U 1 1 5ED6AD99
P 2700 1800
F 0 "H1" H 2800 1800 50  0001 L CNN
F 1 "MountingHole" H 2800 1755 50  0001 L CNN
F 2 "MountingHole:MountingHole_3mm" H 2700 1800 50  0001 C CNN
F 3 "~" H 2700 1800 50  0001 C CNN
	1    2700 1800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR044
U 1 1 5E5A20F3
P 6875 4950
F 0 "#PWR044" H 6875 4700 50  0001 C CNN
F 1 "GND" H 6880 4777 39  0001 C CNN
F 2 "" H 6875 4950 50  0001 C CNN
F 3 "" H 6875 4950 50  0001 C CNN
	1    6875 4950
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR036
U 1 1 5E5A20F9
P 6875 4650
F 0 "#PWR036" H 6875 4500 50  0001 C CNN
F 1 "+5V" H 6875 4800 39  0001 C CNN
F 2 "" H 6875 4650 50  0001 C CNN
F 3 "" H 6875 4650 50  0001 C CNN
	1    6875 4650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR035
U 1 1 5E5A20E7
P 6650 4650
F 0 "#PWR035" H 6650 4500 50  0001 C CNN
F 1 "+5V" H 6650 4800 39  0001 C CNN
F 2 "" H 6650 4650 50  0001 C CNN
F 3 "" H 6650 4650 50  0001 C CNN
	1    6650 4650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR043
U 1 1 5E5A20E1
P 6650 4950
F 0 "#PWR043" H 6650 4700 50  0001 C CNN
F 1 "GND" H 6655 4777 39  0001 C CNN
F 2 "" H 6650 4950 50  0001 C CNN
F 3 "" H 6650 4950 50  0001 C CNN
	1    6650 4950
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR034
U 1 1 5E51C936
P 6425 4650
F 0 "#PWR034" H 6425 4500 50  0001 C CNN
F 1 "+5V" H 6425 4800 39  0001 C CNN
F 2 "" H 6425 4650 50  0001 C CNN
F 3 "" H 6425 4650 50  0001 C CNN
	1    6425 4650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR042
U 1 1 5E51C930
P 6425 4950
F 0 "#PWR042" H 6425 4700 50  0001 C CNN
F 1 "GND" H 6430 4777 39  0001 C CNN
F 2 "" H 6425 4950 50  0001 C CNN
F 3 "" H 6425 4950 50  0001 C CNN
	1    6425 4950
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR021
U 1 1 618DD94F
P 8325 3300
F 0 "#PWR021" H 8325 3150 50  0001 C CNN
F 1 "+5V" H 8325 3450 39  0001 C CNN
F 2 "" H 8325 3300 50  0001 C CNN
F 3 "" H 8325 3300 50  0001 C CNN
	1    8325 3300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR023
U 1 1 618DD949
P 8325 3600
F 0 "#PWR023" H 8325 3350 50  0001 C CNN
F 1 "GND" H 8330 3427 39  0001 C CNN
F 2 "" H 8325 3600 50  0001 C CNN
F 3 "" H 8325 3600 50  0001 C CNN
	1    8325 3600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C13
U 1 1 5E5A20ED
P 6875 4800
F 0 "C13" H 6775 4725 39  0000 C CNN
F 1 "100n" H 6750 4900 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 6913 4650 50  0001 C CNN
F 3 "~" H 6875 4800 50  0001 C CNN
	1    6875 4800
	-1   0    0    1   
$EndComp
$Comp
L Device:C C12
U 1 1 5E5A20DB
P 6650 4800
F 0 "C12" H 6550 4725 39  0000 C CNN
F 1 "100n" H 6525 4900 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 6688 4650 50  0001 C CNN
F 3 "~" H 6650 4800 50  0001 C CNN
	1    6650 4800
	-1   0    0    1   
$EndComp
$Comp
L Device:C C11
U 1 1 5E51C92A
P 6425 4800
F 0 "C11" H 6325 4725 39  0000 C CNN
F 1 "100n" H 6300 4900 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 6463 4650 50  0001 C CNN
F 3 "~" H 6425 4800 50  0001 C CNN
	1    6425 4800
	-1   0    0    1   
$EndComp
$Comp
L Device:C C10
U 1 1 5E51C918
P 6875 4225
F 0 "C10" H 6775 4150 39  0000 C CNN
F 1 "100n" H 6750 4325 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 6913 4075 50  0001 C CNN
F 3 "~" H 6875 4225 50  0001 C CNN
	1    6875 4225
	-1   0    0    1   
$EndComp
$Comp
L Device:C C9
U 1 1 5E4A404D
P 6650 4225
F 0 "C9" H 6550 4150 39  0000 C CNN
F 1 "100n" H 6525 4325 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 6688 4075 50  0001 C CNN
F 3 "~" H 6650 4225 50  0001 C CNN
	1    6650 4225
	-1   0    0    1   
$EndComp
$Comp
L Device:C C8
U 1 1 5E4A403B
P 6425 4225
F 0 "C8" H 6325 4150 39  0000 C CNN
F 1 "100n" H 6300 4325 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 6463 4075 50  0001 C CNN
F 3 "~" H 6425 4225 50  0001 C CNN
	1    6425 4225
	-1   0    0    1   
$EndComp
$Comp
L Device:C C5
U 1 1 618DD943
P 8325 3450
F 0 "C5" H 8225 3375 39  0000 C CNN
F 1 "100n" H 8200 3550 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 8363 3300 50  0001 C CNN
F 3 "~" H 8325 3450 50  0001 C CNN
	1    8325 3450
	-1   0    0    1   
$EndComp
$Comp
L Device:C C3
U 1 1 6150A2CF
P 10175 2950
F 0 "C3" H 10075 2875 39  0000 C CNN
F 1 "100n" H 10050 3050 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 10213 2800 50  0001 C CNN
F 3 "~" H 10175 2950 50  0001 C CNN
	1    10175 2950
	-1   0    0    1   
$EndComp
$Comp
L 74xx:74HC04 U6
U 3 1 5D9B1231
P 1575 6850
F 0 "U6" H 1575 7143 39  0000 C CNN
F 1 "74HCU04" H 1575 7068 39  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 1575 6850 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 1575 6850 50  0001 C CNN
	3    1575 6850
	1    0    0    -1  
$EndComp
Text GLabel 5875 2100 2    39   BiDi ~ 0
VD0
$Comp
L Device:C C2
U 1 1 5F982930
P 10800 1325
F 0 "C2" H 10700 1250 39  0000 C CNN
F 1 "100n" H 10675 1425 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 10838 1175 50  0001 C CNN
F 3 "~" H 10800 1325 50  0001 C CNN
	1    10800 1325
	-1   0    0    1   
$EndComp
Wire Wire Line
	10350 975  10400 975 
Wire Wire Line
	10800 1875 10700 1875
Wire Wire Line
	10800 1475 10800 1875
Connection ~ 10800 1875
Wire Wire Line
	10375 1875 10400 1875
Wire Wire Line
	10800 1175 10800 975 
Connection ~ 10800 975 
Wire Wire Line
	10800 975  10925 975 
Wire Wire Line
	10700 975  10800 975 
Wire Wire Line
	10400 1975 10375 1975
Wire Wire Line
	10700 1975 10800 1975
Wire Wire Line
	10800 1975 10800 1875
$Comp
L Device:R R7
U 1 1 60350603
P 10550 1975
F 0 "R7" V 10575 1775 39  0000 L CNN
F 1 "10k" V 10550 1925 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 10480 1975 50  0001 C CNN
F 3 "~" H 10550 1975 50  0001 C CNN
	1    10550 1975
	0    -1   -1   0   
$EndComp
Text GLabel 10375 1975 0    39   Input ~ 0
TAPE_OUT
$Comp
L power:+5V #PWR0103
U 1 1 5FC2095F
P 7950 1525
F 0 "#PWR0103" H 7950 1375 50  0001 C CNN
F 1 "+5V" H 7965 1690 39  0001 C CNN
F 2 "" H 7950 1525 50  0001 C CNN
F 3 "" H 7950 1525 50  0001 C CNN
	1    7950 1525
	0    1    -1   0   
$EndComp
Connection ~ 10450 6100
Wire Wire Line
	10450 6000 10450 6100
$Comp
L Connector:Barrel_Jack_Switch J3
U 1 1 5B555C2D
P 10750 6000
F 0 "J3" H 10750 6325 50  0000 C CNN
F 1 "DS-210" H 10750 6225 39  0001 C CNN
F 2 "Connector_BarrelJack:BarrelJack_Horizontal" H 10800 5960 50  0001 C CNN
F 3 "~" H 10800 5960 50  0001 C CNN
F 4 "DC IN / 5V" H 10750 6225 50  0000 C CNN "Desc"
	1    10750 6000
	-1   0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG01
U 1 1 604560F9
P 10175 5700
F 0 "#FLG01" H 10175 5775 50  0001 C CNN
F 1 "PWR_FLAG" H 10175 5874 50  0001 C CNN
F 2 "" H 10175 5700 50  0001 C CNN
F 3 "~" H 10175 5700 50  0001 C CNN
	1    10175 5700
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR029
U 1 1 5D8CB390
P 9800 6300
F 0 "#PWR029" H 9800 6050 50  0001 C CNN
F 1 "GND" H 9805 6127 39  0001 C CNN
F 2 "" H 9800 6300 50  0001 C CNN
F 3 "" H 9800 6300 50  0001 C CNN
	1    9800 6300
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D11
U 1 1 5F601D09
P 9800 6150
F 0 "D11" V 9800 6075 39  0000 R CNN
F 1 "LED" V 9748 6033 50  0001 R CNN
F 2 "LED_THT:LED_D4.0mm" H 9800 6150 50  0001 C CNN
F 3 "~" H 9800 6150 50  0001 C CNN
	1    9800 6150
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R54
U 1 1 5F604BA0
P 9800 5850
F 0 "R54" H 9600 5850 39  0000 L CNN
F 1 "1k" V 9800 5800 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 9730 5850 50  0001 C CNN
F 3 "~" H 9800 5850 50  0001 C CNN
	1    9800 5850
	-1   0    0    -1  
$EndComp
Connection ~ 10525 5050
Wire Wire Line
	10475 5050 10525 5050
Wire Wire Line
	10525 4850 10525 4950
Wire Wire Line
	10525 4750 10525 4850
Connection ~ 10525 4850
Connection ~ 10525 4950
Wire Wire Line
	10525 5050 10525 4950
$Comp
L power:GND #PWR038
U 1 1 5E2BDC4F
P 10525 4650
F 0 "#PWR038" H 10525 4400 50  0001 C CNN
F 1 "GND" V 10530 4477 39  0001 C CNN
F 2 "" H 10525 4650 50  0001 C CNN
F 3 "" H 10525 4650 50  0001 C CNN
	1    10525 4650
	0    1    1    0   
$EndComp
Text GLabel 10475 5050 0    39   Output ~ 0
TAPE_IN
$Comp
L Device:CP C6
U 1 1 5C3D9F1D
P 10175 6000
F 0 "C6" H 9975 6050 39  0000 L CNN
F 1 "470u" H 9900 5975 39  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D10.0mm_P3.80mm" H 10213 5850 50  0001 C CNN
F 3 "~" H 10175 6000 50  0001 C CNN
	1    10175 6000
	-1   0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J9
U 1 1 5F8A660F
P 10350 5500
F 0 "J9" V 10350 5300 50  0000 R CNN
F 1 "Conn_01x02" V 10223 5312 50  0001 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 10350 5500 50  0001 C CNN
F 3 "~" H 10350 5500 50  0001 C CNN
	1    10350 5500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10350 5700 10175 5700
Connection ~ 10175 5700
$Comp
L power:+5V #PWR027
U 1 1 5B6C7C72
P 9800 5700
F 0 "#PWR027" H 9800 5550 50  0001 C CNN
F 1 "+5V" H 9800 5850 39  0000 C CNN
F 2 "" H 9800 5700 50  0001 C CNN
F 3 "" H 9800 5700 50  0001 C CNN
	1    9800 5700
	-1   0    0    -1  
$EndComp
Connection ~ 9800 5700
Wire Wire Line
	10175 5850 10175 5700
Connection ~ 10175 6300
Wire Wire Line
	10450 6100 10450 6300
Wire Wire Line
	10175 6150 10175 6300
Wire Wire Line
	10450 5700 10450 5900
Connection ~ 9800 6300
$Comp
L power:PWR_FLAG #FLG02
U 1 1 5E2B10DE
P 10175 6300
F 0 "#FLG02" H 10175 6375 50  0001 C CNN
F 1 "PWR_FLAG" H 10175 6474 50  0001 C CNN
F 2 "" H 10175 6300 50  0001 C CNN
F 3 "~" H 10175 6300 50  0001 C CNN
	1    10175 6300
	1    0    0    1   
$EndComp
Wire Wire Line
	9800 5700 10175 5700
Wire Wire Line
	10175 6300 10450 6300
Wire Wire Line
	9800 6300 10175 6300
$Comp
L Connector:AudioJack3_SwitchTR J4
U 1 1 5D6458B4
P 10725 4750
F 0 "J4" H 10725 5075 50  0000 R CNN
F 1 "PJ307" H 10445 4584 50  0001 R CNN
F 2 "my:SWITCHCRAFT_35RAPC4BHN2" H 10725 4750 50  0001 C CNN
F 3 "~" H 10725 4750 50  0001 C CNN
F 4 "EAR" H 10750 4975 50  0000 R CNN "Desc"
	1    10725 4750
	-1   0    0    -1  
$EndComp
Text GLabel 10650 3925 0    39   Input ~ 0
SOUND
Text GLabel 10650 3450 0    39   Input ~ 0
VIDEO
$Comp
L power:GND #PWR024
U 1 1 5F0B4723
P 10850 3650
F 0 "#PWR024" H 10850 3400 50  0001 C CNN
F 1 "GND" H 10850 3525 39  0001 C CNN
F 2 "" H 10850 3650 50  0001 C CNN
F 3 "" H 10850 3650 50  0001 C CNN
	1    10850 3650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR025
U 1 1 5F0B3BC7
P 10850 4125
F 0 "#PWR025" H 10850 3875 50  0001 C CNN
F 1 "GND" H 10850 4000 39  0001 C CNN
F 2 "" H 10850 4125 50  0001 C CNN
F 3 "" H 10850 4125 50  0001 C CNN
	1    10850 4125
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_Coaxial J2
U 1 1 5F025971
P 10850 3925
F 0 "J2" H 10950 3925 50  0000 L CNN
F 1 "RCJ-013" H 10675 4075 50  0001 L CNN
F 2 "my:CUI_RCJ-013" H 10850 3925 50  0001 C CNN
F 3 " ~" H 10850 3925 50  0001 C CNN
	1    10850 3925
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_Coaxial J1
U 1 1 5F0446AF
P 10850 3450
F 0 "J1" H 10950 3450 50  0000 L CNN
F 1 "RCJ-013" H 10675 3600 50  0001 L CNN
F 2 "my:CUI_RCJ-013" H 10850 3450 50  0001 C CNN
F 3 " ~" H 10850 3450 50  0001 C CNN
	1    10850 3450
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D9
U 1 1 5E87EDF5
P 7450 6275
F 0 "D9" H 7550 6300 39  0000 C CNN
F 1 "BAT85" H 7450 6400 50  0001 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 7450 6275 50  0001 C CNN
F 3 "~" H 7450 6275 50  0001 C CNN
	1    7450 6275
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D8
U 1 1 5E87EDEF
P 7450 6175
F 0 "D8" H 7550 6200 39  0000 C CNN
F 1 "BAT85" H 7450 6300 50  0001 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 7450 6175 50  0001 C CNN
F 3 "~" H 7450 6175 50  0001 C CNN
	1    7450 6175
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D7
U 1 1 5E87EDE9
P 7450 6075
F 0 "D7" H 7550 6100 39  0000 C CNN
F 1 "BAT85" H 7450 6200 50  0001 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 7450 6075 50  0001 C CNN
F 3 "~" H 7450 6075 50  0001 C CNN
	1    7450 6075
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D6
U 1 1 5E87EDE3
P 7450 5975
F 0 "D6" H 7550 6000 39  0000 C CNN
F 1 "BAT85" H 7450 6100 50  0001 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 7450 5975 50  0001 C CNN
F 3 "~" H 7450 5975 50  0001 C CNN
	1    7450 5975
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D5
U 1 1 5E8633BA
P 7450 5875
F 0 "D5" H 7550 5900 39  0000 C CNN
F 1 "BAT85" H 7450 6000 50  0001 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 7450 5875 50  0001 C CNN
F 3 "~" H 7450 5875 50  0001 C CNN
	1    7450 5875
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D4
U 1 1 5E8633B4
P 7450 5775
F 0 "D4" H 7550 5800 39  0000 C CNN
F 1 "BAT85" H 7450 5900 50  0001 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 7450 5775 50  0001 C CNN
F 3 "~" H 7450 5775 50  0001 C CNN
	1    7450 5775
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D2
U 1 1 5E862678
P 7450 5675
F 0 "D2" H 7550 5700 39  0000 C CNN
F 1 "BAT85" H 7450 5800 50  0001 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 7450 5675 50  0001 C CNN
F 3 "~" H 7450 5675 50  0001 C CNN
	1    7450 5675
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D1
U 1 1 5E826CA3
P 7450 5575
F 0 "D1" H 7550 5600 39  0000 C CNN
F 1 "BAT85" H 7450 5700 50  0001 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 7450 5575 50  0001 C CNN
F 3 "~" H 7450 5575 50  0001 C CNN
	1    7450 5575
	1    0    0    -1  
$EndComp
Text GLabel 7300 6275 0    39   Input ~ 0
A15
Text GLabel 7300 6175 0    39   Input ~ 0
A14
Text GLabel 7300 6075 0    39   Input ~ 0
A8
Text GLabel 7300 5975 0    39   Input ~ 0
A13
Text GLabel 7300 5875 0    39   Input ~ 0
A12
Text GLabel 7300 5775 0    39   Input ~ 0
A9
Text GLabel 7300 5675 0    39   Input ~ 0
A10
Text GLabel 7300 5575 0    39   Input ~ 0
A11
$Comp
L Connector_Generic:Conn_01x08 J5
U 1 1 5FB9292E
P 7800 5875
F 0 "J5" H 7750 6275 50  0000 L CNN
F 1 "Conn_01x08" H 7880 5776 50  0001 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x08_P2.54mm_Vertical" H 7800 5875 50  0001 C CNN
F 3 "~" H 7800 5875 50  0001 C CNN
F 4 "KB_A" H 7725 5375 39  0000 L CNN "Desc"
	1    7800 5875
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x05 J6
U 1 1 5FD04AD5
P 9200 6075
F 0 "J6" H 9150 6375 50  0000 L CNN
F 1 "Conn_01x05" H 9280 6026 50  0001 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x05_P2.54mm_Vertical" H 9200 6075 50  0001 C CNN
F 3 "~" H 9200 6075 50  0001 C CNN
F 4 "KB_D" H 9125 5775 39  0000 L CNN "Desc"
	1    9200 6075
	1    0    0    -1  
$EndComp
Text GLabel 9025 5500 3    39   Output ~ 0
TMS
Text GLabel 9125 5500 3    39   Output ~ 0
TDI
$Comp
L Device:R_Network08 RN1
U 1 1 609D4018
P 8825 5300
F 0 "RN1" H 8175 5350 39  0000 L CNN
F 1 "4.7k" H 8175 5250 39  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 9300 5300 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 8825 5300 50  0001 C CNN
	1    8825 5300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR049
U 1 1 5E2BC5D4
P 8425 5100
F 0 "#PWR049" H 8425 4950 50  0001 C CNN
F 1 "+5V" H 8425 5250 39  0001 C CNN
F 2 "" H 8425 5100 50  0001 C CNN
F 3 "" H 8425 5100 50  0001 C CNN
	1    8425 5100
	1    0    0    -1  
$EndComp
Text GLabel 8300 5875 0    39   Output ~ 0
KD0
Text GLabel 8300 5975 0    39   Output ~ 0
KD1
Text GLabel 8300 6075 0    39   Output ~ 0
KD2
Text GLabel 8300 6175 0    39   Output ~ 0
KD3
Text GLabel 8300 6275 0    39   Output ~ 0
KD4
Wire Wire Line
	8425 6275 9000 6275
Connection ~ 8425 6275
Wire Wire Line
	8525 6175 9000 6175
Connection ~ 8525 6175
Wire Wire Line
	8625 6075 9000 6075
Connection ~ 8625 6075
Wire Wire Line
	8725 5975 9000 5975
Connection ~ 8725 5975
Wire Wire Line
	8300 5975 8725 5975
Wire Wire Line
	8300 6075 8625 6075
Wire Wire Line
	8300 6175 8525 6175
Wire Wire Line
	8300 6275 8425 6275
Wire Wire Line
	8425 5500 8425 6275
Wire Wire Line
	8525 5500 8525 6175
Wire Wire Line
	8625 6075 8625 5500
Wire Wire Line
	8725 5975 8725 5500
Text GLabel 8925 5500 3    39   Output ~ 0
nRST
Wire Wire Line
	8300 5875 8825 5875
Wire Wire Line
	8825 5500 8825 5875
Connection ~ 8825 5875
Wire Wire Line
	8825 5875 9000 5875
$Comp
L Device:R R36
U 1 1 5EB8D2BB
P 2750 6000
F 0 "R36" H 2825 6050 39  0000 L CNN
F 1 "47k" V 2750 5950 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2680 6000 50  0001 C CNN
F 3 "~" H 2750 6000 50  0001 C CNN
	1    2750 6000
	-1   0    0    1   
$EndComp
$Comp
L Device:D D3
U 1 1 5EB721B7
P 3150 5400
F 0 "D3" H 3050 5350 39  0000 C CNN
F 1 "1N4148" H 3150 5525 50  0001 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 3150 5400 50  0001 C CNN
F 3 "~" H 3150 5400 50  0001 C CNN
	1    3150 5400
	-1   0    0    1   
$EndComp
$Comp
L Device:R R38
U 1 1 5EB42D4C
P 2200 5800
F 0 "R38" V 2275 5750 39  0000 L CNN
F 1 "10k" V 2200 5750 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2130 5800 50  0001 C CNN
F 3 "~" H 2200 5800 50  0001 C CNN
	1    2200 5800
	0    1    -1   0   
$EndComp
$Comp
L Device:R R35
U 1 1 5EB42275
P 2750 5600
F 0 "R35" H 2825 5550 39  0000 L CNN
F 1 "47k" V 2750 5550 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2680 5600 50  0001 C CNN
F 3 "~" H 2750 5600 50  0001 C CNN
	1    2750 5600
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR054
U 1 1 61ADEF59
P 2750 6150
F 0 "#PWR054" H 2750 5900 50  0001 C CNN
F 1 "GND" H 2755 5977 39  0001 C CNN
F 2 "" H 2750 6150 50  0001 C CNN
F 3 "" H 2750 6150 50  0001 C CNN
	1    2750 6150
	1    0    0    -1  
$EndComp
Text GLabel 2050 5800 0    39   Input ~ 0
TAPE_IN
Text GLabel 4075 5800 2    39   Output ~ 0
TAPE_IN0
$Comp
L Device:CP C15
U 1 1 5F6E9A81
P 2500 5800
F 0 "C15" V 2350 5750 39  0000 L CNN
F 1 "10u" V 2625 5750 39  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 2538 5650 50  0001 C CNN
F 3 "~" H 2500 5800 50  0001 C CNN
	1    2500 5800
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0102
U 1 1 5F6F810B
P 2750 5450
F 0 "#PWR0102" H 2750 5300 50  0001 C CNN
F 1 "+5V" H 2750 5600 39  0001 C CNN
F 2 "" H 2750 5450 50  0001 C CNN
F 3 "" H 2750 5450 50  0001 C CNN
	1    2750 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 5750 2750 5800
Wire Wire Line
	2750 5800 2650 5800
Connection ~ 2750 5800
Wire Wire Line
	2750 5800 2750 5850
$Comp
L 74xx:74HC04 U6
U 1 1 5CF6F413
P 3775 5800
F 0 "U6" H 3775 6093 39  0000 C CNN
F 1 "74HCU04" H 3775 6018 39  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 3775 5800 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 3775 5800 50  0001 C CNN
	1    3775 5800
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U6
U 2 1 5D4EEEE8
P 3175 5800
F 0 "U6" H 3175 6093 39  0000 C CNN
F 1 "74HCU04" H 3175 6018 39  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 3175 5800 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 3175 5800 50  0001 C CNN
	2    3175 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 5800 2850 5800
Wire Wire Line
	3000 6175 2850 6175
Connection ~ 2850 5800
Wire Wire Line
	2850 5800 2875 5800
Wire Wire Line
	3300 6175 3475 6175
Connection ~ 3475 5800
$Comp
L Device:D D12
U 1 1 5F797F7D
P 3150 6175
F 0 "D12" H 3275 6225 39  0000 C CNN
F 1 "1N4148" H 3150 6300 50  0001 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 3150 6175 50  0001 C CNN
F 3 "~" H 3150 6175 50  0001 C CNN
	1    3150 6175
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 5400 2850 5400
Wire Wire Line
	3300 5400 3475 5400
Wire Wire Line
	2850 5400 2850 5800
Wire Wire Line
	3475 5400 3475 5800
Wire Wire Line
	3475 6175 3475 5800
Wire Wire Line
	2850 5800 2850 6175
Wire Wire Line
	7475 4150 7625 4150
Wire Wire Line
	7475 4450 7625 4450
Wire Wire Line
	7475 4250 7625 4250
Wire Wire Line
	8225 4150 8125 4150
$Comp
L power:GND #PWR064
U 1 1 5DE095FC
P 8175 4475
F 0 "#PWR064" H 8175 4225 50  0001 C CNN
F 1 "GND" H 8180 4302 39  0001 C CNN
F 2 "" H 8175 4475 50  0001 C CNN
F 3 "" H 8175 4475 50  0001 C CNN
	1    8175 4475
	1    0    0    -1  
$EndComp
Wire Wire Line
	8125 4050 8175 4050
Wire Wire Line
	8225 4000 8225 4150
Wire Wire Line
	8125 4450 8175 4450
Wire Wire Line
	8175 4050 8175 4450
Connection ~ 8175 4450
Wire Wire Line
	8175 4450 8175 4475
Text GLabel 7475 4450 0    39   Output ~ 0
TDI
Text GLabel 7475 4150 0    39   Input ~ 0
TDO
Text GLabel 7475 4050 0    39   Output ~ 0
TCK
Wire Wire Line
	7475 4050 7550 4050
Text GLabel 7475 4250 0    39   Output ~ 0
TMS
NoConn ~ 7625 4350
NoConn ~ 8125 4350
NoConn ~ 8125 4250
Wire Wire Line
	7550 4475 7550 4050
Connection ~ 7550 4050
Wire Wire Line
	7550 4050 7625 4050
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J7
U 1 1 5DDDF159
P 7825 4250
F 0 "J7" H 7875 4667 50  0000 C CNN
F 1 "Conn_02x05" H 7875 4576 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Vertical" H 7825 4250 50  0001 C CNN
F 3 "~" H 7825 4250 50  0001 C CNN
F 4 "JTAG" H 7875 4575 50  0000 C CNN "Desc"
	1    7825 4250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR070
U 1 1 5E0D9B29
P 7550 4775
F 0 "#PWR070" H 7550 4525 50  0001 C CNN
F 1 "GND" H 7550 4625 39  0001 C CNN
F 2 "" H 7550 4775 50  0001 C CNN
F 3 "" H 7550 4775 50  0001 C CNN
	1    7550 4775
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR061
U 1 1 607F4003
P 8225 4000
F 0 "#PWR061" H 8225 3850 50  0001 C CNN
F 1 "+5V" H 8225 4150 39  0001 C CNN
F 2 "" H 8225 4000 50  0001 C CNN
F 3 "" H 8225 4000 50  0001 C CNN
	1    8225 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R53
U 1 1 5E0D999B
P 7550 4625
F 0 "R53" H 7375 4625 39  0000 L CNN
F 1 "10k" V 7550 4575 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 7480 4625 50  0001 C CNN
F 3 "~" H 7550 4625 50  0001 C CNN
	1    7550 4625
	-1   0    0    1   
$EndComp
$Comp
L 74xx:74HC04 U6
U 6 1 5CFBEB43
P 2475 6850
F 0 "U6" H 2475 7143 39  0000 C CNN
F 1 "74HCU04" H 2475 7068 39  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 2475 6850 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 2475 6850 50  0001 C CNN
	6    2475 6850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R44
U 1 1 5A83ADBE
P 2775 7050
F 0 "R44" H 2650 7125 39  0000 C CNN
F 1 "1k" V 2775 7050 39  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2705 7050 50  0001 C CNN
F 3 "~" H 2775 7050 50  0001 C CNN
	1    2775 7050
	-1   0    0    1   
$EndComp
$Comp
L 74xx:74HC04 U6
U 5 1 5D9B7FD5
P 3075 6850
F 0 "U6" H 3075 7143 39  0000 C CNN
F 1 "74HCU04" H 3075 7068 39  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 3075 6850 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 3075 6850 50  0001 C CNN
	5    3075 6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2775 6850 2775 6900
Connection ~ 2775 6850
Wire Wire Line
	2175 6850 2175 7250
Connection ~ 2175 6850
Wire Wire Line
	2775 6450 2775 6850
Wire Wire Line
	2175 6450 2175 6850
Wire Wire Line
	2775 6450 2625 6450
Wire Wire Line
	2325 6450 2175 6450
Connection ~ 2775 7250
Wire Wire Line
	2775 7250 2775 7300
Wire Wire Line
	2775 7250 2775 7200
Wire Wire Line
	2625 7250 2775 7250
Wire Wire Line
	2175 7250 2175 7300
Connection ~ 2175 7250
Wire Wire Line
	2325 7250 2175 7250
Wire Wire Line
	2175 7600 2775 7600
$Comp
L power:GND #PWR063
U 1 1 5D93D08B
P 2175 7600
F 0 "#PWR063" H 2175 7350 50  0001 C CNN
F 1 "GND" H 2180 7427 39  0001 C CNN
F 2 "" H 2175 7600 50  0001 C CNN
F 3 "" H 2175 7600 50  0001 C CNN
	1    2175 7600
	1    0    0    -1  
$EndComp
Text GLabel 3375 6850 2    39   Output ~ 0
CLK16
$Comp
L Device:R R34
U 1 1 5D340A72
P 2475 6450
F 0 "R34" V 2550 6450 39  0000 C CNN
F 1 "1M" V 2475 6450 39  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2405 6450 50  0001 C CNN
F 3 "~" H 2475 6450 50  0001 C CNN
	1    2475 6450
	0    -1   -1   0   
$EndComp
$Comp
L Device:Crystal Y2
U 1 1 5E767BDB
P 2475 7250
F 0 "Y2" H 2475 7475 39  0000 C CNN
F 1 "16MHz" H 2475 7400 39  0000 C CNN
F 2 "Crystal:Crystal_HC49-U_Vertical" H 2475 7250 50  0001 C CNN
F 3 "~" H 2475 7250 50  0001 C CNN
	1    2475 7250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R41
U 1 1 5EFE7367
P 5050 6325
F 0 "R41" V 4975 6275 39  0000 L CNN
F 1 "2.4k" V 5050 6250 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 4980 6325 50  0001 C CNN
F 3 "~" H 5050 6325 50  0001 C CNN
	1    5050 6325
	0    -1   1    0   
$EndComp
$Comp
L Device:R R40
U 1 1 5EFE736E
P 5050 6125
F 0 "R40" V 4975 6075 39  0000 L CNN
F 1 "4.7k" V 5050 6050 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 4980 6125 50  0001 C CNN
F 3 "~" H 5050 6125 50  0001 C CNN
	1    5050 6125
	0    -1   1    0   
$EndComp
$Comp
L power:+5V #PWR053
U 1 1 5F0BF19A
P 6150 6125
F 0 "#PWR053" H 6150 5975 50  0001 C CNN
F 1 "+5V" H 6150 6275 39  0001 C CNN
F 2 "" H 6150 6125 50  0001 C CNN
F 3 "" H 6150 6125 50  0001 C CNN
	1    6150 6125
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR058
U 1 1 5F1E24F0
P 5775 6700
F 0 "#PWR058" H 5775 6450 50  0001 C CNN
F 1 "GND" H 5780 6527 39  0001 C CNN
F 2 "" H 5775 6700 50  0001 C CNN
F 3 "" H 5775 6700 50  0001 C CNN
	1    5775 6700
	1    0    0    -1  
$EndComp
Text GLabel 6675 6550 2    39   Output ~ 0
VIDEO
Wire Wire Line
	5200 5925 5250 5925
Wire Wire Line
	5250 5925 5250 6125
Wire Wire Line
	5250 6325 5300 6325
Wire Wire Line
	5200 6525 5250 6525
Wire Wire Line
	5200 6325 5250 6325
Connection ~ 5250 6325
Wire Wire Line
	5250 6325 5250 6525
Wire Wire Line
	5200 6125 5250 6125
Connection ~ 5250 6125
Wire Wire Line
	5250 6125 5250 6325
Wire Wire Line
	5775 6250 5775 6325
Wire Wire Line
	5600 6325 5650 6325
Connection ~ 5775 6325
Wire Wire Line
	5775 6325 5775 6400
$Comp
L power:+5V #PWR051
U 1 1 662B1C85
P 5775 5950
F 0 "#PWR051" H 5775 5800 50  0001 C CNN
F 1 "+5V" H 5775 6100 39  0001 C CNN
F 2 "" H 5775 5950 50  0001 C CNN
F 3 "" H 5775 5950 50  0001 C CNN
	1    5775 5950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR068
U 1 1 667692B5
P 6150 7575
F 0 "#PWR068" H 6150 7325 50  0001 C CNN
F 1 "GND" H 6155 7402 39  0001 C CNN
F 2 "" H 6150 7575 50  0001 C CNN
F 3 "" H 6150 7575 50  0001 C CNN
	1    6150 7575
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR059
U 1 1 667692AF
P 6150 6775
F 0 "#PWR059" H 6150 6625 50  0001 C CNN
F 1 "+5V" H 6150 6925 39  0001 C CNN
F 2 "" H 6150 6775 50  0001 C CNN
F 3 "" H 6150 6775 50  0001 C CNN
	1    6150 6775
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR067
U 1 1 667692A9
P 5775 7575
F 0 "#PWR067" H 5775 7325 50  0001 C CNN
F 1 "GND" H 5780 7402 39  0001 C CNN
F 2 "" H 5775 7575 50  0001 C CNN
F 3 "" H 5775 7575 50  0001 C CNN
	1    5775 7575
	1    0    0    -1  
$EndComp
$Comp
L Device:R R50
U 1 1 6676928C
P 5050 7325
F 0 "R50" V 5125 7275 39  0000 L CNN
F 1 "8.2k" V 5050 7250 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 4980 7325 50  0001 C CNN
F 3 "~" H 5050 7325 50  0001 C CNN
	1    5050 7325
	0    -1   -1   0   
$EndComp
$Comp
L Device:Q_NPN_CBE Q3
U 1 1 6676927A
P 6050 6975
F 0 "Q3" H 6250 7025 39  0000 L CNN
F 1 "BC549B" H 6250 6925 39  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 6250 7075 50  0001 C CNN
F 3 "~" H 6050 6975 50  0001 C CNN
	1    6050 6975
	1    0    0    -1  
$EndComp
$Comp
L Device:R R52
U 1 1 66769274
P 6150 7425
F 0 "R52" H 5975 7425 39  0000 L CNN
F 1 "82" V 6150 7375 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 6080 7425 50  0001 C CNN
F 3 "~" H 6150 7425 50  0001 C CNN
	1    6150 7425
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR066
U 1 1 66C3F104
P 5425 7575
F 0 "#PWR066" H 5425 7325 50  0001 C CNN
F 1 "GND" H 5430 7402 39  0001 C CNN
F 2 "" H 5425 7575 50  0001 C CNN
F 3 "" H 5425 7575 50  0001 C CNN
	1    5425 7575
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR060
U 1 1 66CAD871
P 5425 6875
F 0 "#PWR060" H 5425 6725 50  0001 C CNN
F 1 "+5V" H 5425 7025 39  0001 C CNN
F 2 "" H 5425 6875 50  0001 C CNN
F 3 "" H 5425 6875 50  0001 C CNN
	1    5425 6875
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 7325 5250 7325
Connection ~ 5250 7225
Wire Wire Line
	5250 7225 5250 7325
Wire Wire Line
	5425 7175 5425 7225
Wire Wire Line
	5775 7275 5775 7225
Wire Wire Line
	5775 7225 5425 7225
Wire Wire Line
	6150 7275 6150 7225
Wire Wire Line
	6150 7225 6625 7225
Connection ~ 6150 7225
Wire Wire Line
	6150 7225 6150 7175
Wire Wire Line
	6625 7225 6625 7025
$Comp
L Device:R R49
U 1 1 66769286
P 5050 7125
F 0 "R49" V 5125 7075 39  0000 L CNN
F 1 "3.6k" V 5050 7050 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 4980 7125 50  0001 C CNN
F 3 "~" H 5050 7125 50  0001 C CNN
	1    5050 7125
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5200 7125 5250 7125
Wire Wire Line
	5250 7125 5250 7225
$Comp
L Device:Q_NPN_CBE Q2
U 1 1 5EFE6ED2
P 6050 6325
F 0 "Q2" H 6250 6375 39  0000 L CNN
F 1 "BC549B" H 6250 6275 39  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 6250 6425 50  0001 C CNN
F 3 "~" H 6050 6325 50  0001 C CNN
	1    6050 6325
	1    0    0    -1  
$EndComp
Connection ~ 6625 6550
Wire Wire Line
	6625 6550 6675 6550
Wire Wire Line
	5850 6325 5775 6325
Wire Wire Line
	6625 6725 6625 6550
Wire Wire Line
	6150 6550 6150 6525
Connection ~ 5425 7225
Wire Wire Line
	5425 7225 5425 7275
Wire Wire Line
	5425 7225 5250 7225
Wire Wire Line
	5650 6725 5650 6325
Connection ~ 5650 6325
Wire Wire Line
	5650 6325 5775 6325
Wire Wire Line
	5200 6725 5650 6725
Wire Wire Line
	6625 6550 6575 6550
Wire Wire Line
	6150 6550 6275 6550
$Comp
L Device:R R47
U 1 1 5F3E5B7C
P 6425 6550
F 0 "R47" V 6500 6475 39  0000 L CNN
F 1 "68" V 6425 6500 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 6355 6550 50  0001 C CNN
F 3 "~" H 6425 6550 50  0001 C CNN
	1    6425 6550
	0    1    -1   0   
$EndComp
$Comp
L Device:D_Schottky D10
U 1 1 5F22C337
P 5050 6725
F 0 "D10" H 5050 6825 39  0000 C CNN
F 1 "BAT85" H 5050 6850 50  0001 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 5050 6725 50  0001 C CNN
F 3 "~" H 5050 6725 50  0001 C CNN
	1    5050 6725
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 7125 4875 7125
Wire Wire Line
	4875 7325 4900 7325
Wire Wire Line
	4875 6525 4900 6525
Wire Wire Line
	4875 6325 4900 6325
Wire Wire Line
	4900 6125 4875 6125
Wire Wire Line
	4875 5925 4900 5925
Wire Wire Line
	4900 6725 4875 6725
Text GLabel 4875 7125 0    39   Input ~ 0
CHROMA1
Text GLabel 4875 7325 0    39   Input ~ 0
CHROMA0
Text GLabel 4875 6525 0    39   Input ~ 0
Bright
Text GLabel 4875 6325 0    39   Input ~ 0
Green
Text GLabel 4875 6125 0    39   Input ~ 0
Red
Text GLabel 4875 5925 0    39   Input ~ 0
Blue
Text GLabel 4875 6725 0    39   Input ~ 0
Csync
$Comp
L Device:C C17
U 1 1 6676926E
P 6625 6875
F 0 "C17" H 6800 6775 39  0000 R CNN
F 1 "470p" H 6825 6975 39  0000 R CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 6663 6725 50  0001 C CNN
F 3 "~" H 6625 6875 50  0001 C CNN
	1    6625 6875
	1    0    0    1   
$EndComp
$Comp
L Device:C C22
U 1 1 6676929F
P 5775 7425
F 0 "C22" H 5950 7525 39  0000 R CNN
F 1 "100p" H 5975 7325 39  0000 R CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 5813 7275 50  0001 C CNN
F 3 "~" H 5775 7425 50  0001 C CNN
	1    5775 7425
	1    0    0    -1  
$EndComp
$Comp
L Device:R R37
U 1 1 5EFE7375
P 5050 5925
F 0 "R37" V 4975 5875 39  0000 L CNN
F 1 "10k" V 5050 5850 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 4980 5925 50  0001 C CNN
F 3 "~" H 5050 5925 50  0001 C CNN
	1    5050 5925
	0    -1   1    0   
$EndComp
$Comp
L Device:R R42
U 1 1 65E1C7FE
P 5450 6325
F 0 "R42" V 5525 6275 39  0000 L CNN
F 1 "10k" V 5450 6275 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 5380 6325 50  0001 C CNN
F 3 "~" H 5450 6325 50  0001 C CNN
	1    5450 6325
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R45
U 1 1 65D45F83
P 5050 6525
F 0 "R45" V 4975 6475 39  0000 L CNN
F 1 "6.8k" V 5050 6450 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 4980 6525 50  0001 C CNN
F 3 "~" H 5050 6525 50  0001 C CNN
	1    5050 6525
	0    -1   1    0   
$EndComp
$Comp
L Device:R R46
U 1 1 5F1E22D2
P 5775 6550
F 0 "R46" H 5825 6550 39  0000 L CNN
F 1 "15k" V 5775 6500 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 5705 6550 50  0001 C CNN
F 3 "~" H 5775 6550 50  0001 C CNN
	1    5775 6550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R39
U 1 1 6616ACC8
P 5775 6100
F 0 "R39" H 5600 6100 39  0000 L CNN
F 1 "18k" V 5775 6050 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 5705 6100 50  0001 C CNN
F 3 "~" H 5775 6100 50  0001 C CNN
	1    5775 6100
	-1   0    0    1   
$EndComp
Wire Wire Line
	5850 6975 5775 6975
Wire Wire Line
	5775 6975 5775 7225
Connection ~ 5775 7225
$Comp
L Device:R R51
U 1 1 66769292
P 5425 7425
F 0 "R51" H 5475 7425 39  0000 L CNN
F 1 "1.2k" V 5425 7350 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 5355 7425 50  0001 C CNN
F 3 "~" H 5425 7425 50  0001 C CNN
	1    5425 7425
	1    0    0    1   
$EndComp
$Comp
L Device:R R48
U 1 1 66769280
P 5425 7025
F 0 "R48" H 5475 7025 39  0000 L CNN
F 1 "1.2k" V 5425 6950 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 5355 7025 50  0001 C CNN
F 3 "~" H 5425 7025 50  0001 C CNN
	1    5425 7025
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U6
U 7 1 63A6C2BB
P 3875 7100
F 0 "U6" H 3625 7450 39  0000 L CNN
F 1 "74HCU04" H 3950 7450 39  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 3875 7100 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 3875 7100 50  0001 C CNN
	7    3875 7100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR057
U 1 1 63A70551
P 3875 6600
F 0 "#PWR057" H 3875 6450 50  0001 C CNN
F 1 "+5V" H 3890 6765 39  0001 C CNN
F 2 "" H 3875 6600 50  0001 C CNN
F 3 "" H 3875 6600 50  0001 C CNN
	1    3875 6600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR071
U 1 1 63A709C8
P 3875 7600
F 0 "#PWR071" H 3875 7350 50  0001 C CNN
F 1 "GND" H 3880 7427 39  0001 C CNN
F 2 "" H 3875 7600 50  0001 C CNN
F 3 "" H 3875 7600 50  0001 C CNN
	1    3875 7600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C23
U 1 1 60F0AF21
P 3425 7450
F 0 "C23" H 3325 7375 39  0000 C CNN
F 1 "100n" H 3300 7550 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 3463 7300 50  0001 C CNN
F 3 "~" H 3425 7450 50  0001 C CNN
	1    3425 7450
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR072
U 1 1 60F0AF27
P 3425 7600
F 0 "#PWR072" H 3425 7350 50  0001 C CNN
F 1 "GND" H 3430 7427 39  0001 C CNN
F 2 "" H 3425 7600 50  0001 C CNN
F 3 "" H 3425 7600 50  0001 C CNN
	1    3425 7600
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR065
U 1 1 60F0AF2D
P 3425 7300
F 0 "#PWR065" H 3425 7150 50  0001 C CNN
F 1 "+5V" H 3425 7450 39  0001 C CNN
F 2 "" H 3425 7300 50  0001 C CNN
F 3 "" H 3425 7300 50  0001 C CNN
	1    3425 7300
	1    0    0    -1  
$EndComp
Wire Wire Line
	9350 4100 9575 4100
$Comp
L power:GND #PWR037
U 1 1 5D11747D
P 9575 4500
F 0 "#PWR037" H 9575 4250 50  0001 C CNN
F 1 "GND" H 9580 4327 39  0001 C CNN
F 2 "" H 9575 4500 50  0001 C CNN
F 3 "" H 9575 4500 50  0001 C CNN
	1    9575 4500
	1    0    0    -1  
$EndComp
Text GLabel 9750 4100 2    39   Output ~ 0
nRST
$Comp
L Device:CP C7
U 1 1 5E0EE18B
P 9575 4300
F 0 "C7" H 9693 4338 39  0000 L CNN
F 1 "10u" H 9693 4263 39  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 9613 4150 50  0001 C CNN
F 3 "~" H 9575 4300 50  0001 C CNN
	1    9575 4300
	1    0    0    -1  
$EndComp
Connection ~ 9575 4100
Wire Wire Line
	9750 4100 9575 4100
Text Notes 9125 4025 0    50   Italic 0
pullup on RN1
Wire Wire Line
	9350 4100 9125 4100
Connection ~ 9350 4100
Wire Wire Line
	9125 4350 9125 4500
Wire Wire Line
	9125 4500 9350 4500
Wire Wire Line
	9575 4450 9575 4500
Wire Wire Line
	9575 4500 9350 4500
Connection ~ 9575 4500
Connection ~ 9350 4500
Wire Wire Line
	9575 4100 9575 4150
$Comp
L Switch:SW_Push SW2
U 1 1 5F8CEFFC
P 9350 4300
F 0 "SW2" V 9500 4350 39  0000 L CNN
F 1 "SW_Push" H 9225 4225 39  0001 L CNN
F 2 "Button_Switch_THT:SW_Tactile_SPST_Angled_PTS645Vx83-2LFS" H 9350 4500 50  0001 C CNN
F 3 "" H 9350 4500 50  0001 C CNN
F 4 "RST" H 9350 4225 50  0001 C CNN "Desc"
	1    9350 4300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9125 4100 9125 4250
$Comp
L Connector_Generic:Conn_01x02 J8
U 1 1 5F948D62
P 8925 4350
F 0 "J8" H 8975 4150 50  0000 R CNN
F 1 "Conn_01x02" V 8798 4162 50  0001 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 8925 4350 50  0001 C CNN
F 3 "~" H 8925 4350 50  0001 C CNN
	1    8925 4350
	-1   0    0    1   
$EndComp
$Comp
L Device:C C19
U 1 1 5A83A7CC
P 1275 7450
F 0 "C19" H 1175 7375 39  0000 C CNN
F 1 "47p" H 1175 7550 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 1313 7300 50  0001 C CNN
F 3 "~" H 1275 7450 50  0001 C CNN
	1    1275 7450
	-1   0    0    1   
$EndComp
$Comp
L Device:C C21
U 1 1 5D93D0BB
P 2775 7450
F 0 "C21" H 2675 7375 39  0000 C CNN
F 1 "47p" H 2675 7550 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 2813 7300 50  0001 C CNN
F 3 "~" H 2775 7450 50  0001 C CNN
	1    2775 7450
	-1   0    0    1   
$EndComp
$Comp
L Device:CTRIM C20
U 1 1 5F9D0D73
P 2175 7450
F 0 "C20" H 2291 7488 39  0000 L CNN
F 1 "50p" H 2291 7413 39  0000 L CNN
F 2 "my:C_Trim_D6.3mm_P5.50mm" H 2175 7450 50  0001 C CNN
F 3 "~" H 2175 7450 50  0001 C CNN
	1    2175 7450
	1    0    0    -1  
$EndComp
Connection ~ 2175 7600
Connection ~ 675  7600
$Comp
L Device:C C18
U 1 1 5D93D085
P 675 7450
F 0 "C18" H 575 7375 39  0000 C CNN
F 1 "33p" H 575 7550 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 713 7300 50  0001 C CNN
F 3 "~" H 675 7450 50  0001 C CNN
	1    675  7450
	-1   0    0    1   
$EndComp
$EndSCHEMATC
