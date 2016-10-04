VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Trade"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Public Function ProcessTrade(doc As String) As String
Err.Raise 100000, "Stock trade", "unable to trade"
'you code here to execute the trade
Dim ReturnDoc As String
ReturnDoc = doc
ProcessTrade = ReturnDoc
End Function
