#!/usr/bin/env swift

// ====================================================================================================
// Swift で書いたスクリプトを実行できる (MacOS で確認)
// 
// `$ swift ./example.swift` や `$ ./example.swift` (要実行権限) で呼び出せる
// Shebang は `#!/usr/bin/env xcrun swift` や `#!/usr/bin/swift` でも動作する
// ====================================================================================================

import Foundation  // `sqrt()` や `Date` のために必要

print("Swift スクリプト : Start")

Swift.print(sqrt(2))  // `Swift.print()` = `print()`
print("\(Date())")  // UTC

let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
dateFormatter.locale = Locale(identifier: "ja_JP")  // JST
print("\(dateFormatter.string(from: Date()))")

print("Swift スクリプト : Finished")  // `Swift` : 標準ライブラリ、`import Swift` と書いても書かなくても良い・`Foundation` 内ではインポートされている
