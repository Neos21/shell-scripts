# ====================================================================================================
# ��1�����̃��b�Z�[�W�� Toast �ʒm����
# 
# - PowerShell ������s   : `PS> .\toast.ps1 -Message '���b�Z�[�W'
# - GitBash�EWSL ������s : `$ powershell.exe ./toast.ps1 -Message '���b�Z�[�W'`
# ====================================================================================================

# �������w�肷��E�Ăяo������ `-Message '���b�Z�[�W'` �Ǝw��ł���悤�ɂȂ� (`-Message` ���w�肵�Ȃ��Ă��ǂ�)
Param(
  [String]$Message = "Notification"
);

$toast = [Windows.UI.Notifications.ToastNotificationManager,Windows.UI.Notifications,ContentType=WindowsRuntime]::GetTemplateContent([Windows.UI.Notifications.ToastTemplateType,Windows.UI.Notifications,ContentType=WindowsRuntime]::ToastText01);
$toast.GetElementsByTagName("text").Item(0).InnerText = $Message;
[Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier("Microsoft.Windows.Computer").Show($toast);
