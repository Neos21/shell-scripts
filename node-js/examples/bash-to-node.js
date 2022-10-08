#!/usr/bin/env bash

# The Following Lines Are Bash Script : Remove The Bash Lines From This File Itself, Then Write To Temp File, And Execute As Node.js Script.
temp_file_path="$(mktemp)---$(basename $0)"
start_line_number="$(awk '/^#!\/usr\/bin\/env node$/ { print FNR }' "$0")"
tail --lines "+${start_line_number}" "$0" > "${temp_file_path}"
node "${temp_file_path}"
rm -f "${temp_file_path}"
exit 0
# End of Bash ================================================================================


#!/usr/bin/env node

console.log(['Hello World', process.cwd(), __dirname, __filename, 'End'].join('\n'));
