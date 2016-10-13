@Echo Off

Rem ウィンドウを最小化した状態で起動する

If Not "%~0" == "%~dp0.\%~nx0" (
  Start /min Cmd /c, "%~dp0.\%~nx0" %*
  Goto :EOF
)



Rem このバッチファイルがあるフォルダをカレントフォルダにする (UNC パス上でも OK)
Pushd %0\..

Echo 何らかの処理

Pause
Exit /b



Rem ・Torutk - Windows バッチファイル: http://www.torutk.com/projects/swe/wiki/Windows%E3%83%90%E3%83%83%E3%83%81%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB
Rem ・マコトのおもちゃ箱 - Windows バッチファイル (.bat) を最小化した状態で起動する : http://piyopiyocs.blog115.fc2.com/blog-entry-731.html
Rem ・火蛾の灯樹 - バッチファイルを最小化して起動 : http://d.hatena.ne.jp/firedfly/20091124/p1
Rem     @If Not "%~0" == "%~dp0.\%~nx0" Start /min Cmd /c, "%~dp0.\%~nx0" %* & Goto :EOF
Rem ・火蛾の灯樹 - バッチファイルの限界 : http://d.hatena.ne.jp/firedfly/20091125
Rem     cmd /c, とカンマが入っているのは、ファイル名に空白を含むファイルを D&D したとき用です。
Rem     カンマがないとコマンドラインから呼んだときは上手くいくのに、D&D したときだけ失敗します。
Rem     カンマの代わりにセミコロンでもよく、この二つは引数の区切りに使うので、なにかしら半角空白の処理に関する仕様がありそうです。