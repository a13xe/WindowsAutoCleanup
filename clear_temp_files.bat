@echo off
echo Clearing temporary files...

:: Clear Internet Explorer temporary files
echo Clearing Internet Explorer temporary files...
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8

:: Clear temporary files from all user profiles
echo Clearing temporary files from all user profiles...
ICACLS "%SystemRoot%\System32\config\systemprofile\AppData\Local\Temp" /grant administrators:F /t
rd /s /q "%SystemRoot%\System32\config\systemprofile\AppData\Local\Temp"

:: Clear temporary files from the current user's profile
echo Clearing temporary files from the current user's profile...
ICACLS "%TEMP%" /grant administrators:F /t
rd /s /q "%TEMP%"

echo Temporary files have been cleared.
pause
