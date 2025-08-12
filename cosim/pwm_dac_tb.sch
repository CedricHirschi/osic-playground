v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 220 -660 1020 -260 {flags=graph
y1=0
y2=1.5
ypos1=-0.16411796
ypos2=1.0963808
divy=5
subdivy=1
unity=1
x1=0
x2=3e-05
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
dataset=-1
unitx=1
logx=0
logy=0
rawfile=$netlist_dir/pwm_dac_tb.raw
sim_type=tran
color="4 5 6"
node="clk
rst
set;set3,set2,set1,set0"
digital=1}
B 2 -580 -660 220 -260 {flags=graph
y1=-0.4
y2=1.6
ypos1=-0.5
ypos2=1.5
divy=5
subdivy=1
unity=1
x1=-3.2061565e-05
x2=4.6369689e-05
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
dataset=-1
unitx=1
logx=0
logy=0
rawfile=$netlist_dir/pwm_dac_tb.raw
sim_type=tran
color="4 5"
node="unfilt
out"
digital=0}
N 300 -40 300 -0 {lab=out}
N 260 -40 300 -40 {lab=out}
N 300 -40 340 -40 {lab=out}
N 120 -40 200 -40 {lab=unfilt}
N -80 20 -40 20 {lab=set[3..0]}
N -80 -20 -40 -20 {lab=rst}
N -80 -40 -40 -40 {lab=clk}
N -340 20 -340 40 {lab=clk}
N -280 20 -280 40 {lab=rst}
N -340 220 -340 240 {lab=VDD}
N -280 220 -280 240 {lab=VSS}
N 140 200 140 220 {lab=set3}
N 80 200 80 220 {lab=set2}
N 20 140 20 160 {lab=set1}
N -40 140 -40 160 {lab=set0}
C {res.sym} 230 -40 1 0 {name=R1
value=100k
footprint=1206
device=resistor
m=1}
C {capa.sym} 300 30 0 0 {name=C1
m=1
value=25.5p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 300 60 0 0 {name=l1 lab=GND}
C {lab_pin.sym} 340 -40 2 0 {name=p1 sig_type=std_logic lab=out}
C {lab_wire.sym} 180 -40 0 0 {name=p2 sig_type=std_logic lab=unfilt}
C {pwm_dac.sym} 40 0 0 0 {name=A1 model=pwm_dac
device_model=".model pwm_dac d_cosim simulation=\\"ivlng\\" sim_args=[\\"../pwm_dac\\"]"}
C {lab_pin.sym} -80 -40 0 0 {name=p3 sig_type=std_logic lab=clk}
C {lab_pin.sym} -80 -20 0 0 {name=p4 sig_type=std_logic lab=rst}
C {lab_pin.sym} -80 20 0 0 {name=p5 sig_type=std_logic lab=set[3..0]}
C {vsource.sym} -340 70 0 1 {name=V1 value="pulse(0 1.5 5n 0.2n 0.2n 5n 10n)" savecurrent=false}
C {vsource.sym} -280 70 0 0 {name=V2 value="pulse(1.5 0 0.75n 0.1n 0.1n 1n)" savecurrent=false}
C {gnd.sym} -280 100 0 0 {name=l2 lab=GND}
C {gnd.sym} -340 100 0 0 {name=l3 lab=GND}
C {lab_pin.sym} -340 20 1 0 {name=p6 sig_type=std_logic lab=clk}
C {lab_pin.sym} -280 20 1 0 {name=p7 sig_type=std_logic lab=rst}
C {vsource.sym} -340 270 0 1 {name=V3 value=1.5 savecurrent=false}
C {vsource.sym} -280 270 0 0 {name=V4 value=0 savecurrent=false}
C {gnd.sym} -280 300 0 0 {name=l4 lab=GND}
C {gnd.sym} -340 300 0 0 {name=l5 lab=GND}
C {lab_pin.sym} -340 220 1 0 {name=p8 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -280 220 1 0 {name=p9 sig_type=std_logic lab=VSS}
C {lab_pin.sym} -40 140 1 0 {name=p10 sig_type=std_logic lab=set0}
C {lab_pin.sym} 20 140 1 0 {name=p11 sig_type=std_logic lab=set1}
C {lab_pin.sym} 80 200 1 0 {name=p12 sig_type=std_logic lab=set2}
C {lab_pin.sym} 140 200 1 0 {name=p13 sig_type=std_logic lab=set3}
C {simulator_commands_shown.sym} 600 -90 0 0 {
name=Libs_Ngspice
simulator=ngspice
only_toplevel=false
value="
.lib cornerMOSlv.lib mos_tt
.lib cornerMOShv.lib mos_tt
.lib cornerHBT.lib hbt_typ
.lib cornerRES.lib res_typ
"
      }
C {devices/launcher.sym} -30 -220 0 0 {name=h3
descr="Load waves" 
tclcommand="
xschem raw_read $netlist_dir/[file rootname [file tail [xschem get current_name]]].raw tran
xschem setprop rect 2 0 fullxzoom
"
}
C {launcher.sym} 650 290 0 0 {name=h4
descr=SimulateNGSPICE
tclcommand="
# Setup the default simulation commands if not already set up
# for example by already launched simulations.
set_sim_defaults
puts $sim(spice,1,cmd) 

# Change the Xyce command. In the spice category there are currently
# 5 commands (0, 1, 2, 3, 4). Command 3 is the Xyce batch
# you can get the number by querying $sim(spice,n)
set sim(spice,1,cmd) \{ngspice  \\"$N\\" -a\}

# change the simulator to be used (Xyce)
set sim(spice,default) 0

# Create FET and BIP .save file
mkdir -p $netlist_dir
write_data [save_params] $netlist_dir/[file rootname [file tail [xschem get current_name]]].save

# run netlist and simulation
xschem netlist
simulate
"}
C {simulator_commands_shown.sym} 600 60 0 0 {name=SimulatorNGSPICE
simulator=ngspice
only_toplevel=false 
value="
.include pwm_dac_tb.save
.param temp=27
.param VCC=1.5
.control
save all
tran 10n 30u
write pwm_dac_tb.raw
.endc
"}
C {vsource.sym} -40 190 0 1 {name=V5 value=1.5 savecurrent=false}
C {gnd.sym} -40 220 0 0 {name=l6 lab=GND}
C {vsource.sym} 20 190 0 1 {name=V6 value=1.5 savecurrent=false}
C {gnd.sym} 20 220 0 0 {name=l7 lab=GND}
C {vsource.sym} 80 250 0 1 {name=V7 value="pulse(0 1.5 15u 0.2n 0.2n 15u 30u)" savecurrent=false}
C {gnd.sym} 80 280 0 0 {name=l8 lab=GND}
C {vsource.sym} 140 250 0 1 {name=V8 value=0 savecurrent=false}
C {gnd.sym} 140 280 0 0 {name=l9 lab=GND}
