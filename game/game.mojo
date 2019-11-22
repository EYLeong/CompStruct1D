<?xml version="1.0" encoding="UTF-8"?>
<project name="game" board="Mojo V3" language="Lucid">
  <files>
    <src>adder.luc</src>
    <src top="true">mojo_top.luc</src>
    <src>decoder2.luc</src>
    <src>alu.luc</src>
    <src>cpu.luc</src>
    <src>multiplier.luc</src>
    <src>register.luc</src>
    <src>boolean.luc</src>
    <src>comparator.luc</src>
    <src>mux8.luc</src>
    <src>shifter.luc</src>
    <ucf lib="true">mojo.ucf</ucf>
    <ucf>io.ucf</ucf>
    <component>pipeline.luc</component>
    <component>counter.luc</component>
    <component>button_conditioner.luc</component>
    <component>pn_gen.luc</component>
    <component>reset_conditioner.luc</component>
    <component>edge_detector.luc</component>
  </files>
</project>