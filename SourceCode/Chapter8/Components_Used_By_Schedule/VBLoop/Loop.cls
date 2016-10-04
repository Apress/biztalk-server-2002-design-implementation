VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Loop"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Private counter

Public Function Increment()
    'increment the counter variable by 1
    counter = counter + 1
    Increment = counter
End Function

Public Function DoWork()
    'Add you code here.
    MsgBox ("loop #" & counter)
End Function

Private Sub Class_Initialize()
    'initialize the variable
    counter = 0
End Sub
