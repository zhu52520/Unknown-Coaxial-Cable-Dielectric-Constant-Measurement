' This is a script template to be modified by the "Mix complex 1D results" template. Some parts of the code will be replaced by the corresponding formulas.
'
' Version history
' -----------------------------------------------------------------------------------------------------------------------------
' 27-Feb-2017 fsr: Activated scriptsettings (commented out, only needed for debugging)
' 01-Jul-2016 fsr: Delete any previous output files if they exist. Needed for t3d monitors.
' 25-May-2016 fsr: Added support for t3d monitors
' 15-Dec-2014 fsr: Added support for TET meshes
' 21-Nov-2013 fsr: Initial version, based on 1DC version
' -----------------------------------------------------------------------------------------------------------------------------

Option Explicit
'include tmp libraries, these have to be built (and deleted) dynamically from the originial libraries before (after) calling the template
'#include "vba_globals_all.lib"
'#include "infix_postfix.lib"
'#include "complex.lib"

' replacement, either "MWS", "DSMWS", or "DS"
Public Const callingApp = "MWS"

'Const lib_rundef = -1.23456e27 ' uncomment in debugging mode

Sub Main

	Dim A_cst_tmp As Variant, B_cst_tmp As Variant, C_cst_tmp As Variant, D_cst_tmp As Variant, E_cst_tmp As Variant, F_cst_tmp As Variant
	Dim iCharNumber As Integer, iCharLoop As Integer
	Dim nSample As Long
	iCharNumber = 5

	Dim TmpResult_Final As Variant
	Dim sOutputFileName As String

	Dim oResultTmp As Object, oResultNew() As Object, bResultExists() As Boolean
	ReDim oResultNew(iCharNumber)
	ReDim bResultExists(iCharNumber)

	Dim iiitmp As Long
	Dim bTreat1DAs1DC As Boolean	' used if any of the 1DC commands in infix_postfix.lib are used for 1D plots
	bTreat1DAs1DC = False

	' ActivateScriptSettings True ' uncomment in debugging mode

	nSample = GetScriptSetting("t3dsample", "0")
	If (RestoreGlobalDataValue("Mix_A")<>"") Then
		Set A_cst_tmp = Result3D("")
		If nSample > 0 Then A_cst_tmp.SetSample(nSample)
		A_cst_tmp.Load(RestoreGlobalDataValue("Mix_A"))
	Else
		Set A_cst_tmp = Nothing
	End If
	If (RestoreGlobalDataValue("Mix_B")<>"") Then
		Set B_cst_tmp = Result3D("")
		If nSample > 0 Then B_cst_tmp.SetSample(nSample)
		B_cst_tmp.Load(RestoreGlobalDataValue("Mix_B"))
	Else
		Set B_cst_tmp = Nothing
	End If
	If (RestoreGlobalDataValue("Mix_C")<>"") Then
		Set C_cst_tmp = Result3D("")
		If nSample > 0 Then C_cst_tmp.SetSample(nSample)
		C_cst_tmp.Load(RestoreGlobalDataValue("Mix_C"))
	Else
		Set C_cst_tmp = Nothing
	End If
	If (RestoreGlobalDataValue("Mix_D")<>"") Then
		Set D_cst_tmp = Result3D("")
		If nSample > 0 Then D_cst_tmp.SetSample(nSample)
		D_cst_tmp.Load(RestoreGlobalDataValue("Mix_D"))
	Else
		Set D_cst_tmp = Nothing
	End If
	If (RestoreGlobalDataValue("Mix_E")<>"") Then
		Set E_cst_tmp = Result3D("")
		If nSample > 0 Then E_cst_tmp.SetSample(nSample)
		E_cst_tmp.Load(RestoreGlobalDataValue("Mix_E"))
	Else
		Set E_cst_tmp = Nothing
	End If
	If (RestoreGlobalDataValue("Mix_F")<>"") Then
		Set F_cst_tmp = Result3D("")
		If nSample > 0 Then F_cst_tmp.SetSample(nSample)
		F_cst_tmp.Load(RestoreGlobalDataValue("Mix_F"))
	Else
		Set F_cst_tmp = Nothing
	End If

	' Store result type of first field, if used
	If (RestoreGlobalDataValue("Mix_A")<>"") Then StoreGlobalDataValue("TypeOfFieldA", A_cst_tmp.GetType)

	Set TmpResult_Final = EvaluateExpression(A_cst_tmp, B_cst_tmp, C_cst_tmp, D_cst_tmp, E_cst_tmp, F_cst_tmp)
	sOutputFileName = GetProjectPath("Result") & "mix_3D_result" & "." & IIf(RestoreGlobalDataValue("FileExtension") = "", "m3d", RestoreGlobalDataValue("FileExtension"))
	If (Dir(sOutputFileName) <> "") Then Kill(sOutputFileName)
	TmpResult_Final.Save(sOutputFileName)
	Wait 1

	' successful operation
	' ActivateScriptSettings False ' uncomment in debugging mode

	Exit Sub
End Sub

Function EvaluateExpression(A_cst_tmp As Variant, B_cst_tmp As Variant, C_cst_tmp As Variant, D_cst_tmp As Variant, E_cst_tmp As Variant, F_cst_tmp As Variant) As Object
Dim  TmpResult_Final As Object
' The following line in this template will be/has been replaced with the VBA command chain
Dim NumObject_13_2 As Object
Set NumObject_13_2 = GetRes1DComplexFrom1DCNumeric(1,0,callingApp)
NumObject_13_2.MakeCompatibleTo(GetRes1DComplexFrom1DCNumeric(0,0))
Dim TmpResult_13 As Object
Set TmpResult_13 = A_cst_tmp.Copy()
ComplexScalarMult3D(TmpResult_13,NumObject_13_2)
Set TmpResult_Final = TmpResult_13

Set EvaluateExpression = TmpResult_Final
End Function
