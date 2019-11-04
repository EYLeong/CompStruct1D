<?xml version="1.0" encoding="UTF-8"?>
<project name="alu" board="Mojo V3" language="Lucid">
  <files>
    <src>alutester.luc</src>
    <src>adder.luc</src>
    <src top="true">mojo_top.luc</src>
    <src>alu.luc</src>
    <src>multiplier.luc</src>
    <src>boolean.luc</src>
    <src>comparator.luc</src>
    <src>shifter.luc</src>
    <ucf lib="true">mojo.ucf</ucf>
    <ucf>io.ucf</ucf>
    <component>pipeline.luc</component>
    <component>counter.luc</component>
    <component>button_conditioner.luc</component>
    <component>reset_conditioner.luc</component>
    <component>edge_detector.luc</component>
  </files>
</project>
