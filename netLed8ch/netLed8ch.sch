EESchema Schematic File Version 4
LIBS:netLed8ch-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L ESP32-DEVKITC-32D:ESP32-DEVKITC-32D U1
U 1 1 5DC289E7
P 4150 3050
F 0 "U1" H 4150 4217 50  0000 C CNN
F 1 "ESP32-DEVKITC-32D" H 4150 4126 50  0000 C CNN
F 2 "ESP32-DEVKITC-32D:MODULE_ESP32-DEVKITC-32D" H 4150 3050 50  0001 L BNN
F 3 "Unavailable" H 4150 3050 50  0001 L BNN
F 4 "None" H 4150 3050 50  0001 L BNN "フィールド4"
F 5 "ESP32-DEVKITC-32D" H 4150 3050 50  0001 L BNN "フィールド5"
F 6 "None" H 4150 3050 50  0001 L BNN "フィールド6"
F 7 "Eval Board For Esp-Wroom-32" H 4150 3050 50  0001 L BNN "フィールド7"
F 8 "Espressif Systems" H 4150 3050 50  0001 L BNN "フィールド8"
	1    4150 3050
	1    0    0    -1  
$EndComp
Text Label 3350 2750 2    50   ~ 0
P1
Text Label 3350 2850 2    50   ~ 0
P2
Text Label 3350 2950 2    50   ~ 0
P3
Text Label 3350 3050 2    50   ~ 0
P4
Text Label 3350 3250 2    50   ~ 0
P6
Text Label 3350 3150 2    50   ~ 0
P5
Text Label 4950 3150 0    50   ~ 0
LED
Text Label 4950 3250 0    50   ~ 0
P8
Text Label 3350 3550 2    50   ~ 0
P7
$Comp
L Connector:Conn_01x03_Female J2
U 1 1 5DC29148
P 1100 5200
F 0 "J2" H 994 4875 50  0000 C CNN
F 1 "32" H 1300 5200 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 1100 5200 50  0001 C CNN
F 3 "~" H 1100 5200 50  0001 C CNN
	1    1100 5200
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR08
U 1 1 5DC2914F
P 1300 5100
F 0 "#PWR08" H 1300 4950 50  0001 C CNN
F 1 "+5V" H 1315 5273 50  0000 C CNN
F 2 "" H 1300 5100 50  0001 C CNN
F 3 "" H 1300 5100 50  0001 C CNN
	1    1300 5100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR012
U 1 1 5DC29155
P 1300 5300
F 0 "#PWR012" H 1300 5050 50  0001 C CNN
F 1 "GND" H 1305 5127 50  0000 C CNN
F 2 "" H 1300 5300 50  0001 C CNN
F 3 "" H 1300 5300 50  0001 C CNN
	1    1300 5300
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Female J3
U 1 1 5DC29178
P 1900 5200
F 0 "J3" H 1794 4875 50  0000 C CNN
F 1 "33" H 2100 5200 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 1900 5200 50  0001 C CNN
F 3 "~" H 1900 5200 50  0001 C CNN
	1    1900 5200
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR09
U 1 1 5DC2917F
P 2100 5100
F 0 "#PWR09" H 2100 4950 50  0001 C CNN
F 1 "+5V" H 2115 5273 50  0000 C CNN
F 2 "" H 2100 5100 50  0001 C CNN
F 3 "" H 2100 5100 50  0001 C CNN
	1    2100 5100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR013
U 1 1 5DC29185
P 2100 5300
F 0 "#PWR013" H 2100 5050 50  0001 C CNN
F 1 "GND" H 2105 5127 50  0000 C CNN
F 2 "" H 2100 5300 50  0001 C CNN
F 3 "" H 2100 5300 50  0001 C CNN
	1    2100 5300
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Female J4
U 1 1 5DC291B9
P 2750 5200
F 0 "J4" H 2644 4875 50  0000 C CNN
F 1 "25" H 2950 5200 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 2750 5200 50  0001 C CNN
F 3 "~" H 2750 5200 50  0001 C CNN
	1    2750 5200
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR010
U 1 1 5DC291C0
P 2950 5100
F 0 "#PWR010" H 2950 4950 50  0001 C CNN
F 1 "+5V" H 2965 5273 50  0000 C CNN
F 2 "" H 2950 5100 50  0001 C CNN
F 3 "" H 2950 5100 50  0001 C CNN
	1    2950 5100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR014
U 1 1 5DC291C6
P 2950 5300
F 0 "#PWR014" H 2950 5050 50  0001 C CNN
F 1 "GND" H 2955 5127 50  0000 C CNN
F 2 "" H 2950 5300 50  0001 C CNN
F 3 "" H 2950 5300 50  0001 C CNN
	1    2950 5300
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Female J5
U 1 1 5DC291F1
P 3500 5200
F 0 "J5" H 3394 4875 50  0000 C CNN
F 1 "26" H 3700 5200 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 3500 5200 50  0001 C CNN
F 3 "~" H 3500 5200 50  0001 C CNN
	1    3500 5200
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR011
U 1 1 5DC291F8
P 3700 5100
F 0 "#PWR011" H 3700 4950 50  0001 C CNN
F 1 "+5V" H 3715 5273 50  0000 C CNN
F 2 "" H 3700 5100 50  0001 C CNN
F 3 "" H 3700 5100 50  0001 C CNN
	1    3700 5100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR015
U 1 1 5DC291FE
P 3700 5300
F 0 "#PWR015" H 3700 5050 50  0001 C CNN
F 1 "GND" H 3705 5127 50  0000 C CNN
F 2 "" H 3700 5300 50  0001 C CNN
F 3 "" H 3700 5300 50  0001 C CNN
	1    3700 5300
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Female J6
U 1 1 5DC29314
P 1050 6150
F 0 "J6" H 944 5825 50  0000 C CNN
F 1 "27" H 1250 6150 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 1050 6150 50  0001 C CNN
F 3 "~" H 1050 6150 50  0001 C CNN
	1    1050 6150
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR016
U 1 1 5DC2931B
P 1250 6050
F 0 "#PWR016" H 1250 5900 50  0001 C CNN
F 1 "+5V" H 1265 6223 50  0000 C CNN
F 2 "" H 1250 6050 50  0001 C CNN
F 3 "" H 1250 6050 50  0001 C CNN
	1    1250 6050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR020
U 1 1 5DC29321
P 1250 6250
F 0 "#PWR020" H 1250 6000 50  0001 C CNN
F 1 "GND" H 1255 6077 50  0000 C CNN
F 2 "" H 1250 6250 50  0001 C CNN
F 3 "" H 1250 6250 50  0001 C CNN
	1    1250 6250
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Female J7
U 1 1 5DC29327
P 1850 6150
F 0 "J7" H 1744 5825 50  0000 C CNN
F 1 "14" H 2050 6150 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 1850 6150 50  0001 C CNN
F 3 "~" H 1850 6150 50  0001 C CNN
	1    1850 6150
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR017
U 1 1 5DC2932E
P 2050 6050
F 0 "#PWR017" H 2050 5900 50  0001 C CNN
F 1 "+5V" H 2065 6223 50  0000 C CNN
F 2 "" H 2050 6050 50  0001 C CNN
F 3 "" H 2050 6050 50  0001 C CNN
	1    2050 6050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR021
U 1 1 5DC29334
P 2050 6250
F 0 "#PWR021" H 2050 6000 50  0001 C CNN
F 1 "GND" H 2055 6077 50  0000 C CNN
F 2 "" H 2050 6250 50  0001 C CNN
F 3 "" H 2050 6250 50  0001 C CNN
	1    2050 6250
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Female J8
U 1 1 5DC2933A
P 2700 6150
F 0 "J8" H 2594 5825 50  0000 C CNN
F 1 "13" H 2900 6150 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 2700 6150 50  0001 C CNN
F 3 "~" H 2700 6150 50  0001 C CNN
	1    2700 6150
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR018
U 1 1 5DC29341
P 2900 6050
F 0 "#PWR018" H 2900 5900 50  0001 C CNN
F 1 "+5V" H 2915 6223 50  0000 C CNN
F 2 "" H 2900 6050 50  0001 C CNN
F 3 "" H 2900 6050 50  0001 C CNN
	1    2900 6050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR022
U 1 1 5DC29347
P 2900 6250
F 0 "#PWR022" H 2900 6000 50  0001 C CNN
F 1 "GND" H 2905 6077 50  0000 C CNN
F 2 "" H 2900 6250 50  0001 C CNN
F 3 "" H 2900 6250 50  0001 C CNN
	1    2900 6250
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Female J9
U 1 1 5DC2934D
P 3450 6150
F 0 "J9" H 3344 5825 50  0000 C CNN
F 1 "16" H 3650 6150 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 3450 6150 50  0001 C CNN
F 3 "~" H 3450 6150 50  0001 C CNN
	1    3450 6150
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR019
U 1 1 5DC29354
P 3650 6050
F 0 "#PWR019" H 3650 5900 50  0001 C CNN
F 1 "+5V" H 3665 6223 50  0000 C CNN
F 2 "" H 3650 6050 50  0001 C CNN
F 3 "" H 3650 6050 50  0001 C CNN
	1    3650 6050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR023
U 1 1 5DC2935A
P 3650 6250
F 0 "#PWR023" H 3650 6000 50  0001 C CNN
F 1 "GND" H 3655 6077 50  0000 C CNN
F 2 "" H 3650 6250 50  0001 C CNN
F 3 "" H 3650 6250 50  0001 C CNN
	1    3650 6250
	1    0    0    -1  
$EndComp
Text Label 1300 5200 0    50   ~ 0
P1
Text Label 2100 5200 0    50   ~ 0
P2
Text Label 2950 5200 0    50   ~ 0
P3
Text Label 3700 5200 0    50   ~ 0
P4
Text Label 1250 6150 0    50   ~ 0
P5
Text Label 2050 6150 0    50   ~ 0
P6
Text Label 2900 6150 0    50   ~ 0
P7
Text Label 3650 6150 0    50   ~ 0
P8
$Comp
L Device:R R1
U 1 1 5DC2974E
P 6100 3550
F 0 "R1" H 6170 3596 50  0000 L CNN
F 1 "R" H 6170 3505 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 6030 3550 50  0001 C CNN
F 3 "~" H 6100 3550 50  0001 C CNN
	1    6100 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D1
U 1 1 5DC297C9
P 6100 3850
F 0 "D1" V 6138 3733 50  0000 R CNN
F 1 "LED" V 6047 3733 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 6100 3850 50  0001 C CNN
F 3 "~" H 6100 3850 50  0001 C CNN
	1    6100 3850
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR07
U 1 1 5DC29918
P 6100 4000
F 0 "#PWR07" H 6100 3750 50  0001 C CNN
F 1 "GND" H 6105 3827 50  0000 C CNN
F 2 "" H 6100 4000 50  0001 C CNN
F 3 "" H 6100 4000 50  0001 C CNN
	1    6100 4000
	1    0    0    -1  
$EndComp
Text Label 6100 3400 0    50   ~ 0
LED
$Comp
L power:+5V #PWR06
U 1 1 5DC29B0D
P 3350 3950
F 0 "#PWR06" H 3350 3800 50  0001 C CNN
F 1 "+5V" H 3365 4123 50  0000 C CNN
F 2 "" H 3350 3950 50  0001 C CNN
F 3 "" H 3350 3950 50  0001 C CNN
	1    3350 3950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01
U 1 1 5DC29B85
P 4950 2150
F 0 "#PWR01" H 4950 1900 50  0001 C CNN
F 1 "GND" H 4955 1977 50  0000 C CNN
F 2 "" H 4950 2150 50  0001 C CNN
F 3 "" H 4950 2150 50  0001 C CNN
	1    4950 2150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5DC29BBD
P 4950 2750
F 0 "#PWR04" H 4950 2500 50  0001 C CNN
F 1 "GND" H 4955 2577 50  0000 C CNN
F 2 "" H 4950 2750 50  0001 C CNN
F 3 "" H 4950 2750 50  0001 C CNN
	1    4950 2750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5DC29BF5
P 3350 3450
F 0 "#PWR05" H 3350 3200 50  0001 C CNN
F 1 "GND" H 3355 3277 50  0000 C CNN
F 2 "" H 3350 3450 50  0001 C CNN
F 3 "" H 3350 3450 50  0001 C CNN
	1    3350 3450
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J1
U 1 1 5DC29C50
P 6100 2450
F 0 "J1" H 6206 2628 50  0000 C CNN
F 1 "5V+" H 6206 2537 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x01_P2.54mm_Vertical" H 6100 2450 50  0001 C CNN
F 3 "~" H 6100 2450 50  0001 C CNN
	1    6100 2450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 5DC29CBF
P 6300 2550
F 0 "#PWR03" H 6300 2300 50  0001 C CNN
F 1 "GND" H 6305 2377 50  0000 C CNN
F 2 "" H 6300 2550 50  0001 C CNN
F 3 "" H 6300 2550 50  0001 C CNN
	1    6300 2550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR02
U 1 1 5DC29D00
P 6300 2450
F 0 "#PWR02" H 6300 2300 50  0001 C CNN
F 1 "+5V" H 6315 2623 50  0000 C CNN
F 2 "" H 6300 2450 50  0001 C CNN
F 3 "" H 6300 2450 50  0001 C CNN
	1    6300 2450
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x06 J11
U 1 1 5DC60643
P 3150 2450
F 0 "J11" H 3070 1925 50  0000 C CNN
F 1 "3V3-IO35" H 3070 2016 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x06_P2.54mm_Vertical" H 3150 2450 50  0001 C CNN
F 3 "~" H 3150 2450 50  0001 C CNN
	1    3150 2450
	-1   0    0    1   
$EndComp
Wire Wire Line
	3350 3350 3050 3350
Wire Wire Line
	3350 3450 3050 3450
Connection ~ 3350 3450
$Comp
L Connector_Generic:Conn_01x03 J10
U 1 1 5DC609EA
P 5150 2250
F 0 "J10" H 5229 2292 50  0000 L CNN
F 1 "GND-IO22" H 5229 2201 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 5150 2250 50  0001 C CNN
F 3 "~" H 5150 2250 50  0001 C CNN
	1    5150 2250
	1    0    0    -1  
$EndComp
Connection ~ 4950 2150
$Comp
L Connector_Generic:Conn_01x05 J12
U 1 1 5DC60AC4
P 5150 2850
F 0 "J12" H 5230 2892 50  0000 L CNN
F 1 "IO21-IO5" H 5230 2801 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x05_P2.54mm_Vertical" H 5150 2850 50  0001 C CNN
F 3 "~" H 5150 2850 50  0001 C CNN
	1    5150 2850
	1    0    0    -1  
$EndComp
Connection ~ 4950 2750
$Comp
L Connector_Generic:Conn_01x04 J14
U 1 1 5DC60B83
P 5150 3450
F 0 "J14" H 5230 3442 50  0000 L CNN
F 1 "IO4-IO15" H 5230 3351 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x04_P2.54mm_Vertical" H 5150 3450 50  0001 C CNN
F 3 "~" H 5150 3450 50  0001 C CNN
	1    5150 3450
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J13
U 1 1 5DC612E5
P 2850 3450
F 0 "J13" H 2770 3125 50  0000 C CNN
F 1 "IO12-GND" H 2770 3216 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 2850 3450 50  0001 C CNN
F 3 "~" H 2850 3450 50  0001 C CNN
	1    2850 3450
	-1   0    0    1   
$EndComp
$EndSCHEMATC
