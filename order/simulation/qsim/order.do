onerror {quit -f}
vlib work
vlog -work work order.vo
vlog -work work order.vt
vsim -novopt -c -t 1ps -L cyclone_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.order_vlg_vec_tst
vcd file -direction order.msim.vcd
vcd add -internal order_vlg_vec_tst/*
vcd add -internal order_vlg_vec_tst/i1/*
add wave /*
run -all
