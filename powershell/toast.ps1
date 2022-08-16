# ====================================================================================================
# 第1引数のメッセージを Toast 通知する
# 
# - PowerShell から実行   : `PS> .\toast.ps1 -Message 'メッセージ'
# - GitBash・WSL から実行 : `$ powershell.exe ./toast.ps1 -Message 'メッセージ'`
# ====================================================================================================

# 引数を指定する・呼び出し時に `-Message 'メッセージ'` と指定できるようになる (`-Message` を指定しなくても良い)
Param(
  [String]$Message = "Notification"
);

$toast = [Windows.UI.Notifications.ToastNotificationManager,Windows.UI.Notifications,ContentType=WindowsRuntime]::GetTemplateContent([Windows.UI.Notifications.ToastTemplateType,Windows.UI.Notifications,ContentType=WindowsRuntime]::ToastText01);
$toast.GetElementsByTagName("text").Item(0).InnerText = $Message;
[Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier("Microsoft.Windows.Computer").Show($toast);
