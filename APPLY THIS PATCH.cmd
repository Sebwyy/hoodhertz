@echo off
NET SESSION >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo You must run this script as an administrator.
    pause
    exit /b
)

set hosts=%systemroot%\System32\drivers\etc\hosts

icacls %hosts% /grant "All:(F)" /t
icacls %hosts% /grant "Users:(R)" /t

attrib -s -h -r %hosts%

(echo.
echo 127.0.0.1 www.expatriate.goodhertz.co
echo 127.0.0.1 expatriate.goodhertz.co
echo 127.0.0.1 goodhertz.com
echo 0.0.0.0 juce.com
echo 0.0.0.0 www.juce.com
)>>%hosts%

icacls %hosts% /remove:g "All"
icacls %hosts% /remove:g "Users"

ipconfig /flushdns

echo Entries are added to the hosts file.
pause
