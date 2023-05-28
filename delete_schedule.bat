@echo off

REM Unregister the task
schtasks /delete /tn "CustomScheds\ClearTempFiles" /f

REM Remove task XML file
del "%SystemRoot%\System32\Tasks\CustomScheds\ClearTempFiles"

echo Scheduler state removed successfully.
pause
