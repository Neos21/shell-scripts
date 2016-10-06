@Echo Off

Rem Touch コマンドもどき
Rem 
Rem Usage : touch [ファイルパス]
Rem ・指定のファイルがなければ空ファイルを新規作成する
Rem ・指定のファイルがあれば更新日時を更新する



Rem 引数がなければ何もしない
If %1. ==. Goto :EOF

If Not Exist %1 (
  Rem ファイルがなければ作る
  Type Nul > %1
) Else (
  Rem ファイルがあれば日付を更新する
  Copy /b %1 +,, > Nul
)

Exit /b



Rem ・ワイの Windows にも touch コマンドがやってきたで！ヤァ！ヤァ！ヤァ！ : http://gabekore.org/windows-touch-command