VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "AIC"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Implements IBTSAppIntegration

Private Function IBTSAppIntegration_ProcessMessage(ByVal document As String) As String
On Error GoTo ExecuteError
    Dim ResponseDoc As String
    
    ResponseDoc = QuoteServiceSoapClient(document)
    UpdateDB (ResponseDoc)
    IBTSAppIntegration_ProcessMessage = "Stock Quotes have been updated successfully"
    Exit Function
ExecuteError:
    On Error GoTo 0
    Err.Raise Err.Number, Err.Source, "The following Error was encountered: " + Err.Description
End Function

Private Function QuoteServiceSoapClient(document As String)
    Dim SoapClient As New MSSOAPLib.SoapClient
    SoapClient.mssoapinit "http://w2kserver/QuoteService/QuoteService.wsdl", "QuoteService", "QuoteServiceSoapPort"
    QuoteServiceClient = SoapClient.QuoteServiceController(document)
End Function

Private Sub UpdateDB(ResponseDoc)
'you code here to update the database
End Sub

