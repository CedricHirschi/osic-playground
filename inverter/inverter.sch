v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
N 0 0 0 20 {lab=out}
N -60 50 -40 50 {lab=in}
N -60 0 -60 50 {lab=in}
N -60 -50 -40 -50 {lab=in}
N -0 80 0 100 {lab=VSS}
N 0 -100 0 -80 {lab=VDD}
N 0 -50 100 -50 {lab=VDD}
N 100 -100 100 -50 {lab=VDD}
N 100 50 100 100 {lab=VSS}
N 0 50 100 50 {lab=VSS}
N -140 -0 -60 0 {lab=in}
N -60 -50 -60 0 {lab=in}
N 0 0 140 0 {lab=out}
N 0 -20 0 0 {lab=out}
C {sg13g2_pr/sg13_lv_nmos.sym} -20 50 0 0 {name=M1
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} -20 -50 0 0 {name=M2
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {lab_pin.sym} -140 0 0 0 {name=p1 sig_type=std_logic lab=in}
C {lab_pin.sym} 0 100 3 0 {name=p2 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 140 0 2 0 {name=p3 sig_type=std_logic lab=out}
C {lab_pin.sym} 100 100 3 0 {name=p4 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 100 -100 1 0 {name=p5 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 0 -100 1 0 {name=p6 sig_type=std_logic lab=VDD}
C {ipin.sym} -140 100 0 0 {name=p7 lab=in}
C {ipin.sym} -140 160 0 0 {name=p8 lab=VDD}
C {ipin.sym} -140 180 0 0 {name=p9 lab=VSS}
C {opin.sym} -140 130 2 0 {name=p10 lab=out}
