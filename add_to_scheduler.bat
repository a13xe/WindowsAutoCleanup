@echo off

REM Create folder in Task Scheduler Library
schtasks /Create /TN "\CustomScheds" /RL HIGHEST /SC DAILY /F

REM Add scheduler task action
schtasks /Create /TN "\CustomScheds\ClearTempFiles" /SC DAILY /TR "RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8" /RU SYSTEM
REM Grant administrators full control to systemprofile\AppData\Local\Temp
icacls "%SystemRoot%\System32\config\systemprofile\AppData\Local\Temp" /grant administrators:F /t
REM Grant administrators full control to %TEMP%
icacls "%TEMP%" /grant administrators:F /t
REM Grant administrators full control to %SystemRoot%\Temp
icacls "%SystemRoot%\Temp" /grant administrators:F /t

pause