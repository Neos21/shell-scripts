: <<EOF
@Echo Off
Goto WINDOWS
EOF
exec cmd //c ${0//\//\\\\} $*
:WINDOWS

@Rem GitBash から直接実行してもコマンドプロンプトから実行しても必ず Windows バッチファイルとして実行されるファイルを作る
@Rem 
@Rem - GitBash からこのバッチファイルを直接実行した時は1行目から `EOF` までの行がヒアドキュメントとして無視され
@Rem   `exec cmd` の行によって Windows コマンドプロンプトで自身を開き直す
@Rem - `cmd.exe` でこのバッチファイルを実行した時は1行目がラベル扱いになり `Goto` コマンドから `:WINDOWS` ラベルの行に移動する
@Rem   よってそれ以降に書かれた行が Windows バッチファイルとして必ず実行される

Echo Hello World
Pause

Exit /b
