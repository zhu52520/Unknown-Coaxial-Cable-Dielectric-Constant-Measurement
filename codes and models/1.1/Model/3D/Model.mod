'# MWS Version: Version 2020.0 - Sep 25 2019 - ACIS 29.0.1 -

'# length = mm
'# frequency = GHz
'# time = ns
'# frequency range: fmin = 0.5 fmax = 15
'# created = '[VERSION]2020.0|29.0.1|20190925[/VERSION]


'@ use template: Antenna - Waveguide.cfg

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
'set the units
With Units
    .Geometry "mm"
    .Frequency "GHz"
    .Voltage "V"
    .Resistance "Ohm"
    .Inductance "H"
    .TemperatureUnit  "Kelvin"
    .Time "ns"
    .Current "A"
    .Conductance "Siemens"
    .Capacitance "F"
End With
'----------------------------------------------------------------------------
Plot.DrawBox True
With Background
     .Type "Normal"
     .Epsilon "1.0"
     .Mu "1.0"
     .XminSpace "0.0"
     .XmaxSpace "0.0"
     .YminSpace "0.0"
     .YmaxSpace "0.0"
     .ZminSpace "0.0"
     .ZmaxSpace "0.0"
End With
With Boundary
     .Xmin "expanded open"
     .Xmax "expanded open"
     .Ymin "expanded open"
     .Ymax "expanded open"
     .Zmin "expanded open"
     .Zmax "expanded open"
     .Xsymmetry "none"
     .Ysymmetry "none"
     .Zsymmetry "none"
End With
' switch on FD-TET setting for accurate farfields
FDSolver.ExtrudeOpenBC "True"
Mesh.FPBAAvoidNonRegUnite "True"
Mesh.ConsiderSpaceForLowerMeshLimit "False"
Mesh.MinimumStepNumber "5"
With MeshSettings
     .SetMeshType "Hex"
     .Set "RatioLimitGeometry", "20"
End With
With MeshSettings
     .SetMeshType "HexTLM"
     .Set "RatioLimitGeometry", "20"
End With
PostProcess1D.ActivateOperation "vswr", "true"
PostProcess1D.ActivateOperation "yz-matrices", "true"
With FarfieldPlot
	.ClearCuts ' lateral=phi, polar=theta
	.AddCut "lateral", "0", "1"
	.AddCut "lateral", "90", "1"
	.AddCut "polar", "90", "1"
End With
'----------------------------------------------------------------------------
With MeshSettings
     .SetMeshType "Hex"
     .Set "Version", 1%
End With
With Mesh
     .MeshType "PBA"
End With
'set the solver type
ChangeSolverType("HF Time Domain")
'----------------------------------------------------------------------------

'@ new component: component1

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Component.New "component1"

'@ define cylinder: component1:solid1

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Cylinder 
     .Reset 
     .Name "solid1" 
     .Component "component1" 
     .Material "PEC" 
     .OuterRadius "5.5" 
     .InnerRadius "5" 
     .Axis "z" 
     .Zrange "0", "122" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With

'@ define material: material1

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Material 
     .Reset 
     .Name "material1"
     .Folder ""
     .Rho "0.0"
     .ThermalType "Normal"
     .ThermalConductivity "0"
     .SpecificHeat "0", "J/K/kg"
     .DynamicViscosity "0"
     .Emissivity "0"
     .MetabolicRate "0.0"
     .VoxelConvection "0.0"
     .BloodFlow "0"
     .MechanicsType "Unused"
     .FrqType "all"
     .Type "Normal"
     .MaterialUnit "Frequency", "GHz"
     .MaterialUnit "Geometry", "mm"
     .MaterialUnit "Time", "ns"
     .MaterialUnit "Temperature", "Kelvin"
     .Epsilon "2"
     .Mu "1"
     .Sigma "0"
     .TanD "0.0"
     .TanDFreq "0.0"
     .TanDGiven "False"
     .TanDModel "ConstTanD"
     .EnableUserConstTanDModelOrderEps "False"
     .ConstTanDModelOrderEps "1"
     .SetElParametricConductivity "False"
     .ReferenceCoordSystem "Global"
     .CoordSystemType "Cartesian"
     .SigmaM "0"
     .TanDM "0.0"
     .TanDMFreq "0.0"
     .TanDMGiven "False"
     .TanDMModel "ConstTanD"
     .EnableUserConstTanDModelOrderMu "False"
     .ConstTanDModelOrderMu "1"
     .SetMagParametricConductivity "False"
     .DispModelEps  "None"
     .DispModelMu "None"
     .DispersiveFittingSchemeEps "Nth Order"
     .MaximalOrderNthModelFitEps "10"
     .ErrorLimitNthModelFitEps "0.1"
     .UseOnlyDataInSimFreqRangeNthModelEps "False"
     .DispersiveFittingSchemeMu "Nth Order"
     .MaximalOrderNthModelFitMu "10"
     .ErrorLimitNthModelFitMu "0.1"
     .UseOnlyDataInSimFreqRangeNthModelMu "False"
     .UseGeneralDispersionEps "False"
     .UseGeneralDispersionMu "False"
     .NLAnisotropy "False"
     .NLAStackingFactor "1"
     .NLADirectionX "1"
     .NLADirectionY "0"
     .NLADirectionZ "0"
     .Colour "0", "1", "1" 
     .Wireframe "False" 
     .Reflection "False" 
     .Allowoutline "True" 
     .Transparentoutline "False" 
     .Transparency "0" 
     .Create
End With

'@ define cylinder: component1:solid2

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Cylinder 
     .Reset 
     .Name "solid2" 
     .Component "component1" 
     .Material "material1" 
     .OuterRadius "5" 
     .InnerRadius "2" 
     .Axis "z" 
     .Zrange "0", "50" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With

'@ define cylinder: component1:solid3

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Cylinder 
     .Reset 
     .Name "solid3" 
     .Component "component1" 
     .Material "material1" 
     .OuterRadius "5" 
     .InnerRadius "2" 
     .Axis "z" 
     .Zrange "72", "122" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With

'@ define material: material2

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Material 
     .Reset 
     .Name "material2"
     .Folder ""
     .Rho "0.0"
     .ThermalType "Normal"
     .ThermalConductivity "0"
     .SpecificHeat "0", "J/K/kg"
     .DynamicViscosity "0"
     .Emissivity "0"
     .MetabolicRate "0.0"
     .VoxelConvection "0.0"
     .BloodFlow "0"
     .MechanicsType "Unused"
     .FrqType "all"
     .Type "Normal"
     .MaterialUnit "Frequency", "GHz"
     .MaterialUnit "Geometry", "mm"
     .MaterialUnit "Time", "ns"
     .MaterialUnit "Temperature", "Kelvin"
     .Epsilon "3.5"
     .Mu "1"
     .Sigma "0"
     .TanD "0.0"
     .TanDFreq "0.0"
     .TanDGiven "False"
     .TanDModel "ConstTanD"
     .EnableUserConstTanDModelOrderEps "False"
     .ConstTanDModelOrderEps "1"
     .SetElParametricConductivity "False"
     .ReferenceCoordSystem "Global"
     .CoordSystemType "Cartesian"
     .SigmaM "0"
     .TanDM "0.0"
     .TanDMFreq "0.0"
     .TanDMGiven "False"
     .TanDMModel "ConstTanD"
     .EnableUserConstTanDModelOrderMu "False"
     .ConstTanDModelOrderMu "1"
     .SetMagParametricConductivity "False"
     .DispModelEps  "None"
     .DispModelMu "None"
     .DispersiveFittingSchemeEps "Nth Order"
     .MaximalOrderNthModelFitEps "10"
     .ErrorLimitNthModelFitEps "0.1"
     .UseOnlyDataInSimFreqRangeNthModelEps "False"
     .DispersiveFittingSchemeMu "Nth Order"
     .MaximalOrderNthModelFitMu "10"
     .ErrorLimitNthModelFitMu "0.1"
     .UseOnlyDataInSimFreqRangeNthModelMu "False"
     .UseGeneralDispersionEps "False"
     .UseGeneralDispersionMu "False"
     .NLAnisotropy "False"
     .NLAStackingFactor "1"
     .NLADirectionX "1"
     .NLADirectionY "0"
     .NLADirectionZ "0"
     .Colour "0", "1", "1" 
     .Wireframe "False" 
     .Reflection "False" 
     .Allowoutline "True" 
     .Transparentoutline "False" 
     .Transparency "0" 
     .Create
End With

'@ define cylinder: component1:solid4

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Cylinder 
     .Reset 
     .Name "solid4" 
     .Component "component1" 
     .Material "material2" 
     .OuterRadius "5" 
     .InnerRadius "2" 
     .Axis "z" 
     .Zrange "50", "72" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With

'@ define cylinder: component1:solid5

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Cylinder 
     .Reset 
     .Name "solid5" 
     .Component "component1" 
     .Material "PEC" 
     .OuterRadius "2" 
     .InnerRadius "0.0" 
     .Axis "z" 
     .Zrange "0", "122" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With

'@ pick face

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Pick.PickFaceFromId "component1:solid3", "3"

'@ define port: 1

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Port 
     .Reset 
     .PortNumber "1" 
     .Label "" 
     .Folder "" 
     .NumberOfModes "1" 
     .AdjustPolarization "False" 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .TextMaxLimit "0" 
     .Coordinates "Picks" 
     .Orientation "positive" 
     .PortOnBound "True" 
     .ClipPickedPortToBound "False" 
     .Xrange "-5", "5" 
     .Yrange "-5", "5" 
     .Zrange "122", "122" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .WaveguideMonitor "False" 
     .Create 
End With

'@ pick face

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Pick.PickFaceFromId "component1:solid2", "1"

'@ define port: 2

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Port 
     .Reset 
     .PortNumber "2" 
     .Label "" 
     .Folder "" 
     .NumberOfModes "1" 
     .AdjustPolarization "False" 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .TextMaxLimit "0" 
     .Coordinates "Picks" 
     .Orientation "positive" 
     .PortOnBound "True" 
     .ClipPickedPortToBound "False" 
     .Xrange "-5", "5" 
     .Yrange "-5", "5" 
     .Zrange "0", "0" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .WaveguideMonitor "False" 
     .Create 
End With

'@ delete shape: component1:solid4

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Solid.Delete "component1:solid4"

'@ define material: material3

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Material 
     .Reset 
     .Name "material3"
     .Folder ""
     .Rho "0.0"
     .ThermalType "Normal"
     .ThermalConductivity "0"
     .SpecificHeat "0", "J/K/kg"
     .DynamicViscosity "0"
     .Emissivity "0"
     .MetabolicRate "0.0"
     .VoxelConvection "0.0"
     .BloodFlow "0"
     .MechanicsType "Unused"
     .FrqType "all"
     .Type "Normal"
     .MaterialUnit "Frequency", "GHz"
     .MaterialUnit "Geometry", "mm"
     .MaterialUnit "Time", "ns"
     .MaterialUnit "Temperature", "Kelvin"
     .Epsilon "5.2"
     .Mu "1"
     .Sigma "0"
     .TanD "0.0"
     .TanDFreq "0.0"
     .TanDGiven "False"
     .TanDModel "ConstTanD"
     .EnableUserConstTanDModelOrderEps "False"
     .ConstTanDModelOrderEps "1"
     .SetElParametricConductivity "False"
     .ReferenceCoordSystem "Global"
     .CoordSystemType "Cartesian"
     .SigmaM "0"
     .TanDM "0.0"
     .TanDMFreq "0.0"
     .TanDMGiven "False"
     .TanDMModel "ConstTanD"
     .EnableUserConstTanDModelOrderMu "False"
     .ConstTanDModelOrderMu "1"
     .SetMagParametricConductivity "False"
     .DispModelEps  "None"
     .DispModelMu "None"
     .DispersiveFittingSchemeEps "Nth Order"
     .MaximalOrderNthModelFitEps "10"
     .ErrorLimitNthModelFitEps "0.1"
     .UseOnlyDataInSimFreqRangeNthModelEps "False"
     .DispersiveFittingSchemeMu "Nth Order"
     .MaximalOrderNthModelFitMu "10"
     .ErrorLimitNthModelFitMu "0.1"
     .UseOnlyDataInSimFreqRangeNthModelMu "False"
     .UseGeneralDispersionEps "False"
     .UseGeneralDispersionMu "False"
     .NLAnisotropy "False"
     .NLAStackingFactor "1"
     .NLADirectionX "1"
     .NLADirectionY "0"
     .NLADirectionZ "0"
     .Colour "0", "0.501961", "1" 
     .Wireframe "False" 
     .Reflection "False" 
     .Allowoutline "True" 
     .Transparentoutline "False" 
     .Transparency "0" 
     .Create
End With

'@ define cylinder: component1:solid6

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Cylinder 
     .Reset 
     .Name "solid6" 
     .Component "component1" 
     .Material "material3" 
     .OuterRadius "5" 
     .InnerRadius "2" 
     .Axis "z" 
     .Zrange "50", "72" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With

'@ define monitor: e-field (f=3.5)

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Monitor 
     .Reset 
     .Name "e-field (f=3.5)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Efield" 
     .MonitorValue "3.5" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-5.2", "5.2", "-5.2", "5.2", "0", "122" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .Create 
End With

'@ define monitor: h-field (f=3.5)

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Monitor 
     .Reset 
     .Name "h-field (f=3.5)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Hfield" 
     .MonitorValue "3.5" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-5.2", "5.2", "-5.2", "5.2", "0", "122" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .Create 
End With

'@ define frequency range

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Solver.FrequencyRange "0.0", "20"

'@ define time domain solver parameters

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Mesh.SetCreator "High Frequency" 
With Solver 
     .Method "Hexahedral"
     .CalculationType "TD-S"
     .StimulationPort "All"
     .StimulationMode "All"
     .SteadyStateLimit "-40"
     .MeshAdaption "False"
     .AutoNormImpedance "False"
     .NormingImpedance "50"
     .CalculateModesOnly "False"
     .SParaSymmetry "False"
     .StoreTDResultsInCache  "False"
     .FullDeembedding "False"
     .SuperimposePLWExcitation "False"
     .UseSensitivityAnalysis "False"
End With

'@ set PBA version

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Discretizer.PBAVersion "2019092520"

'@ delete port: port1

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Port.Delete "1"

'@ delete port: port2

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Port.Delete "2"

'@ pick face

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Pick.PickFaceFromId "component1:solid1", "3"

'@ define port: 1

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Port 
     .Reset 
     .PortNumber "1" 
     .Label "" 
     .Folder "" 
     .NumberOfModes "1" 
     .AdjustPolarization "False" 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .TextMaxLimit "0" 
     .Coordinates "Picks" 
     .Orientation "positive" 
     .PortOnBound "False" 
     .ClipPickedPortToBound "False" 
     .Xrange "-5.5", "5.5" 
     .Yrange "-5.5", "5.5" 
     .Zrange "122", "122" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .WaveguideMonitor "False" 
     .Create 
End With

'@ pick face

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Pick.PickFaceFromId "component1:solid1", "1"

'@ define port: 2

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Port 
     .Reset 
     .PortNumber "2" 
     .Label "" 
     .Folder "" 
     .NumberOfModes "1" 
     .AdjustPolarization "False" 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .TextMaxLimit "0" 
     .Coordinates "Picks" 
     .Orientation "positive" 
     .PortOnBound "False" 
     .ClipPickedPortToBound "False" 
     .Xrange "-5.5", "5.5" 
     .Yrange "-5.5", "5.5" 
     .Zrange "0", "0" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .WaveguideMonitor "False" 
     .Create 
End With

'@ define frequency range

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Solver.FrequencyRange "1", "10"

'@ delete material: material2

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Material.Delete "material2"

'@ define material: material1

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Material 
     .Reset 
     .Name "material1"
     .Folder ""
     .Rho "0.0"
     .ThermalType "Normal"
     .ThermalConductivity "0"
     .SpecificHeat "0", "J/K/kg"
     .DynamicViscosity "0"
     .Emissivity "0"
     .MetabolicRate "0.0"
     .VoxelConvection "0.0"
     .BloodFlow "0"
     .MechanicsType "Unused"
     .FrqType "all"
     .Type "Normal"
     .MaterialUnit "Frequency", "GHz"
     .MaterialUnit "Geometry", "mm"
     .MaterialUnit "Time", "ns"
     .MaterialUnit "Temperature", "Kelvin"
     .Epsilon "1"
     .Mu "1"
     .Sigma "0"
     .TanD "0.0"
     .TanDFreq "0.0"
     .TanDGiven "False"
     .TanDModel "ConstTanD"
     .EnableUserConstTanDModelOrderEps "False"
     .ConstTanDModelOrderEps "1"
     .SetElParametricConductivity "False"
     .ReferenceCoordSystem "Global"
     .CoordSystemType "Cartesian"
     .SigmaM "0"
     .TanDM "0.0"
     .TanDMFreq "0.0"
     .TanDMGiven "False"
     .TanDMModel "ConstTanD"
     .EnableUserConstTanDModelOrderMu "False"
     .ConstTanDModelOrderMu "1"
     .SetMagParametricConductivity "False"
     .DispModelEps  "None"
     .DispModelMu "None"
     .DispersiveFittingSchemeEps "Nth Order"
     .MaximalOrderNthModelFitEps "10"
     .ErrorLimitNthModelFitEps "0.1"
     .UseOnlyDataInSimFreqRangeNthModelEps "False"
     .DispersiveFittingSchemeMu "Nth Order"
     .MaximalOrderNthModelFitMu "10"
     .ErrorLimitNthModelFitMu "0.1"
     .UseOnlyDataInSimFreqRangeNthModelMu "False"
     .UseGeneralDispersionEps "False"
     .UseGeneralDispersionMu "False"
     .NLAnisotropy "False"
     .NLAStackingFactor "1"
     .NLADirectionX "1"
     .NLADirectionY "0"
     .NLADirectionZ "0"
     .Colour "0", "1", "1" 
     .Wireframe "False" 
     .Reflection "False" 
     .Allowoutline "True" 
     .Transparentoutline "False" 
     .Transparency "0" 
     .Create
End With

'@ define boundaries

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Boundary
     .Xmin "electric"
     .Xmax "electric"
     .Ymin "electric"
     .Ymax "electric"
     .Zmin "electric"
     .Zmax "electric"
     .Xsymmetry "none"
     .Ysymmetry "none"
     .Zsymmetry "none"
     .ApplyInAllDirections "False"
End With

'@ define time domain solver parameters

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Mesh.SetCreator "High Frequency" 
With Solver 
     .Method "Hexahedral"
     .CalculationType "TD-S"
     .StimulationPort "1"
     .StimulationMode "1"
     .SteadyStateLimit "-40"
     .MeshAdaption "False"
     .CalculateModesOnly "False"
     .SParaSymmetry "False"
     .StoreTDResultsInCache  "False"
     .FullDeembedding "False"
     .SuperimposePLWExcitation "False"
     .UseSensitivityAnalysis "False"
End With

'@ define background

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Background 
     .ResetBackground 
     .XminSpace "0.0" 
     .XmaxSpace "0.0" 
     .YminSpace "0.0" 
     .YmaxSpace "0.0" 
     .ZminSpace "0.0" 
     .ZmaxSpace "0.0" 
     .ApplyInAllDirections "False" 
End With 
With Material 
     .Reset 
     .Rho "0.0"
     .ThermalType "Normal"
     .ThermalConductivity "0"
     .SpecificHeat "0", "J/K/kg"
     .DynamicViscosity "0"
     .Emissivity "0"
     .MetabolicRate "0.0"
     .VoxelConvection "0.0"
     .BloodFlow "0"
     .MechanicsType "Unused"
     .FrqType "all"
     .Type "Pec"
     .MaterialUnit "Frequency", "Hz"
     .MaterialUnit "Geometry", "m"
     .MaterialUnit "Time", "s"
     .MaterialUnit "Temperature", "Kelvin"
     .Epsilon "1.0"
     .Mu "1.0"
     .ReferenceCoordSystem "Global"
     .CoordSystemType "Cartesian"
     .NLAnisotropy "False"
     .NLAStackingFactor "1"
     .NLADirectionX "1"
     .NLADirectionY "0"
     .NLADirectionZ "0"
     .Colour "0.6", "0.6", "0.6" 
     .Wireframe "False" 
     .Reflection "False" 
     .Allowoutline "True" 
     .Transparentoutline "False" 
     .Transparency "0" 
     .ChangeBackgroundMaterial
End With

'@ define time domain solver parameters

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Mesh.SetCreator "High Frequency" 
With Solver 
     .Method "Hexahedral"
     .CalculationType "TD-S"
     .StimulationPort "All"
     .StimulationMode "All"
     .SteadyStateLimit "-40"
     .MeshAdaption "False"
     .AutoNormImpedance "False"
     .NormingImpedance "50"
     .CalculateModesOnly "False"
     .SParaSymmetry "False"
     .StoreTDResultsInCache  "False"
     .FullDeembedding "False"
     .SuperimposePLWExcitation "False"
     .UseSensitivityAnalysis "False"
End With

'@ define frequency range

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Solver.FrequencyRange "3", "4"

'@ boolean add shapes: component1:solid1, component1:solid5

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Solid.Add "component1:solid1", "component1:solid5"

'@ boolean add shapes: component1:solid2, component1:solid3

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Solid.Add "component1:solid2", "component1:solid3"

'@ boolean add shapes: component1:solid2, component1:solid6

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Solid.Add "component1:solid2", "component1:solid6"

'@ delete shape: component1:solid1

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Solid.Delete "component1:solid1"

'@ define frequency range

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Solver.FrequencyRange "1", "10"

'@ delete monitor: h-field (f=3.5)

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Monitor.Delete "h-field (f=3.5)"

'@ define material: material3

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Material 
     .Reset 
     .Name "material3"
     .Folder ""
     .Rho "0.0"
     .ThermalType "Normal"
     .ThermalConductivity "0"
     .SpecificHeat "0", "J/K/kg"
     .DynamicViscosity "0"
     .Emissivity "0"
     .MetabolicRate "0.0"
     .VoxelConvection "0.0"
     .BloodFlow "0"
     .MechanicsType "Unused"
     .FrqType "all"
     .Type "Normal"
     .MaterialUnit "Frequency", "GHz"
     .MaterialUnit "Geometry", "mm"
     .MaterialUnit "Time", "ns"
     .MaterialUnit "Temperature", "Kelvin"
     .Epsilon "100"
     .Mu "1"
     .Sigma "0"
     .TanD "0.0"
     .TanDFreq "0.0"
     .TanDGiven "False"
     .TanDModel "ConstTanD"
     .EnableUserConstTanDModelOrderEps "False"
     .ConstTanDModelOrderEps "1"
     .SetElParametricConductivity "False"
     .ReferenceCoordSystem "Global"
     .CoordSystemType "Cartesian"
     .SigmaM "0"
     .TanDM "0.0"
     .TanDMFreq "0.0"
     .TanDMGiven "False"
     .TanDMModel "ConstTanD"
     .EnableUserConstTanDModelOrderMu "False"
     .ConstTanDModelOrderMu "1"
     .SetMagParametricConductivity "False"
     .DispModelEps  "None"
     .DispModelMu "None"
     .DispersiveFittingSchemeEps "Nth Order"
     .MaximalOrderNthModelFitEps "10"
     .ErrorLimitNthModelFitEps "0.1"
     .UseOnlyDataInSimFreqRangeNthModelEps "False"
     .DispersiveFittingSchemeMu "Nth Order"
     .MaximalOrderNthModelFitMu "10"
     .ErrorLimitNthModelFitMu "0.1"
     .UseOnlyDataInSimFreqRangeNthModelMu "False"
     .UseGeneralDispersionEps "False"
     .UseGeneralDispersionMu "False"
     .NLAnisotropy "False"
     .NLAStackingFactor "1"
     .NLADirectionX "1"
     .NLADirectionY "0"
     .NLADirectionZ "0"
     .Colour "0", "0.501961", "1" 
     .Wireframe "False" 
     .Reflection "False" 
     .Allowoutline "True" 
     .Transparentoutline "False" 
     .Transparency "0" 
     .Create
End With

'@ define time domain solver parameters

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Mesh.SetCreator "High Frequency" 
With Solver 
     .Method "Hexahedral"
     .CalculationType "TD-S"
     .StimulationPort "All"
     .StimulationMode "All"
     .SteadyStateLimit "-30"
     .MeshAdaption "False"
     .AutoNormImpedance "False"
     .NormingImpedance "50"
     .CalculateModesOnly "False"
     .SParaSymmetry "False"
     .StoreTDResultsInCache  "False"
     .FullDeembedding "False"
     .SuperimposePLWExcitation "False"
     .UseSensitivityAnalysis "False"
End With

'@ delete shape: component1:solid2

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Solid.Delete "component1:solid2"

'@ delete monitor: e-field (f=3.5)

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Monitor.Delete "e-field (f=3.5)"

'@ delete port: port2

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Port.Delete "2"

'@ delete port: port1

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Port.Delete "1"

'@ define cylinder: component1:solid1

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Cylinder 
     .Reset 
     .Name "solid1" 
     .Component "component1" 
     .Material "material1" 
     .OuterRadius "3" 
     .InnerRadius "2" 
     .Axis "z" 
     .Zrange "0", "2" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With

'@ define cylinder: component1:solid2

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Cylinder 
     .Reset 
     .Name "solid2" 
     .Component "component1" 
     .Material "material1" 
     .OuterRadius "3" 
     .InnerRadius "2" 
     .Axis "z" 
     .Zrange "2", "57" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With

'@ delete shape: component1:solid2

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Solid.Delete "component1:solid2"

'@ define cylinder: component1:solid2

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Cylinder 
     .Reset 
     .Name "solid2" 
     .Component "component1" 
     .Material "material3" 
     .OuterRadius "3" 
     .InnerRadius "2" 
     .Axis "z" 
     .Zrange "2", "57" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With

'@ define cylinder: component1:solid3

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Cylinder 
     .Reset 
     .Name "solid3" 
     .Component "component1" 
     .Material "material1" 
     .OuterRadius "3" 
     .InnerRadius "2" 
     .Axis "z" 
     .Zrange "57", "59" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With

'@ pick face

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Pick.PickFaceFromId "component1:solid3", "3"

'@ define port: 1

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Port 
     .Reset 
     .PortNumber "1" 
     .Label "" 
     .Folder "" 
     .NumberOfModes "1" 
     .AdjustPolarization "False" 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .TextMaxLimit "0" 
     .Coordinates "Picks" 
     .Orientation "positive" 
     .PortOnBound "True" 
     .ClipPickedPortToBound "False" 
     .Xrange "-3", "3" 
     .Yrange "-3", "3" 
     .Zrange "59", "59" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .WaveguideMonitor "False" 
     .Create 
End With

'@ pick face

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Pick.PickFaceFromId "component1:solid1", "1"

'@ define port: 2

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Port 
     .Reset 
     .PortNumber "2" 
     .Label "" 
     .Folder "" 
     .NumberOfModes "1" 
     .AdjustPolarization "False" 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .TextMaxLimit "0" 
     .Coordinates "Picks" 
     .Orientation "positive" 
     .PortOnBound "True" 
     .ClipPickedPortToBound "False" 
     .Xrange "-3", "3" 
     .Yrange "-3", "3" 
     .Zrange "0", "0" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .WaveguideMonitor "False" 
     .Create 
End With

'@ define monitor: e-field (f=1)

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Monitor 
     .Reset 
     .Name "e-field (f=1)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Efield" 
     .MonitorValue "1" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-3", "3", "-3", "3", "0", "59" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .Create 
End With

'@ define frequency range

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Solver.FrequencyRange "0.5", "1.5"

'@ define material: material3

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Material 
     .Reset 
     .Name "material3"
     .Folder ""
     .Rho "0.0"
     .ThermalType "Normal"
     .ThermalConductivity "0"
     .SpecificHeat "0", "J/K/kg"
     .DynamicViscosity "0"
     .Emissivity "0"
     .MetabolicRate "0.0"
     .VoxelConvection "0.0"
     .BloodFlow "0"
     .MechanicsType "Unused"
     .FrqType "all"
     .Type "Normal"
     .MaterialUnit "Frequency", "GHz"
     .MaterialUnit "Geometry", "mm"
     .MaterialUnit "Time", "ns"
     .MaterialUnit "Temperature", "Kelvin"
     .Epsilon "5.2"
     .Mu "1"
     .Sigma "0"
     .TanD "0.0"
     .TanDFreq "0.0"
     .TanDGiven "False"
     .TanDModel "ConstTanD"
     .EnableUserConstTanDModelOrderEps "False"
     .ConstTanDModelOrderEps "1"
     .SetElParametricConductivity "False"
     .ReferenceCoordSystem "Global"
     .CoordSystemType "Cartesian"
     .SigmaM "0"
     .TanDM "0.0"
     .TanDMFreq "0.0"
     .TanDMGiven "False"
     .TanDMModel "ConstTanD"
     .EnableUserConstTanDModelOrderMu "False"
     .ConstTanDModelOrderMu "1"
     .SetMagParametricConductivity "False"
     .DispModelEps  "None"
     .DispModelMu "None"
     .DispersiveFittingSchemeEps "Nth Order"
     .MaximalOrderNthModelFitEps "10"
     .ErrorLimitNthModelFitEps "0.1"
     .UseOnlyDataInSimFreqRangeNthModelEps "False"
     .DispersiveFittingSchemeMu "Nth Order"
     .MaximalOrderNthModelFitMu "10"
     .ErrorLimitNthModelFitMu "0.1"
     .UseOnlyDataInSimFreqRangeNthModelMu "False"
     .UseGeneralDispersionEps "False"
     .UseGeneralDispersionMu "False"
     .NLAnisotropy "False"
     .NLAStackingFactor "1"
     .NLADirectionX "1"
     .NLADirectionY "0"
     .NLADirectionZ "0"
     .Colour "0", "0.501961", "1" 
     .Wireframe "False" 
     .Reflection "False" 
     .Allowoutline "True" 
     .Transparentoutline "False" 
     .Transparency "0" 
     .Create
End With

'@ define material colour: material1

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Material 
     .Name "material1"
     .Folder ""
     .Colour "0", "1", "1" 
     .Wireframe "False" 
     .Reflection "False" 
     .Allowoutline "True" 
     .Transparentoutline "False" 
     .Transparency "0" 
     .ChangeColour 
End With

'@ define material: material3

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Material 
     .Reset 
     .Name "material3"
     .Folder ""
     .Rho "0.0"
     .ThermalType "Normal"
     .ThermalConductivity "0"
     .SpecificHeat "0", "J/K/kg"
     .DynamicViscosity "0"
     .Emissivity "0"
     .MetabolicRate "0.0"
     .VoxelConvection "0.0"
     .BloodFlow "0"
     .MechanicsType "Unused"
     .FrqType "all"
     .Type "Normal"
     .MaterialUnit "Frequency", "GHz"
     .MaterialUnit "Geometry", "mm"
     .MaterialUnit "Time", "ns"
     .MaterialUnit "Temperature", "Kelvin"
     .Epsilon "2"
     .Mu "1"
     .Sigma "0"
     .TanD "0.0"
     .TanDFreq "0.0"
     .TanDGiven "False"
     .TanDModel "ConstTanD"
     .EnableUserConstTanDModelOrderEps "False"
     .ConstTanDModelOrderEps "1"
     .SetElParametricConductivity "False"
     .ReferenceCoordSystem "Global"
     .CoordSystemType "Cartesian"
     .SigmaM "0"
     .TanDM "0.0"
     .TanDMFreq "0.0"
     .TanDMGiven "False"
     .TanDMModel "ConstTanD"
     .EnableUserConstTanDModelOrderMu "False"
     .ConstTanDModelOrderMu "1"
     .SetMagParametricConductivity "False"
     .DispModelEps  "None"
     .DispModelMu "None"
     .DispersiveFittingSchemeEps "Nth Order"
     .MaximalOrderNthModelFitEps "10"
     .ErrorLimitNthModelFitEps "0.1"
     .UseOnlyDataInSimFreqRangeNthModelEps "False"
     .DispersiveFittingSchemeMu "Nth Order"
     .MaximalOrderNthModelFitMu "10"
     .ErrorLimitNthModelFitMu "0.1"
     .UseOnlyDataInSimFreqRangeNthModelMu "False"
     .UseGeneralDispersionEps "False"
     .UseGeneralDispersionMu "False"
     .NLAnisotropy "False"
     .NLAStackingFactor "1"
     .NLADirectionX "1"
     .NLADirectionY "0"
     .NLADirectionZ "0"
     .Colour "0", "0.501961", "1" 
     .Wireframe "False" 
     .Reflection "False" 
     .Allowoutline "True" 
     .Transparentoutline "False" 
     .Transparency "0" 
     .Create
End With

'@ delete shape: component1:solid1

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Solid.Delete "component1:solid1"

'@ delete shape: component1:solid2

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Solid.Delete "component1:solid2"

'@ delete shape: component1:solid3

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Solid.Delete "component1:solid3"

'@ delete port: port1

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Port.Delete "1"

'@ delete port: port2

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Port.Delete "2"

'@ new component: component2

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Component.New "component2"

'@ define cylinder: component2:solid1

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Cylinder 
     .Reset 
     .Name "solid1" 
     .Component "component2" 
     .Material "material1" 
     .OuterRadius "3" 
     .InnerRadius "2" 
     .Axis "z" 
     .Zrange "0", "10" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With

'@ pick face

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Pick.PickFaceFromId "component2:solid1", "3"

'@ define port: 1

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Port 
     .Reset 
     .PortNumber "1" 
     .Label "" 
     .Folder "" 
     .NumberOfModes "1" 
     .AdjustPolarization "False" 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .TextMaxLimit "0" 
     .Coordinates "Picks" 
     .Orientation "positive" 
     .PortOnBound "True" 
     .ClipPickedPortToBound "False" 
     .Xrange "-3", "3" 
     .Yrange "-3", "3" 
     .Zrange "10", "10" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .WaveguideMonitor "False" 
     .Create 
End With

'@ pick face

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Pick.PickFaceFromId "component2:solid1", "1"

'@ define port: 2

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Port 
     .Reset 
     .PortNumber "2" 
     .Label "" 
     .Folder "" 
     .NumberOfModes "1" 
     .AdjustPolarization "False" 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .TextMaxLimit "0" 
     .Coordinates "Picks" 
     .Orientation "positive" 
     .PortOnBound "True" 
     .ClipPickedPortToBound "False" 
     .Xrange "-3", "3" 
     .Yrange "-3", "3" 
     .Zrange "0", "0" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .WaveguideMonitor "False" 
     .Create 
End With

'@ define monitor: e-field (f=3.5)

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Monitor 
     .Reset 
     .Name "e-field (f=3.5)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Efield" 
     .MonitorValue "3.5" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-3", "3", "-3", "3", "0", "10" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .Create 
End With

'@ delete monitor: e-field (f=3.5)

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Monitor.Delete "e-field (f=3.5)"

'@ delete shape: component2:solid1

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Solid.Delete "component2:solid1"

'@ delete component: component2

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Component.Delete "component2"

'@ define background

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Background 
     .ResetBackground 
     .XminSpace "0.0" 
     .XmaxSpace "0.0" 
     .YminSpace "0.0" 
     .YmaxSpace "0.0" 
     .ZminSpace "0.0" 
     .ZmaxSpace "0.0" 
     .ApplyInAllDirections "False" 
End With 
With Material 
     .Reset 
     .Rho "0.0"
     .ThermalType "Normal"
     .ThermalConductivity "0"
     .SpecificHeat "0", "J/K/kg"
     .DynamicViscosity "0"
     .Emissivity "0"
     .MetabolicRate "0.0"
     .VoxelConvection "0.0"
     .BloodFlow "0"
     .MechanicsType "Unused"
     .FrqType "all"
     .Type "Normal"
     .MaterialUnit "Frequency", "Hz"
     .MaterialUnit "Geometry", "m"
     .MaterialUnit "Time", "s"
     .MaterialUnit "Temperature", "Kelvin"
     .Epsilon "1.0"
     .Mu "1.0"
     .Sigma "0.0"
     .TanD "0.0"
     .TanDFreq "0.0"
     .TanDGiven "False"
     .TanDModel "ConstSigma"
     .EnableUserConstTanDModelOrderEps "False"
     .ConstTanDModelOrderEps "1"
     .SetElParametricConductivity "False"
     .ReferenceCoordSystem "Global"
     .CoordSystemType "Cartesian"
     .SigmaM "0"
     .TanDM "0.0"
     .TanDMFreq "0.0"
     .TanDMGiven "False"
     .TanDMModel "ConstSigma"
     .EnableUserConstTanDModelOrderMu "False"
     .ConstTanDModelOrderMu "1"
     .SetMagParametricConductivity "False"
     .DispModelEps  "None"
     .DispModelMu "None"
     .DispersiveFittingSchemeEps "Nth Order"
     .MaximalOrderNthModelFitEps "10"
     .ErrorLimitNthModelFitEps "0.1"
     .UseOnlyDataInSimFreqRangeNthModelEps "False"
     .DispersiveFittingSchemeMu "Nth Order"
     .MaximalOrderNthModelFitMu "10"
     .ErrorLimitNthModelFitMu "0.1"
     .UseOnlyDataInSimFreqRangeNthModelMu "False"
     .UseGeneralDispersionEps "False"
     .UseGeneralDispersionMu "False"
     .NLAnisotropy "False"
     .NLAStackingFactor "1"
     .NLADirectionX "1"
     .NLADirectionY "0"
     .NLADirectionZ "0"
     .Colour "0.6", "0.6", "0.6" 
     .Wireframe "False" 
     .Reflection "False" 
     .Allowoutline "True" 
     .Transparentoutline "False" 
     .Transparency "0" 
     .ChangeBackgroundMaterial
End With

'@ delete port: port1

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Port.Delete "1"

'@ delete port: port2

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Port.Delete "2"

'@ new component: component2

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Component.New "component2"

'@ define cylinder: component2:solid1

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Cylinder 
     .Reset 
     .Name "solid1" 
     .Component "component2" 
     .Material "PEC" 
     .OuterRadius "3.5" 
     .InnerRadius "3" 
     .Axis "z" 
     .Zrange "0", "100" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With

'@ define cylinder: component2:solid2

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Cylinder 
     .Reset 
     .Name "solid2" 
     .Component "component2" 
     .Material "Vacuum" 
     .OuterRadius "3" 
     .InnerRadius "2" 
     .Axis "z" 
     .Zrange "0", "100" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With

'@ define cylinder: component2:solid3

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Cylinder 
     .Reset 
     .Name "solid3" 
     .Component "component2" 
     .Material "PEC" 
     .OuterRadius "2" 
     .InnerRadius "0" 
     .Axis "z" 
     .Zrange "0", "100" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With

'@ pick face

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Pick.PickFaceFromId "component2:solid2", "3"

'@ define port: 1

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Port 
     .Reset 
     .PortNumber "1" 
     .Label "" 
     .Folder "" 
     .NumberOfModes "1" 
     .AdjustPolarization "False" 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .TextMaxLimit "1" 
     .Coordinates "Picks" 
     .Orientation "positive" 
     .PortOnBound "True" 
     .ClipPickedPortToBound "False" 
     .Xrange "-3", "3" 
     .Yrange "-3", "3" 
     .Zrange "100", "100" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .WaveguideMonitor "False" 
     .Create 
End With

'@ pick face

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Pick.PickFaceFromId "component2:solid2", "1"

'@ define port: 2

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Port 
     .Reset 
     .PortNumber "2" 
     .Label "" 
     .Folder "" 
     .NumberOfModes "1" 
     .AdjustPolarization "False" 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .TextMaxLimit "1" 
     .Coordinates "Picks" 
     .Orientation "positive" 
     .PortOnBound "True" 
     .ClipPickedPortToBound "False" 
     .Xrange "-3", "3" 
     .Yrange "-3", "3" 
     .Zrange "0", "0" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .WaveguideMonitor "False" 
     .Create 
End With

'@ delete component: component1

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Component.Delete "component1"

'@ delete port: port1

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Port.Delete "1"

'@ delete port: port2

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Port.Delete "2"

'@ pick face

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Pick.PickFaceFromId "component2:solid1", "3"

'@ define port: 1

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Port 
     .Reset 
     .PortNumber "1" 
     .Label "" 
     .Folder "" 
     .NumberOfModes "1" 
     .AdjustPolarization "False" 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .TextMaxLimit "1" 
     .Coordinates "Picks" 
     .Orientation "positive" 
     .PortOnBound "True" 
     .ClipPickedPortToBound "False" 
     .Xrange "-3.5", "3.5" 
     .Yrange "-3.5", "3.5" 
     .Zrange "100", "100" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .WaveguideMonitor "False" 
     .Create 
End With

'@ pick face

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Pick.PickFaceFromId "component2:solid1", "1"

'@ define port: 2

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Port 
     .Reset 
     .PortNumber "2" 
     .Label "" 
     .Folder "" 
     .NumberOfModes "1" 
     .AdjustPolarization "False" 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .TextMaxLimit "1" 
     .Coordinates "Picks" 
     .Orientation "positive" 
     .PortOnBound "True" 
     .ClipPickedPortToBound "False" 
     .Xrange "-3.5", "3.5" 
     .Yrange "-3.5", "3.5" 
     .Zrange "0", "0" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .WaveguideMonitor "False" 
     .Create 
End With

'@ define monitor: h-field (f=1)

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Monitor 
     .Reset 
     .Name "h-field (f=1)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Hfield" 
     .MonitorValue "1" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-3.5", "3.5", "-3.5", "3.5", "0", "100" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .Create 
End With

'@ define background

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Background 
     .ResetBackground 
     .XminSpace "0.0" 
     .XmaxSpace "0.0" 
     .YminSpace "0.0" 
     .YmaxSpace "0.0" 
     .ZminSpace "0.0" 
     .ZmaxSpace "0.0" 
     .ApplyInAllDirections "False" 
End With 
With Material 
     .Reset 
     .Rho "0.0"
     .ThermalType "Normal"
     .ThermalConductivity "0"
     .SpecificHeat "0", "J/K/kg"
     .DynamicViscosity "0"
     .Emissivity "0"
     .MetabolicRate "0.0"
     .VoxelConvection "0.0"
     .BloodFlow "0"
     .MechanicsType "Unused"
     .FrqType "all"
     .Type "Pec"
     .MaterialUnit "Frequency", "Hz"
     .MaterialUnit "Geometry", "m"
     .MaterialUnit "Time", "s"
     .MaterialUnit "Temperature", "Kelvin"
     .Epsilon "1.0"
     .Mu "1.0"
     .ReferenceCoordSystem "Global"
     .CoordSystemType "Cartesian"
     .NLAnisotropy "False"
     .NLAStackingFactor "1"
     .NLADirectionX "1"
     .NLADirectionY "0"
     .NLADirectionZ "0"
     .Colour "0.6", "0.6", "0.6" 
     .Wireframe "False" 
     .Reflection "False" 
     .Allowoutline "True" 
     .Transparentoutline "False" 
     .Transparency "0" 
     .ChangeBackgroundMaterial
End With

'@ delete component: component2

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Component.Delete "component2"

'@ delete port: port2

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Port.Delete "2"

'@ delete port: port1

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Port.Delete "1"

'@ new component: component1

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Component.New "component1"

'@ define brick: component1:solid1

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Brick
     .Reset 
     .Name "solid1" 
     .Component "component1" 
     .Material "Vacuum" 
     .Xrange "0", "10" 
     .Yrange "0", "10" 
     .Zrange "0", "20" 
     .Create
End With

'@ pick face

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Pick.PickFaceFromId "component1:solid1", "1"

'@ define port: 1

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Port 
     .Reset 
     .PortNumber "1" 
     .Label "" 
     .Folder "" 
     .NumberOfModes "1" 
     .AdjustPolarization "False" 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .TextMaxLimit "1" 
     .Coordinates "Picks" 
     .Orientation "positive" 
     .PortOnBound "True" 
     .ClipPickedPortToBound "False" 
     .Xrange "0", "10" 
     .Yrange "0", "10" 
     .Zrange "20", "20" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .WaveguideMonitor "False" 
     .Create 
End With

'@ pick face

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Pick.PickFaceFromId "component1:solid1", "2"

'@ define port: 2

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Port 
     .Reset 
     .PortNumber "2" 
     .Label "" 
     .Folder "" 
     .NumberOfModes "1" 
     .AdjustPolarization "False" 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .TextMaxLimit "1" 
     .Coordinates "Picks" 
     .Orientation "positive" 
     .PortOnBound "True" 
     .ClipPickedPortToBound "False" 
     .Xrange "0", "10" 
     .Yrange "0", "10" 
     .Zrange "0", "0" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .WaveguideMonitor "False" 
     .Create 
End With

'@ delete shape: component1:solid1

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Solid.Delete "component1:solid1"

'@ delete component: component1

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Component.Delete "component1"

'@ delete port: port2

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Port.Delete "2"

'@ delete port: port1

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Port.Delete "1"

'@ new component: component1

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Component.New "component1"

'@ define cylinder: component1:solid1

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Cylinder 
     .Reset 
     .Name "solid1" 
     .Component "component1" 
     .Material "PEC" 
     .OuterRadius "3.5" 
     .InnerRadius "3" 
     .Axis "z" 
     .Zrange "0", "d+d2+d2" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With

'@ define cylinder: component1:solid2

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Cylinder 
     .Reset 
     .Name "solid2" 
     .Component "component1" 
     .Material "PEC" 
     .OuterRadius "2" 
     .InnerRadius "0.0" 
     .Axis "z" 
     .Zrange "0", "d+d2+d2" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With

'@ define cylinder: component1:solid3

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Cylinder 
     .Reset 
     .Name "solid3" 
     .Component "component1" 
     .Material "material1" 
     .OuterRadius "3" 
     .InnerRadius "2" 
     .Axis "z" 
     .Zrange "0", "d2" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With

'@ define cylinder: component1:solid4

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Cylinder 
     .Reset 
     .Name "solid4" 
     .Component "component1" 
     .Material "material1" 
     .OuterRadius "3" 
     .InnerRadius "2" 
     .Axis "z" 
     .Zrange "d+d2", "d+d2+d2" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With

'@ define cylinder: component1:solid5

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Cylinder 
     .Reset 
     .Name "solid5" 
     .Component "component1" 
     .Material "material3" 
     .OuterRadius "3" 
     .InnerRadius "2" 
     .Axis "z" 
     .Zrange "d2", "d+d2" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With

'@ pick face

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Pick.PickFaceFromId "component1:solid1", "3"

'@ define port: 1

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Port 
     .Reset 
     .PortNumber "1" 
     .Label "" 
     .Folder "" 
     .NumberOfModes "1" 
     .AdjustPolarization "False" 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .TextMaxLimit "1" 
     .Coordinates "Picks" 
     .Orientation "positive" 
     .PortOnBound "True" 
     .ClipPickedPortToBound "False" 
     .Xrange "-3.5", "3.5" 
     .Yrange "-3.5", "3.5" 
     .Zrange "75", "75" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .WaveguideMonitor "False" 
     .Create 
End With

'@ pick face

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Pick.PickFaceFromId "component1:solid1", "1"

'@ define port: 2

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Port 
     .Reset 
     .PortNumber "2" 
     .Label "" 
     .Folder "" 
     .NumberOfModes "1" 
     .AdjustPolarization "False" 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .TextMaxLimit "1" 
     .Coordinates "Picks" 
     .Orientation "positive" 
     .PortOnBound "True" 
     .ClipPickedPortToBound "False" 
     .Xrange "-3.5", "3.5" 
     .Yrange "-3.5", "3.5" 
     .Zrange "0", "0" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .WaveguideMonitor "False" 
     .Create 
End With

'@ define material colour: material1

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Material 
     .Name "material1"
     .Folder ""
     .Colour "0", "1", "1" 
     .Wireframe "False" 
     .Reflection "False" 
     .Allowoutline "True" 
     .Transparentoutline "False" 
     .Transparency "0" 
     .ChangeColour 
End With

'@ define solver s-parameter symmetries

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Solver
     .ResetSParaSymm 
End With

'@ delete monitor: e-field (f=1)

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Monitor 
     .Delete "e-field (f=1)" 
End With

'@ define monitor: e-field (f=10)

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Monitor 
     .Reset 
     .Name "e-field (f=10)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Efield" 
     .MonitorValue "10" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-3.5", "3.5", "-3.5", "3.5", "0", "75" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .Create 
End With

'@ delete monitor: h-field (f=1)

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Monitor 
     .Delete "h-field (f=1)" 
End With

'@ define monitor: h-field (f=10)

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Monitor 
     .Reset 
     .Name "h-field (f=10)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Hfield" 
     .MonitorValue "10" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-3.5", "3.5", "-3.5", "3.5", "0", "75" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .Create 
End With

'@ define frequency range

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Solver.FrequencyRange "0.5", "20"

'@ define material: material3

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Material 
     .Reset 
     .Name "material3"
     .Folder ""
     .Rho "0.0"
     .ThermalType "Normal"
     .ThermalConductivity "0"
     .SpecificHeat "0", "J/K/kg"
     .DynamicViscosity "0"
     .Emissivity "0"
     .MetabolicRate "0.0"
     .VoxelConvection "0.0"
     .BloodFlow "0"
     .MechanicsType "Unused"
     .FrqType "all"
     .Type "Normal"
     .MaterialUnit "Frequency", "GHz"
     .MaterialUnit "Geometry", "mm"
     .MaterialUnit "Time", "ns"
     .MaterialUnit "Temperature", "Kelvin"
     .Epsilon "1.1"
     .Mu "1"
     .Sigma "0"
     .TanD "0.0"
     .TanDFreq "0.0"
     .TanDGiven "False"
     .TanDModel "ConstTanD"
     .EnableUserConstTanDModelOrderEps "False"
     .ConstTanDModelOrderEps "1"
     .SetElParametricConductivity "False"
     .ReferenceCoordSystem "Global"
     .CoordSystemType "Cartesian"
     .SigmaM "0"
     .TanDM "0.0"
     .TanDMFreq "0.0"
     .TanDMGiven "False"
     .TanDMModel "ConstTanD"
     .EnableUserConstTanDModelOrderMu "False"
     .ConstTanDModelOrderMu "1"
     .SetMagParametricConductivity "False"
     .DispModelEps  "None"
     .DispModelMu "None"
     .DispersiveFittingSchemeEps "Nth Order"
     .MaximalOrderNthModelFitEps "10"
     .ErrorLimitNthModelFitEps "0.1"
     .UseOnlyDataInSimFreqRangeNthModelEps "False"
     .DispersiveFittingSchemeMu "Nth Order"
     .MaximalOrderNthModelFitMu "10"
     .ErrorLimitNthModelFitMu "0.1"
     .UseOnlyDataInSimFreqRangeNthModelMu "False"
     .UseGeneralDispersionEps "False"
     .UseGeneralDispersionMu "False"
     .NLAnisotropy "False"
     .NLAStackingFactor "1"
     .NLADirectionX "1"
     .NLADirectionY "0"
     .NLADirectionZ "0"
     .Colour "0", "0.501961", "1" 
     .Wireframe "False" 
     .Reflection "False" 
     .Allowoutline "True" 
     .Transparentoutline "False" 
     .Transparency "0" 
     .Create
End With

'@ delete monitor: h-field (f=10)

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Monitor 
     .Delete "h-field (f=10)" 
End With

'@ define monitor: h-field (f=15)

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Monitor 
     .Reset 
     .Name "h-field (f=15)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Hfield" 
     .MonitorValue "15" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-3.5", "3.5", "-3.5", "3.5", "0", "200" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .Create 
End With

'@ delete monitor: e-field (f=10)

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Monitor 
     .Delete "e-field (f=10)" 
End With

'@ define monitor: e-field (f=15)

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Monitor 
     .Reset 
     .Name "e-field (f=15)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Efield" 
     .MonitorValue "15" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-3.5", "3.5", "-3.5", "3.5", "0", "200" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .Create 
End With

'@ define material: material3

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Material 
     .Reset 
     .Name "material3"
     .Folder ""
     .Rho "0.0"
     .ThermalType "Normal"
     .ThermalConductivity "0"
     .SpecificHeat "0", "J/K/kg"
     .DynamicViscosity "0"
     .Emissivity "0"
     .MetabolicRate "0.0"
     .VoxelConvection "0.0"
     .BloodFlow "0"
     .MechanicsType "Unused"
     .FrqType "all"
     .Type "Normal"
     .MaterialUnit "Frequency", "GHz"
     .MaterialUnit "Geometry", "mm"
     .MaterialUnit "Time", "ns"
     .MaterialUnit "Temperature", "Kelvin"
     .Epsilon "1.1"
     .Mu "1"
     .Sigma "0"
     .TanD "0.0"
     .TanDFreq "0.0"
     .TanDGiven "False"
     .TanDModel "ConstTanD"
     .EnableUserConstTanDModelOrderEps "False"
     .ConstTanDModelOrderEps "1"
     .SetElParametricConductivity "False"
     .ReferenceCoordSystem "Global"
     .CoordSystemType "Cartesian"
     .SigmaM "0"
     .TanDM "0.0"
     .TanDMFreq "0.0"
     .TanDMGiven "False"
     .TanDMModel "ConstTanD"
     .EnableUserConstTanDModelOrderMu "False"
     .ConstTanDModelOrderMu "1"
     .SetMagParametricConductivity "False"
     .DispModelEps  "None"
     .DispModelMu "None"
     .DispersiveFittingSchemeEps "Nth Order"
     .MaximalOrderNthModelFitEps "10"
     .ErrorLimitNthModelFitEps "0.1"
     .UseOnlyDataInSimFreqRangeNthModelEps "False"
     .DispersiveFittingSchemeMu "Nth Order"
     .MaximalOrderNthModelFitMu "10"
     .ErrorLimitNthModelFitMu "0.1"
     .UseOnlyDataInSimFreqRangeNthModelMu "False"
     .UseGeneralDispersionEps "False"
     .UseGeneralDispersionMu "False"
     .NLAnisotropy "False"
     .NLAStackingFactor "1"
     .NLADirectionX "1"
     .NLADirectionY "0"
     .NLADirectionZ "0"
     .Colour "0", "0.501961", "1" 
     .Wireframe "False" 
     .Reflection "False" 
     .Allowoutline "True" 
     .Transparentoutline "False" 
     .Transparency "0" 
     .Create
End With

'@ delete monitor: h-field (f=15)

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Monitor 
     .Delete "h-field (f=15)" 
End With

'@ define monitor: h-field (f=10)

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Monitor 
     .Reset 
     .Name "h-field (f=10)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Hfield" 
     .MonitorValue "10" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-3.5", "3.5", "-3.5", "3.5", "0", "200" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .Create 
End With

'@ delete monitor: e-field (f=15)

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Monitor 
     .Delete "e-field (f=15)" 
End With

'@ define monitor: e-field (f=10)

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Monitor 
     .Reset 
     .Name "e-field (f=10)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Efield" 
     .MonitorValue "10" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-3.5", "3.5", "-3.5", "3.5", "0", "200" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .Create 
End With

'@ define material: material3

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Material 
     .Reset 
     .Name "material3"
     .Folder ""
     .Rho "0.0"
     .ThermalType "Normal"
     .ThermalConductivity "0"
     .SpecificHeat "0", "J/K/kg"
     .DynamicViscosity "0"
     .Emissivity "0"
     .MetabolicRate "0.0"
     .VoxelConvection "0.0"
     .BloodFlow "0"
     .MechanicsType "Unused"
     .FrqType "all"
     .Type "Normal"
     .MaterialUnit "Frequency", "GHz"
     .MaterialUnit "Geometry", "mm"
     .MaterialUnit "Time", "ns"
     .MaterialUnit "Temperature", "Kelvin"
     .Epsilon "1.05"
     .Mu "1"
     .Sigma "0"
     .TanD "0.0"
     .TanDFreq "0.0"
     .TanDGiven "False"
     .TanDModel "ConstTanD"
     .EnableUserConstTanDModelOrderEps "False"
     .ConstTanDModelOrderEps "1"
     .SetElParametricConductivity "False"
     .ReferenceCoordSystem "Global"
     .CoordSystemType "Cartesian"
     .SigmaM "0"
     .TanDM "0.0"
     .TanDMFreq "0.0"
     .TanDMGiven "False"
     .TanDMModel "ConstTanD"
     .EnableUserConstTanDModelOrderMu "False"
     .ConstTanDModelOrderMu "1"
     .SetMagParametricConductivity "False"
     .DispModelEps  "None"
     .DispModelMu "None"
     .DispersiveFittingSchemeEps "Nth Order"
     .MaximalOrderNthModelFitEps "10"
     .ErrorLimitNthModelFitEps "0.1"
     .UseOnlyDataInSimFreqRangeNthModelEps "False"
     .DispersiveFittingSchemeMu "Nth Order"
     .MaximalOrderNthModelFitMu "10"
     .ErrorLimitNthModelFitMu "0.1"
     .UseOnlyDataInSimFreqRangeNthModelMu "False"
     .UseGeneralDispersionEps "False"
     .UseGeneralDispersionMu "False"
     .NLAnisotropy "False"
     .NLAStackingFactor "1"
     .NLADirectionX "1"
     .NLADirectionY "0"
     .NLADirectionZ "0"
     .Colour "0", "0.501961", "1" 
     .Wireframe "False" 
     .Reflection "False" 
     .Allowoutline "True" 
     .Transparentoutline "False" 
     .Transparency "0" 
     .Create
End With

'@ define frequency range

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Solver.FrequencyRange "10", "30"

'@ delete monitor: h-field (f=10)

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Monitor 
     .Delete "h-field (f=10)" 
End With

'@ define monitor: h-field (f=20)

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Monitor 
     .Reset 
     .Name "h-field (f=20)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Hfield" 
     .MonitorValue "20" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-3.5", "3.5", "-3.5", "3.5", "0", "200" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .Create 
End With

'@ delete monitor: e-field (f=10)

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Monitor 
     .Delete "e-field (f=10)" 
End With

'@ define monitor: e-field (f=20)

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Monitor 
     .Reset 
     .Name "e-field (f=20)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Efield" 
     .MonitorValue "20" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-3.5", "3.5", "-3.5", "3.5", "0", "200" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .Create 
End With

'@ delete monitor: h-field (f=20)

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Monitor 
     .Delete "h-field (f=20)" 
End With

'@ define monitor: h-field (f=1)

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Monitor 
     .Reset 
     .Name "h-field (f=1)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Hfield" 
     .MonitorValue "1" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-3.5", "3.5", "-3.5", "3.5", "0", "95" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .Create 
End With

'@ delete monitor: e-field (f=20)

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Monitor 
     .Delete "e-field (f=20)" 
End With

'@ define monitor: e-field (f=1)

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Monitor 
     .Reset 
     .Name "e-field (f=1)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Efield" 
     .MonitorValue "1" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-3.5", "3.5", "-3.5", "3.5", "0", "95" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .Create 
End With

'@ define frequency range

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Solver.FrequencyRange "0.5", "10"

'@ delete monitor: h-field (f=1)

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Monitor 
     .Delete "h-field (f=1)" 
End With

'@ define monitor: h-field (f=10)

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Monitor 
     .Reset 
     .Name "h-field (f=10)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Hfield" 
     .MonitorValue "10" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-3.5", "3.5", "-3.5", "3.5", "0", "95" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .Create 
End With

'@ delete monitor: e-field (f=1)

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Monitor 
     .Delete "e-field (f=1)" 
End With

'@ define monitor: e-field (f=10)

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Monitor 
     .Reset 
     .Name "e-field (f=10)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Efield" 
     .MonitorValue "10" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-3.5", "3.5", "-3.5", "3.5", "0", "95" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .Create 
End With

'@ define frequency range

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Solver.FrequencyRange "0.5", "15"

'@ define monitor: e-field (f=1)

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Monitor 
     .Reset 
     .Name "e-field (f=1)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Efield" 
     .MonitorValue "1" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-3.5", "3.5", "-3.5", "3.5", "0", "95" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .Create 
End With

'@ define monitor: h-field (f=1)

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Monitor 
     .Reset 
     .Name "h-field (f=1)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Hfield" 
     .MonitorValue "1" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-3.5", "3.5", "-3.5", "3.5", "0", "95" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .Create 
End With

'@ define time domain solver parameters

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Mesh.SetCreator "High Frequency" 
With Solver 
     .Method "Hexahedral"
     .CalculationType "TD-S"
     .StimulationPort "All"
     .StimulationMode "All"
     .SteadyStateLimit "-40"
     .MeshAdaption "False"
     .AutoNormImpedance "False"
     .NormingImpedance "50"
     .CalculateModesOnly "False"
     .SParaSymmetry "False"
     .StoreTDResultsInCache  "False"
     .FullDeembedding "False"
     .SuperimposePLWExcitation "False"
     .UseSensitivityAnalysis "False"
End With

'@ define material: material3

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Material 
     .Reset 
     .Name "material3"
     .Folder ""
     .Rho "0.0"
     .ThermalType "Normal"
     .ThermalConductivity "0"
     .SpecificHeat "0", "J/K/kg"
     .DynamicViscosity "0"
     .Emissivity "0"
     .MetabolicRate "0.0"
     .VoxelConvection "0.0"
     .BloodFlow "0"
     .MechanicsType "Unused"
     .FrqType "all"
     .Type "Normal"
     .MaterialUnit "Frequency", "GHz"
     .MaterialUnit "Geometry", "mm"
     .MaterialUnit "Time", "ns"
     .MaterialUnit "Temperature", "Kelvin"
     .Epsilon "1.2"
     .Mu "1"
     .Sigma "0"
     .TanD "0.0"
     .TanDFreq "0.0"
     .TanDGiven "False"
     .TanDModel "ConstTanD"
     .EnableUserConstTanDModelOrderEps "False"
     .ConstTanDModelOrderEps "1"
     .SetElParametricConductivity "False"
     .ReferenceCoordSystem "Global"
     .CoordSystemType "Cartesian"
     .SigmaM "0"
     .TanDM "0.0"
     .TanDMFreq "0.0"
     .TanDMGiven "False"
     .TanDMModel "ConstTanD"
     .EnableUserConstTanDModelOrderMu "False"
     .ConstTanDModelOrderMu "1"
     .SetMagParametricConductivity "False"
     .DispModelEps  "None"
     .DispModelMu "None"
     .DispersiveFittingSchemeEps "Nth Order"
     .MaximalOrderNthModelFitEps "10"
     .ErrorLimitNthModelFitEps "0.1"
     .UseOnlyDataInSimFreqRangeNthModelEps "False"
     .DispersiveFittingSchemeMu "Nth Order"
     .MaximalOrderNthModelFitMu "10"
     .ErrorLimitNthModelFitMu "0.1"
     .UseOnlyDataInSimFreqRangeNthModelMu "False"
     .UseGeneralDispersionEps "False"
     .UseGeneralDispersionMu "False"
     .NLAnisotropy "False"
     .NLAStackingFactor "1"
     .NLADirectionX "1"
     .NLADirectionY "0"
     .NLADirectionZ "0"
     .Colour "0", "0.501961", "1" 
     .Wireframe "False" 
     .Reflection "False" 
     .Allowoutline "True" 
     .Transparentoutline "False" 
     .Transparency "0" 
     .Create
End With

'@ delete monitor: e-field (f=1)

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Monitor 
     .Delete "e-field (f=1)" 
End With

'@ define monitor: e-field (f=15)

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Monitor 
     .Reset 
     .Name "e-field (f=15)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Efield" 
     .MonitorValue "15" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-3.5", "3.5", "-3.5", "3.5", "0", "95" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .Create 
End With

'@ delete monitor: h-field (f=1)

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Monitor 
     .Delete "h-field (f=1)" 
End With

'@ define monitor: h-field (f=15)

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Monitor 
     .Reset 
     .Name "h-field (f=15)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Hfield" 
     .MonitorValue "15" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-3.5", "3.5", "-3.5", "3.5", "0", "95" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .Create 
End With

'@ delete monitor: h-field (f=15)

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Monitor 
     .Delete "h-field (f=15)" 
End With

'@ define monitor: h-field (f=1)

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Monitor 
     .Reset 
     .Name "h-field (f=1)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Hfield" 
     .MonitorValue "1" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-3.5", "3.5", "-3.5", "3.5", "0", "155" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .Create 
End With

'@ delete monitor: e-field (f=15)

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Monitor 
     .Delete "e-field (f=15)" 
End With

'@ define monitor: e-field (f=1)

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Monitor 
     .Reset 
     .Name "e-field (f=1)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Efield" 
     .MonitorValue "1" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-3.5", "3.5", "-3.5", "3.5", "0", "155" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .Create 
End With

'@ delete port: port2

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Port.Delete "2"

'@ define background

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Background 
     .ResetBackground 
     .XminSpace "0.0" 
     .XmaxSpace "0.0" 
     .YminSpace "0.0" 
     .YmaxSpace "0.0" 
     .ZminSpace "0.0" 
     .ZmaxSpace "0.0" 
     .ApplyInAllDirections "False" 
End With 
With Material 
     .Reset 
     .Rho "0.0"
     .ThermalType "Normal"
     .ThermalConductivity "0"
     .SpecificHeat "0", "J/K/kg"
     .DynamicViscosity "0"
     .Emissivity "0"
     .MetabolicRate "0.0"
     .VoxelConvection "0.0"
     .BloodFlow "0"
     .MechanicsType "Unused"
     .FrqType "all"
     .Type "Normal"
     .MaterialUnit "Frequency", "Hz"
     .MaterialUnit "Geometry", "m"
     .MaterialUnit "Time", "s"
     .MaterialUnit "Temperature", "Kelvin"
     .Epsilon "1.0"
     .Mu "1.0"
     .Sigma "0.0"
     .TanD "0.0"
     .TanDFreq "0.0"
     .TanDGiven "False"
     .TanDModel "ConstSigma"
     .EnableUserConstTanDModelOrderEps "False"
     .ConstTanDModelOrderEps "1"
     .SetElParametricConductivity "False"
     .ReferenceCoordSystem "Global"
     .CoordSystemType "Cartesian"
     .SigmaM "0"
     .TanDM "0.0"
     .TanDMFreq "0.0"
     .TanDMGiven "False"
     .TanDMModel "ConstSigma"
     .EnableUserConstTanDModelOrderMu "False"
     .ConstTanDModelOrderMu "1"
     .SetMagParametricConductivity "False"
     .DispModelEps  "None"
     .DispModelMu "None"
     .DispersiveFittingSchemeEps "Nth Order"
     .MaximalOrderNthModelFitEps "10"
     .ErrorLimitNthModelFitEps "0.1"
     .UseOnlyDataInSimFreqRangeNthModelEps "False"
     .DispersiveFittingSchemeMu "Nth Order"
     .MaximalOrderNthModelFitMu "10"
     .ErrorLimitNthModelFitMu "0.1"
     .UseOnlyDataInSimFreqRangeNthModelMu "False"
     .UseGeneralDispersionEps "False"
     .UseGeneralDispersionMu "False"
     .NLAnisotropy "False"
     .NLAStackingFactor "1"
     .NLADirectionX "1"
     .NLADirectionY "0"
     .NLADirectionZ "0"
     .Colour "0.6", "0.6", "0.6" 
     .Wireframe "False" 
     .Reflection "False" 
     .Allowoutline "True" 
     .Transparentoutline "False" 
     .Transparency "0" 
     .ChangeBackgroundMaterial
End With 

'@ define material: material3

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Material 
     .Reset 
     .Name "material3"
     .Folder ""
     .Rho "0.0"
     .ThermalType "Normal"
     .ThermalConductivity "0"
     .SpecificHeat "0", "J/K/kg"
     .DynamicViscosity "0"
     .Emissivity "0"
     .MetabolicRate "0.0"
     .VoxelConvection "0.0"
     .BloodFlow "0"
     .MechanicsType "Unused"
     .FrqType "all"
     .Type "Normal"
     .MaterialUnit "Frequency", "GHz"
     .MaterialUnit "Geometry", "mm"
     .MaterialUnit "Time", "ns"
     .MaterialUnit "Temperature", "Kelvin"
     .Epsilon "0.1947"
     .Mu "1"
     .Sigma "0.0405"
     .TanD "0.0"
     .TanDFreq "0.0"
     .TanDGiven "False"
     .TanDModel "ConstTanD"
     .EnableUserConstTanDModelOrderEps "False"
     .ConstTanDModelOrderEps "1"
     .SetElParametricConductivity "False"
     .ReferenceCoordSystem "Global"
     .CoordSystemType "Cartesian"
     .SigmaM "0"
     .TanDM "0.0"
     .TanDMFreq "0.0"
     .TanDMGiven "False"
     .TanDMModel "ConstTanD"
     .EnableUserConstTanDModelOrderMu "False"
     .ConstTanDModelOrderMu "1"
     .SetMagParametricConductivity "False"
     .DispModelEps  "None"
     .DispModelMu "None"
     .DispersiveFittingSchemeEps "Nth Order"
     .MaximalOrderNthModelFitEps "10"
     .ErrorLimitNthModelFitEps "0.1"
     .UseOnlyDataInSimFreqRangeNthModelEps "False"
     .DispersiveFittingSchemeMu "Nth Order"
     .MaximalOrderNthModelFitMu "10"
     .ErrorLimitNthModelFitMu "0.1"
     .UseOnlyDataInSimFreqRangeNthModelMu "False"
     .UseGeneralDispersionEps "False"
     .UseGeneralDispersionMu "False"
     .NLAnisotropy "False"
     .NLAStackingFactor "1"
     .NLADirectionX "1"
     .NLADirectionY "0"
     .NLADirectionZ "0"
     .Colour "0", "0.501961", "1" 
     .Wireframe "False" 
     .Reflection "False" 
     .Allowoutline "True" 
     .Transparentoutline "False" 
     .Transparency "0" 
     .Create
End With 


'@ pick face

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
Pick.PickFaceFromId "component1:solid1", "1" 


'@ define port: 2

'[VERSION]2020.0|29.0.1|20190925[/VERSION]
With Port 
     .Reset 
     .PortNumber "2" 
     .Label "" 
     .Folder "" 
     .NumberOfModes "1" 
     .AdjustPolarization "False" 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .TextMaxLimit "0" 
     .Coordinates "Picks" 
     .Orientation "positive" 
     .PortOnBound "True" 
     .ClipPickedPortToBound "False" 
     .Xrange "-3.5", "3.5" 
     .Yrange "-3.5", "3.5" 
     .Zrange "0", "0" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .WaveguideMonitor "False" 
     .Create 
End With 


