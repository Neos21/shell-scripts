@Echo Off

Rem ウィンドウ位置・ウィンドウサイズを指定して Windows バッチを起動する



Rem 設定

Rem ウィンドウのスクリーン左上からの横位置
Set X=10

Rem ウィンドウのスクリーン左上からの縦位置
Set Y=20

Rem ウィンドウの幅
Set W=200

Rem ウィンドウの高さ
Set H=300



Rem VBScript で起動していればメイン処理へ
If "%~1" == "RestartedByVBS" Goto :MAIN

Rem VBScript がなければ生成する
Setlocal EnableDelayedExpansion
(
  For /f "delims=:, tokens=1*" %%a In ('Type "%~f0" ^| Findstr "^VBS:"') Do (
    Set LINE=%%b
    Echo.!LINE:~1!
  )
) > TempVBS.vbs
Endlocal

Rem VBScript からこのバッチファイルを実行させる
Cscript //NoLogo TempVBS.vbs "%~f0" %X% %Y% %W% %H%

Rem VBScript を削除して終了する
Del /q /f TempVBS.vbs > Nul 2>&1
Exit /b



:MAIN

Echo ウィンドウ位置・ウィンドウサイズを指定して Windows バッチを起動する
Echo メイン処理
Echo.
Echo ウィンドウのスクリーン左上からの横位置 : %X%
Echo ウィンドウのスクリーン左上からの縦位置 : %Y%
Echo ウィンドウの幅   : %W%
Echo ウィンドウの高さ : %H%
Echo.
Pause
Exit /b



Rem ウィンドウ位置・サイズを設定する VBScript
Rem 
Rem 各行、VBScript のコードの手前に「VBS: 」と書いておく (空行も半角スペースを付与する)。

VBS: Option Explicit
VBS: 
VBS: If WScript.Arguments.Count = 0 Or InStr(LCase(WScript.FullName), "wscript") > 0 Then
VBS:   WScript.Echo "Usage : CScript //NoLogo " & WScript.ScriptName & " <.bat BatchFileName> <X Coordinate> <Y Coordinate>"
VBS:   WScript.Quit
VBS: End If
VBS: 
VBS: Dim x : x =   0 : If WScript.Arguments.Count >= 2 Then x = WScript.Arguments(1)
VBS: Dim y : y =   0 : If WScript.Arguments.Count >= 3 Then y = WScript.Arguments(2)
VBS: Dim w : w = 100 : If WScript.Arguments.Count >= 4 Then w = WScript.Arguments(3)
VBS: Dim h : h = 100 : If WScript.Arguments.Count >= 5 Then h = WScript.Arguments(4)
VBS: 
VBS: Dim wmi : Set wmi = GetObject("winmgmts:\\.\root\cimv2")
VBS: Dim config : Set config = wmi.Get("Win32_ProcessStartup")
VBS: config.SpawnInstance_
VBS: config.X = x
VBS: config.Y = y
VBS: config.XSize = w
VBS: config.YSize = h
VBS: 
VBS: Dim newProcess : Set newProcess = wmi.Get("Win32_Process")
VBS: newProcess.Create chr(34) & WScript.Arguments(0) & chr(34) & " RestartedByVBS", Null, config, Null



Rem ・Positioning CMD Window : http://www.dostips.com/forum/viewtopic.php?t=4285