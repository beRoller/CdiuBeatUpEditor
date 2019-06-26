VERSION 5.00
Begin VB.Form GoRoom 
   BorderStyle     =   1  '��u�T�w
   Caption         =   "�i�J�ж�"
   ClientHeight    =   1500
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   6240
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1500
   ScaleWidth      =   6240
   StartUpPosition =   3  '�t�ιw�]��
   Begin VB.TextBox GoRoomPw 
      Height          =   375
      IMEMode         =   3  '�Ȥ�
      Left            =   1440
      PasswordChar    =   "*"
      TabIndex        =   2
      Top             =   840
      Width           =   3015
   End
   Begin VB.CommandButton GoRoomButton 
      Caption         =   "�i�J�ж�"
      Height          =   1215
      Left            =   4680
      TabIndex        =   1
      Top             =   120
      Width           =   1455
   End
   Begin VB.TextBox GoRoomName 
      Height          =   375
      Left            =   1440
      TabIndex        =   0
      Top             =   240
      Width           =   3015
   End
   Begin VB.Label Go_RoomNumber 
      AutoSize        =   -1  'True
      Caption         =   "�ж��s��"
      Height          =   180
      Left            =   120
      TabIndex        =   4
      Top             =   240
      Width           =   720
   End
   Begin VB.Label Go_RoomPw 
      AutoSize        =   -1  'True
      Caption         =   "�ж��K�X"
      Height          =   180
      Left            =   120
      TabIndex        =   3
      Top             =   840
      Width           =   720
   End
End
Attribute VB_Name = "GoRoom"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()

SetLG

End Sub

Private Sub GoRoomButton_Click()

Dim Check As VbMsgBoxResult, SaveFile As String

If Admin = False Then On Error Resume Next

If TotalBeat > 0 Then
    If cma2.CheckCombo(TotalBeat) > 0 Then
        Check = MsgBox(IIf(Language = 0, "�ɮ׬O�_�ݭn�x�s?", "Do You Need To Save?"), vbYesNoCancel, IIf(Language = 0, "�t�ΰT��", "System Info"))
    Else
        GoRoomDo
    End If
Else
    GoRoomDo
End If

If Check = vbYes Then

    SaveFile = cma2.OpenFile("cdiu", "Save")

    If SaveFile <> "" Then cma3.CbeOut SaveFile

    GoRoomDo
ElseIf Check = vbNo Then
    GoRoomDo
ElseIf Check = vbCancel Then
    Exit Sub
End If

End Sub

Private Sub GoRoomDo()

Dim Result As String, Show() As String, ShowA() As String

RoomPassword = IIf(GoRoom.GoRoomPw.Text <> "", GoRoom.GoRoomPw.Text, "9898x9898")
RoomNumber = IIf(GoRoom.GoRoomName.Text <> "", GoRoom.GoRoomName.Text, "0")

Result = GetData2(GetLink("584444400A1F1F4747471E445245401E5E55441F535459451F575F425F5F5D1E4058400F454355420D") + GetCode(User) + GetLink("16425F5F5D0D") + GetCode(CStr(RoomNumber)) + GetLink("16425F5F5D40470D") + GetCode(RoomPassword) + GetLink("165859540D") + GetCode(GetHardId))

If Result <> "0" Then
    Room = True

    RoomNumber = Val(GoRoom.GoRoomName.Text)
    GoRoomButton.Enabled = False
    GoRoomName.Enabled = False
    GoRoomPw.Enabled = False
    ChatBox.ShowRoomNumber.Caption = GoRoom.GoRoomName.Text
    ChatBox.ShowRoomName.Caption = Split(Result, "999bbb999")(0)
    ChatBox.ShowRoomName.Caption = GetDCode(ChatBox.ShowRoomName.Caption)
    If ChatBox.ShowRoomName.Caption = "9898x9898" Then ChatBox.ShowRoomName.Caption = ""
    ChatBox.ShowRoomHost.Caption = Split(Result, "999bbb999")(1)
    Roomid = Split(Result, "999bbb999")(2) - 1
    If ChatBox.ShowRoomHost.Caption = User Then ChatBox.StartButton.Visible = True
    GoRoom.Hide
    GoRoom.Enabled = False
    
    cma1.CloseSound
    cma4.UnloadD3D
    cma6.UnloadDI
    
    ChatBox.Show
    ChatBox.UpdateTextShow
    cmt.Enabled = False
    cmt.Hide
    ChatBox.UpdateText.Enabled = True
    Unload GoRoom
Else
    MsgBox IIf(Language = 0, "�K�X���~", "Password Wrong"), vbYes, IIf(Language = 0, "�t�ΰT��", "System Info")
End If

If GoRoom.GoRoomName.Text = "" Then GoRoom.GoRoomName.Text = 0

End Sub

Private Sub GoRoomName_KeyDown(KeyCode As Integer, Shift As Integer)

If KeyCode = 13 Then GoRoomPw.SetFocus

End Sub

Private Sub GoRoomPw_KeyDown(KeyCode As Integer, Shift As Integer)

If KeyCode = 13 Then GoRoomButton_Click

End Sub

Public Sub SetLG()

If Admin = False Then On Error Resume Next

        If Language = 0 Then
            GoRoom.Caption = "�i�J�ж�"
            GoRoom.Go_RoomNumber.Caption = "�ж��s��"
            GoRoom.Go_RoomPw.Caption = "�ж��K�X"
            GoRoom.GoRoomButton.Caption = "�i�J�ж�"

        ElseIf Language = 1 Then
            GoRoom.Caption = "Go Room"
            GoRoom.Go_RoomNumber.Caption = "Room Number"
            GoRoom.Go_RoomPw.Caption = "Room Password"
            GoRoom.GoRoomButton.Caption = "Go Room"

        End If
End Sub

