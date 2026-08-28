vlog list.svh +incdir+C:/uvm-1.2/src
vsim -novopt -suppress 12110 tb \
-sv_lib C:/questasim64_10.7c/uvm-1.2/win64/uvm_dpi
run -all
