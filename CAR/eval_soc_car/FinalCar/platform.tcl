# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\vivado_pxlsoc\eval_soc_car\FinalCar\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\vivado_pxlsoc\eval_soc_car\FinalCar\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {FinalCar}\
-hw {C:\vivado_pxlsoc\SOC_CAR\CAR\Final_Car\FinalCar.xsa}\
-out {C:/vivado_pxlsoc/eval_soc_car}

platform write
domain create -name {standalone_ps7_cortexa9_0} -display-name {standalone_ps7_cortexa9_0} -os {standalone} -proc {ps7_cortexa9_0} -runtime {cpp} -arch {32-bit} -support-app {hello_world}
platform generate -domains 
platform active {FinalCar}
domain active {zynq_fsbl}
domain active {standalone_ps7_cortexa9_0}
platform generate -quick
bsp reload
domain active {zynq_fsbl}
bsp reload
domain active {standalone_ps7_cortexa9_0}
bsp reload
platform clean
platform clean
platform clean
platform clean
platform clean
platform clean
platform generate
platform clean
platform generate
platform clean
platform generate
