set projDir "/home/enyi/SUTD/compstruc/Mojo/projects/alu/work/planAhead"
set projName "alu"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "/home/enyi/SUTD/compstruc/Mojo/projects/alu/work/verilog/mojo_top_0.v" "/home/enyi/SUTD/compstruc/Mojo/projects/alu/work/verilog/reset_conditioner_1.v" "/home/enyi/SUTD/compstruc/Mojo/projects/alu/work/verilog/button_conditioner_2.v" "/home/enyi/SUTD/compstruc/Mojo/projects/alu/work/verilog/edge_detector_3.v" "/home/enyi/SUTD/compstruc/Mojo/projects/alu/work/verilog/alutester_4.v" "/home/enyi/SUTD/compstruc/Mojo/projects/alu/work/verilog/alu_5.v" "/home/enyi/SUTD/compstruc/Mojo/projects/alu/work/verilog/pipeline_6.v" "/home/enyi/SUTD/compstruc/Mojo/projects/alu/work/verilog/counter_7.v" "/home/enyi/SUTD/compstruc/Mojo/projects/alu/work/verilog/adder_8.v" "/home/enyi/SUTD/compstruc/Mojo/projects/alu/work/verilog/comparator_9.v" "/home/enyi/SUTD/compstruc/Mojo/projects/alu/work/verilog/shifter_10.v" "/home/enyi/SUTD/compstruc/Mojo/projects/alu/work/verilog/boolean_11.v" "/home/enyi/SUTD/compstruc/Mojo/projects/alu/work/verilog/multiplier_12.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "/home/enyi/SUTD/compstruc/Mojo/projects/alu/constraint/io.ucf" "/home/enyi/SUTD/compstruc/Mojo/mojo-ide-B1.3.6-linux64/mojo-ide-B1.3.6/library/components/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1