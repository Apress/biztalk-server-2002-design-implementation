VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "StockQuote"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Public Function QuoteServiceSoapClient(document As String)
    Dim SoapClient As New MSSOAPLib.SoapClient
    SoapClient.mssoapinit "http://w2kserver/QuoteService/QuoteService.wsdl", "QuoteService", "QuoteServiceSoapPort"
    QuoteServiceClient = SoapClient.QuoteServiceController(document)
End Function

Public Sub UpdateDB(ResponseDoc)
'you code here to update the database
End Sub
