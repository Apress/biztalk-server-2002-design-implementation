VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "TradeInformation"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Public Function TradeOrderInProcess(doc As String)
'Err.Raise "10000", "TradeInformation", "unable to update databae"
MsgBox ("ok")
TradeOrderInProcess = doc
End Function
Public Function TradeOrderError(doc As String)

End Function

Public Function TradeOrderComplete(doc As String)

End Function
