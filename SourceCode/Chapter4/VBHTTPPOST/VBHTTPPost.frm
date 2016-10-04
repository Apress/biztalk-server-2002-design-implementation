VERSION 5.00
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Begin VB.Form Form1 
   Caption         =   "VB HTTP Post Utility"
   ClientHeight    =   7755
   ClientLeft      =   4485
   ClientTop       =   2400
   ClientWidth     =   7695
   LinkTopic       =   "Form1"
   ScaleHeight     =   7755
   ScaleWidth      =   7695
   Begin RichTextLib.RichTextBox postresponse 
      Height          =   2775
      Left            =   360
      TabIndex        =   7
      Top             =   4320
      Width           =   6975
      _ExtentX        =   12303
      _ExtentY        =   4895
      _Version        =   393217
      Enabled         =   -1  'True
      ScrollBars      =   3
      TextRTF         =   $"VBHTTPPost.frx":0000
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Reset"
      Height          =   375
      Left            =   5760
      TabIndex        =   3
      Top             =   7320
      Width           =   1335
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Post"
      Height          =   375
      Left            =   3360
      TabIndex        =   2
      Top             =   7320
      Width           =   1575
   End
   Begin RichTextLib.RichTextBox postdocument 
      Height          =   2295
      Left            =   360
      TabIndex        =   1
      Top             =   1320
      Width           =   6975
      _ExtentX        =   12303
      _ExtentY        =   4048
      _Version        =   393217
      ScrollBars      =   3
      TextRTF         =   $"VBHTTPPost.frx":0082
   End
   Begin VB.TextBox urlstring 
      Height          =   375
      Left            =   360
      TabIndex        =   0
      Text            =   "http://localhost/B2B_Anonymous/Anonymous.asp"
      Top             =   480
      Width           =   6975
   End
   Begin VB.Label status 
      Caption         =   "Status:"
      Height          =   375
      Left            =   4800
      TabIndex        =   8
      Top             =   0
      Width           =   2415
   End
   Begin VB.Label Label3 
      Caption         =   "URL"
      Height          =   255
      Left            =   360
      TabIndex        =   6
      Top             =   120
      Width           =   1215
   End
   Begin VB.Label Label2 
      Caption         =   "Post document"
      Height          =   255
      Left            =   360
      TabIndex        =   5
      Top             =   960
      Width           =   1815
   End
   Begin VB.Label Label1 
      Caption         =   "Response"
      Height          =   255
      Left            =   360
      TabIndex        =   4
      Top             =   3840
      Width           =   1575
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Dim xmlrequest As String
Dim httprequest As New MSXML2.XMLHTTP26



Dim d As DOMDocument


Dim docresponse
postresponse.Text = ""
status.Caption = "Status: Sending"

If (Len(urlstring) = 0) Then
MsgBox ("Type in a url to which the document is posted")
Exit Sub
End If
xmlrequest = postdocument.Text

httprequest.open "POST", urlstring, False
httprequest.send xmlrequest
postresponse.Text = CStr(httprequest.status) & " - " & httprequest.statusText & httprequest.responseText

status.Caption = "Status: Done"




End Sub

Private Sub Command2_Click()
postresponse.Text = ""
postdocument.Text = ""
End Sub

