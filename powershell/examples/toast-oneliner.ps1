# ====================================================================================================
# Toast 通知するワンライナー
# ====================================================================================================

PowerShell.exe '$m="""通知ワンライナー""";$t=[Windows.UI.Notifications.ToastNotificationManager,Windows.UI.Notifications,ContentType=WindowsRuntime]::GetTemplateContent([Windows.UI.Notifications.ToastTemplateType,Windows.UI.Notifications,ContentType=WindowsRuntime]::ToastText01);$t.GetElementsByTagName("""text""").Item(0).InnerText=$m;[Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier("""Microsoft.Windows.Computer""").Show($t);'
