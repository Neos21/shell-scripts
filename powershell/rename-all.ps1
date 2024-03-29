# ================================================================================
# スクリプトを実行したカレントディレクトリにあるファイルについて
# 「メディアの作成日時」もしくは「撮影日時」の値を取得してファイル名先頭に付与 (リネーム) する
# 
# ex. 「HOGE.jpg」→「2019-01-31 HOGE.jpg」
# ================================================================================

# スクリプトを呼び出したカレントディレクトリを指定する
[String]$targetDirectory = Get-Location

Write-Host "`n処理開始 : $targetDirectory"

# 対象ディレクトリ配下のファイルのみをフルパスで取得する
$targetFiles = Get-ChildItem $targetDirectory | Where-Object { ! $_.PSIsContainer } | % { $_.FullName }

# ファイルフルパスを元に1ファイルずつ処理する
foreach($targetFile in $targetFiles) {
  # ディレクトリパスとファイル名に分割する
  $folderPath = Split-Path $targetFile
  $fileName   = Split-Path $targetFile -Leaf
  Write-Host "`n$folderPath : $fileName"
  
  if((Get-Item $targetFile).extension.toLower() -eq ".ps1") {
    Write-Host "  PowerShell スクリプトは処理しない"
    continue
  }
  
  # シェルオブジェクトを作成する
  $shell       = New-Object -ComObject Shell.Application
  $shellFolder = $shell.namespace($folderPath)
  $shellFile   = $shellFolder.parseName($fileName)
  
  # 詳細プロパティからリネームに使用するプロパティ名と値を取得する
  $selectedPropertyNo    = ""
  $selectedPropertyName  = ""
  $selectedPropertyValue = ""
  
  # 詳細プロパティを列挙する : 適当に310項目
  for($i = 0; $i -lt 310; $i++) {
    $propertyName  = $shellFolder.getDetailsOf($Null, $i)
    if($propertyName -eq "メディアの作成日時" -or $propertyName -eq "撮影日時") {
      $propertyValue = $shellFolder.getDetailsOf($shellFile, $i)
      if($propertyValue) {
        # 指定のプロパティに値があった場合のみ取得する
        $selectedPropertyNo    = $i
        $selectedPropertyName  = $propertyName
        $selectedPropertyValue = $propertyValue
        break
      }
    }
  }
  
  if(!$selectedPropertyNo) {
    Write-Host "  プロパティ・もしくはプロパティの値がなかった・リネーム処理できない"
    continue
  }
  else {
    Write-Host "  No.$selectedPropertyNo : $selectedPropertyName [$selectedPropertyValue]"
  }
  
  # 日付をファイル名の先頭に付与する
  $dateTimeStr = $selectedPropertyValue.substring(1, 4) `
                 + "-" + $selectedPropertyValue.substring(7, 2) `
                 + "-" + $selectedPropertyValue.substring(11, 2)
  $newFileName = $dateTimeStr + " " + $fileName
  
  # リネームする
  Rename-Item $targetFile -newName $newFileName
  
  Write-Host "  リネーム完了 : [$newFileName]"
}

Write-Host "`n処理完了"
