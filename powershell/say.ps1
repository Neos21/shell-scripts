# ================================================================================
# Windows 版・簡易 `say` コマンド
# ================================================================================

# 引数を文字列に連結する
$paramArray = $args[0..($args.Length - 1)];
$paramString = $paramArray -join ' ';

# 引数での文字列指定がなければ中断する
if([string]::IsNullOrEmpty($paramString)) {
  Write-Host 'Please Input Text';
  exit;
}

# 発話する
$sapi = New-Object -ComObject SAPI.SpVoice;
$sapi.Speak($paramString) | Out-Null;
