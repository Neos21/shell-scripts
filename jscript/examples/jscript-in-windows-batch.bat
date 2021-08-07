@if(0)==(0) Echo Off

Rem Windows バッチの中に JScript のコードを混在させる方法



Echo Windows バッチによる前処理

Rem JScript の呼び出し
Cscript //NoLogo //E:JScript "%~f0" %*

Echo Windows バッチによる後処理

Pause
Exit /b

@end

// ココから JScript

WScript.echo("WSH JScript による処理");



/*
 * # 動作原理
 * 
 * - Windows バッチファイルとして保存するので、まずは Windows バッチとして1行目が評価される。
 *   @ でコンソール出力はされず、0 == 0 は当然 true なので Echo Off となる。
 * - そこから @end という行の直前までは Windows バッチとして動作する。
 *   Exit /b なり Goto :EOF なりで、バッチファイルは終了させれば、それ以降の行は読み込まれない。
 * - 途中で CScript で自分自身を JScript として実行させている。
 * 
 * - JScript としてこのファイルを1行目から評価していくと、@if から @end までは
 *   「@if・@elif・@else・@end ステートメント」という JScript 独自の構文として解釈される。
 * - 1行目の @if(0)==(0) は @if ステートメントで if(0) とみなされる。
 *   0 は false 扱いなので、条件に一致せず、@end までの中身は評価・実行されなくなる。
 * 
 * # 参考
 * 
 * - JScript でハマる日々 : http://d.hatena.ne.jp/miya2000/20090823/p0
 * - BAT と WSH のコードを1ファイルに混在させるための shebang 記法 : http://computer-technology.hateblo.jp/entry/20131025/p1
 * - @if...@elif...@else...@end ステートメント : https://msdn.microsoft.com/ja-jp/library/ct27x3xa.aspx
 * - MS-DOS のバッチファイルに、WSH (JScript) のコードを記述する : http://www.odin.hyork.net/write/write0028.html
 *     こちらは @if(1==1) で JScript にも true 判定させるが、直後からブロックコメントとして囲む書き方。
 */
