Option Explicit

' ====================================================================================================
' エクスプローラから本 VBS ファイルをダブルクリックしても WScript ではなく CScript で実行する
' ====================================================================================================

If LCase(Right(WScript.FullName, 11)) <> "cscript.exe" Then
  WScript.CreateObject("WScript.Shell" ).Run "cscript //NoLogo """ & WScript.ScriptFullName & """"
  WScript.Quit
End If

WScript.StdOut.Write "Hello World"
WScript.StdOut.WriteBlankLines 1
WScript.StdOut.WriteLine "End"
WScript.Sleep 500
WScript.Quit
