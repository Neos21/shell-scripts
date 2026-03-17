#Requires -RunAsAdministrator

# ====================================================================================================
# DNS 設定変更ツール : 管理者権限で実行する必要アリ
# ====================================================================================================

# パラメータを変数 `$mode` で受け取る・`param()` はスクリプト先頭に書く必要アリ
param([ValidateSet('set-cloudflare', 'set-google', 'restore', 'open')] [string]$mode = '');

Write-Host '------------------';
Write-Host 'DNS 設定変更ツール';
Write-Host '------------------';
Write-Host '';

# メインのネットワークインターフェースを取得する
$iface = Get-NetRoute -DestinationPrefix '0.0.0.0/0' | Sort-Object RouteMetric | Select-Object -First 1;
$alias = $iface.InterfaceAlias;
Write-Host "対象のネットワークインターフェース : $alias";
Write-Host '';

# 現在の DNS を取得する
$current = Get-DnsClientServerAddress -InterfaceAlias $alias;
Write-Host '現在の DNS :';
$current.ServerAddresses | ForEach-Object { Write-Host "  $_"; };
Write-Host '';

if ($mode -eq 'set-cloudflare') {
  Write-Host 'Cloudflare DNS に設定します…';
  $cloudflareIPv4 = '1.1.1.1', '1.0.0.1';
  $cloudflareIPv6 = '2606:4700:4700::1111', '2606:4700:4700::1001';
  Set-DnsClientServerAddress -InterfaceAlias $alias -ServerAddresses ($cloudflareIPv4 + $cloudflareIPv6);
  Write-Host 'Cloudflare DNS に設定しました';
}
elseif ($mode -eq 'set-google') {
  Write-Host 'Google Public DNS に設定します…';
  $googleIPv4 = '8.8.8.8', '8.8.4.4';
  $googleIPv6 = '2001:4860:4860::8888', '2001:4860:4860::8844';
  Set-DnsClientServerAddress -InterfaceAlias $alias -ServerAddresses ($googleIPv4 + $googleIPv6);
  Write-Host 'Google Public DNS に設定しました';
}
elseif ($mode -eq 'restore') {
  Write-Host 'デフォルト設定 DHCP DNS に設定します…';
  Set-DnsClientServerAddress -InterfaceAlias $alias -ResetServerAddresses;
  Write-Host 'デフォルト設定 DHCP DNS に戻しました';
}
elseif ($mode -eq 'open') {
  Write-Host '「ネットワークの状態」ウィンドウを開きます…';
  $shell = New-Object -ComObject Shell.Application;
  $folder = $shell.Namespace('shell:ConnectionsFolder');
  foreach ($item in $folder.Items()) {
    if ($item.Name -eq $alias) {
      $item.InvokeVerb('Status');
    }
  }
  Write-Host '「ネットワークの状態」ウィンドウを開きました。「プロパティ」の中から IPv4・IPv6 設定が GUI で確認できます';
}
else {
  Write-Host '- `set-cloudflare` を指定すると Cloudflare DNS に設定変更します (IPv4・IPv6 両対応)';
  Write-Host '- `set-google` を指定すると Cloudflare DNS に設定変更します (IPv4・IPv6 両対応)';
  Write-Host '- `restore` を指定するとデフォルト設定 DHCP DNS に変更します';
  Write-Host '- `open` を指定すると「ネットワークの状態」ウィンドウを開きます。「プロパティ」の中から IPv4・IPv6 設定が GUI で確認できます';
}

Write-Host '';
