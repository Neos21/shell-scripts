@Echo Off

Rem �E�B���h�E�ʒu�E�E�B���h�E�T�C�Y���w�肵�� Windows �o�b�`���N������



Rem �ݒ�

Rem �E�B���h�E�̃X�N���[�����ォ��̉��ʒu
Set X=10

Rem �E�B���h�E�̃X�N���[�����ォ��̏c�ʒu
Set Y=20

Rem �E�B���h�E�̕�
Set W=200

Rem �E�B���h�E�̍���
Set H=300



Rem VBScript �ŋN�����Ă���΃��C��������
If "%~1" == "RestartedByVBS" Goto :MAIN

Rem VBScript ���Ȃ���ΐ�������
Setlocal EnableDelayedExpansion
(
  For /f "delims=:, tokens=1*" %%a In ('Type "%~f0" ^| Findstr "^VBS:"') Do (
    Set LINE=%%b
    Echo.!LINE:~1!
  )
) > TempVBS.vbs
Endlocal

Rem VBScript ���炱�̃o�b�`�t�@�C�������s������
Cscript //NoLogo TempVBS.vbs "%~f0" %X% %Y% %W% %H%

Rem VBScript ���폜���ďI������
Del /q /f TempVBS.vbs > Nul 2>&1
Exit /b



:MAIN

Echo �E�B���h�E�ʒu�E�E�B���h�E�T�C�Y���w�肵�� Windows �o�b�`���N������
Echo ���C������
Echo.
Echo �E�B���h�E�̃X�N���[�����ォ��̉��ʒu : %X%
Echo �E�B���h�E�̃X�N���[�����ォ��̏c�ʒu : %Y%
Echo �E�B���h�E�̕�   : %W%
Echo �E�B���h�E�̍��� : %H%
Echo.
Pause
Exit /b



Rem �E�B���h�E�ʒu�E�T�C�Y��ݒ肷�� VBScript
Rem 
Rem �e�s�AVBScript �̃R�[�h�̎�O�ɁuVBS: �v�Ə����Ă��� (��s�����p�X�y�[�X��t�^����)�B

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



Rem �EPositioning CMD Window : http://www.dostips.com/forum/viewtopic.php?t=4285
