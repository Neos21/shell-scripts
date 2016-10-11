@Echo Off

Rem GitBash を起動するバッチファイル
Rem 
Rem このバッチファイルを PATH を通したフォルダに格納しておけば、
Rem エクスプローラのアドレスバーや「ファイル名を指定して実行」から
Rem 「bash」と入力することで GitBash を起動できる
Rem 
Rem ・初期パスが system32 になる場合は %HOMEPATH% にする



If "%CD%" == "C:\WINDOWS\system32" (
  Cd %HOMEDRIVE%%HOMEPATH%
)

Start "" "C:\Program Files\Git\git-bash.exe"

Exit /b



Rem ・Windows エクスプローラからGit-Bashのコマンドウインドウを開く : http://qiita.com/ysks/items/9dba7bda6378c34939d7