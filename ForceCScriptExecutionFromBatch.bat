' 2> Nul & @Cls & @Cscript //NoLogo //E:VBScript "%~f0" %* & @Goto :EOF

' Windows バッチファイル自身を VBScript として呼び出すことで必ず CScript として起動させる方法

WScript.Echo "VBScript で標準出力。2秒後に終了します。"
WScript.Sleep(2000)
WScript.Quit



' 先頭の「' 2> Nul」は、Windows バッチとしてはエラーを表示させないようにさせつつ、
' VBScript として実行させるときはコメントアウトとして扱うためのもの。
' この文字列がどうしてもプロンプトに出てしまうので、Cls でクリアしている。
' あとは「&」でコマンドをつなぎ、自分自身を VBScript エンジンで起動させ、Windows バッチを終了させる。
' 
' 参考：http://detail.chiebukuro.yahoo.co.jp/qa/question_detail/q11118013486