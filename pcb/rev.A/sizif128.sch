EESchema Schematic File Version 4
LIBS:sizif128-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "ZX-SIZIF-128"
Date "2019-12-11"
Rev ""
Comp "Uzix"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L my:YM2149 U2
U 1 1 5AB2C535
P 9475 2000
F 0 "U2" H 9075 3300 51  0000 C CNN
F 1 "YM2149" H 9800 3300 51  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm_Socket" H 9475 3600 39  0001 C CNN
F 3 "" H 9475 3600 39  0001 C CNN
	1    9475 2000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR02
U 1 1 5AB361CA
P 9475 600
F 0 "#PWR02" H 9475 450 50  0001 C CNN
F 1 "+5V" H 9490 765 39  0001 C CNN
F 2 "" H 9475 600 50  0001 C CNN
F 3 "" H 9475 600 50  0001 C CNN
	1    9475 600 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR018
U 1 1 5AB364EB
P 9475 3100
F 0 "#PWR018" H 9475 2850 50  0001 C CNN
F 1 "GND" H 9480 2927 39  0001 C CNN
F 2 "" H 9475 3100 50  0001 C CNN
F 3 "" H 9475 3100 50  0001 C CNN
	1    9475 3100
	1    0    0    -1  
$EndComp
Text GLabel 8875 850  0    39   BiDi ~ 0
D0
Text GLabel 8875 950  0    39   BiDi ~ 0
D1
Text GLabel 8875 1050 0    39   BiDi ~ 0
D2
Text GLabel 8875 1150 0    39   BiDi ~ 0
D3
Text GLabel 8875 1250 0    39   BiDi ~ 0
D4
Text GLabel 8875 1350 0    39   BiDi ~ 0
D5
Text GLabel 8875 1450 0    39   BiDi ~ 0
D6
Text GLabel 8875 1550 0    39   BiDi ~ 0
D7
$Comp
L power:+5V #PWR08
U 1 1 5ABB2AE9
P 8875 1700
F 0 "#PWR08" H 8875 1550 50  0001 C CNN
F 1 "+5V" H 8890 1865 39  0001 C CNN
F 2 "" H 8875 1700 50  0001 C CNN
F 3 "" H 8875 1700 50  0001 C CNN
	1    8875 1700
	0    -1   -1   0   
$EndComp
Text GLabel 8875 2400 0    39   Input ~ 0
AY_CLK
NoConn ~ 8875 2500
$Comp
L power:GND #PWR09
U 1 1 5ABCEA74
P 8875 1800
F 0 "#PWR09" H 8875 1550 50  0001 C CNN
F 1 "GND" H 8880 1627 39  0001 C CNN
F 2 "" H 8875 1800 50  0001 C CNN
F 3 "" H 8875 1800 50  0001 C CNN
	1    8875 1800
	0    1    1    0   
$EndComp
$Comp
L Device:R R41
U 1 1 5EFE7367
P 4500 6250
F 0 "R41" V 4425 6200 39  0000 L CNN
F 1 "2.4k" V 4500 6175 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 4430 6250 50  0001 C CNN
F 3 "~" H 4500 6250 50  0001 C CNN
	1    4500 6250
	0    -1   1    0   
$EndComp
$Comp
L Device:R R40
U 1 1 5EFE736E
P 4500 6050
F 0 "R40" V 4425 6000 39  0000 L CNN
F 1 "4.7k" V 4500 5975 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 4430 6050 50  0001 C CNN
F 3 "~" H 4500 6050 50  0001 C CNN
	1    4500 6050
	0    -1   1    0   
$EndComp
$Comp
L Device:R R37
U 1 1 5EFE7375
P 4500 5850
F 0 "R37" V 4425 5800 39  0000 L CNN
F 1 "10k" V 4500 5775 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 4430 5850 50  0001 C CNN
F 3 "~" H 4500 5850 50  0001 C CNN
	1    4500 5850
	0    -1   1    0   
$EndComp
$Comp
L power:+5V #PWR053
U 1 1 5F0BF19A
P 5625 6050
F 0 "#PWR053" H 5625 5900 50  0001 C CNN
F 1 "+5V" H 5625 6200 39  0001 C CNN
F 2 "" H 5625 6050 50  0001 C CNN
F 3 "" H 5625 6050 50  0001 C CNN
	1    5625 6050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR058
U 1 1 5F1E24F0
P 5250 6625
F 0 "#PWR058" H 5250 6375 50  0001 C CNN
F 1 "GND" H 5255 6452 39  0001 C CNN
F 2 "" H 5250 6625 50  0001 C CNN
F 3 "" H 5250 6625 50  0001 C CNN
	1    5250 6625
	1    0    0    -1  
$EndComp
Text GLabel 4325 6650 0    39   Input ~ 0
Csync
Text GLabel 6150 6475 2    39   Output ~ 0
VIDEO
Text GLabel 4025 1100 0    39   Input ~ 0
CLK14
Text GLabel 8875 1950 0    39   Input ~ 0
AY_BDIR
Text GLabel 8875 2050 0    39   Input ~ 0
AY_BC1
Text GLabel 4025 1800 0    39   Output ~ 0
Bright
Text GLabel 4025 1900 0    39   Output ~ 0
Red
Text GLabel 4025 1700 0    39   Output ~ 0
Green
Text GLabel 4025 2100 0    39   Output ~ 0
Blue
Text GLabel 4025 1600 0    39   Output ~ 0
BEEPER
$Comp
L power:+5V #PWR01
U 1 1 5CE81107
P 4625 600
F 0 "#PWR01" H 4625 450 50  0001 C CNN
F 1 "+5V" H 4640 765 39  0001 C CNN
F 2 "" H 4625 600 50  0001 C CNN
F 3 "" H 4625 600 50  0001 C CNN
	1    4625 600 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR045
U 1 1 5CEE906F
P 4625 5000
F 0 "#PWR045" H 4625 4750 50  0001 C CNN
F 1 "GND" H 4630 4827 39  0001 C CNN
F 2 "" H 4625 5000 50  0001 C CNN
F 3 "" H 4625 5000 50  0001 C CNN
	1    4625 5000
	1    0    0    -1  
$EndComp
Text GLabel 5925 1200 2    39   Input ~ 0
TDI
Text GLabel 5925 1300 2    39   Output ~ 0
TDO
Text GLabel 5925 1100 2    39   Input ~ 0
TCK
Text GLabel 5925 1400 2    39   Input ~ 0
TMS
Text GLabel 5925 3800 2    39   Output ~ 0
nVWR
Text GLabel 4025 2900 0    39   Output ~ 0
CLKCPU
Text GLabel 4325 5850 0    39   Input ~ 0
Blue
Text GLabel 4325 6050 0    39   Input ~ 0
Red
Text GLabel 4325 6250 0    39   Input ~ 0
Green
Wire Wire Line
	4325 5850 4350 5850
Wire Wire Line
	4350 6050 4325 6050
Wire Wire Line
	4325 6250 4350 6250
Text GLabel 4325 6450 0    39   Input ~ 0
Bright
$Comp
L Device:R R45
U 1 1 65D45F83
P 4500 6450
F 0 "R45" V 4425 6400 39  0000 L CNN
F 1 "8.2k" V 4500 6375 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 4430 6450 50  0001 C CNN
F 3 "~" H 4500 6450 50  0001 C CNN
	1    4500 6450
	0    -1   1    0   
$EndComp
Wire Wire Line
	4325 6450 4350 6450
Wire Wire Line
	4350 6650 4325 6650
Wire Wire Line
	4650 5850 4725 5850
Wire Wire Line
	4725 5850 4725 6050
Wire Wire Line
	4725 6250 4775 6250
Wire Wire Line
	4650 6450 4725 6450
Wire Wire Line
	4650 6250 4725 6250
Connection ~ 4725 6250
Wire Wire Line
	4725 6250 4725 6450
Wire Wire Line
	4650 6050 4725 6050
Connection ~ 4725 6050
Wire Wire Line
	4725 6050 4725 6250
Wire Wire Line
	5250 6175 5250 6250
Wire Wire Line
	5075 6250 5125 6250
Connection ~ 5250 6250
Wire Wire Line
	5250 6250 5250 6325
$Comp
L power:+5V #PWR051
U 1 1 662B1C85
P 5250 5875
F 0 "#PWR051" H 5250 5725 50  0001 C CNN
F 1 "+5V" H 5250 6025 39  0001 C CNN
F 2 "" H 5250 5875 50  0001 C CNN
F 3 "" H 5250 5875 50  0001 C CNN
	1    5250 5875
	1    0    0    -1  
$EndComp
Text GLabel 4325 7250 0    39   Input ~ 0
CHROMA0
$Comp
L power:GND #PWR068
U 1 1 667692B5
P 5625 7500
F 0 "#PWR068" H 5625 7250 50  0001 C CNN
F 1 "GND" H 5630 7327 39  0001 C CNN
F 2 "" H 5625 7500 50  0001 C CNN
F 3 "" H 5625 7500 50  0001 C CNN
	1    5625 7500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR059
U 1 1 667692AF
P 5625 6700
F 0 "#PWR059" H 5625 6550 50  0001 C CNN
F 1 "+5V" H 5625 6850 39  0001 C CNN
F 2 "" H 5625 6700 50  0001 C CNN
F 3 "" H 5625 6700 50  0001 C CNN
	1    5625 6700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR067
U 1 1 667692A9
P 5250 7500
F 0 "#PWR067" H 5250 7250 50  0001 C CNN
F 1 "GND" H 5255 7327 39  0001 C CNN
F 2 "" H 5250 7500 50  0001 C CNN
F 3 "" H 5250 7500 50  0001 C CNN
	1    5250 7500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C22
U 1 1 6676929F
P 5250 7350
F 0 "C22" H 5400 7425 39  0000 R CNN
F 1 "100p" H 5425 7275 39  0000 R CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 5288 7200 50  0001 C CNN
F 3 "~" H 5250 7350 50  0001 C CNN
	1    5250 7350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R50
U 1 1 6676928C
P 4500 7250
F 0 "R50" V 4425 7175 39  0000 L CNN
F 1 "8.2k" V 4500 7175 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 4430 7250 50  0001 C CNN
F 3 "~" H 4500 7250 50  0001 C CNN
	1    4500 7250
	0    -1   -1   0   
$EndComp
$Comp
L Device:Q_NPN_CBE Q3
U 1 1 6676927A
P 5525 6900
F 0 "Q3" H 5725 6950 39  0000 L CNN
F 1 "BC547B" H 5725 6850 39  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 5725 7000 50  0001 C CNN
F 3 "~" H 5525 6900 50  0001 C CNN
	1    5525 6900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R52
U 1 1 66769274
P 5625 7350
F 0 "R52" V 5550 7300 39  0000 L CNN
F 1 "82" V 5625 7300 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 5555 7350 50  0001 C CNN
F 3 "~" H 5625 7350 50  0001 C CNN
	1    5625 7350
	-1   0    0    1   
$EndComp
$Comp
L Device:R R48
U 1 1 66769280
P 4900 6950
F 0 "R48" V 4975 6900 39  0000 L CNN
F 1 "1.2k" V 4900 6875 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 4830 6950 50  0001 C CNN
F 3 "~" H 4900 6950 50  0001 C CNN
	1    4900 6950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R51
U 1 1 66769292
P 4900 7350
F 0 "R51" V 4825 7300 39  0000 L CNN
F 1 "1.2k" V 4900 7275 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 4830 7350 50  0001 C CNN
F 3 "~" H 4900 7350 50  0001 C CNN
	1    4900 7350
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR066
U 1 1 66C3F104
P 4900 7500
F 0 "#PWR066" H 4900 7250 50  0001 C CNN
F 1 "GND" H 4905 7327 39  0001 C CNN
F 2 "" H 4900 7500 50  0001 C CNN
F 3 "" H 4900 7500 50  0001 C CNN
	1    4900 7500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR060
U 1 1 66CAD871
P 4900 6800
F 0 "#PWR060" H 4900 6650 50  0001 C CNN
F 1 "+5V" H 4900 6950 39  0001 C CNN
F 2 "" H 4900 6800 50  0001 C CNN
F 3 "" H 4900 6800 50  0001 C CNN
	1    4900 6800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4325 7250 4350 7250
Wire Wire Line
	4650 7250 4725 7250
Wire Wire Line
	5325 7150 5250 7150
Connection ~ 4725 7150
Wire Wire Line
	4725 7150 4725 7250
Wire Wire Line
	4900 7100 4900 7150
Wire Wire Line
	5250 7200 5250 7150
Connection ~ 5250 7150
Wire Wire Line
	5250 7150 4900 7150
Wire Wire Line
	5325 6900 5325 7150
$Comp
L Device:C C17
U 1 1 6676926E
P 6100 6800
F 0 "C17" H 6250 6875 39  0000 R CNN
F 1 "470p" H 6275 6725 39  0000 R CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 6138 6650 50  0001 C CNN
F 3 "~" H 6100 6800 50  0001 C CNN
	1    6100 6800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5625 7200 5625 7150
Wire Wire Line
	5625 7150 6100 7150
Connection ~ 5625 7150
Wire Wire Line
	5625 7150 5625 7100
Wire Wire Line
	6100 7150 6100 6950
Wire Wire Line
	4350 7050 4325 7050
$Comp
L Device:R R49
U 1 1 66769286
P 4500 7050
F 0 "R49" V 4425 6975 39  0000 L CNN
F 1 "2.2k" V 4500 6975 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 4430 7050 50  0001 C CNN
F 3 "~" H 4500 7050 50  0001 C CNN
	1    4500 7050
	0    -1   -1   0   
$EndComp
Text GLabel 4325 7050 0    39   Input ~ 0
CHROMA1
Wire Wire Line
	4650 7050 4725 7050
Wire Wire Line
	4725 7050 4725 7150
$Comp
L Device:Q_NPN_CBE Q2
U 1 1 5EFE6ED2
P 5525 6250
F 0 "Q2" H 5725 6300 39  0000 L CNN
F 1 "BC547B" H 5725 6200 39  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 5725 6350 50  0001 C CNN
F 3 "~" H 5525 6250 50  0001 C CNN
	1    5525 6250
	1    0    0    -1  
$EndComp
Connection ~ 6100 6475
Wire Wire Line
	6100 6475 6150 6475
Wire Wire Line
	5325 6250 5250 6250
Wire Wire Line
	6100 6650 6100 6475
Wire Wire Line
	5625 6475 5625 6450
Connection ~ 4900 7150
Wire Wire Line
	4900 7150 4900 7200
Wire Wire Line
	4900 7150 4725 7150
NoConn ~ 10075 1200
NoConn ~ 10075 2850
NoConn ~ 10075 2750
NoConn ~ 10075 2650
NoConn ~ 10075 2550
NoConn ~ 10075 2450
NoConn ~ 10075 2350
NoConn ~ 10075 2250
NoConn ~ 10075 2150
Wire Wire Line
	10475 1050 10375 1050
Wire Wire Line
	10375 950  10475 950 
Wire Wire Line
	10475 850  10375 850 
$Comp
L Device:R R3
U 1 1 5ABB8ADC
P 10225 1050
F 0 "R3" V 10250 825 39  0000 L CNN
F 1 "1k" V 10225 1000 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 10155 1050 50  0001 C CNN
F 3 "~" H 10225 1050 50  0001 C CNN
	1    10225 1050
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R1
U 1 1 5ABB8A0E
P 10225 850
F 0 "R1" V 10250 625 39  0000 L CNN
F 1 "1k" V 10225 800 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 10155 850 50  0001 C CNN
F 3 "~" H 10225 850 50  0001 C CNN
	1    10225 850 
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R2
U 1 1 5ABB88D9
P 10225 950
F 0 "R2" V 10250 725 39  0000 L CNN
F 1 "1k" V 10225 900 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 10155 950 50  0001 C CNN
F 3 "~" H 10225 950 50  0001 C CNN
	1    10225 950 
	0    -1   -1   0   
$EndComp
Connection ~ 4625 600 
Connection ~ 4725 5000
Wire Wire Line
	4725 5000 4625 5000
Connection ~ 4725 600 
Wire Wire Line
	4625 600  4725 600 
Connection ~ 5225 600 
Wire Wire Line
	5125 600  5225 600 
Wire Wire Line
	5225 600  5325 600 
Connection ~ 4825 5000
Wire Wire Line
	4825 5000 4725 5000
Wire Wire Line
	4925 5000 4825 5000
Connection ~ 4825 600 
Wire Wire Line
	4725 600  4825 600 
Wire Wire Line
	4825 600  4925 600 
Connection ~ 5225 5000
Wire Wire Line
	5325 5000 5225 5000
Wire Wire Line
	5225 5000 5125 5000
Connection ~ 4925 5000
Connection ~ 4925 600 
Connection ~ 5025 5000
Wire Wire Line
	5025 5000 4925 5000
Wire Wire Line
	5125 5000 5025 5000
Connection ~ 5025 600 
Wire Wire Line
	4925 600  5025 600 
Wire Wire Line
	5025 600  5125 600 
Connection ~ 4625 5000
Connection ~ 5125 5000
Connection ~ 5125 600 
$Comp
L sizif128-rescue:EPM7128SLC84-10N-EPM7128SLC84-10N U4
U 1 1 5C6203D6
P 4975 2800
F 0 "U4" H 4275 4875 50  0000 C CNN
F 1 "EPM7128SLC84-15N" H 5825 4875 50  0000 C CNN
F 2 "Package_LCC:PLCC-84_THT-Socket" H 4375 2500 50  0001 L BNN
F 3 "Unavailable" H 4775 2900 50  0001 L BNN
F 4 "EPM7128SLC84-10N" H 4625 3000 50  0001 L BNN "Field4"
F 5 "None" H 4875 2800 50  0001 L BNN "Field5"
F 6 "PLCC-84 Intel" H 4675 2700 50  0001 L BNN "Field6"
F 7 "Intel" H 4875 2600 50  0001 L BNN "Field8"
	1    4975 2800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 6150A2CF
P 10375 2550
F 0 "C3" H 10275 2475 39  0000 C CNN
F 1 "100n" H 10275 2650 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 10413 2400 50  0001 C CNN
F 3 "~" H 10375 2550 50  0001 C CNN
	1    10375 2550
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR015
U 1 1 6150A2D5
P 10375 2700
F 0 "#PWR015" H 10375 2450 50  0001 C CNN
F 1 "GND" H 10380 2527 39  0001 C CNN
F 2 "" H 10375 2700 50  0001 C CNN
F 3 "" H 10375 2700 50  0001 C CNN
	1    10375 2700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR013
U 1 1 6150A2DB
P 10375 2400
F 0 "#PWR013" H 10375 2250 50  0001 C CNN
F 1 "+5V" H 10375 2550 39  0001 C CNN
F 2 "" H 10375 2400 50  0001 C CNN
F 3 "" H 10375 2400 50  0001 C CNN
	1    10375 2400
	1    0    0    -1  
$EndComp
Text GLabel 4025 1200 0    39   Input ~ 0
nRST
$Comp
L Device:C C8
U 1 1 5E4A403B
P 6350 4825
F 0 "C8" H 6250 4750 39  0000 C CNN
F 1 "100n" H 6250 4925 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 6388 4675 50  0001 C CNN
F 3 "~" H 6350 4825 50  0001 C CNN
	1    6350 4825
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR039
U 1 1 5E4A4041
P 6350 4975
F 0 "#PWR039" H 6350 4725 50  0001 C CNN
F 1 "GND" H 6355 4802 39  0001 C CNN
F 2 "" H 6350 4975 50  0001 C CNN
F 3 "" H 6350 4975 50  0001 C CNN
	1    6350 4975
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR031
U 1 1 5E4A4047
P 6350 4675
F 0 "#PWR031" H 6350 4525 50  0001 C CNN
F 1 "+5V" H 6350 4825 39  0001 C CNN
F 2 "" H 6350 4675 50  0001 C CNN
F 3 "" H 6350 4675 50  0001 C CNN
	1    6350 4675
	1    0    0    -1  
$EndComp
$Comp
L Device:C C9
U 1 1 5E4A404D
P 6575 4825
F 0 "C9" H 6475 4750 39  0000 C CNN
F 1 "100n" H 6475 4925 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 6613 4675 50  0001 C CNN
F 3 "~" H 6575 4825 50  0001 C CNN
	1    6575 4825
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR040
U 1 1 5E4A4053
P 6575 4975
F 0 "#PWR040" H 6575 4725 50  0001 C CNN
F 1 "GND" H 6580 4802 39  0001 C CNN
F 2 "" H 6575 4975 50  0001 C CNN
F 3 "" H 6575 4975 50  0001 C CNN
	1    6575 4975
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR032
U 1 1 5E4A4059
P 6575 4675
F 0 "#PWR032" H 6575 4525 50  0001 C CNN
F 1 "+5V" H 6575 4825 39  0001 C CNN
F 2 "" H 6575 4675 50  0001 C CNN
F 3 "" H 6575 4675 50  0001 C CNN
	1    6575 4675
	1    0    0    -1  
$EndComp
$Comp
L Device:C C10
U 1 1 5E51C918
P 6800 4825
F 0 "C10" H 6700 4750 39  0000 C CNN
F 1 "100n" H 6700 4925 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 6838 4675 50  0001 C CNN
F 3 "~" H 6800 4825 50  0001 C CNN
	1    6800 4825
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR041
U 1 1 5E51C91E
P 6800 4975
F 0 "#PWR041" H 6800 4725 50  0001 C CNN
F 1 "GND" H 6805 4802 39  0001 C CNN
F 2 "" H 6800 4975 50  0001 C CNN
F 3 "" H 6800 4975 50  0001 C CNN
	1    6800 4975
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR033
U 1 1 5E51C924
P 6800 4675
F 0 "#PWR033" H 6800 4525 50  0001 C CNN
F 1 "+5V" H 6800 4825 39  0001 C CNN
F 2 "" H 6800 4675 50  0001 C CNN
F 3 "" H 6800 4675 50  0001 C CNN
	1    6800 4675
	1    0    0    -1  
$EndComp
$Comp
L Device:C C11
U 1 1 5E51C92A
P 7025 4825
F 0 "C11" H 6925 4750 39  0000 C CNN
F 1 "100n" H 6925 4925 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 7063 4675 50  0001 C CNN
F 3 "~" H 7025 4825 50  0001 C CNN
	1    7025 4825
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR042
U 1 1 5E51C930
P 7025 4975
F 0 "#PWR042" H 7025 4725 50  0001 C CNN
F 1 "GND" H 7030 4802 39  0001 C CNN
F 2 "" H 7025 4975 50  0001 C CNN
F 3 "" H 7025 4975 50  0001 C CNN
	1    7025 4975
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR034
U 1 1 5E51C936
P 7025 4675
F 0 "#PWR034" H 7025 4525 50  0001 C CNN
F 1 "+5V" H 7025 4825 39  0001 C CNN
F 2 "" H 7025 4675 50  0001 C CNN
F 3 "" H 7025 4675 50  0001 C CNN
	1    7025 4675
	1    0    0    -1  
$EndComp
$Comp
L Device:C C12
U 1 1 5E5A20DB
P 7250 4825
F 0 "C12" H 7150 4750 39  0000 C CNN
F 1 "100n" H 7150 4925 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 7288 4675 50  0001 C CNN
F 3 "~" H 7250 4825 50  0001 C CNN
	1    7250 4825
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR043
U 1 1 5E5A20E1
P 7250 4975
F 0 "#PWR043" H 7250 4725 50  0001 C CNN
F 1 "GND" H 7255 4802 39  0001 C CNN
F 2 "" H 7250 4975 50  0001 C CNN
F 3 "" H 7250 4975 50  0001 C CNN
	1    7250 4975
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR035
U 1 1 5E5A20E7
P 7250 4675
F 0 "#PWR035" H 7250 4525 50  0001 C CNN
F 1 "+5V" H 7250 4825 39  0001 C CNN
F 2 "" H 7250 4675 50  0001 C CNN
F 3 "" H 7250 4675 50  0001 C CNN
	1    7250 4675
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR036
U 1 1 5E5A20F9
P 7475 4675
F 0 "#PWR036" H 7475 4525 50  0001 C CNN
F 1 "+5V" H 7475 4825 39  0001 C CNN
F 2 "" H 7475 4675 50  0001 C CNN
F 3 "" H 7475 4675 50  0001 C CNN
	1    7475 4675
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR044
U 1 1 5E5A20F3
P 7475 4975
F 0 "#PWR044" H 7475 4725 50  0001 C CNN
F 1 "GND" H 7480 4802 39  0001 C CNN
F 2 "" H 7475 4975 50  0001 C CNN
F 3 "" H 7475 4975 50  0001 C CNN
	1    7475 4975
	1    0    0    -1  
$EndComp
$Comp
L Device:C C13
U 1 1 5E5A20ED
P 7475 4825
F 0 "C13" H 7375 4750 39  0000 C CNN
F 1 "100n" H 7375 4925 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 7513 4675 50  0001 C CNN
F 3 "~" H 7475 4825 50  0001 C CNN
	1    7475 4825
	-1   0    0    1   
$EndComp
Wire Wire Line
	10475 950  10475 850 
Wire Wire Line
	10475 1050 10475 950 
Connection ~ 10475 950 
Text GLabel 5925 2200 2    39   Input ~ 0
VD7
Text GLabel 5925 2400 2    39   Input ~ 0
VD5
Text GLabel 5925 2700 2    39   Input ~ 0
VD4
Text GLabel 5925 2300 2    39   Input ~ 0
VD2
Text GLabel 5925 2000 2    39   Input ~ 0
VD1
Text GLabel 5925 1800 2    39   Output ~ 0
VA5
Text GLabel 5925 4200 2    39   Output ~ 0
VA6
Text GLabel 5925 2100 2    39   Input ~ 0
VD0
Text GLabel 5925 4000 2    39   Output ~ 0
VA10
Text GLabel 5925 3600 2    39   Output ~ 0
VA12
Text GLabel 5925 2600 2    39   Input ~ 0
VD3
Text GLabel 5925 3900 2    39   Output ~ 0
VA8
Text GLabel 5925 3200 2    39   Output ~ 0
VA15
Text GLabel 4025 2000 0    39   Output ~ 0
Csync
Text GLabel 5925 2500 2    39   Input ~ 0
VD6
Text GLabel 5925 2900 2    39   Output ~ 0
VA1
Text GLabel 5925 2800 2    39   Output ~ 0
VA0
Text GLabel 5925 1700 2    39   Output ~ 0
nVRD
Text GLabel 5925 3300 2    39   Output ~ 0
VA7
Text GLabel 5925 1600 2    39   Output ~ 0
VA4
Text GLabel 5925 3500 2    39   Output ~ 0
VA2
Text GLabel 5925 3100 2    39   Output ~ 0
VA3
Text GLabel 5925 3000 2    39   Output ~ 0
VA14
Text GLabel 5925 3400 2    39   Output ~ 0
VA13
Text GLabel 5925 1900 2    39   Output ~ 0
VA16
Text GLabel 5925 3700 2    39   Output ~ 0
VA11
Text GLabel 5925 4100 2    39   Output ~ 0
VA9
Text GLabel 5925 4500 2    39   Output ~ 0
TAPE_OUT
Wire Wire Line
	5125 6650 5125 6250
Connection ~ 5125 6250
Wire Wire Line
	5125 6250 5250 6250
Wire Wire Line
	4650 6650 5125 6650
$Comp
L Device:R R42
U 1 1 65E1C7FE
P 4925 6250
F 0 "R42" V 5000 6200 39  0000 L CNN
F 1 "15k" V 4925 6200 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 4855 6250 50  0001 C CNN
F 3 "~" H 4925 6250 50  0001 C CNN
	1    4925 6250
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R39
U 1 1 6616ACC8
P 5250 6025
F 0 "R39" V 5175 5975 39  0000 L CNN
F 1 "20k" V 5250 5975 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 5180 6025 50  0001 C CNN
F 3 "~" H 5250 6025 50  0001 C CNN
	1    5250 6025
	-1   0    0    1   
$EndComp
$Comp
L Device:R R46
U 1 1 5F1E22D2
P 5250 6475
F 0 "R46" V 5325 6425 39  0000 L CNN
F 1 "12k" V 5250 6425 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 5180 6475 50  0001 C CNN
F 3 "~" H 5250 6475 50  0001 C CNN
	1    5250 6475
	1    0    0    -1  
$EndComp
Text GLabel 4025 3700 0    39   Input ~ 0
nRD
$Comp
L Device:CP C1
U 1 1 5D452FD1
P 10650 950
F 0 "C1" V 10500 950 39  0000 C CNN
F 1 "10u" V 10800 950 39  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 10688 800 50  0001 C CNN
F 3 "~" H 10650 950 50  0001 C CNN
	1    10650 950 
	0    -1   1    0   
$EndComp
Text GLabel 5925 4300 2    39   Input ~ 0
TAPE_IN0
$Comp
L 74xx:74HC04 U6
U 6 1 5CFBEB43
P 2525 6225
F 0 "U6" H 2525 6518 39  0000 C CNN
F 1 "74HCU04" H 2525 6443 39  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 2525 6225 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 2525 6225 50  0001 C CNN
	6    2525 6225
	1    0    0    -1  
$EndComp
$Comp
L Device:R R43
U 1 1 5D93D097
P 1275 6425
F 0 "R43" V 1200 6425 39  0000 C CNN
F 1 "1k" V 1275 6425 39  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 1205 6425 50  0001 C CNN
F 3 "~" H 1275 6425 50  0001 C CNN
	1    1275 6425
	-1   0    0    1   
$EndComp
$Comp
L Device:R R44
U 1 1 5A83ADBE
P 2825 6425
F 0 "R44" V 2750 6425 39  0000 C CNN
F 1 "1k" V 2825 6425 39  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2755 6425 50  0001 C CNN
F 3 "~" H 2825 6425 50  0001 C CNN
	1    2825 6425
	-1   0    0    1   
$EndComp
NoConn ~ 2825 7475
NoConn ~ 2225 7475
$Comp
L 74xx:74HC04 U6
U 7 1 63A6C2BB
P 3400 7100
F 0 "U6" H 3150 7450 39  0000 L CNN
F 1 "74HCU04" H 3475 7450 39  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 3400 7100 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 3400 7100 50  0001 C CNN
	7    3400 7100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR057
U 1 1 63A70551
P 3400 6600
F 0 "#PWR057" H 3400 6450 50  0001 C CNN
F 1 "+5V" H 3415 6765 39  0001 C CNN
F 2 "" H 3400 6600 50  0001 C CNN
F 3 "" H 3400 6600 50  0001 C CNN
	1    3400 6600
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U6
U 5 1 5D9B7FD5
P 3125 6225
F 0 "U6" H 3125 6518 39  0000 C CNN
F 1 "74HCU04" H 3125 6443 39  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 3125 6225 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 3125 6225 50  0001 C CNN
	5    3125 6225
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U6
U 4 1 5D9B4031
P 975 7475
F 0 "U6" H 975 7768 39  0000 C CNN
F 1 "74HCU04" H 975 7693 39  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 975 7475 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 975 7475 50  0001 C CNN
	4    975  7475
	1    0    0    -1  
$EndComp
Wire Wire Line
	2825 6225 2825 6275
Connection ~ 2825 6225
Wire Wire Line
	2225 6225 2225 6625
Connection ~ 2225 6225
Wire Wire Line
	2825 5825 2825 6225
Wire Wire Line
	2225 5825 2225 6225
$Comp
L 74xx:74HC04 U6
U 3 1 5D9B1231
P 975 6225
F 0 "U6" H 975 6518 39  0000 C CNN
F 1 "74HCU04" H 975 6443 39  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 975 6225 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 975 6225 50  0001 C CNN
	3    975  6225
	1    0    0    -1  
$EndComp
$Comp
L Device:C C21
U 1 1 5D93D0BB
P 2825 6825
F 0 "C21" H 2725 6750 39  0000 C CNN
F 1 "47p" H 2700 6925 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 2863 6675 50  0001 C CNN
F 3 "~" H 2825 6825 50  0001 C CNN
	1    2825 6825
	-1   0    0    1   
$EndComp
Wire Wire Line
	2825 5825 2675 5825
Wire Wire Line
	2375 5825 2225 5825
$Comp
L Device:R R33
U 1 1 5D93D0A7
P 975 5825
F 0 "R33" V 1050 5825 39  0000 C CNN
F 1 "1M" V 975 5825 39  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 905 5825 50  0001 C CNN
F 3 "~" H 975 5825 50  0001 C CNN
	1    975  5825
	0    -1   -1   0   
$EndComp
Connection ~ 2825 6625
Wire Wire Line
	2825 6625 2825 6675
Wire Wire Line
	2825 6625 2825 6575
Wire Wire Line
	2675 6625 2825 6625
Wire Wire Line
	2225 6625 2225 6675
Connection ~ 2225 6625
Wire Wire Line
	2375 6625 2225 6625
Connection ~ 2225 6975
Wire Wire Line
	2225 6975 2825 6975
$Comp
L power:GND #PWR063
U 1 1 5D93D08B
P 2225 6975
F 0 "#PWR063" H 2225 6725 50  0001 C CNN
F 1 "GND" H 2230 6802 39  0001 C CNN
F 2 "" H 2225 6975 50  0001 C CNN
F 3 "" H 2225 6975 50  0001 C CNN
	1    2225 6975
	1    0    0    -1  
$EndComp
$Comp
L Device:C C18
U 1 1 5D93D085
P 675 6825
F 0 "C18" H 575 6750 39  0000 C CNN
F 1 "33p" H 575 6925 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 713 6675 50  0001 C CNN
F 3 "~" H 675 6825 50  0001 C CNN
	1    675  6825
	-1   0    0    1   
$EndComp
Text GLabel 3425 6225 2    39   Output ~ 0
CLK16
$Comp
L Device:C C19
U 1 1 5A83A7CC
P 1275 6825
F 0 "C19" H 1175 6750 39  0000 C CNN
F 1 "47p" H 1150 6925 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 1313 6675 50  0001 C CNN
F 3 "~" H 1275 6825 50  0001 C CNN
	1    1275 6825
	-1   0    0    1   
$EndComp
Wire Wire Line
	1275 5825 1275 6225
Wire Wire Line
	1275 5825 1125 5825
Wire Wire Line
	675  5825 675  6225
Wire Wire Line
	825  5825 675  5825
$Comp
L 74xx:74HC04 U6
U 2 1 5D4EEEE8
P 1575 6225
F 0 "U6" H 1575 6518 39  0000 C CNN
F 1 "74HCU04" H 1575 6443 39  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 1575 6225 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 1575 6225 50  0001 C CNN
	2    1575 6225
	1    0    0    -1  
$EndComp
Connection ~ 675  6225
Wire Wire Line
	1275 6225 1275 6275
Connection ~ 1275 6225
$Comp
L Device:R R34
U 1 1 5D340A72
P 2525 5825
F 0 "R34" V 2600 5825 39  0000 C CNN
F 1 "1M" V 2525 5825 39  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2455 5825 50  0001 C CNN
F 3 "~" H 2525 5825 50  0001 C CNN
	1    2525 5825
	0    -1   -1   0   
$EndComp
Connection ~ 1275 6625
Wire Wire Line
	1275 6625 1275 6675
Wire Wire Line
	1275 6625 1275 6575
Wire Wire Line
	1125 6625 1275 6625
Wire Wire Line
	675  6625 675  6675
Connection ~ 675  6625
Wire Wire Line
	825  6625 675  6625
Wire Wire Line
	675  6225 675  6625
Connection ~ 675  6975
Wire Wire Line
	675  6975 1275 6975
$Comp
L 74xx:74HC04 U6
U 1 1 5CF6F413
P 2525 7475
F 0 "U6" H 2525 7768 39  0000 C CNN
F 1 "74HCU04" H 2525 7693 39  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 2525 7475 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 2525 7475 50  0001 C CNN
	1    2525 7475
	1    0    0    -1  
$EndComp
$Comp
L Device:Crystal Y2
U 1 1 5E767BDB
P 2525 6625
F 0 "Y2" H 2525 6850 39  0000 C CNN
F 1 "16MHz" H 2525 6775 39  0000 C CNN
F 2 "Crystal:Crystal_HC49-U_Vertical" H 2525 6625 50  0001 C CNN
F 3 "~" H 2525 6625 50  0001 C CNN
	1    2525 6625
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR062
U 1 1 61657146
P 675 6975
F 0 "#PWR062" H 675 6725 50  0001 C CNN
F 1 "GND" H 680 6802 39  0001 C CNN
F 2 "" H 675 6975 50  0001 C CNN
F 3 "" H 675 6975 50  0001 C CNN
	1    675  6975
	1    0    0    -1  
$EndComp
$Comp
L Device:C C20
U 1 1 616560FA
P 2225 6825
F 0 "C20" H 2125 6750 39  0000 C CNN
F 1 "33p" H 2125 6925 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 2263 6675 50  0001 C CNN
F 3 "~" H 2225 6825 50  0001 C CNN
	1    2225 6825
	-1   0    0    1   
$EndComp
Text GLabel 1875 6225 2    39   Output ~ 0
CLK14
$Comp
L Device:Crystal Y1
U 1 1 5A83A544
P 975 6625
F 0 "Y1" H 975 6850 39  0000 C CNN
F 1 "14.318MHz" H 975 6775 39  0000 C CNN
F 2 "Crystal:Crystal_HC49-U_Vertical" H 975 6625 50  0001 C CNN
F 3 "~" H 975 6625 50  0001 C CNN
	1    975  6625
	1    0    0    -1  
$EndComp
Text GLabel 3275 3150 2    39   UnSpc ~ 0
VD7
Text GLabel 3275 3050 2    39   UnSpc ~ 0
VD6
Text GLabel 3275 2950 2    39   UnSpc ~ 0
VD5
Text GLabel 3275 2850 2    39   UnSpc ~ 0
VD4
Text GLabel 3275 2750 2    39   UnSpc ~ 0
VD3
Text GLabel 3275 2650 2    39   UnSpc ~ 0
VD2
Text GLabel 3275 2550 2    39   UnSpc ~ 0
VD1
Text GLabel 3275 3250 2    39   UnSpc ~ 0
VA0
Text GLabel 3275 3350 2    39   UnSpc ~ 0
VA1
Text GLabel 3275 3550 2    39   UnSpc ~ 0
VA3
Text GLabel 3275 3650 2    39   UnSpc ~ 0
VA4
Text GLabel 3275 3750 2    39   UnSpc ~ 0
VA5
Text GLabel 3275 3850 2    39   UnSpc ~ 0
VA6
Text GLabel 3275 3950 2    39   UnSpc ~ 0
VA7
Text GLabel 3275 2450 2    39   UnSpc ~ 0
VD0
$Comp
L Device:R R16
U 1 1 62053588
P 2950 3250
F 0 "R16" V 2900 3025 39  0000 L CNN
F 1 "1k" V 2950 3200 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2880 3250 50  0001 C CNN
F 3 "~" H 2950 3250 50  0001 C CNN
	1    2950 3250
	0    -1   1    0   
$EndComp
$Comp
L Device:R R17
U 1 1 62053582
P 2950 3350
F 0 "R17" V 2900 3125 39  0000 L CNN
F 1 "1k" V 2950 3300 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2880 3350 50  0001 C CNN
F 3 "~" H 2950 3350 50  0001 C CNN
	1    2950 3350
	0    -1   1    0   
$EndComp
$Comp
L Device:R R18
U 1 1 6205357C
P 2950 3450
F 0 "R18" V 2900 3225 39  0000 L CNN
F 1 "1k" V 2950 3400 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2880 3450 50  0001 C CNN
F 3 "~" H 2950 3450 50  0001 C CNN
	1    2950 3450
	0    -1   1    0   
$EndComp
$Comp
L Device:R R19
U 1 1 62053576
P 2950 3550
F 0 "R19" V 2900 3325 39  0000 L CNN
F 1 "1k" V 2950 3500 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2880 3550 50  0001 C CNN
F 3 "~" H 2950 3550 50  0001 C CNN
	1    2950 3550
	0    -1   1    0   
$EndComp
$Comp
L Device:R R20
U 1 1 62053570
P 2950 3650
F 0 "R20" V 2900 3425 39  0000 L CNN
F 1 "1k" V 2950 3600 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2880 3650 50  0001 C CNN
F 3 "~" H 2950 3650 50  0001 C CNN
	1    2950 3650
	0    -1   1    0   
$EndComp
$Comp
L Device:R R21
U 1 1 6205356A
P 2950 3750
F 0 "R21" V 2900 3525 39  0000 L CNN
F 1 "1k" V 2950 3700 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2880 3750 50  0001 C CNN
F 3 "~" H 2950 3750 50  0001 C CNN
	1    2950 3750
	0    -1   1    0   
$EndComp
$Comp
L Device:R R9
U 1 1 62053564
P 2950 2550
F 0 "R9" V 2900 2325 39  0000 L CNN
F 1 "1k" V 2950 2500 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2880 2550 50  0001 C CNN
F 3 "~" H 2950 2550 50  0001 C CNN
	1    2950 2550
	0    -1   1    0   
$EndComp
$Comp
L Device:R R8
U 1 1 6205355E
P 2950 2450
F 0 "R8" V 2900 2225 39  0000 L CNN
F 1 "1k" V 2950 2400 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2880 2450 50  0001 C CNN
F 3 "~" H 2950 2450 50  0001 C CNN
	1    2950 2450
	0    -1   1    0   
$EndComp
$Comp
L Device:R R15
U 1 1 62BF8D78
P 2950 3150
F 0 "R15" V 2900 2925 39  0000 L CNN
F 1 "1k" V 2950 3100 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2880 3150 50  0001 C CNN
F 3 "~" H 2950 3150 50  0001 C CNN
	1    2950 3150
	0    -1   1    0   
$EndComp
$Comp
L Device:R R10
U 1 1 62BF8D72
P 2950 2650
F 0 "R10" V 2900 2425 39  0000 L CNN
F 1 "1k" V 2950 2600 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2880 2650 50  0001 C CNN
F 3 "~" H 2950 2650 50  0001 C CNN
	1    2950 2650
	0    -1   1    0   
$EndComp
$Comp
L Device:R R14
U 1 1 62BF8D6C
P 2950 3050
F 0 "R14" V 2900 2825 39  0000 L CNN
F 1 "1k" V 2950 3000 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2880 3050 50  0001 C CNN
F 3 "~" H 2950 3050 50  0001 C CNN
	1    2950 3050
	0    -1   1    0   
$EndComp
$Comp
L Device:R R13
U 1 1 62BF8D66
P 2950 2950
F 0 "R13" V 2900 2725 39  0000 L CNN
F 1 "1k" V 2950 2900 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2880 2950 50  0001 C CNN
F 3 "~" H 2950 2950 50  0001 C CNN
	1    2950 2950
	0    -1   1    0   
$EndComp
$Comp
L Device:R R22
U 1 1 62BF8D54
P 2950 3850
F 0 "R22" V 2900 3625 39  0000 L CNN
F 1 "1k" V 2950 3800 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2880 3850 50  0001 C CNN
F 3 "~" H 2950 3850 50  0001 C CNN
	1    2950 3850
	0    -1   1    0   
$EndComp
$Comp
L Device:R R23
U 1 1 62BF8D4E
P 2950 3950
F 0 "R23" V 2900 3725 39  0000 L CNN
F 1 "1k" V 2950 3900 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2880 3950 50  0001 C CNN
F 3 "~" H 2950 3950 50  0001 C CNN
	1    2950 3950
	0    -1   1    0   
$EndComp
Text GLabel 2675 2450 0    39   UnSpc ~ 0
D0
Text GLabel 2675 2550 0    39   UnSpc ~ 0
D1
Text GLabel 2675 2650 0    39   UnSpc ~ 0
D2
Text GLabel 2675 2750 0    39   UnSpc ~ 0
D3
Text GLabel 2675 2850 0    39   UnSpc ~ 0
D4
Text GLabel 2675 2950 0    39   UnSpc ~ 0
D5
Text GLabel 2675 3050 0    39   UnSpc ~ 0
D6
Wire Wire Line
	2800 2450 2675 2450
Wire Wire Line
	2675 2550 2800 2550
Wire Wire Line
	2675 2650 2800 2650
Wire Wire Line
	2675 2750 2800 2750
Wire Wire Line
	2675 2850 2800 2850
Wire Wire Line
	2800 2950 2675 2950
Wire Wire Line
	2675 3050 2800 3050
Wire Wire Line
	2800 3150 2675 3150
Text GLabel 2675 3150 0    39   UnSpc ~ 0
D7
Text GLabel 2675 3250 0    39   UnSpc ~ 0
A0
Text GLabel 2675 3350 0    39   UnSpc ~ 0
A1
Text GLabel 2675 3450 0    39   UnSpc ~ 0
A2
Text GLabel 2675 3550 0    39   UnSpc ~ 0
A3
Text GLabel 2675 3650 0    39   UnSpc ~ 0
A4
Text GLabel 2675 3750 0    39   UnSpc ~ 0
A5
Text GLabel 2675 3850 0    39   UnSpc ~ 0
A6
Text GLabel 2675 3950 0    39   UnSpc ~ 0
A7
Wire Wire Line
	2675 3250 2800 3250
Wire Wire Line
	2800 3350 2675 3350
Wire Wire Line
	2675 3450 2800 3450
Wire Wire Line
	2800 3550 2675 3550
Wire Wire Line
	2675 3650 2800 3650
Wire Wire Line
	2675 3850 2800 3850
Wire Wire Line
	2675 3950 2800 3950
Text GLabel 3275 4050 2    39   UnSpc ~ 0
VA8
Wire Wire Line
	2675 4050 2800 4050
Text GLabel 2675 4050 0    39   UnSpc ~ 0
A8
$Comp
L Device:R R30
U 1 1 62BF8D48
P 2950 4550
F 0 "R30" V 2900 4325 39  0000 L CNN
F 1 "1k" V 2950 4500 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2880 4550 50  0001 C CNN
F 3 "~" H 2950 4550 50  0001 C CNN
	1    2950 4550
	0    -1   1    0   
$EndComp
Text GLabel 3275 4150 2    39   UnSpc ~ 0
VA9
Text GLabel 3275 4250 2    39   UnSpc ~ 0
VA10
Text GLabel 3275 4350 2    39   UnSpc ~ 0
VA11
Text GLabel 3275 4450 2    39   UnSpc ~ 0
VA12
Text GLabel 3275 4550 2    39   UnSpc ~ 0
VA13
$Comp
L Device:R R29
U 1 1 62BF8D42
P 2950 4450
F 0 "R29" V 2900 4225 39  0000 L CNN
F 1 "1k" V 2950 4400 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2880 4450 50  0001 C CNN
F 3 "~" H 2950 4450 50  0001 C CNN
	1    2950 4450
	0    -1   1    0   
$EndComp
$Comp
L Device:R R28
U 1 1 62BF8D3C
P 2950 4350
F 0 "R28" V 2900 4125 39  0000 L CNN
F 1 "1k" V 2950 4300 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2880 4350 50  0001 C CNN
F 3 "~" H 2950 4350 50  0001 C CNN
	1    2950 4350
	0    -1   1    0   
$EndComp
$Comp
L Device:R R24
U 1 1 62BF8D36
P 2950 4050
F 0 "R24" V 2900 3825 39  0000 L CNN
F 1 "1k" V 2950 4000 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2880 4050 50  0001 C CNN
F 3 "~" H 2950 4050 50  0001 C CNN
	1    2950 4050
	0    -1   1    0   
$EndComp
$Comp
L Device:R R25
U 1 1 62BF8D30
P 2950 4150
F 0 "R25" V 2900 3925 39  0000 L CNN
F 1 "1k" V 2950 4100 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2880 4150 50  0001 C CNN
F 3 "~" H 2950 4150 50  0001 C CNN
	1    2950 4150
	0    -1   1    0   
$EndComp
$Comp
L Device:R R27
U 1 1 62BF8D2A
P 2950 4250
F 0 "R27" V 2900 4025 39  0000 L CNN
F 1 "1k" V 2950 4200 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2880 4250 50  0001 C CNN
F 3 "~" H 2950 4250 50  0001 C CNN
	1    2950 4250
	0    -1   1    0   
$EndComp
Text GLabel 2675 4150 0    39   UnSpc ~ 0
A9
Text GLabel 2675 4250 0    39   UnSpc ~ 0
A10
Text GLabel 2675 4350 0    39   UnSpc ~ 0
A11
Text GLabel 2675 4450 0    39   UnSpc ~ 0
A12
Text GLabel 2675 4550 0    39   UnSpc ~ 0
A13
Wire Wire Line
	2800 4150 2675 4150
Wire Wire Line
	2675 4250 2800 4250
Wire Wire Line
	2800 4350 2675 4350
Wire Wire Line
	2800 4450 2675 4450
Wire Wire Line
	2675 4550 2800 4550
Wire Wire Line
	3100 2450 3275 2450
Wire Wire Line
	3100 2550 3275 2550
Wire Wire Line
	3100 2650 3275 2650
Wire Wire Line
	3100 2750 3275 2750
Wire Wire Line
	3100 2850 3275 2850
Wire Wire Line
	3100 2950 3275 2950
Wire Wire Line
	3100 3050 3275 3050
Wire Wire Line
	3100 3150 3275 3150
Wire Wire Line
	3100 3250 3275 3250
Wire Wire Line
	3100 3350 3275 3350
Wire Wire Line
	3100 3450 3275 3450
Wire Wire Line
	3100 3550 3275 3550
Wire Wire Line
	3100 3650 3275 3650
Wire Wire Line
	3100 3750 3275 3750
Wire Wire Line
	3100 3850 3275 3850
Wire Wire Line
	3100 3950 3275 3950
Wire Wire Line
	3100 4050 3275 4050
Wire Wire Line
	3100 4150 3275 4150
Wire Wire Line
	3100 4250 3275 4250
Wire Wire Line
	3100 4350 3275 4350
Wire Wire Line
	3100 4450 3275 4450
Wire Wire Line
	3100 4550 3275 4550
Text GLabel 3275 3450 2    39   UnSpc ~ 0
VA2
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
P 2225 5075
F 0 "#PWR046" H 2225 4925 50  0001 C CNN
F 1 "+5V" H 2225 5225 39  0001 C CNN
F 2 "" H 2225 5075 50  0001 C CNN
F 3 "" H 2225 5075 50  0001 C CNN
	1    2225 5075
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR050
U 1 1 6171D45F
P 2225 5375
F 0 "#PWR050" H 2225 5125 50  0001 C CNN
F 1 "GND" H 2230 5202 39  0001 C CNN
F 2 "" H 2225 5375 50  0001 C CNN
F 3 "" H 2225 5375 50  0001 C CNN
	1    2225 5375
	1    0    0    -1  
$EndComp
$Comp
L Device:C C14
U 1 1 6171D459
P 2225 5225
F 0 "C14" H 2125 5150 39  0000 C CNN
F 1 "100n" H 2125 5325 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 2263 5075 50  0001 C CNN
F 3 "~" H 2225 5225 50  0001 C CNN
	1    2225 5225
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR014
U 1 1 6169FCFB
P 2125 2600
F 0 "#PWR014" H 2125 2450 50  0001 C CNN
F 1 "+5V" H 2125 2750 39  0001 C CNN
F 2 "" H 2125 2600 50  0001 C CNN
F 3 "" H 2125 2600 50  0001 C CNN
	1    2125 2600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR017
U 1 1 6169FCF5
P 2125 2900
F 0 "#PWR017" H 2125 2650 50  0001 C CNN
F 1 "GND" H 2130 2727 39  0001 C CNN
F 2 "" H 2125 2900 50  0001 C CNN
F 3 "" H 2125 2900 50  0001 C CNN
	1    2125 2900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 6169FCEF
P 2125 2750
F 0 "C4" H 2025 2675 39  0000 C CNN
F 1 "100n" H 2025 2850 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 2163 2600 50  0001 C CNN
F 3 "~" H 2125 2750 50  0001 C CNN
	1    2125 2750
	-1   0    0    1   
$EndComp
Wire Wire Line
	800  2400 1175 2400
Wire Wire Line
	800  1800 800  2400
$Comp
L power:+5V #PWR07
U 1 1 65FFD594
P 650 1550
F 0 "#PWR07" H 650 1400 50  0001 C CNN
F 1 "+5V" H 665 1723 39  0001 C CNN
F 2 "" H 650 1550 50  0001 C CNN
F 3 "" H 650 1550 50  0001 C CNN
	1    650  1550
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR010
U 1 1 65FFD58E
P 650 2050
F 0 "#PWR010" H 650 1800 50  0001 C CNN
F 1 "GND" H 655 1877 39  0001 C CNN
F 2 "" H 650 2050 50  0001 C CNN
F 3 "" H 650 2050 50  0001 C CNN
	1    650  2050
	-1   0    0    -1  
$EndComp
$Comp
L Jumper:Jumper_3_Bridged12 JP1
U 1 1 65FFD588
P 650 1800
F 0 "JP1" H 650 1905 39  0000 C CNN
F 1 "Jumper_3_Bridged12" V 695 1867 39  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 650 1800 50  0001 C CNN
F 3 "~" H 650 1800 50  0001 C CNN
	1    650  1800
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
$Comp
L Device:D_Schottky D9
U 1 1 5E87EDF5
P 10550 6475
F 0 "D9" H 10650 6500 39  0000 C CNN
F 1 "BAT85" H 10550 6600 50  0001 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 10550 6475 50  0001 C CNN
F 3 "~" H 10550 6475 50  0001 C CNN
	1    10550 6475
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D8
U 1 1 5E87EDEF
P 10550 6375
F 0 "D8" H 10650 6400 39  0000 C CNN
F 1 "BAT85" H 10550 6500 50  0001 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 10550 6375 50  0001 C CNN
F 3 "~" H 10550 6375 50  0001 C CNN
	1    10550 6375
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D7
U 1 1 5E87EDE9
P 10550 6275
F 0 "D7" H 10650 6300 39  0000 C CNN
F 1 "BAT85" H 10550 6400 50  0001 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 10550 6275 50  0001 C CNN
F 3 "~" H 10550 6275 50  0001 C CNN
	1    10550 6275
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D6
U 1 1 5E87EDE3
P 10550 6175
F 0 "D6" H 10650 6200 39  0000 C CNN
F 1 "BAT85" H 10550 6300 50  0001 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 10550 6175 50  0001 C CNN
F 3 "~" H 10550 6175 50  0001 C CNN
	1    10550 6175
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D5
U 1 1 5E8633BA
P 10550 6075
F 0 "D5" H 10650 6100 39  0000 C CNN
F 1 "BAT85" H 10550 6200 50  0001 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 10550 6075 50  0001 C CNN
F 3 "~" H 10550 6075 50  0001 C CNN
	1    10550 6075
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D4
U 1 1 5E8633B4
P 10550 5975
F 0 "D4" H 10650 6000 39  0000 C CNN
F 1 "BAT85" H 10550 6100 50  0001 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 10550 5975 50  0001 C CNN
F 3 "~" H 10550 5975 50  0001 C CNN
	1    10550 5975
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D2
U 1 1 5E862678
P 10550 5875
F 0 "D2" H 10650 5900 39  0000 C CNN
F 1 "BAT85" H 10550 6000 50  0001 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 10550 5875 50  0001 C CNN
F 3 "~" H 10550 5875 50  0001 C CNN
	1    10550 5875
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D1
U 1 1 5E826CA3
P 10550 5775
F 0 "D1" H 10650 5800 39  0000 C CNN
F 1 "BAT85" H 10550 5900 50  0001 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 10550 5775 50  0001 C CNN
F 3 "~" H 10550 5775 50  0001 C CNN
	1    10550 5775
	1    0    0    -1  
$EndComp
Text GLabel 10400 6475 0    39   Input ~ 0
A15
Text GLabel 10400 6375 0    39   Input ~ 0
A14
Text GLabel 10400 6275 0    39   Input ~ 0
A8
Text GLabel 10400 6175 0    39   Input ~ 0
A13
Text GLabel 10400 6075 0    39   Input ~ 0
A12
Text GLabel 10400 5975 0    39   Input ~ 0
A9
Text GLabel 10400 5875 0    39   Input ~ 0
A10
Text GLabel 10400 5775 0    39   Input ~ 0
A11
$Comp
L Connector_Generic:Conn_01x08 J5
U 1 1 5FB9292E
P 10900 6075
F 0 "J5" H 10850 6475 39  0000 L CNN
F 1 "Conn_01x08" H 10980 5976 50  0001 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x08_P2.54mm_Vertical" H 10900 6075 50  0001 C CNN
F 3 "~" H 10900 6075 50  0001 C CNN
F 4 "KB_A" H 10825 5575 39  0000 L CNN "Desc"
	1    10900 6075
	1    0    0    -1  
$EndComp
NoConn ~ 10075 1350
NoConn ~ 10075 1450
NoConn ~ 10075 1550
NoConn ~ 10075 1650
NoConn ~ 10075 1750
NoConn ~ 10075 1850
NoConn ~ 10075 1950
NoConn ~ 10075 2050
Wire Wire Line
	6100 6475 6050 6475
Wire Wire Line
	5625 6475 5750 6475
$Comp
L Device:R R47
U 1 1 5F3E5B7C
P 5900 6475
F 0 "R47" V 5975 6425 39  0000 L CNN
F 1 "68" V 5900 6425 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 5830 6475 50  0001 C CNN
F 3 "~" H 5900 6475 50  0001 C CNN
	1    5900 6475
	0    -1   -1   0   
$EndComp
Text GLabel 10800 3475 0    39   Input ~ 0
SOUND
Text GLabel 10125 3475 0    39   Input ~ 0
VIDEO
$Comp
L power:GND #PWR024
U 1 1 5F0B4723
P 10325 3675
F 0 "#PWR024" H 10325 3425 50  0001 C CNN
F 1 "GND" H 10325 3550 39  0001 C CNN
F 2 "" H 10325 3675 50  0001 C CNN
F 3 "" H 10325 3675 50  0001 C CNN
	1    10325 3675
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR025
U 1 1 5F0B3BC7
P 11000 3675
F 0 "#PWR025" H 11000 3425 50  0001 C CNN
F 1 "GND" H 11000 3550 39  0001 C CNN
F 2 "" H 11000 3675 50  0001 C CNN
F 3 "" H 11000 3675 50  0001 C CNN
	1    11000 3675
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_Coaxial J1
U 1 1 5F0446AF
P 10325 3475
F 0 "J1" H 10425 3450 50  0000 L CNN
F 1 "RCJ-013" H 10150 3625 50  0001 L CNN
F 2 "my:CUI_RCJ-013" H 10325 3475 50  0001 C CNN
F 3 " ~" H 10325 3475 50  0001 C CNN
	1    10325 3475
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_Coaxial J2
U 1 1 5F025971
P 11000 3475
F 0 "J2" H 11100 3450 50  0000 L CNN
F 1 "RCJ-013" H 10825 3625 50  0001 L CNN
F 2 "my:CUI_RCJ-013" H 11000 3475 50  0001 C CNN
F 3 " ~" H 11000 3475 50  0001 C CNN
	1    11000 3475
	1    0    0    -1  
$EndComp
Wire Wire Line
	10475 4125 10475 4175
Wire Wire Line
	10475 4375 10475 4425
Connection ~ 10475 4375
$Comp
L Device:R R53
U 1 1 5E0D999B
P 7400 7425
F 0 "R53" V 7475 7350 39  0000 L CNN
F 1 "10k" V 7400 7375 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 7330 7425 50  0001 C CNN
F 3 "~" H 7400 7425 50  0001 C CNN
	1    7400 7425
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR061
U 1 1 607F4003
P 8075 6800
F 0 "#PWR061" H 8075 6650 50  0001 C CNN
F 1 "+5V" H 8075 6950 39  0001 C CNN
F 2 "" H 8075 6800 50  0001 C CNN
F 3 "" H 8075 6800 50  0001 C CNN
	1    8075 6800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR070
U 1 1 5E0D9B29
P 7400 7575
F 0 "#PWR070" H 7400 7325 50  0001 C CNN
F 1 "GND" H 7400 7425 39  0001 C CNN
F 2 "" H 7400 7575 50  0001 C CNN
F 3 "" H 7400 7575 50  0001 C CNN
	1    7400 7575
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J7
U 1 1 5DDDF159
P 7675 7050
F 0 "J7" H 7725 7467 50  0000 C CNN
F 1 "Conn_02x05" H 7725 7376 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Vertical" H 7675 7050 50  0001 C CNN
F 3 "~" H 7675 7050 50  0001 C CNN
F 4 "JTAG" H 7725 7375 50  0000 C CNN "Desc"
	1    7675 7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 6850 7475 6850
Connection ~ 7400 6850
Wire Wire Line
	7400 7275 7400 6850
NoConn ~ 7975 7050
NoConn ~ 7975 7150
NoConn ~ 7475 7150
Text GLabel 7325 7050 0    39   Output ~ 0
TMS
Wire Wire Line
	7325 6850 7400 6850
Text GLabel 7325 6850 0    39   Output ~ 0
TCK
Text GLabel 7325 6950 0    39   Input ~ 0
TDO
Text GLabel 7325 7250 0    39   Output ~ 0
TDI
Wire Wire Line
	8025 7250 8025 7275
Connection ~ 8025 7250
Wire Wire Line
	8025 6850 8025 7250
Wire Wire Line
	7975 7250 8025 7250
Wire Wire Line
	8075 6800 8075 6950
Wire Wire Line
	7975 6850 8025 6850
$Comp
L power:GND #PWR064
U 1 1 5DE095FC
P 8025 7275
F 0 "#PWR064" H 8025 7025 50  0001 C CNN
F 1 "GND" H 8030 7102 39  0001 C CNN
F 2 "" H 8025 7275 50  0001 C CNN
F 3 "" H 8025 7275 50  0001 C CNN
	1    8025 7275
	1    0    0    -1  
$EndComp
Wire Wire Line
	8075 6950 7975 6950
Wire Wire Line
	10475 4275 10475 4375
$Comp
L Connector:Barrel_Jack_Switch J3
U 1 1 5B555C2D
P 10775 4275
F 0 "J3" H 10775 4575 39  0000 C CNN
F 1 "DC-005" H 10775 4500 39  0001 C CNN
F 2 "Connector_BarrelJack:BarrelJack_Horizontal" H 10825 4235 50  0001 C CNN
F 3 "~" H 10825 4235 50  0001 C CNN
F 4 "DC IN / 5V" H 10775 4500 39  0000 C CNN "Desc"
	1    10775 4275
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR071
U 1 1 63A709C8
P 3400 7600
F 0 "#PWR071" H 3400 7350 50  0001 C CNN
F 1 "GND" H 3405 7427 39  0001 C CNN
F 2 "" H 3400 7600 50  0001 C CNN
F 3 "" H 3400 7600 50  0001 C CNN
	1    3400 7600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C23
U 1 1 60F0AF21
P 3775 7450
F 0 "C23" H 3675 7375 39  0000 C CNN
F 1 "100n" H 3675 7550 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 3813 7300 50  0001 C CNN
F 3 "~" H 3775 7450 50  0001 C CNN
	1    3775 7450
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR072
U 1 1 60F0AF27
P 3775 7600
F 0 "#PWR072" H 3775 7350 50  0001 C CNN
F 1 "GND" H 3780 7427 39  0001 C CNN
F 2 "" H 3775 7600 50  0001 C CNN
F 3 "" H 3775 7600 50  0001 C CNN
	1    3775 7600
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR065
U 1 1 60F0AF2D
P 3775 7300
F 0 "#PWR065" H 3775 7150 50  0001 C CNN
F 1 "+5V" H 3775 7450 39  0001 C CNN
F 2 "" H 3775 7300 50  0001 C CNN
F 3 "" H 3775 7300 50  0001 C CNN
	1    3775 7300
	1    0    0    -1  
$EndComp
Text GLabel 8875 2300 0    39   Input ~ 0
nRST
Text GLabel 4025 4400 0    39   Output ~ 0
AY_BDIR
Text GLabel 4025 4300 0    39   Output ~ 0
AY_BC1
Text GLabel 4025 4500 0    39   Output ~ 0
AY_CLK
NoConn ~ 675  7475
NoConn ~ 1275 7475
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
$Comp
L CPU:Z80CPU U3
U 1 1 5A82BF7B
P 7300 2125
F 0 "U3" H 7800 3550 50  0000 C CNN
F 1 "Z84C0008PEC " H 6875 3550 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm_Socket" H 7300 2525 50  0001 C CNN
F 3 "www.zilog.com/manage_directlink.php?filepath=docs/z80/um0080" H 7300 2525 50  0001 C CNN
	1    7300 2125
	-1   0    0    -1  
$EndComp
$Comp
L power:+5V #PWR021
U 1 1 618DD94F
P 8400 3325
F 0 "#PWR021" H 8400 3175 50  0001 C CNN
F 1 "+5V" H 8400 3475 39  0001 C CNN
F 2 "" H 8400 3325 50  0001 C CNN
F 3 "" H 8400 3325 50  0001 C CNN
	1    8400 3325
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR023
U 1 1 618DD949
P 8400 3625
F 0 "#PWR023" H 8400 3375 50  0001 C CNN
F 1 "GND" H 8405 3452 39  0001 C CNN
F 2 "" H 8400 3625 50  0001 C CNN
F 3 "" H 8400 3625 50  0001 C CNN
	1    8400 3625
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 618DD943
P 8400 3475
F 0 "C5" H 8300 3400 39  0000 C CNN
F 1 "100n" H 8300 3575 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 8438 3325 50  0001 C CNN
F 3 "~" H 8400 3475 50  0001 C CNN
	1    8400 3475
	-1   0    0    1   
$EndComp
Text GLabel 8000 1525 2    39   Input ~ 0
nNMI
Text GLabel 6600 3325 0    39   BiDi ~ 0
D7
Text GLabel 6600 3225 0    39   BiDi ~ 0
D6
Text GLabel 6600 3125 0    39   BiDi ~ 0
D5
Text GLabel 6600 3025 0    39   BiDi ~ 0
D4
Text GLabel 6600 2925 0    39   BiDi ~ 0
D3
Text GLabel 6600 2825 0    39   BiDi ~ 0
D2
Text GLabel 6600 2725 0    39   BiDi ~ 0
D1
Text GLabel 6600 2625 0    39   BiDi ~ 0
D0
Text GLabel 8000 2825 2    39   Output ~ 0
nMREQ
Text GLabel 8000 2925 2    39   Output ~ 0
nIORQ
$Comp
L power:GND #PWR022
U 1 1 5A825FC1
P 7300 3625
F 0 "#PWR022" H 7300 3375 50  0001 C CNN
F 1 "GND" H 7305 3452 39  0001 C CNN
F 2 "" H 7300 3625 50  0001 C CNN
F 3 "" H 7300 3625 50  0001 C CNN
	1    7300 3625
	-1   0    0    -1  
$EndComp
Text GLabel 8000 2725 2    39   Output ~ 0
nWR
Text GLabel 8000 2625 2    39   Output ~ 0
nRD
Text GLabel 8000 2025 2    39   Output ~ 0
nRFSH
Text GLabel 8000 1925 2    39   Output ~ 0
nM1
Text GLabel 8000 1625 2    39   Input ~ 0
nINT
Text GLabel 8100 1225 2    39   Input ~ 0
CLKCPU
Text GLabel 6600 2425 0    39   Output ~ 0
A15
Text GLabel 6600 2325 0    39   Output ~ 0
A14
Text GLabel 6600 2225 0    39   Output ~ 0
A13
Text GLabel 6600 2125 0    39   Output ~ 0
A12
Text GLabel 6600 2025 0    39   Output ~ 0
A11
Text GLabel 6600 1925 0    39   Output ~ 0
A10
Text GLabel 6600 1825 0    39   Output ~ 0
A9
Text GLabel 6600 1725 0    39   Output ~ 0
A8
Text GLabel 6600 1625 0    39   Output ~ 0
A7
Text GLabel 6600 1525 0    39   Output ~ 0
A6
Text GLabel 6600 1425 0    39   Output ~ 0
A5
Text GLabel 6600 1325 0    39   Output ~ 0
A4
Text GLabel 6600 1225 0    39   Output ~ 0
A3
Text GLabel 6600 1125 0    39   Output ~ 0
A2
Text GLabel 6600 1025 0    39   Output ~ 0
A1
Text GLabel 6600 925  0    39   Output ~ 0
A0
$Comp
L power:+5V #PWR03
U 1 1 5A823585
P 7300 625
F 0 "#PWR03" H 7300 475 50  0001 C CNN
F 1 "+5V" H 7315 790 39  0001 C CNN
F 2 "" H 7300 625 50  0001 C CNN
F 3 "" H 7300 625 50  0001 C CNN
	1    7300 625 
	-1   0    0    -1  
$EndComp
Text GLabel 10475 5175 0    39   Output ~ 0
TAPE_IN
$Comp
L Connector:AudioJack3_SwitchTR J4
U 1 1 5D6458B4
P 10725 4875
F 0 "J4" H 10445 4800 50  0000 R CNN
F 1 "PJ307" H 10445 4709 50  0001 R CNN
F 2 "my:SWITCHCRAFT_35RAPC4BHN2" H 10725 4875 50  0001 C CNN
F 3 "~" H 10725 4875 50  0001 C CNN
F 4 "EAR" H 10445 4709 50  0000 R CNN "Desc"
	1    10725 4875
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR038
U 1 1 5E2BDC4F
P 10525 4775
F 0 "#PWR038" H 10525 4525 50  0001 C CNN
F 1 "GND" V 10530 4602 39  0001 C CNN
F 2 "" H 10525 4775 50  0001 C CNN
F 3 "" H 10525 4775 50  0001 C CNN
	1    10525 4775
	0    1    1    0   
$EndComp
Wire Wire Line
	10525 5175 10525 5075
Connection ~ 10525 5075
Connection ~ 10525 4975
Wire Wire Line
	10525 4875 10525 4975
Wire Wire Line
	10525 4975 10525 5075
Wire Wire Line
	10475 5175 10525 5175
Connection ~ 10525 5175
NoConn ~ 8000 3325
NoConn ~ 8000 2225
Text GLabel 4025 2300 0    39   Output ~ 0
CHROMA0
Text GLabel 4025 2200 0    39   Output ~ 0
CHROMA1
Text GLabel 4025 1400 0    39   Input ~ 0
CLK16
Text GLabel 5925 4400 2    39   Output ~ 0
RA14
Text GLabel 10550 1800 0    39   Input ~ 0
TAPE_OUT
Text GLabel 10550 1675 0    39   Input ~ 0
BEEPER
$Comp
L Device:R R6
U 1 1 6034FFAE
P 10700 1675
F 0 "R6" V 10700 1425 39  0000 L CNN
F 1 "4.7k" V 10700 1625 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 10630 1675 50  0001 C CNN
F 3 "~" H 10700 1675 50  0001 C CNN
	1    10700 1675
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R7
U 1 1 60350603
P 10700 1800
F 0 "R7" V 10700 1550 39  0000 L CNN
F 1 "10k" V 10700 1750 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 10630 1800 50  0001 C CNN
F 3 "~" H 10700 1800 50  0001 C CNN
	1    10700 1800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10850 1800 10850 1675
Connection ~ 10850 1675
Text GLabel 4025 3900 0    39   Input ~ 0
KD0
Text GLabel 4025 4200 0    39   Input ~ 0
KD4
Text GLabel 4025 4000 0    39   Input ~ 0
KD3
Text GLabel 4025 4100 0    39   Input ~ 0
KD2
Text GLabel 4025 3800 0    39   Input ~ 0
KD1
Wire Wire Line
	9500 6200 9500 5725
Wire Wire Line
	9400 6300 9400 5725
Wire Wire Line
	9300 5725 9300 6400
Wire Wire Line
	9200 5725 9200 6500
Wire Wire Line
	9075 6500 9200 6500
Wire Wire Line
	9075 6400 9300 6400
Wire Wire Line
	9075 6300 9400 6300
Wire Wire Line
	9075 6200 9500 6200
Connection ~ 9500 6200
Wire Wire Line
	9500 6200 9775 6200
Connection ~ 9400 6300
Wire Wire Line
	9400 6300 9775 6300
Connection ~ 9300 6400
Wire Wire Line
	9300 6400 9775 6400
Connection ~ 9200 6500
Wire Wire Line
	9200 6500 9775 6500
$Comp
L Connector_Generic:Conn_01x05 J6
U 1 1 5FD04AD5
P 9975 6300
F 0 "J6" H 9950 6600 39  0000 L CNN
F 1 "Conn_01x05" H 10055 6251 50  0001 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x05_P2.54mm_Vertical" H 9975 6300 50  0001 C CNN
F 3 "~" H 9975 6300 50  0001 C CNN
F 4 "KB_D" H 9900 6000 39  0000 L CNN "Desc"
	1    9975 6300
	1    0    0    -1  
$EndComp
Text GLabel 9075 6500 0    39   Output ~ 0
KD4
Text GLabel 9075 6400 0    39   Output ~ 0
KD3
Text GLabel 9075 6300 0    39   Output ~ 0
KD2
Text GLabel 9075 6200 0    39   Output ~ 0
KD1
Text GLabel 9075 6100 0    39   Output ~ 0
KD0
Wire Wire Line
	7325 7050 7475 7050
Wire Wire Line
	7325 7250 7475 7250
Text GLabel 9900 5725 3    39   Output ~ 0
TDI
Text GLabel 9800 5725 3    39   Output ~ 0
TMS
$Comp
L power:+5V #PWR019
U 1 1 5E1BD2B1
P 8000 3225
F 0 "#PWR019" H 8000 3075 50  0001 C CNN
F 1 "+5V" H 8000 3375 39  0001 C CNN
F 2 "" H 8000 3225 50  0001 C CNN
F 3 "" H 8000 3225 50  0001 C CNN
	1    8000 3225
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR011
U 1 1 5E1BDB08
P 8000 2125
F 0 "#PWR011" H 8000 1975 50  0001 C CNN
F 1 "+5V" H 8000 2275 39  0001 C CNN
F 2 "" H 8000 2125 50  0001 C CNN
F 3 "" H 8000 2125 50  0001 C CNN
	1    8000 2125
	0    1    1    0   
$EndComp
$Comp
L power:PWR_FLAG #FLG02
U 1 1 5E2B10DE
P 10475 4425
F 0 "#FLG02" H 10475 4500 50  0001 C CNN
F 1 "PWR_FLAG" H 10475 4599 50  0001 C CNN
F 2 "" H 10475 4425 50  0001 C CNN
F 3 "~" H 10475 4425 50  0001 C CNN
	1    10475 4425
	1    0    0    1   
$EndComp
$Comp
L power:+5V #PWR012
U 1 1 5E2BAF18
P 8875 2150
F 0 "#PWR012" H 8875 2000 50  0001 C CNN
F 1 "+5V" H 8890 2315 39  0001 C CNN
F 2 "" H 8875 2150 50  0001 C CNN
F 3 "" H 8875 2150 50  0001 C CNN
	1    8875 2150
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR049
U 1 1 5E2BC5D4
P 9200 5325
F 0 "#PWR049" H 9200 5175 50  0001 C CNN
F 1 "+5V" H 9200 5475 39  0001 C CNN
F 2 "" H 9200 5325 50  0001 C CNN
F 3 "" H 9200 5325 50  0001 C CNN
	1    9200 5325
	1    0    0    -1  
$EndComp
Wire Wire Line
	7325 6950 7475 6950
$Comp
L Device:R R12
U 1 1 62BF8D5A
P 2950 2850
F 0 "R12" V 2900 2625 39  0000 L CNN
F 1 "1k" V 2950 2800 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2880 2850 50  0001 C CNN
F 3 "~" H 2950 2850 50  0001 C CNN
	1    2950 2850
	0    -1   1    0   
$EndComp
$Comp
L Device:R R11
U 1 1 62BF8D60
P 2950 2750
F 0 "R11" V 2900 2525 39  0000 L CNN
F 1 "1k" V 2950 2700 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2880 2750 50  0001 C CNN
F 3 "~" H 2950 2750 50  0001 C CNN
	1    2950 2750
	0    -1   1    0   
$EndComp
Wire Wire Line
	2800 3750 2675 3750
Text GLabel 4025 3600 0    39   Output ~ 0
nROMCS
Text GLabel 4025 3500 0    39   Input ~ 0
nWR
Text GLabel 4025 3100 0    39   Input ~ 0
nIORQ
Text GLabel 4025 3200 0    39   Input ~ 0
nMREQ
Text GLabel 4025 3000 0    39   Input ~ 0
nM1
Text GLabel 4025 2800 0    39   Input ~ 0
nRFSH
Text GLabel 4025 3300 0    39   Input ~ 0
A1
Text GLabel 4025 3400 0    39   Input ~ 0
A0
Text GLabel 4025 2600 0    39   Input ~ 0
A14
Text GLabel 4025 2500 0    39   Input ~ 0
A15
Text GLabel 4025 2700 0    39   Output ~ 0
nINT
$Comp
L Device:C C2
U 1 1 5E8551ED
P 10850 1200
F 0 "C2" H 10775 1100 39  0000 C CNN
F 1 "100n" H 10750 1300 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 10888 1050 50  0001 C CNN
F 3 "~" H 10850 1200 50  0001 C CNN
	1    10850 1200
	-1   0    0    1   
$EndComp
Connection ~ 10475 4425
Wire Wire Line
	10175 4125 10075 4125
Connection ~ 10175 4425
Wire Wire Line
	10175 4425 10475 4425
Connection ~ 10175 4125
$Comp
L power:PWR_FLAG #FLG01
U 1 1 604560F9
P 10075 4125
F 0 "#FLG01" H 10075 4200 50  0001 C CNN
F 1 "PWR_FLAG" H 10075 4299 50  0001 C CNN
F 2 "" H 10075 4125 50  0001 C CNN
F 3 "~" H 10075 4125 50  0001 C CNN
	1    10075 4125
	-1   0    0    -1  
$EndComp
$Comp
L Device:CP C6
U 1 1 5C3D9F1D
P 10175 4275
F 0 "C6" H 10293 4313 39  0000 L CNN
F 1 "470u" H 10293 4238 39  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D10.0mm_P3.80mm" H 10213 4125 50  0001 C CNN
F 3 "~" H 10175 4275 50  0001 C CNN
	1    10175 4275
	-1   0    0    -1  
$EndComp
$Comp
L power:+5V #PWR027
U 1 1 5B6C7C72
P 10175 4125
F 0 "#PWR027" H 10175 3975 50  0001 C CNN
F 1 "+5V" H 10175 4275 39  0000 C CNN
F 2 "" H 10175 4125 50  0001 C CNN
F 3 "" H 10175 4125 50  0001 C CNN
	1    10175 4125
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR029
U 1 1 5D8CB390
P 10175 4425
F 0 "#PWR029" H 10175 4175 50  0001 C CNN
F 1 "GND" H 10180 4252 39  0001 C CNN
F 2 "" H 10175 4425 50  0001 C CNN
F 3 "" H 10175 4425 50  0001 C CNN
	1    10175 4425
	-1   0    0    -1  
$EndComp
Text GLabel 9600 5725 3    39   Output ~ 0
nNMI
$Comp
L Device:R_Network08 RN1
U 1 1 609D4018
P 9600 5525
F 0 "RN1" H 8950 5575 50  0000 L CNN
F 1 "10k" H 8950 5475 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 10075 5525 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 9600 5525 50  0001 C CNN
	1    9600 5525
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 5725 9700 6100
Connection ~ 9700 6100
Wire Wire Line
	9700 6100 9775 6100
Wire Wire Line
	9075 6100 9700 6100
Text GLabel 8000 925  2    39   Input ~ 0
nRST
Wire Wire Line
	10850 1350 10850 1675
Text GLabel 10925 950  2    39   Output ~ 0
SOUND
$Comp
L power:GND #PWR052
U 1 1 5EBEC17A
P 7975 6025
F 0 "#PWR052" H 7975 5775 50  0001 C CNN
F 1 "GND" H 7980 5852 39  0001 C CNN
F 2 "" H 7975 6025 50  0001 C CNN
F 3 "" H 7975 6025 50  0001 C CNN
	1    7975 6025
	1    0    0    -1  
$EndComp
Connection ~ 7975 5600
Wire Wire Line
	7975 5625 7975 5600
$Comp
L Device:Q_NPN_CBE Q1
U 1 1 5EBB39E6
P 7875 5825
F 0 "Q1" H 8075 5875 39  0000 L CNN
F 1 "BC547B" H 8075 5775 39  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 8075 5925 50  0001 C CNN
F 3 "~" H 7875 5825 50  0001 C CNN
	1    7875 5825
	1    0    0    -1  
$EndComp
Wire Wire Line
	7975 5600 8075 5600
Wire Wire Line
	7975 5575 7975 5600
$Comp
L power:+5V #PWR048
U 1 1 5EB9A72C
P 7975 5275
F 0 "#PWR048" H 7975 5125 50  0001 C CNN
F 1 "+5V" H 7975 5425 39  0001 C CNN
F 2 "" H 7975 5275 50  0001 C CNN
F 3 "" H 7975 5275 50  0001 C CNN
	1    7975 5275
	1    0    0    -1  
$EndComp
$Comp
L Device:R R31
U 1 1 5EB9A233
P 7975 5425
F 0 "R31" V 8050 5375 39  0000 L CNN
F 1 "10k" V 7975 5375 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 7905 5425 50  0001 C CNN
F 3 "~" H 7975 5425 50  0001 C CNN
	1    7975 5425
	1    0    0    -1  
$EndComp
Connection ~ 7350 5825
Wire Wire Line
	7350 5825 7375 5825
$Comp
L Device:R R36
U 1 1 5EB8D2BB
P 7525 5825
F 0 "R36" V 7600 5775 39  0000 L CNN
F 1 "10k" V 7525 5775 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 7455 5825 50  0001 C CNN
F 3 "~" H 7525 5825 50  0001 C CNN
	1    7525 5825
	0    -1   -1   0   
$EndComp
Connection ~ 7125 5825
Wire Wire Line
	7350 5825 7125 5825
$Comp
L power:GND #PWR056
U 1 1 5EB80AE7
P 7350 6125
F 0 "#PWR056" H 7350 5875 50  0001 C CNN
F 1 "GND" H 7355 5952 39  0001 C CNN
F 2 "" H 7350 6125 50  0001 C CNN
F 3 "" H 7350 6125 50  0001 C CNN
	1    7350 6125
	1    0    0    -1  
$EndComp
$Comp
L Device:C C16
U 1 1 5EB8044C
P 7350 5975
F 0 "C16" H 7200 5950 39  0000 C CNN
F 1 "10n" H 7200 6025 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 7388 5825 50  0001 C CNN
F 3 "~" H 7350 5975 50  0001 C CNN
	1    7350 5975
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR055
U 1 1 5EB7ED95
P 7125 6125
F 0 "#PWR055" H 7125 5875 50  0001 C CNN
F 1 "GND" H 7130 5952 39  0001 C CNN
F 2 "" H 7125 6125 50  0001 C CNN
F 3 "" H 7125 6125 50  0001 C CNN
	1    7125 6125
	1    0    0    -1  
$EndComp
Wire Wire Line
	7075 5825 7125 5825
$Comp
L Device:D D3
U 1 1 5EB721B7
P 7125 5975
F 0 "D3" V 7125 6075 39  0000 C CNN
F 1 "1N4148" H 7125 6100 50  0001 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 7125 5975 50  0001 C CNN
F 3 "~" H 7125 5975 50  0001 C CNN
	1    7125 5975
	0    1    1    0   
$EndComp
Connection ~ 6425 5825
Wire Wire Line
	6425 5825 6325 5825
Wire Wire Line
	6425 5825 6475 5825
$Comp
L Device:R R38
U 1 1 5EB42D4C
P 6425 5975
F 0 "R38" V 6500 5925 39  0000 L CNN
F 1 "10k" V 6425 5925 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 6355 5975 50  0001 C CNN
F 3 "~" H 6425 5975 50  0001 C CNN
	1    6425 5975
	1    0    0    -1  
$EndComp
$Comp
L Device:R R35
U 1 1 5EB42275
P 6625 5825
F 0 "R35" V 6700 5775 39  0000 L CNN
F 1 "470" V 6625 5775 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 6555 5825 50  0001 C CNN
F 3 "~" H 6625 5825 50  0001 C CNN
	1    6625 5825
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C15
U 1 1 5EB35D38
P 6925 5825
F 0 "C15" V 7075 5825 39  0000 C CNN
F 1 "100n" V 6775 5825 39  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 6963 5675 50  0001 C CNN
F 3 "~" H 6925 5825 50  0001 C CNN
	1    6925 5825
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR054
U 1 1 61ADEF59
P 6425 6125
F 0 "#PWR054" H 6425 5875 50  0001 C CNN
F 1 "GND" H 6430 5952 39  0001 C CNN
F 2 "" H 6425 6125 50  0001 C CNN
F 3 "" H 6425 6125 50  0001 C CNN
	1    6425 6125
	1    0    0    -1  
$EndComp
Text GLabel 6325 5825 0    39   Input ~ 0
TAPE_IN
Text GLabel 8075 5600 2    39   Output ~ 0
TAPE_IN0
Wire Wire Line
	9100 4375 8925 4375
Connection ~ 8925 4375
Wire Wire Line
	8925 4325 8925 4375
$Comp
L Device:R R26
U 1 1 607909F9
P 8925 4175
F 0 "R26" V 9000 4125 39  0000 L CNN
F 1 "47k" V 8925 4125 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 8855 4175 50  0001 C CNN
F 3 "~" H 8925 4175 50  0001 C CNN
	1    8925 4175
	-1   0    0    -1  
$EndComp
$Comp
L Device:CP C7
U 1 1 5E0EE18B
P 8925 4575
F 0 "C7" H 9043 4613 39  0000 L CNN
F 1 "10u" H 9043 4538 39  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D4.0mm_P2.00mm" H 8963 4425 50  0001 C CNN
F 3 "~" H 8925 4575 50  0001 C CNN
	1    8925 4575
	1    0    0    -1  
$EndComp
Wire Wire Line
	8925 4425 8925 4375
$Comp
L power:+5V #PWR026
U 1 1 5D3ADC2D
P 8925 4025
F 0 "#PWR026" H 8925 3875 50  0001 C CNN
F 1 "+5V" H 8940 4190 39  0001 C CNN
F 2 "" H 8925 4025 50  0001 C CNN
F 3 "" H 8925 4025 50  0001 C CNN
	1    8925 4025
	1    0    0    -1  
$EndComp
Text GLabel 9100 4375 2    39   Output ~ 0
nRST
$Comp
L power:GND #PWR037
U 1 1 5D11747D
P 8925 4725
F 0 "#PWR037" H 8925 4475 50  0001 C CNN
F 1 "GND" H 8930 4552 39  0001 C CNN
F 2 "" H 8925 4725 50  0001 C CNN
F 3 "" H 8925 4725 50  0001 C CNN
	1    8925 4725
	-1   0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 5ED79585
P 11100 575
F 0 "H3" H 11200 575 50  0001 L CNN
F 1 "MountingHole" H 11200 530 50  0001 L CNN
F 2 "MountingHole:MountingHole_3mm" H 11100 575 50  0001 C CNN
F 3 "~" H 11100 575 50  0001 C CNN
	1    11100 575 
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 5ED6E047
P 10875 575
F 0 "H2" H 10975 575 50  0001 L CNN
F 1 "MountingHole" H 10975 530 50  0001 L CNN
F 2 "MountingHole:MountingHole_3mm" H 10875 575 50  0001 C CNN
F 3 "~" H 10875 575 50  0001 C CNN
	1    10875 575 
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H1
U 1 1 5ED6AD99
P 10650 575
F 0 "H1" H 10750 575 50  0001 L CNN
F 1 "MountingHole" H 10750 530 50  0001 L CNN
F 2 "MountingHole:MountingHole_3mm" H 10650 575 50  0001 C CNN
F 3 "~" H 10650 575 50  0001 C CNN
	1    10650 575 
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5E086AD0
P 8250 1125
F 0 "R4" V 8325 1075 39  0000 L CNN
F 1 "2.2k" V 8250 1050 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 8180 1125 50  0001 C CNN
F 3 "~" H 8250 1125 50  0001 C CNN
	1    8250 1125
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8000 1225 8050 1225
Wire Wire Line
	8050 1225 8050 1125
Wire Wire Line
	8050 1125 8100 1125
Connection ~ 8050 1225
Wire Wire Line
	8050 1225 8100 1225
$Comp
L power:+5V #PWR05
U 1 1 5E0A8022
P 8400 1125
F 0 "#PWR05" H 8400 975 50  0001 C CNN
F 1 "+5V" H 8415 1290 39  0001 C CNN
F 2 "" H 8400 1125 50  0001 C CNN
F 3 "" H 8400 1125 50  0001 C CNN
	1    8400 1125
	0    1    -1   0   
$EndComp
$Comp
L Switch:SW_Push SW1
U 1 1 6509608E
P 6700 7500
F 0 "SW1" H 6625 7675 39  0000 L CNN
F 1 "SW_Push" H 6575 7425 39  0001 L CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm" H 6700 7700 50  0001 C CNN
F 3 "" H 6700 7700 50  0001 C CNN
F 4 "NMI" H 6700 7425 50  0000 C CNN "Desc"
	1    6700 7500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR069
U 1 1 65096088
P 6900 7500
F 0 "#PWR069" H 6900 7250 50  0001 C CNN
F 1 "GND" H 6905 7327 39  0001 C CNN
F 2 "" H 6900 7500 50  0001 C CNN
F 3 "" H 6900 7500 50  0001 C CNN
	1    6900 7500
	0    -1   1    0   
$EndComp
Text GLabel 6500 7500 0    39   Output ~ 0
nNMI
NoConn ~ 4025 1300
NoConn ~ 4025 2400
Wire Wire Line
	10475 950  10500 950 
$Comp
L Device:R R5
U 1 1 5E09CC70
P 10475 1250
F 0 "R5" V 10550 1200 39  0000 L CNN
F 1 "1k" V 10475 1200 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 10405 1250 50  0001 C CNN
F 3 "~" H 10475 1250 50  0001 C CNN
	1    10475 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	10800 950  10850 950 
Wire Wire Line
	10925 950  10850 950 
Connection ~ 10850 950 
Wire Wire Line
	10475 1100 10475 1050
Wire Wire Line
	10850 950  10850 1050
Connection ~ 10475 1050
$Comp
L power:GND #PWR06
U 1 1 5E0C8FFE
P 10475 1400
F 0 "#PWR06" H 10475 1150 50  0001 C CNN
F 1 "GND" H 10480 1227 39  0001 C CNN
F 2 "" H 10475 1400 50  0001 C CNN
F 3 "" H 10475 1400 50  0001 C CNN
	1    10475 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D10
U 1 1 5F22C337
P 4500 6650
F 0 "D10" H 4500 6750 39  0000 C CNN
F 1 "BAT85" H 4500 6775 50  0001 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 4500 6650 50  0001 C CNN
F 3 "~" H 4500 6650 50  0001 C CNN
	1    4500 6650
	1    0    0    -1  
$EndComp
Wire Wire Line
	10475 4125 10175 4125
$Comp
L Device:R R32
U 1 1 5E310A14
P 7675 5550
F 0 "R32" V 7750 5500 39  0000 L CNN
F 1 "500k" V 7675 5475 39  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 7605 5550 50  0001 C CNN
F 3 "~" H 7675 5550 50  0001 C CNN
	1    7675 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7675 5400 7675 5275
Wire Wire Line
	7675 5275 7975 5275
Connection ~ 7975 5275
Wire Wire Line
	7675 5700 7675 5825
Connection ~ 7675 5825
$Comp
L my:logo LOGO1
U 1 1 5E9F134C
P 2950 900
F 0 "LOGO1" H 2950 1100 50  0001 C CNN
F 1 "logo" H 2950 650 50  0001 C CNN
F 2 "my:black-mage2" H 2950 700 50  0001 C CNN
F 3 "~" H 2980 700 50  0001 C CNN
F 4 "Logo" H 2850 800 50  0000 L CNN "Desc"
	1    2950 900 
	1    0    0    -1  
$EndComp
$Comp
L my:logo LOGO2
U 1 1 5E9FA75D
P 2950 1350
F 0 "LOGO2" H 2950 1550 50  0001 C CNN
F 1 "logo" H 2950 1100 50  0001 C CNN
F 2 "my:dc_center_positive_big" H 2950 1150 50  0001 C CNN
F 3 "~" H 2980 1150 50  0001 C CNN
F 4 "DC" H 2900 1275 50  0000 L CNN "Desc"
	1    2950 1350
	1    0    0    -1  
$EndComp
$EndSCHEMATC
