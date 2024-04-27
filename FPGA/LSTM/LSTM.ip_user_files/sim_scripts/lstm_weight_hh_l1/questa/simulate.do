onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib lstm_weight_hh_l1_opt

do {wave.do}

view wave
view structure
view signals

do {lstm_weight_hh_l1.udo}

run -all

quit -force
