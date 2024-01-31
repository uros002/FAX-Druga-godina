transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/User/OneDrive/Desktop/FAX 2GOD/LPRS/vezbe2/MyFirstDigitalSystem/MyFirstDigitalSystem.vhd}

vcom -93 -work work {C:/Users/User/OneDrive/Desktop/FAX 2GOD/LPRS/vezbe2/MyFirstDigitalSystem/simulation/modelsim/MyFirstDigitalSystem_tb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  MyFirstDigitalSystem_tb

add wave *
view structure
view signals
run -all
