VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "QuoteService"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Dim quotes As String
Public Function RetrieveQuotes() As String
Dim responsedocument As String
'add you code to return the quote for the ticker in the document
RetrieveQuotes = quotes
End Function
Public Function ReceiveTicker(doc As String) As String
quotes = doc
ReceiveTicker = doc
End Function
Public Function QuoteServiceController(Tickers As String) As String
  Dim ssked_URL As String
  Dim sked As Object
  
  'set the URL for quote service schedule.
  ssked_URL = "sked:///C:\Program Files\Microsoft BizTalk Server\XLANG Scheduler\quoteservice.skx/QuoteServicePort"
  'Load and start the schedule
  Set sked = GetObject(ssked_URL)

  'Provide Ticker document by call the method on the port
  sked.ReceiveTicker (Tickers)

  'Retrieve the quote result by call the method on the port
  QuoteServiceController = sked.RetrieveQuotes()
End Function

