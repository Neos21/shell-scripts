Rem ^
/*
@Echo Off
Cls



Rem Windows バッチの中に SQL を書いておき SQL*Plus で実行する方法

Sqlplus USER/PASS@ORCL @"%~f0"



Pause
Exit /b
*/



-- ここから SQL*Plus で読み込む SQL

SELECT 1 FROM DUAL;



/*
 * # 動作原理
 * 
 * Windows バッチとして起動すると、1～2行目は「Rem ^」で改行をエスケープし、「Rem /*」として処理する。
 * この Rem がコンソールに表示されるため、直後に @Echo Off と Cls を行っておく。
 * 任意の処理を挟んで Sqlplus コマンドで DB 接続し、「@」で自分自身を SQL スクリプトとして実行させる。
 * 
 * SQL ファイルとしては、1行目は Rem コマンドとして無視、2行目からブロックコメントとして無視される。
 * ブロックコメントの終了以降に SQL を記述しておけば、それが実行される。
 * 
 * SQL*Plus が終了すると、Pause と Exit /b でバッチファイルを終了する。
 * 次の行の「*/」は読み込まれないため無視される。
 * 
 * # 別の書き方
 * 
 * 1行に集約して
 * Rem /? > Nul & @Cls & @Sqlplus USER/PASS@ORCL @"%~0" & @Pause & @Goto :EOF
 * と書いても同様に動作する。
 * 
 * 1行にする場合、Windows バッチに Rem 以降をコマンドとして解釈させるために
 * 「Rem /?」でヘルプを表示させ、Nul にリダイレクトしている。
 * あとは「&」でコマンドを繋いでいくだけ。
 * これで2行目以降に SQL を記述すれば良い。
 */