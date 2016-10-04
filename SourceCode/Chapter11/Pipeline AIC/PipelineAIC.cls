VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "PipelineAIC"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Implements IPipelineComponentAdmin
Implements IPipelineComponent

Private url As String
Private method As String
Private userid As String
Private password As String

Private Sub IPipelineComponent_EnableDesign(ByVal fEnable As Long) 'Do Nothing
End Sub 'IPipelineComponent_EnableDesign

Private Function IPipelineComponent_Execute(ByVal dictTransport As Object, _
    ByVal pdispContext As Object, _
    ByVal lFlags As Long) As Long

 On Error GoTo ExecuteError
 Dim ResponseDoc As String
  
 'Overwrite configuration defaults with any values passed in
 IPipelineComponentAdmin_SetConfigData dictTransport
 
 If Not pdispContext Is Nothing Then
    IPipelineComponentAdmin_SetConfigData pdispContext
 End If
 
 'call the web service
 ResponseDoc = QuoteServiceSoapClient(url, method, dictTransport("working_data"), userid, password)
 UpdateDB (ResponseDoc)
 'set the response document
 dictTransport("Responsefield") = "Stock Quotes from " & url & " have been updated successfully by Pipeline AIC"
 'return success
 IPipelineComponent_Execute = 0
 Exit Function

ExecuteError:
    IPipelineComponent_Execute = 2 'Serious Error Occurred
End Function 'IPipelineComponent_Execute

Private Function IPipelineComponentAdmin_GetConfigData() As Object
    Dim objectConfig As New CDictionary
    
    objectConfig.Value("url") = url
    objectConfig.Value("method") = method
    objectConfig.Value("userid") = userid
    objectConfig.Value("password") = password
    
    Set IPipelineComponentAdmin_GetConfigData = objectConfig
End Function 'IPipelineComponentAdmin_GetConfigData

Private Sub IPipelineComponentAdmin_SetConfigData(ByVal pDict As Object)
    'set value for url
    If Not IsNull(pDict("url")) Then
        url = CStr(pDict("url"))
    End If
    'set value for method
    If Not IsNull(pDict("method")) Then
        method = CStr(pDict("method"))
    End If
    'set value for userid
    If Not IsNull(pDict("userid")) Then
        userid = CStr(pDict("userid"))
    End If
    'set value for method
    If Not IsNull(pDict("password")) Then
        password = CStr(pDict("password"))
    End If
        

End Sub 'IPipelineComponentAdmin_SetConfigData

Private Function QuoteServiceSoapClient(ByVal url As String, ByVal method As String, _
       ByVal working_dat, ByVal userid As String, ByVal password As String) As String
    Dim ResponseDoc
    'Add you code to call the web service,
    'and save the return data to ResponseDoc
    QuoteServiceSoapClient = ResponseDoc
End Function

Private Sub UpdateDB(document As String)
    'add you code to update stock quotes in database
End Sub
