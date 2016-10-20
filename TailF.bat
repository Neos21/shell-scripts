@Echo Off

Rem Tail -f コマンドもどき
Rem 
Rem 入力ファイルが出力オープンされている間は監視を継続する。
Rem 入力ファイルへの出力オープンがクローズされると終了する。



Setlocal

If Not Exist "%~1" (
  Echo Usage: %~nx0 [File Name]
  Goto :EOF
)

Set SS=0
Set LL=0

:TOP

If %SS%==%~z1 (
  Ping localhost -n 2 > Nul
  Rem 追記できるか確認してエラーにならなかったら終了
  Cmd /c "Type Nul >> %1" 2>Nul
  If Not ERRORLEVEL 1 Goto :EOF
  Goto :TOP
)

Set SS=%~z1

For /f "delims=[] tokens=1*" %%1 In ('Find /n /v "" ^<%1 ^|More +%%LL%%') Do (
  Set LL=%%1
  Echo:%%2
)

Goto :TOP



Rem 「出力オープンされているか」は、Nul が追記できるかを試して確認している。
Rem メモ帳や Notepad++ ではファイルを開いている時もファイルをロックしていないため再現できないが、
Rem サクラエディタはファイルをロックするので、動作を再現できる。
Rem ・バッチファイルで作る tail -f コマンド : http://scripting.cocolog-nifty.com/blog/2007/05/tail_f_0b9c.html