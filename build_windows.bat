@echo off
if not exist bin mkdir bin
if "%DEVELOPER_KEY%"=="" (
  echo Set DEVELOPER_KEY to the full path of your Garmin developer_key.der
  echo Example: set DEVELOPER_KEY=C:\Users\YourName\DeveloperKey\developer_key.der
  exit /b 1
)
monkeyc -d fr935 -f monkey.jungle -o bin\Satisfy935.prg -y "%DEVELOPER_KEY%" -r -w
if errorlevel 1 exit /b %errorlevel%
echo Built: bin\Satisfy935.prg
