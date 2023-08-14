<?xml version="1.0" encoding="UTF-8"?>
<MetaResultFile creator="Solver HFTD - Field 3DFD Monitor" version="20170330">
  <SpecialMaterials>
    <Background type="FIELDFREE"/>
    <Material name="air_0" type="FIELDFREE"/>
  </SpecialMaterials>
  <SimulationProperties dB_Amplitude="20" encoded_unit="&amp;U:A^1.:m^-1" fieldname="surface current (f=15) [1]" fieldtype="Surface current" frequency="15"/>
  <MetaGeometryFile filename="model.gex" lod="1"/>
  <ResultGroups num_steps="1" transformation="1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1">
    <SharedDataWith treepath="2D/3D Results\H-Field\h-field (f=15) [1]" rexname="h-field (f=15)_1,1_m3d.rex"/>
    <Frame index="0">
      <FieldResultFile filename="h-field (f=15)_1,1.m3d" type="m3d"/>
    </Frame>
  </ResultGroups>
  <ResultDataType complex="1" timedomain="0" vector="1"/>
  <SimulationDomain min="-5.995849132538 -5.995849132538 -5.995849132538" max="15.99584960938 15.99584960938 105.9958496094"/>
  <PlotSettings Plot="2" ignore_symmetry="0" deformation="0"/>
  <Source type="SOLVER"/>
</MetaResultFile>
