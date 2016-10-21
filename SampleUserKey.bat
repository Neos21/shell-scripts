@Echo Off

Rem ユーザにキー入力で処理を指定してもらうサンプル
Rem 
Rem ・ちょっと面倒な処理を簡単なキー入力で呼び出せるショートカットとして
Rem ・処理を実行するかどうかユーザに確認をとるスクリプトとして



Rem このバッチファイルがあるフォルダをカレントフォルダにする (UNC パス上でも OK)
Pushd %0\..



:START
Cls
Echo ────────────────────
Echo キー入力で処理を指定してもらうバッチファイル
Echo.
Echo 以下のいずれかのキーを入力してください。
Echo.
Echo   [exp] エクスプローラを開く
Echo   [i]   IP Config を実行する
Echo   [q]   終了
Echo ────────────────────



:USER_KEY_LOOP
Rem キー入力を受け付ける。「^>」はリダイレクト記号「>」をエスケープしている
Set USER_KEY=
Set /p USER_KEY=コマンド + Enter ^> 

Rem キー入力がされていたら先頭3文字のみにする
If Not "%USER_KEY%" == "" Set USER_KEY=%USER_KEY:~0,3%

Rem キー入力が指定の文字列と一致したら、ラベルで該当処理に移動する
If "%USER_KEY%" == "exp" Goto OPEN_EXPLORER

Rem 先頭1文字のみにする
If Not "%USER_KEY%" == "" Set USER_KEY=%USER_KEY:~0,1%

Rem 「exp」の部分と同様に処理分けする
If "%USER_KEY%" == "i" Goto EXEC_IPCONFIG
If "%USER_KEY%" == "q" Goto QUIT_THIS_BAT

Rem 未入力・もしくはキー入力が一致しない場合はループする
Goto USER_KEY_LOOP



Rem 以降、指定したキーに応じた処理をラベルで分けて記述する



:OPEN_EXPLORER
Echo.
Echo エクスプローラを起動します。

Start Explorer

Rem 処理を一時停止し START ラベルに移動する
Echo.
Pause
Goto START



:EXEC_IPCONFIG
Echo.

Ipconfig

Echo.
Pause
Goto START



:QUIT_THIS_BAT
Echo.
Echo バッチファイルを終了します。
Echo.
Pause
Exit /b



Rem ・主に言語とシステム開発に関して - 開発用のフォルダ構成を自動的に生成してくれるバッチ (プロジェクト用のリポジトリ立ち上げに便利。ついでに用が済んだら自動消滅)
Rem     http://language-and-engineering.hatenablog.jp/entry/20120126/p1
Rem ・主に言語とシステム開発に関して - 開発に役立つ BAT ファイルの書き方・パターン集 (コマンドプロンプトの定石を体系的に学びバッチ中級者になろう)
Rem     http://language-and-engineering.hatenablog.jp/entry/20130502/PatternsOfMSDOSorBAT