
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2$
create_project: 2default:default2
00:00:022default:default2
00:00:052default:default2
426.1482default:default2
127.9142default:defaultZ17-268h px� 
�
Command: %s
53*	vivadotcl2P
<synth_design -top fixed_full_adder_32 -part xc7k160tfbg676-12default:defaultZ4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7k160t2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7k160t2default:defaultZ17-349h px� 
�
%s*synth2�
sStarting Synthesize : Time (s): cpu = 00:00:04 ; elapsed = 00:00:08 . Memory (MB): peak = 687.629 ; gain = 236.516
2default:defaulth px� 
�
synthesizing module '%s'%s4497*oasys2'
fixed_full_adder_322default:default2
 2default:default2�
sD:/Desktop/Estimating-battery-SOC-using-neural-network-main/FPGA/LSTM/LSTM.srcs/sources_1/new/fixed_full_adder_32.v2default:default2
232default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2%
fixed_point_adder2default:default2
 2default:default2�
qD:/Desktop/Estimating-battery-SOC-using-neural-network-main/FPGA/LSTM/LSTM.srcs/sources_1/new/fixed_point_adder.v2default:default2
222default:default8@Z8-6157h px� 
Y
%s
*synth2A
-	Parameter IDLE bound to: 0 - type: integer 
2default:defaulth p
x
� 
\
%s
*synth2D
0	Parameter COMPUTE bound to: 1 - type: integer 
2default:defaulth p
x
� 
[
%s
*synth2C
/	Parameter FINISH bound to: 2 - type: integer 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2%
fixed_point_adder2default:default2
 2default:default2
12default:default2
12default:default2�
qD:/Desktop/Estimating-battery-SOC-using-neural-network-main/FPGA/LSTM/LSTM.srcs/sources_1/new/fixed_point_adder.v2default:default2
222default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2'
fixed_full_adder_322default:default2
 2default:default2
22default:default2
12default:default2�
sD:/Desktop/Estimating-battery-SOC-using-neural-network-main/FPGA/LSTM/LSTM.srcs/sources_1/new/fixed_full_adder_32.v2default:default2
232default:default8@Z8-6155h px� 
�
%s*synth2�
sFinished Synthesize : Time (s): cpu = 00:00:05 ; elapsed = 00:00:10 . Memory (MB): peak = 760.441 ; gain = 309.328
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
~Finished Constraint Validation : Time (s): cpu = 00:00:05 ; elapsed = 00:00:11 . Memory (MB): peak = 760.441 ; gain = 309.328
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Loading part: xc7k160tfbg676-1
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:05 ; elapsed = 00:00:11 . Memory (MB): peak = 760.441 ; gain = 309.328
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
W
Loading part %s157*device2$
xc7k160tfbg676-12default:defaultZ21-403h px� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2
	state_reg2default:default2%
fixed_point_adder2default:defaultZ8-802h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_                    IDLE |                              001 |                               00
2default:defaulth p
x
� 
�
%s
*synth2s
_                 COMPUTE |                              010 |                               01
2default:defaulth p
x
� 
�
%s
*synth2s
_                  FINISH |                              100 |                               10
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
	state_reg2default:default2
one-hot2default:default2%
fixed_point_adder2default:defaultZ8-3354h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:06 ; elapsed = 00:00:11 . Memory (MB): peak = 760.441 ; gain = 309.328
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
� 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input     16 Bit       Adders := 32    
2default:defaulth p
x
� 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               16 Bit    Registers := 64    
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                1 Bit    Registers := 32    
2default:defaulth p
x
� 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   3 Input      1 Bit        Muxes := 96    
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Y
%s
*synth2A
-Start RTL Hierarchical Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Hierarchical RTL Component report 
2default:defaulth p
x
� 
F
%s
*synth2.
Module fixed_point_adder 
2default:defaulth p
x
� 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
� 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input     16 Bit       Adders := 1     
2default:defaulth p
x
� 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               16 Bit    Registers := 2     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                1 Bit    Registers := 1     
2default:defaulth p
x
� 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   3 Input      1 Bit        Muxes := 3     
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
[
%s
*synth2C
/Finished RTL Hierarchical Component Statistics
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2m
YPart Resources:
DSPs: 600 (col length:100)
BRAMs: 650 (col length: RAMB18 100 RAMB36 50)
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
]
%s
*synth2E
1Warning: Parallel synthesis criteria is not met 
2default:defaulth p
x
� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[0].single_adder/extended_num1_0_7_reg[0]2default:default2
FDCE2default:default2H
4adder_block[0].single_adder/extended_num1_0_7_reg[1]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[0].single_adder/extended_num1_0_7_reg[1]2default:default2
FDCE2default:default2H
4adder_block[0].single_adder/extended_num1_0_7_reg[2]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[0].single_adder/extended_num1_0_7_reg[2]2default:default2
FDCE2default:default2H
4adder_block[0].single_adder/extended_num1_0_7_reg[3]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[0].single_adder/extended_num1_0_7_reg[3]2default:default2
FDCE2default:default2H
4adder_block[0].single_adder/extended_num1_0_7_reg[4]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[0].single_adder/extended_num1_0_7_reg[4]2default:default2
FDCE2default:default2H
4adder_block[0].single_adder/extended_num1_0_7_reg[5]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[0].single_adder/extended_num1_0_7_reg[5]2default:default2
FDCE2default:default2H
4adder_block[0].single_adder/extended_num1_0_7_reg[6]2default:defaultZ8-3886h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2J
6\adder_block[0].single_adder/extended_num1_0_7_reg[6] 2default:defaultZ8-3333h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2I
5adder_block[0].single_adder/extended_num1_0_7_reg[14]2default:default2
FDCE2default:default2I
5adder_block[0].single_adder/extended_num1_0_7_reg[15]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[1].single_adder/extended_num1_0_7_reg[0]2default:default2
FDCE2default:default2H
4adder_block[1].single_adder/extended_num1_0_7_reg[1]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[1].single_adder/extended_num1_0_7_reg[1]2default:default2
FDCE2default:default2H
4adder_block[1].single_adder/extended_num1_0_7_reg[2]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[1].single_adder/extended_num1_0_7_reg[2]2default:default2
FDCE2default:default2H
4adder_block[1].single_adder/extended_num1_0_7_reg[3]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[1].single_adder/extended_num1_0_7_reg[3]2default:default2
FDCE2default:default2H
4adder_block[1].single_adder/extended_num1_0_7_reg[4]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[1].single_adder/extended_num1_0_7_reg[4]2default:default2
FDCE2default:default2H
4adder_block[1].single_adder/extended_num1_0_7_reg[5]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[1].single_adder/extended_num1_0_7_reg[5]2default:default2
FDCE2default:default2H
4adder_block[1].single_adder/extended_num1_0_7_reg[6]2default:defaultZ8-3886h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2J
6\adder_block[1].single_adder/extended_num1_0_7_reg[6] 2default:defaultZ8-3333h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2I
5adder_block[1].single_adder/extended_num1_0_7_reg[14]2default:default2
FDCE2default:default2I
5adder_block[1].single_adder/extended_num1_0_7_reg[15]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[2].single_adder/extended_num1_0_7_reg[0]2default:default2
FDCE2default:default2H
4adder_block[2].single_adder/extended_num1_0_7_reg[1]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[2].single_adder/extended_num1_0_7_reg[1]2default:default2
FDCE2default:default2H
4adder_block[2].single_adder/extended_num1_0_7_reg[2]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[2].single_adder/extended_num1_0_7_reg[2]2default:default2
FDCE2default:default2H
4adder_block[2].single_adder/extended_num1_0_7_reg[3]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[2].single_adder/extended_num1_0_7_reg[3]2default:default2
FDCE2default:default2H
4adder_block[2].single_adder/extended_num1_0_7_reg[4]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[2].single_adder/extended_num1_0_7_reg[4]2default:default2
FDCE2default:default2H
4adder_block[2].single_adder/extended_num1_0_7_reg[5]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[2].single_adder/extended_num1_0_7_reg[5]2default:default2
FDCE2default:default2H
4adder_block[2].single_adder/extended_num1_0_7_reg[6]2default:defaultZ8-3886h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2J
6\adder_block[2].single_adder/extended_num1_0_7_reg[6] 2default:defaultZ8-3333h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2I
5adder_block[2].single_adder/extended_num1_0_7_reg[14]2default:default2
FDCE2default:default2I
5adder_block[2].single_adder/extended_num1_0_7_reg[15]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[3].single_adder/extended_num1_0_7_reg[0]2default:default2
FDCE2default:default2H
4adder_block[3].single_adder/extended_num1_0_7_reg[1]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[3].single_adder/extended_num1_0_7_reg[1]2default:default2
FDCE2default:default2H
4adder_block[3].single_adder/extended_num1_0_7_reg[2]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[3].single_adder/extended_num1_0_7_reg[2]2default:default2
FDCE2default:default2H
4adder_block[3].single_adder/extended_num1_0_7_reg[3]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[3].single_adder/extended_num1_0_7_reg[3]2default:default2
FDCE2default:default2H
4adder_block[3].single_adder/extended_num1_0_7_reg[4]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[3].single_adder/extended_num1_0_7_reg[4]2default:default2
FDCE2default:default2H
4adder_block[3].single_adder/extended_num1_0_7_reg[5]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[3].single_adder/extended_num1_0_7_reg[5]2default:default2
FDCE2default:default2H
4adder_block[3].single_adder/extended_num1_0_7_reg[6]2default:defaultZ8-3886h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2J
6\adder_block[3].single_adder/extended_num1_0_7_reg[6] 2default:defaultZ8-3333h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2I
5adder_block[3].single_adder/extended_num1_0_7_reg[14]2default:default2
FDCE2default:default2I
5adder_block[3].single_adder/extended_num1_0_7_reg[15]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[4].single_adder/extended_num1_0_7_reg[0]2default:default2
FDCE2default:default2H
4adder_block[4].single_adder/extended_num1_0_7_reg[1]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[4].single_adder/extended_num1_0_7_reg[1]2default:default2
FDCE2default:default2H
4adder_block[4].single_adder/extended_num1_0_7_reg[2]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[4].single_adder/extended_num1_0_7_reg[2]2default:default2
FDCE2default:default2H
4adder_block[4].single_adder/extended_num1_0_7_reg[3]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[4].single_adder/extended_num1_0_7_reg[3]2default:default2
FDCE2default:default2H
4adder_block[4].single_adder/extended_num1_0_7_reg[4]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[4].single_adder/extended_num1_0_7_reg[4]2default:default2
FDCE2default:default2H
4adder_block[4].single_adder/extended_num1_0_7_reg[5]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[4].single_adder/extended_num1_0_7_reg[5]2default:default2
FDCE2default:default2H
4adder_block[4].single_adder/extended_num1_0_7_reg[6]2default:defaultZ8-3886h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2J
6\adder_block[4].single_adder/extended_num1_0_7_reg[6] 2default:defaultZ8-3333h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2I
5adder_block[4].single_adder/extended_num1_0_7_reg[14]2default:default2
FDCE2default:default2I
5adder_block[4].single_adder/extended_num1_0_7_reg[15]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[5].single_adder/extended_num1_0_7_reg[0]2default:default2
FDCE2default:default2H
4adder_block[5].single_adder/extended_num1_0_7_reg[1]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[5].single_adder/extended_num1_0_7_reg[1]2default:default2
FDCE2default:default2H
4adder_block[5].single_adder/extended_num1_0_7_reg[2]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[5].single_adder/extended_num1_0_7_reg[2]2default:default2
FDCE2default:default2H
4adder_block[5].single_adder/extended_num1_0_7_reg[3]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[5].single_adder/extended_num1_0_7_reg[3]2default:default2
FDCE2default:default2H
4adder_block[5].single_adder/extended_num1_0_7_reg[4]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[5].single_adder/extended_num1_0_7_reg[4]2default:default2
FDCE2default:default2H
4adder_block[5].single_adder/extended_num1_0_7_reg[5]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[5].single_adder/extended_num1_0_7_reg[5]2default:default2
FDCE2default:default2H
4adder_block[5].single_adder/extended_num1_0_7_reg[6]2default:defaultZ8-3886h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2J
6\adder_block[5].single_adder/extended_num1_0_7_reg[6] 2default:defaultZ8-3333h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2I
5adder_block[5].single_adder/extended_num1_0_7_reg[14]2default:default2
FDCE2default:default2I
5adder_block[5].single_adder/extended_num1_0_7_reg[15]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[6].single_adder/extended_num1_0_7_reg[0]2default:default2
FDCE2default:default2H
4adder_block[6].single_adder/extended_num1_0_7_reg[1]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[6].single_adder/extended_num1_0_7_reg[1]2default:default2
FDCE2default:default2H
4adder_block[6].single_adder/extended_num1_0_7_reg[2]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[6].single_adder/extended_num1_0_7_reg[2]2default:default2
FDCE2default:default2H
4adder_block[6].single_adder/extended_num1_0_7_reg[3]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[6].single_adder/extended_num1_0_7_reg[3]2default:default2
FDCE2default:default2H
4adder_block[6].single_adder/extended_num1_0_7_reg[4]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[6].single_adder/extended_num1_0_7_reg[4]2default:default2
FDCE2default:default2H
4adder_block[6].single_adder/extended_num1_0_7_reg[5]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[6].single_adder/extended_num1_0_7_reg[5]2default:default2
FDCE2default:default2H
4adder_block[6].single_adder/extended_num1_0_7_reg[6]2default:defaultZ8-3886h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2J
6\adder_block[6].single_adder/extended_num1_0_7_reg[6] 2default:defaultZ8-3333h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2I
5adder_block[6].single_adder/extended_num1_0_7_reg[14]2default:default2
FDCE2default:default2I
5adder_block[6].single_adder/extended_num1_0_7_reg[15]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[7].single_adder/extended_num1_0_7_reg[0]2default:default2
FDCE2default:default2H
4adder_block[7].single_adder/extended_num1_0_7_reg[1]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[7].single_adder/extended_num1_0_7_reg[1]2default:default2
FDCE2default:default2H
4adder_block[7].single_adder/extended_num1_0_7_reg[2]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[7].single_adder/extended_num1_0_7_reg[2]2default:default2
FDCE2default:default2H
4adder_block[7].single_adder/extended_num1_0_7_reg[3]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[7].single_adder/extended_num1_0_7_reg[3]2default:default2
FDCE2default:default2H
4adder_block[7].single_adder/extended_num1_0_7_reg[4]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[7].single_adder/extended_num1_0_7_reg[4]2default:default2
FDCE2default:default2H
4adder_block[7].single_adder/extended_num1_0_7_reg[5]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[7].single_adder/extended_num1_0_7_reg[5]2default:default2
FDCE2default:default2H
4adder_block[7].single_adder/extended_num1_0_7_reg[6]2default:defaultZ8-3886h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2J
6\adder_block[7].single_adder/extended_num1_0_7_reg[6] 2default:defaultZ8-3333h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2I
5adder_block[7].single_adder/extended_num1_0_7_reg[14]2default:default2
FDCE2default:default2I
5adder_block[7].single_adder/extended_num1_0_7_reg[15]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[8].single_adder/extended_num1_0_7_reg[0]2default:default2
FDCE2default:default2H
4adder_block[8].single_adder/extended_num1_0_7_reg[1]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[8].single_adder/extended_num1_0_7_reg[1]2default:default2
FDCE2default:default2H
4adder_block[8].single_adder/extended_num1_0_7_reg[2]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[8].single_adder/extended_num1_0_7_reg[2]2default:default2
FDCE2default:default2H
4adder_block[8].single_adder/extended_num1_0_7_reg[3]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[8].single_adder/extended_num1_0_7_reg[3]2default:default2
FDCE2default:default2H
4adder_block[8].single_adder/extended_num1_0_7_reg[4]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[8].single_adder/extended_num1_0_7_reg[4]2default:default2
FDCE2default:default2H
4adder_block[8].single_adder/extended_num1_0_7_reg[5]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[8].single_adder/extended_num1_0_7_reg[5]2default:default2
FDCE2default:default2H
4adder_block[8].single_adder/extended_num1_0_7_reg[6]2default:defaultZ8-3886h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2J
6\adder_block[8].single_adder/extended_num1_0_7_reg[6] 2default:defaultZ8-3333h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2I
5adder_block[8].single_adder/extended_num1_0_7_reg[14]2default:default2
FDCE2default:default2I
5adder_block[8].single_adder/extended_num1_0_7_reg[15]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[9].single_adder/extended_num1_0_7_reg[0]2default:default2
FDCE2default:default2H
4adder_block[9].single_adder/extended_num1_0_7_reg[1]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[9].single_adder/extended_num1_0_7_reg[1]2default:default2
FDCE2default:default2H
4adder_block[9].single_adder/extended_num1_0_7_reg[2]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[9].single_adder/extended_num1_0_7_reg[2]2default:default2
FDCE2default:default2H
4adder_block[9].single_adder/extended_num1_0_7_reg[3]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[9].single_adder/extended_num1_0_7_reg[3]2default:default2
FDCE2default:default2H
4adder_block[9].single_adder/extended_num1_0_7_reg[4]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[9].single_adder/extended_num1_0_7_reg[4]2default:default2
FDCE2default:default2H
4adder_block[9].single_adder/extended_num1_0_7_reg[5]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2H
4adder_block[9].single_adder/extended_num1_0_7_reg[5]2default:default2
FDCE2default:default2H
4adder_block[9].single_adder/extended_num1_0_7_reg[6]2default:defaultZ8-3886h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2J
6\adder_block[9].single_adder/extended_num1_0_7_reg[6] 2default:defaultZ8-3333h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2I
5adder_block[9].single_adder/extended_num1_0_7_reg[14]2default:default2
FDCE2default:default2I
5adder_block[9].single_adder/extended_num1_0_7_reg[15]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2I
5adder_block[10].single_adder/extended_num1_0_7_reg[0]2default:default2
FDCE2default:default2I
5adder_block[10].single_adder/extended_num1_0_7_reg[1]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2I
5adder_block[10].single_adder/extended_num1_0_7_reg[1]2default:default2
FDCE2default:default2I
5adder_block[10].single_adder/extended_num1_0_7_reg[2]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2I
5adder_block[10].single_adder/extended_num1_0_7_reg[2]2default:default2
FDCE2default:default2I
5adder_block[10].single_adder/extended_num1_0_7_reg[3]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2I
5adder_block[10].single_adder/extended_num1_0_7_reg[3]2default:default2
FDCE2default:default2I
5adder_block[10].single_adder/extended_num1_0_7_reg[4]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2I
5adder_block[10].single_adder/extended_num1_0_7_reg[4]2default:default2
FDCE2default:default2I
5adder_block[10].single_adder/extended_num1_0_7_reg[5]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2I
5adder_block[10].single_adder/extended_num1_0_7_reg[5]2default:default2
FDCE2default:default2I
5adder_block[10].single_adder/extended_num1_0_7_reg[6]2default:defaultZ8-3886h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2K
7\adder_block[10].single_adder/extended_num1_0_7_reg[6] 2default:defaultZ8-3333h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2J
6adder_block[10].single_adder/extended_num1_0_7_reg[14]2default:default2
FDCE2default:default2J
6adder_block[10].single_adder/extended_num1_0_7_reg[15]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2I
5adder_block[11].single_adder/extended_num1_0_7_reg[0]2default:default2
FDCE2default:default2I
5adder_block[11].single_adder/extended_num1_0_7_reg[1]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2I
5adder_block[11].single_adder/extended_num1_0_7_reg[1]2default:default2
FDCE2default:default2I
5adder_block[11].single_adder/extended_num1_0_7_reg[2]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2I
5adder_block[11].single_adder/extended_num1_0_7_reg[2]2default:default2
FDCE2default:default2I
5adder_block[11].single_adder/extended_num1_0_7_reg[3]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2I
5adder_block[11].single_adder/extended_num1_0_7_reg[3]2default:default2
FDCE2default:default2I
5adder_block[11].single_adder/extended_num1_0_7_reg[4]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2I
5adder_block[11].single_adder/extended_num1_0_7_reg[4]2default:default2
FDCE2default:default2I
5adder_block[11].single_adder/extended_num1_0_7_reg[5]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2I
5adder_block[11].single_adder/extended_num1_0_7_reg[5]2default:default2
FDCE2default:default2I
5adder_block[11].single_adder/extended_num1_0_7_reg[6]2default:defaultZ8-3886h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2K
7\adder_block[11].single_adder/extended_num1_0_7_reg[6] 2default:defaultZ8-3333h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2J
6adder_block[11].single_adder/extended_num1_0_7_reg[14]2default:default2
FDCE2default:default2J
6adder_block[11].single_adder/extended_num1_0_7_reg[15]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2I
5adder_block[12].single_adder/extended_num1_0_7_reg[0]2default:default2
FDCE2default:default2I
5adder_block[12].single_adder/extended_num1_0_7_reg[1]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2I
5adder_block[12].single_adder/extended_num1_0_7_reg[1]2default:default2
FDCE2default:default2I
5adder_block[12].single_adder/extended_num1_0_7_reg[2]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2I
5adder_block[12].single_adder/extended_num1_0_7_reg[2]2default:default2
FDCE2default:default2I
5adder_block[12].single_adder/extended_num1_0_7_reg[3]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2I
5adder_block[12].single_adder/extended_num1_0_7_reg[3]2default:default2
FDCE2default:default2I
5adder_block[12].single_adder/extended_num1_0_7_reg[4]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2I
5adder_block[12].single_adder/extended_num1_0_7_reg[4]2default:default2
FDCE2default:default2I
5adder_block[12].single_adder/extended_num1_0_7_reg[5]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2I
5adder_block[12].single_adder/extended_num1_0_7_reg[5]2default:default2
FDCE2default:default2I
5adder_block[12].single_adder/extended_num1_0_7_reg[6]2default:defaultZ8-3886h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2K
7\adder_block[12].single_adder/extended_num1_0_7_reg[6] 2default:defaultZ8-3333h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2J
6adder_block[12].single_adder/extended_num1_0_7_reg[14]2default:default2
FDCE2default:default2J
6adder_block[12].single_adder/extended_num1_0_7_reg[15]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2I
5adder_block[13].single_adder/extended_num1_0_7_reg[0]2default:default2
FDCE2default:default2I
5adder_block[13].single_adder/extended_num1_0_7_reg[1]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2I
5adder_block[13].single_adder/extended_num1_0_7_reg[1]2default:default2
FDCE2default:default2I
5adder_block[13].single_adder/extended_num1_0_7_reg[2]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2I
5adder_block[13].single_adder/extended_num1_0_7_reg[2]2default:default2
FDCE2default:default2I
5adder_block[13].single_adder/extended_num1_0_7_reg[3]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2I
5adder_block[13].single_adder/extended_num1_0_7_reg[3]2default:default2
FDCE2default:default2I
5adder_block[13].single_adder/extended_num1_0_7_reg[4]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2I
5adder_block[13].single_adder/extended_num1_0_7_reg[4]2default:default2
FDCE2default:default2I
5adder_block[13].single_adder/extended_num1_0_7_reg[5]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2I
5adder_block[13].single_adder/extended_num1_0_7_reg[5]2default:default2
FDCE2default:default2I
5adder_block[13].single_adder/extended_num1_0_7_reg[6]2default:defaultZ8-3886h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2K
7\adder_block[13].single_adder/extended_num1_0_7_reg[6] 2default:defaultZ8-3333h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2J
6adder_block[13].single_adder/extended_num1_0_7_reg[14]2default:default2
FDCE2default:default2J
6adder_block[13].single_adder/extended_num1_0_7_reg[15]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2I
5adder_block[14].single_adder/extended_num1_0_7_reg[0]2default:default2
FDCE2default:default2I
5adder_block[14].single_adder/extended_num1_0_7_reg[1]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2I
5adder_block[14].single_adder/extended_num1_0_7_reg[1]2default:default2
FDCE2default:default2I
5adder_block[14].single_adder/extended_num1_0_7_reg[2]2default:defaultZ8-3886h px� 
�
�Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2 
Synth 8-38862default:default2
1002default:defaultZ17-14h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2K
7\adder_block[14].single_adder/extended_num1_0_7_reg[6] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2K
7\adder_block[15].single_adder/extended_num1_0_7_reg[6] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2K
7\adder_block[16].single_adder/extended_num1_0_7_reg[6] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2K
7\adder_block[17].single_adder/extended_num1_0_7_reg[6] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2K
7\adder_block[18].single_adder/extended_num1_0_7_reg[6] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2K
7\adder_block[19].single_adder/extended_num1_0_7_reg[6] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2K
7\adder_block[20].single_adder/extended_num1_0_7_reg[6] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2K
7\adder_block[21].single_adder/extended_num1_0_7_reg[6] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2K
7\adder_block[22].single_adder/extended_num1_0_7_reg[6] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2K
7\adder_block[23].single_adder/extended_num1_0_7_reg[6] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2K
7\adder_block[24].single_adder/extended_num1_0_7_reg[6] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2K
7\adder_block[25].single_adder/extended_num1_0_7_reg[6] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2K
7\adder_block[26].single_adder/extended_num1_0_7_reg[6] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2K
7\adder_block[27].single_adder/extended_num1_0_7_reg[6] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2K
7\adder_block[28].single_adder/extended_num1_0_7_reg[6] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2K
7\adder_block[29].single_adder/extended_num1_0_7_reg[6] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2K
7\adder_block[30].single_adder/extended_num1_0_7_reg[6] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2K
7\adder_block[31].single_adder/extended_num1_0_7_reg[6] 2default:defaultZ8-3333h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:11 ; elapsed = 00:00:22 . Memory (MB): peak = 937.691 ; gain = 486.578
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
|Finished Timing Optimization : Time (s): cpu = 00:00:11 ; elapsed = 00:00:22 . Memory (MB): peak = 942.664 ; gain = 491.551
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
{Finished Technology Mapping : Time (s): cpu = 00:00:11 ; elapsed = 00:00:23 . Memory (MB): peak = 942.664 ; gain = 491.551
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
uFinished IO Insertion : Time (s): cpu = 00:00:14 ; elapsed = 00:00:32 . Memory (MB): peak = 944.664 ; gain = 493.551
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:14 ; elapsed = 00:00:32 . Memory (MB): peak = 944.664 ; gain = 493.551
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
D
%s
*synth2,

Report Check Netlist: 
2default:defaulth p
x
� 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
� 
u
%s
*synth2]
I|      |Item              |Errors |Warnings |Status |Description       |
2default:defaulth p
x
� 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
� 
u
%s
*synth2]
I|1     |multi_driven_nets |      0|        0|Passed |Multi driven nets |
2default:defaulth p
x
� 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:14 ; elapsed = 00:00:32 . Memory (MB): peak = 944.664 ; gain = 493.551
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:14 ; elapsed = 00:00:32 . Memory (MB): peak = 944.664 ; gain = 493.551
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:14 ; elapsed = 00:00:32 . Memory (MB): peak = 944.664 ; gain = 493.551
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:14 ; elapsed = 00:00:32 . Memory (MB): peak = 944.664 ; gain = 493.551
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
J
%s
*synth22
| |BlackBox name |Instances |
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px� 
D
%s*synth2,
+------+-------+------+
2default:defaulth px� 
D
%s*synth2,
|      |Cell   |Count |
2default:defaulth px� 
D
%s*synth2,
+------+-------+------+
2default:defaulth px� 
D
%s*synth2,
|1     |BUFG   |     1|
2default:defaulth px� 
D
%s*synth2,
|2     |CARRY4 |    96|
2default:defaulth px� 
D
%s*synth2,
|3     |LUT1   |     1|
2default:defaulth px� 
D
%s*synth2,
|4     |LUT2   |   353|
2default:defaulth px� 
D
%s*synth2,
|5     |LUT3   |    32|
2default:defaulth px� 
D
%s*synth2,
|6     |LUT4   |    64|
2default:defaulth px� 
D
%s*synth2,
|7     |LUT6   |     6|
2default:defaulth px� 
D
%s*synth2,
|8     |FDCE   |   864|
2default:defaulth px� 
D
%s*synth2,
|9     |FDPE   |    32|
2default:defaulth px� 
D
%s*synth2,
|10    |IBUF   |   771|
2default:defaulth px� 
D
%s*synth2,
|11    |OBUF   |   513|
2default:defaulth px� 
D
%s*synth2,
+------+-------+------+
2default:defaulth px� 
E
%s
*synth2-

Report Instance Areas: 
2default:defaulth p
x
� 
t
%s
*synth2\
H+------+---------------------------------+---------------------+------+
2default:defaulth p
x
� 
t
%s
*synth2\
H|      |Instance                         |Module               |Cells |
2default:defaulth p
x
� 
t
%s
*synth2\
H+------+---------------------------------+---------------------+------+
2default:defaulth p
x
� 
t
%s
*synth2\
H|1     |top                              |                     |  2733|
2default:defaulth p
x
� 
t
%s
*synth2\
H|2     |  \adder_block[0].single_adder   |fixed_point_adder    |    47|
2default:defaulth p
x
� 
t
%s
*synth2\
H|3     |  \adder_block[10].single_adder  |fixed_point_adder_0  |    46|
2default:defaulth p
x
� 
t
%s
*synth2\
H|4     |  \adder_block[11].single_adder  |fixed_point_adder_1  |    45|
2default:defaulth p
x
� 
t
%s
*synth2\
H|5     |  \adder_block[12].single_adder  |fixed_point_adder_2  |    45|
2default:defaulth p
x
� 
t
%s
*synth2\
H|6     |  \adder_block[13].single_adder  |fixed_point_adder_3  |    45|
2default:defaulth p
x
� 
t
%s
*synth2\
H|7     |  \adder_block[14].single_adder  |fixed_point_adder_4  |    45|
2default:defaulth p
x
� 
t
%s
*synth2\
H|8     |  \adder_block[15].single_adder  |fixed_point_adder_5  |    45|
2default:defaulth p
x
� 
t
%s
*synth2\
H|9     |  \adder_block[16].single_adder  |fixed_point_adder_6  |    46|
2default:defaulth p
x
� 
t
%s
*synth2\
H|10    |  \adder_block[17].single_adder  |fixed_point_adder_7  |    45|
2default:defaulth p
x
� 
t
%s
*synth2\
H|11    |  \adder_block[18].single_adder  |fixed_point_adder_8  |    45|
2default:defaulth p
x
� 
t
%s
*synth2\
H|12    |  \adder_block[19].single_adder  |fixed_point_adder_9  |    45|
2default:defaulth p
x
� 
t
%s
*synth2\
H|13    |  \adder_block[1].single_adder   |fixed_point_adder_10 |    45|
2default:defaulth p
x
� 
t
%s
*synth2\
H|14    |  \adder_block[20].single_adder  |fixed_point_adder_11 |    45|
2default:defaulth p
x
� 
t
%s
*synth2\
H|15    |  \adder_block[21].single_adder  |fixed_point_adder_12 |    45|
2default:defaulth p
x
� 
t
%s
*synth2\
H|16    |  \adder_block[22].single_adder  |fixed_point_adder_13 |    46|
2default:defaulth p
x
� 
t
%s
*synth2\
H|17    |  \adder_block[23].single_adder  |fixed_point_adder_14 |    45|
2default:defaulth p
x
� 
t
%s
*synth2\
H|18    |  \adder_block[24].single_adder  |fixed_point_adder_15 |    45|
2default:defaulth p
x
� 
t
%s
*synth2\
H|19    |  \adder_block[25].single_adder  |fixed_point_adder_16 |    45|
2default:defaulth p
x
� 
t
%s
*synth2\
H|20    |  \adder_block[26].single_adder  |fixed_point_adder_17 |    45|
2default:defaulth p
x
� 
t
%s
*synth2\
H|21    |  \adder_block[27].single_adder  |fixed_point_adder_18 |    45|
2default:defaulth p
x
� 
t
%s
*synth2\
H|22    |  \adder_block[28].single_adder  |fixed_point_adder_19 |    46|
2default:defaulth p
x
� 
t
%s
*synth2\
H|23    |  \adder_block[29].single_adder  |fixed_point_adder_20 |    45|
2default:defaulth p
x
� 
t
%s
*synth2\
H|24    |  \adder_block[2].single_adder   |fixed_point_adder_21 |    45|
2default:defaulth p
x
� 
t
%s
*synth2\
H|25    |  \adder_block[30].single_adder  |fixed_point_adder_22 |    45|
2default:defaulth p
x
� 
t
%s
*synth2\
H|26    |  \adder_block[31].single_adder  |fixed_point_adder_23 |    46|
2default:defaulth p
x
� 
t
%s
*synth2\
H|27    |  \adder_block[3].single_adder   |fixed_point_adder_24 |    45|
2default:defaulth p
x
� 
t
%s
*synth2\
H|28    |  \adder_block[4].single_adder   |fixed_point_adder_25 |    46|
2default:defaulth p
x
� 
t
%s
*synth2\
H|29    |  \adder_block[5].single_adder   |fixed_point_adder_26 |    45|
2default:defaulth p
x
� 
t
%s
*synth2\
H|30    |  \adder_block[6].single_adder   |fixed_point_adder_27 |    45|
2default:defaulth p
x
� 
t
%s
*synth2\
H|31    |  \adder_block[7].single_adder   |fixed_point_adder_28 |    45|
2default:defaulth p
x
� 
t
%s
*synth2\
H|32    |  \adder_block[8].single_adder   |fixed_point_adder_29 |    45|
2default:defaulth p
x
� 
t
%s
*synth2\
H|33    |  \adder_block[9].single_adder   |fixed_point_adder_30 |    45|
2default:defaulth p
x
� 
t
%s
*synth2\
H+------+---------------------------------+---------------------+------+
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:14 ; elapsed = 00:00:32 . Memory (MB): peak = 944.664 ; gain = 493.551
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
r
%s
*synth2Z
FSynthesis finished with 0 errors, 0 critical warnings and 0 warnings.
2default:defaulth p
x
� 
�
%s
*synth2�
~Synthesis Optimization Runtime : Time (s): cpu = 00:00:14 ; elapsed = 00:00:32 . Memory (MB): peak = 944.664 ; gain = 493.551
2default:defaulth p
x
� 
�
%s
*synth2�
Synthesis Optimization Complete : Time (s): cpu = 00:00:14 ; elapsed = 00:00:32 . Memory (MB): peak = 944.664 ; gain = 493.551
2default:defaulth p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0542default:default2
956.8052default:default2
0.0002default:defaultZ17-268h px� 
f
-Analyzing %s Unisim elements for replacement
17*netlist2
962default:defaultZ29-17h px� 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0012default:default2
1063.9222default:default2
0.0002default:defaultZ17-268h px� 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px� 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1482default:default2
02default:default2
02default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:00:182default:default2
00:00:422default:default2
1063.9222default:default2
637.6372default:defaultZ17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0022default:default2
1063.9222default:default2
0.0002default:defaultZ17-268h px� 
K
"No constraints selected for write.1103*constraintsZ18-5210h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2�
oD:/Desktop/Estimating-battery-SOC-using-neural-network-main/FPGA/LSTM/LSTM.runs/synth_2/fixed_full_adder_32.dcp2default:defaultZ17-1381h px� 
�
%s4*runtcl2�
|Executing : report_utilization -file fixed_full_adder_32_utilization_synth.rpt -pb fixed_full_adder_32_utilization_synth.pb
2default:defaulth px� 
�
Exiting %s at %s...
206*common2
Vivado2default:default2,
Sat May  4 17:33:45 20242default:defaultZ17-206h px� 


End Record