@echo off
IF "%1"=="" goto missingadaptername
IF [%2]==[] (
set /a throttlelimit=2
)
:loop 
set /a num=%random% * 100 / 32768 + 1 
IF %num% LSS %throttlelimit% (
echo "Resetting adapter %1..."
wmic path win32_networkadapter where NetConnectionId="%1" call disable > nul
wmic path win32_networkadapter where NetConnectionId="%1" call enable >nul
timeout /t 10 >nul
)
goto loop
:missingadaptername
echo "Adapter Name Missing!!!"
