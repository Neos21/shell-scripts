@Echo Off

Rem バッチファイルの終了と共にコンソールが閉じる場合に限ってコンソールを開き続けるようにする
Rem 
Rem ・Cmd /k でコンソールを使い続けられるが、バッチをコンソールから呼び出したときはサブコンソールが開いてしまう
Rem ・バッチファイルまでのフルパスが長過ぎると正常に動作しない



Echo 何らかの処理…
Echo バッチファイルを終了します。
Pause



Rem バッチファイルの終了と共にコンソールが閉じる場合に限ってコンソールを開き続けるようにする
Setlocal
Set _=%0
Echo %CMDCMDLINE% | Findstr /ir "Cmd.*/c.*%_:\=\\%" > Nul
Endlocal
If Not ERRORLEVEL 1 Cmd /k
Exit /b



Rem ・Windows Script Programming - バッチファイル実行後にコンソールを使う : http://scripting.cocolog-nifty.com/blog/2006/11/post_b6b4.html