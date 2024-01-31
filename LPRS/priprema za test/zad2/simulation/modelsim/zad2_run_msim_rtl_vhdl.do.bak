transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/User/OneDrive/Desktop/FAX 2GOD/LPRS/priprema za test/zad2/zad2.vhdl}

vcom -93 -work work {C:/Users/User/OneDrive/Desktop/FAX 2GOD/LPRS/priprema za test/zad2/zad2_tb.vhdl}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  zad2_tb

add wave *
view structure
view signals
run 1 us
