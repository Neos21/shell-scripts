# ================================================================================
# Windows �ŁE�Ȉ� `say` �R�}���h
# ================================================================================

# �����𕶎���ɘA������
$paramArray = $args[0..($args.Length - 1)];
$paramString = $paramArray -join ' ';

# �����ł̕�����w�肪�Ȃ���Β��f����
if([string]::IsNullOrEmpty($paramString)) {
  Write-Host 'Please Input Text';
  exit;
}

# ���b����
$sapi = New-Object -ComObject SAPI.SpVoice;
$sapi.Speak($paramString) | Out-Null;
