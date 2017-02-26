@Echo Off

Rem 指定のフォルダの配下に今日日付の「YYYYMMDD」フォルダを作成する



Rem ユーザ設定変数

Rem 今日日付のフォルダを作成する親フォルダのパス。「\」で終えること
Set BASE_DIR=C:\Test\



Rem 環境変数より今日日付を取得し「YYYYMMDD」の形式でフォルダ名を作成する
Set TODAY_DIR=%DATE:~0,4%%DATE:~5,2%%DATE:~8,2%

Rem 親フォルダに移動する
Pushd %BASE_DIR%

Rem 今日日付を含むフォルダが既に作られていないか確認する
Dir /a:d /b %TODAY_DIR%* > Nul 2>&1

Rem なさそうならフォルダを作成しエクスプローラで開いて終わり
If Not "%ERRORLEVEL%" == "0" (
  Md %TODAY_DIR%
  Start "" "%BASE_DIR%%TODAY_DIR%"
  Exit /b
)

Rem 既に今日日付を含むフォルダがありそうならそれを開く
Rem (複数存在する場合は名前順で最後に登場するフォルダが開く)
For /f "delims=" %%a In ('Dir /a:d /b %TODAY_DIR%*') Do Set DIR_NAME=%%a
Start "" "%BASE_DIR%%DIR_NAME%"
Exit /b



Rem ・主に言語とシステム開発に関して - 開発時に SVN リポジトリのディレクトリ上にコミットしておきたいバッチファイル : http://language-and-engineering.hatenablog.jp/entry/20101109/p1
Rem ・特定のフォルダ配下に今日日付のフォルダを作成する Windows バッチ : http://neos21.hatenablog.com/entry/2016/01/23/160433
Rem ・意外に知らない Start コマンドの使い方 : http://orangeclover.hatenablog.com/entry/20090814/1250261637