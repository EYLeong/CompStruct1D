set projDir "/home/enyi/SUTD/compstruc/Mojo/projects/1D/alu/work/planAhead"
set projName "alu"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "/home/enyi/SUTD/compstruc/Mojo/projects/1D/alu/work/verilog/mojo_top_0.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/alu/work/verilog/reset_conditioner_1.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/alu/work/verilog/button_conditioner_2.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/alu/work/verilog/edge_detector_3.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/alu/work/verilog/button_conditioner_2.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/alu/work/verilog/edge_detector_3.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/alu/work/verilog/button_conditioner_2.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/alu/work/verilog/edge_detector_3.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/alu/work/verilog/button_conditioner_2.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/alu/work/verilog/edge_detector_3.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/alu/work/verilog/alutester_10.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/alu/work/verilog/alu_11.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/alu/work/verilog/alu_11.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/alu/work/verilog/pipeline_13.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/alu/work/verilog/pipeline_13.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/alu/work/verilog/pipeline_13.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/alu/work/verilog/pipeline_13.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/alu/work/verilog/counter_17.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/alu/work/verilog/adder_18.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/alu/work/verilog/comparator_19.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/alu/work/verilog/shifter_20.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/alu/work/verilog/boolean_21.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/alu/work/verilog/multiplier_22.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/alu/work/verilog/adder_18.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/alu/work/verilog/comparator_19.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/alu/work/verilog/shifter_20.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/alu/work/verilog/boolean_21.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/alu/work/verilog/multiplier_22.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "/home/enyi/SUTD/compstruc/Mojo/projects/1D/alu/constraint/io.ucf" "/home/enyi/SUTD/compstruc/Mojo/mojo-ide-B1.3.6-linux64/mojo-ide-B1.3.6/library/components/mojo.ucf"]
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
