VERSION 5.00
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "richtx32.ocx"
Begin VB.Form SuspendDocTool 
   Caption         =   "SuspendDocTool"
   ClientHeight    =   7020
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7230
   LinkTopic       =   "Form1"
   ScaleHeight     =   7020
   ScaleWidth      =   7230
   StartUpPosition =   3  'Windows Default
   Begin VB.ListBox List1 
      Height          =   5520
      Left            =   240
      TabIndex        =   10
      Top             =   480
      Width           =   1935
   End
   Begin RichTextLib.RichTextBox datavalue 
      Height          =   3855
      Left            =   3480
      TabIndex        =   9
      Top             =   2040
      Width           =   3495
      _ExtentX        =   6165
      _ExtentY        =   6800
      _Version        =   393217
      ScrollBars      =   3
      TextRTF         =   $"Form1.frx":0000
   End
   Begin VB.TextBox reasonvalue 
      Height          =   285
      Left            =   3480
      TabIndex        =   8
      Top             =   1560
      Width           =   3495
   End
   Begin VB.TextBox documentvalue 
      Height          =   285
      Left            =   3480
      TabIndex        =   7
      Top             =   1200
      Width           =   3495
   End
   Begin VB.TextBox destinationvalue 
      Height          =   285
      Left            =   3480
      TabIndex        =   6
      Top             =   840
      Width           =   3495
   End
   Begin VB.TextBox sourcevalue 
      Height          =   285
      Left            =   3480
      TabIndex        =   5
      Top             =   480
      Width           =   3495
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Delete"
      Height          =   375
      Left            =   5760
      TabIndex        =   4
      Top             =   6000
      Width           =   1215
   End
   Begin VB.Label Label7 
      Caption         =   "Document Detail"
      Height          =   375
      Left            =   3480
      TabIndex        =   13
      Top             =   0
      Width           =   2775
   End
   Begin VB.Label Label6 
      Caption         =   "Suspened Document"
      Height          =   375
      Left            =   240
      TabIndex        =   12
      Top             =   0
      Width           =   1935
   End
   Begin VB.Label Label5 
      Caption         =   "Data"
      Height          =   255
      Left            =   2280
      TabIndex        =   11
      Top             =   2160
      Width           =   855
   End
   Begin VB.Label Label4 
      Caption         =   "Document"
      Height          =   255
      Left            =   2280
      TabIndex        =   3
      Top             =   1320
      Width           =   975
   End
   Begin VB.Label Label3 
      Caption         =   "Reason"
      Height          =   255
      Left            =   2280
      TabIndex        =   2
      Top             =   1680
      Width           =   1335
   End
   Begin VB.Label Label2 
      Caption         =   "Destination"
      Height          =   255
      Left            =   2280
      TabIndex        =   1
      Top             =   840
      Width           =   855
   End
   Begin VB.Label Label1 
      Caption         =   "Source"
      Height          =   255
      Left            =   2280
      TabIndex        =   0
      Top             =   480
      Width           =   735
   End
End
Attribute VB_Name = "SuspendDocTool"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim handle As String
Dim index As Integer
Dim Doclist As Variant
Dim interchange As BTSInterchangeLib.interchange




Private Sub Command3_Click()
If List1.ListIndex >= 0 Then
    interchange.DeleteFromSuspendedQueue (handle)
    List1.RemoveItem (index)
    sourcevalue.Text = ""
    destinationvalue.Text = ""
    documentvalue.Text = ""
    reasonvalue.Text = ""
    datavalue.Text = ""
End If
End Sub

Private Sub Form_Load()

Set interchange = New BTSInterchangeLib.interchange
Doclist = interchange.CheckSuspendedQueue()

    For i = 0 To UBound(Doclist)
        interchange.GetSuspendedQueueItemDetails Doclist(i), src, dst, doc, reas, data
        List1.AddItem (Doclist(i))
    Next

End Sub

Private Sub List1_Click()
On Error Resume Next
Dim i
Dim src, dst, doc, reas, data
handle = List1.Text
interchange.GetSuspendedQueueItemDetails handle, src, dst, doc, reas, data
sourcevalue.Text = src
destinationvalue.Text = det
documentvalue.Text = doc
reasonvalue.Text = reas
datavalue.Text = data
index = List1.ListIndex
End Sub
