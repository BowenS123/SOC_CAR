# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\vivado_pxlsoc\eval_speedsensor_ip\vitis\eval_speedsensor_ip\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\vivado_pxlsoc\eval_speedsensor_ip\vitis\eval_speedsensor_ip\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {eval_speedsensor_ip}\
-hw {C:\vivado_pxlsoc\eval_speedsensor_ip\eval_speedsensor_ip_v2.xsa}\
-out {C:/vivado_pxlsoc/eval_speedsensor_ip/vitis}

platform write
domain create -name {standalone_ps7_cortexa9_0} -display-name {standalone_ps7_cortexa9_0} -os {standalone} -proc {ps7_cortexa9_0} -runtime {cpp} -arch {32-bit} -support-app {hello_world}
platform generate -domains 
platform active {eval_speedsensor_ip}
domain active {zynq_fsbl}
domain active {standalone_ps7_cortexa9_0}
platform generate -quick
platform generate
platform active {eval_speedsensor_ip}
platform config -updatehw {C:/vivado_pxlsoc/eval_speedsensor_ip/eval_speedsensor_ip_v3.xsa}
platform generate
