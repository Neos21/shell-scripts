@Echo Off

Rem Wait (Sleep) 処理を実現するサンプル
Rem 
Rem 以下のサンプルはいずれも 3 秒停止する



Echo.
Echo Ping コマンドで Wait 処理 (一番色々な環境で使えるか・「指定の秒数 + 1」を引数に与える)
Ping localhost -n 4 > Nul

Echo.
Echo Choice コマンドで Wait 処理 (キー入力により動作が中断するかも)
Choice /c yn /d y /t 3 > Nul

Echo.
Echo Timeout コマンドで Wait 処理 (Windows Vista 以降の標準コマンド・キー入力で終了する)
Timeout 3 > Nul

Echo.
Echo Sleep コマンドで Wait 処理 (Windows Server 2003 Resource Kit Tools に含まれるコマンド)
Sleep 3

Pause
Exit /b



Rem ・Windows のコマンドプロンプトで sleep する3つの方法 : https://www.xmisao.com/2013/11/19/how-to-sleep-in-windows-command-prompt.html
Rem     ・ローカルホストに ping して試行回数により停止時間を制御する方法。
Rem       127.0.0.1 が必ず応答し、かつ ping の送信間隔が1秒であることを応用したもの。
Rem     ・choice はユーザに選択をさせるコマンドである。このコマンドはユーザに選択肢を提示し、一定時間入力がなければ、デフォルトが選択されたものとみなす。
Rem       choice は /t スイッチでタイムアウトを設定できる。
Rem ・Windows の timeout / sleep コマンドで実行を一時停止する : http://www.atmarkit.co.jp/ait/articles/1206/08/news137.html
Rem     ・Windows Vista / Windows Server 2003 以降の Windows OS には、timeout.exe というコマンドが用意されている。
Rem       元々は Windows 2000 の Resource Kit に含まれていたツール。
Rem       単に指定された時間を待つだけでなく、途中で何らかのキー入力をすると、そこで終了する (休止を中断する)。
Rem       sleep コマンドというよりは、最大待ち時間制限付きの pause コマンドという感じのコマンドである。
Rem     ・一番新しい sleep.exe は Windows Server 2003 Resource Kit Tools に含まれている。
Rem ・ Windows Server 2003 Resource Kit Tools : https://www.microsoft.com/en-us/download/details.aspx?id=17657
