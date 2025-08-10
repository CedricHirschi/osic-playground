v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 -380 -640 420 -240 {flags=graph
y1=0
y2=2
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=-1.1645778e-09
x2=1.1417994e-08
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
dataset=-1
unitx=1
logx=0
logy=0
rawfile=$netlist_dir/inverter_tb.raw
color="4 5"
node="in
out"}
N -340 180 -340 200 {lab=VSS}
N -280 180 -280 200 {lab=VDD}
N -220 180 -220 200 {lab=in}
N 280 180 280 200 {lab=out}
N -10 50 -10 70 {lab=VSS}
N -70 -0 -50 -0 {lab=in}
N -10 -70 -10 -50 {lab=VDD}
N 80 0 100 0 {lab=out}
C {inverter.sym} 10 0 0 0 {name=x1}
C {res.sym} 280 230 0 0 {name=R1
value=1Meg
footprint=1206
device=resistor
m=1}
C {vsource.sym} -340 230 0 0 {name=V1 value=0 savecurrent=false}
C {vsource.sym} -280 230 0 0 {name=V2 value=1.5 savecurrent=false}
C {vsource.sym} -220 230 0 0 {name=V3 value="pulse(0 1.5 1n 0.1n 0.1n 1n 2n)" savecurrent=false}
C {gnd.sym} -340 260 0 0 {name=l1 lab=GND}
C {gnd.sym} -280 260 0 0 {name=l2 lab=GND}
C {gnd.sym} -220 260 0 0 {name=l3 lab=GND}
C {gnd.sym} 280 260 0 0 {name=l4 lab=GND}
C {lab_pin.sym} -340 180 1 0 {name=p1 sig_type=std_logic lab=VSS}
C {lab_pin.sym} -280 180 1 0 {name=p2 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -220 180 1 0 {name=p3 sig_type=std_logic lab=in}
C {lab_pin.sym} 280 180 1 0 {name=p4 sig_type=std_logic lab=out
}
C {lab_pin.sym} 100 0 2 0 {name=p5 sig_type=std_logic lab=out
}
C {lab_pin.sym} -70 0 0 0 {name=p6 sig_type=std_logic lab=in}
C {lab_pin.sym} -10 -70 1 0 {name=p7 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -10 70 3 0 {name=p8 sig_type=std_logic lab=VSS}
C {simulator_commands_shown.sym} 480 -140 0 0 {
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
C {launcher.sym} 520 220 0 0 {name=h4
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
C {simulator_commands_shown.sym} 480 10 0 0 {name=SimulatorNGSPICE
simulator=ngspice
only_toplevel=false 
value="
.include inverter_tb.save
.param temp=27
.control
save all
tran 50p 10n
write inverter_tb.raw
.endc
"}
C {launcher.sym} -320 -200 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/inverter_tb.raw tran"
}
