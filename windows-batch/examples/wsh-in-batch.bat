@Echo Off

Rem Windows バッチの中に WSH のコードを混在させる方法
Rem 
Rem WSH のスクリプトファイルをその場で生成して実行、使い終わったらファイルを削除している。
Rem Setlocal と Endlocal の間のファイル生成処理がミソ。
Rem 
Rem ・Find や Findstr は最終行を解釈しないバグがあり、このバッチファイルの最終行が空行でないと処理が完了しなくなってしまう。
Rem   そこで、Type を使ってバッチファイル自身をパイプで渡して Findstr するようにしている。
Rem   こうして、バッチファイル自身の中から、行頭が「VBS:」や「JS:」で始まる行を返し、For 文に使われている。
Rem ・「delims=:」によって、「VBS: [コード]」や「JS: [コード]」のコロン部分で区切れる。
Rem ・「tokens=1*」とアスタリスクを使うと、指定していた最後のトークン = 1 = %%a が解析された後で、
Rem   行に含まれる残りのテキストがその次のトークン = %%b に全て設定される。
Rem   %%b の中に delims と同じ文字列が含まれていても、それは分割されない。
Rem   これにより、%%a が行頭の「VBS」や「JS」という文字列を取得し、delims によって「:」が除去される。
Rem   %%b には残りのテキスト、つまりコードが設定される。
Rem ・このままだと %%b の先頭には「VBS: 」や「JS: 」の末尾の半角スペースが含まれてしまっている。
Rem   そこで、遅延展開を使って %%b をいったん遅延環境変数 !LINE! に入れ、!LINE:~1! とすることで1文字目 = 半角スペースを除去している。
Rem ・「Echo.」のドットは、!LINE:~1! が空になった時に空行として出力させるためのもの。
Rem   Echo コマンドの直後は「.,:;(」あたりの文字を繋げて置いても無視して解釈される。
Rem ・遅延展開をしないようにするには、「VBS:[コード]」のように半角スペースを入れないルールにしておけば、文字列をちぎる処理が不要になる。



Echo Windows バッチによる前処理



Rem VBScript ファイルの生成と実行
Set VBS=TempVBScript.vbs

Setlocal EnableDelayedExpansion
(
  For /f "delims=:, tokens=1*" %%a In ('Type "%~f0" ^| Findstr "^VBS:"') Do (
    Set LINE=%%b
    Echo.!LINE:~1!
  )
) > "%VBS%"
Endlocal

Cscript //NoLogo "%VBS%"

Del /q /f "%VBS%" > Nul 2>&1



Rem JScript ファイルの生成と実行
Set JS=TempJScript.vbs

Setlocal EnableDelayedExpansion
(
  For /f "delims=:, tokens=1*" %%a In ('Type "%~f0" ^| Findstr "^JS:"') Do (
    Set LINE=%%b
    Echo.!LINE:~1!
  )
) > "%JS%"
Endlocal

Cscript //NoLogo //E:JScript "%JS%"

Del /q /f "%JS%" > Nul 2>&1



Echo Windows バッチによる後処理

Pause
Exit /b



Rem ココから VBScript
Rem 
Rem 各行、VBScript のコードの手前に「VBS: 」と書いておく (空行も半角スペースを付与する)。

VBS: Option Explicit
VBS: 
VBS: Sub test()
VBS:   WScript.Echo "VBScript による処理"
VBS: End Sub
VBS: test()



Rem ココから JScript
Rem 
Rem 各行、JScript のコードの手前に「JS: 」と書いておく (空行も半角スペースを付与する)。

JS: var test = function() {
JS:   WScript.Echo("JScript による処理");
JS: }
JS: 
JS: test();



Rem ・Positioning CMD Window : http://www.dostips.com/forum/viewtopic.php?t=4285
