VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsStrCat"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit

Private Buffer As String
Private BufferLen As Long
Private Pointer As Long

'Auf "Leerstring" setzen:
Public Sub Clear()
  Pointer = 1
End Sub

'String anh�ngen:
Public Sub Concat(ByRef Value As String)
  Dim PointerNew As Long
  
  'Ben�tigten Buffer berechnen:
  PointerNew = Pointer + LenB(Value)
  
  'Ggf. Buffer verg��ern:
  If PointerNew > BufferLen Then
    Buffer = Buffer & Space$(PointerNew)
    BufferLen = LenB(Buffer)
  End If
  
  'String passend kopieren:
  MidB$(Buffer, Pointer) = Value
  Pointer = PointerNew
End Sub

'L�nge des internen Strings:
Public Property Get Length() As Long
  Length = Pointer \ 2
End Property

'Inhalt des internen Strings:
Public Property Get Value() As String
  Value = LeftB$(Buffer, Pointer - 1)
End Property

'Neues Objekt initialisieren:
Private Sub Class_Initialize()
  Clear
End Sub

