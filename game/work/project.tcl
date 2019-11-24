set projDir "/home/enyi/SUTD/compstruc/Mojo/projects/1D/game/work/planAhead"
set projName "game"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "/home/enyi/SUTD/compstruc/Mojo/projects/1D/game/work/verilog/mojo_top_0.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/game/work/verilog/reset_conditioner_1.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/game/work/verilog/button_conditioner_2.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/game/work/verilog/button_conditioner_2.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/game/work/verilog/button_conditioner_2.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/game/work/verilog/button_conditioner_2.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/game/work/verilog/button_conditioner_2.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/game/work/verilog/edge_detector_7.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/game/work/verilog/counter_8.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/game/work/verilog/counter_8.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/game/work/verilog/register_10.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/game/work/verilog/register_10.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/game/work/verilog/cpu_12.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/game/work/verilog/multi_seven_seg_13.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/game/work/verilog/randomSet_14.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/game/work/verilog/uart_tx_15.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/game/work/verilog/dig2to1_16.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/game/work/verilog/dig2to1_16.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/game/work/verilog/pipeline_18.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/game/work/verilog/pipeline_18.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/game/work/verilog/pipeline_18.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/game/work/verilog/pipeline_18.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/game/work/verilog/pipeline_18.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/game/work/verilog/decoder2_23.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/game/work/verilog/register_24.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/game/work/verilog/register_24.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/game/work/verilog/register_24.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/game/work/verilog/mux8_27.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/game/work/verilog/alu_28.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/game/work/verilog/counter_29.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/game/work/verilog/seven_seg_30.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/game/work/verilog/decoder_31.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/game/work/verilog/pn_gen_32.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/game/work/verilog/pn_gen_32.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/game/work/verilog/adder_34.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/game/work/verilog/comparator_35.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/game/work/verilog/shifter_36.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/game/work/verilog/boolean_37.v" "/home/enyi/SUTD/compstruc/Mojo/projects/1D/game/work/verilog/multiplier_38.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "/home/enyi/SUTD/compstruc/Mojo/projects/1D/game/constraint/io.ucf" "/home/enyi/SUTD/compstruc/Mojo/mojo-ide-B1.3.6-linux64/mojo-ide-B1.3.6/library/components/mojo.ucf"]
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
