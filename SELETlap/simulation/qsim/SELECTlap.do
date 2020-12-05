onerror {quit -f}
vlib work
vlog -work work SELECTlap.vo
vlog -work work SELECTlap.vt
vsim -novopt -c -t 1ps -L cyclone_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.SELECTlap_vlg_vec_tst
vcd file -direction SELECTlap.msim.vcd
vcd add -internal SELECTlap_vlg_vec_tst/*
vcd add -internal SELECTlap_vlg_vec_tst/i1/*
add wave /*
run -all
