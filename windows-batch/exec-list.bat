@Echo Off

Rem list.exe の実行ヘルパー
Rem 
Rem Windows Server 2003 Resource Kit Tools に同梱されている
Rem list.exe の設定ファイルを生成し、実行します。
Rem 
Rem ・https://www.microsoft.com/en-us/download/details.aspx?id=17657
Rem 
Rem list.exe と同じフォルダにこのバッチファイルを置き、
Rem 開きたいファイルをこのバッチファイルにドラッグ・アンド・ドロップしてください。



Rem このバッチファイルがあるフォルダをカレントフォルダにする (UNC パス上でも OK)
Pushd %0\..

Rem list.exe がなかったら中断
If Not Exist list.exe (
  Echo list.exe not found.
  Pause
  Exit /b
)

Rem 引数1 (ドラッグ・アンド・ドロップしたファイル) がなければ中断
If '%1' == '' (
  list.exe /?
  Pause
  Exit /b
)

Rem 環境設定を行う tools.ini がなければ生成する
If Not Exist tools.ini (
  (
    Echo [list]
    Echo tab 2
    Echo tcolor 1B
    Echo lcolor 0A
    Echo hcolor 1E
    Echo bcolor 3B
    Echo ccolor 1A
    Echo kcolor 0A
  ) > tools.ini
)

Rem tools.ini を読み込ませるための環境変数を設定する
Set INIT=%~dp0

Rem list.exe を実行する
list.exe %1

Pause
Exit /b



Rem 参考
Rem ・https://support.microsoft.com/ja-jp/kb/206848
Rem     List.exe ツールは単純なテキスト表示 / 検索ツールで、ファイルの内容を表示します。
Rem ・https://groups.google.com/forum/m/#!topic/microsoft.public.win32.programmer.tools/IkzI5PxkphE