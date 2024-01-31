transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/User/OneDrive/Desktop/FAX 2GOD/LPRS/LAB9_Zad1/FSM_game.vhd}

vcom -93 -work work {C:/Users/User/OneDrive/Desktop/FAX 2GOD/LPRS/LAB9_Zad1/simulation/modelsim/FSM_game_tb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  FSM_game_tb

add wave *
view structure
view signals
run 1 us
