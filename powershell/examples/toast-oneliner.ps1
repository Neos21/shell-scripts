# ====================================================================================================
# Toast �ʒm���郏�����C�i�[
# ====================================================================================================

PowerShell.exe '$m="""�ʒm�������C�i�[""";$t=[Windows.UI.Notifications.ToastNotificationManager,Windows.UI.Notifications,ContentType=WindowsRuntime]::GetTemplateContent([Windows.UI.Notifications.ToastTemplateType,Windows.UI.Notifications,ContentType=WindowsRuntime]::ToastText01);$t.GetElementsByTagName("""text""").Item(0).InnerText=$m;[Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier("""Microsoft.Windows.Computer""").Show($t);'
