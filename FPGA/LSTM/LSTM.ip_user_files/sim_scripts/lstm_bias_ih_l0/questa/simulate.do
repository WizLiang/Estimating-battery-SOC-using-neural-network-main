onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib lstm_bias_ih_l0_opt

do {wave.do}

view wave
view structure
view signals

do {lstm_bias_ih_l0.udo}

run -all

quit -force
