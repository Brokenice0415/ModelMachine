onerror {quit -f}
vlib work
vlog -work work CPUlap.vo
vlog -work work CPUlap.vt
vsim -novopt -c -t 1ps -L cyclone_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.CPUlap_vlg_vec_tst
vcd file -direction CPUlap.msim.vcd
vcd add -internal CPUlap_vlg_vec_tst/*
vcd add -internal CPUlap_vlg_vec_tst/i1/*
add wave /*
run -all
