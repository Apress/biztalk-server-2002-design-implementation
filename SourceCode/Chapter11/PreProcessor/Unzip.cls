VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Unzip"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Implements IBTSCustomProcess
Dim src_id
Dim dest_id
Sub IBTSCustomProcess_SetContext(ByVal pCtx As IBTSCustomProcessContext)
    ' Note: This sample only demonstrates how to obtain context information...
    
    src_id = pCtx.SourceID
    dest_id = pCtx.DestID

End Sub

Sub IBTSCustomProcess_Execute(ByVal vDataIn, ByVal nCodePageIn As Long, ByVal bIsFilePath As Boolean, ByRef nCodePageOut, ByRef vDataOut)
On Error GoTo ErrorHandler
    vDataOut = Unzip(vDataIn)
Exit Sub

ErrorHandler:
    On Error GoTo 0
    Err.Raise Err.Number, Err.Source, Err.Description
End Sub

Private Function Unzip(ByRef ZippedData) As String
'add you code to unzip the data
End Function

