@Echo Off

Pushd %0\..

For /f "tokens=1*" %%a In ('Help') Do (
  Echo.%%a | Findstr /r "^[A-Z][ABCDEFGHIJKLMNOPQRSTUVWXYZ]" > Nul
  If Not ERRORLEVEL 1 (
    Help %%a > %%a.txt
  )
)

Exit /b
