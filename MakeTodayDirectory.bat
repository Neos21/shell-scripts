@Echo Off

Rem 指定のフォルダの配下に今日日付の「YYYYMMDD」フォルダを作成する



Rem ユーザ設定変数

Rem 今日日付のフォルダを作成する親フォルダのパス。「\」で終えること
Set BASE_DIR=C:\Test\



Rem 環境変数より今日日付を取得し「YYYYMMDD」の形式を作成する
Set TODAY=%DATE:~0,4%%DATE:~5,2%%DATE:~8,2%

Rem フォルダのフルパスを作っておく
Set TODAY_DIR=%BASE_DIR%%TODAY%

Rem フォルダを作成する
Mkdir %TODAY_DIR%

Rem 作ったフォルダをエクスプローラで開く
Start Explorer "%TODAY_DIR%

Exit /b



Rem ・主に言語とシステム開発に関して - 開発時に SVN リポジトリのディレクトリ上にコミットしておきたいバッチファイル : http://language-and-engineering.hatenablog.jp/entry/20101109/p1
Rem ・特定のフォルダ配下に今日日付のフォルダを作成する Windows バッチ : http://neos21.hatenablog.com/entry/2016/01/23/160433