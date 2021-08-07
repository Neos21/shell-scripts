@Echo Off

Rem ビープ音を鳴らす



Echo このあとビープ音を鳴らします。
Pause

Rem Beep!
Echo 

Echo ビープ音を鳴らしました。終了します。

Pause
Exit /b



Rem ベル文字という、制御文字の一種を Echo コマンドに渡す。
Rem   Code  : BEL
Rem   ASCII : 7
Rem   Caret : ^G
Rem   Unicode : U+2407 \
Rem コマンドプロンプト上では、「Echo 」の後に Ctrl + G とタイプすることで「Echo ^G」と表示され、
Rem このまま Enter を押下すればビープ音が出力される。
Rem Windows バッチファイルに入力するには、制御文字を表示できるテキストエディタを使用すると良い。
Rem 今回は Notepad++ にて、Ctrl + Shift + G で BEL 文字を入力した。
