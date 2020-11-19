@Echo Off

Rem PowerShell を起動する
Rem 
Rem - 「powershell」と打つよりタイプ数を減らすためのエイリアスとしてのスクリプト
Rem - 引数を %* で全て引き渡す
Rem - スクリプトを指定された場合のために -NoExit 指定しておく
Rem - Start を指定しなければコマンドプロンプト内で PowerShell が実行される

Start PowerShell.exe -NoExit %*
