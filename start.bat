@echo off
setlocal enableextensions
pushd "%~dp0"
set PATH=%cd%;%PATH%
if defined PROCESSOR_ARCHITEW6432 start "" %SystemRoot%\sysnative\cmd.exe /c "%~nx0" %* & goto :EOF
net session >nul 2>&1 || (
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\GetAdmin.vbs"
echo UAC.ShellExecute "%~nx0", "%*", "", "runas", 1 >> "%temp%\GetAdmin.vbs"
cscript //NOLOGO "%temp%\GetAdmin.vbs"
del /f /q "%temp%\GetAdmin.vbs" >nul 2>&1
exit
)

setlocal enabledelayedexpansion
set /a seconds=5

:wait
if !seconds! gtr 0 (
    echo DON'T CLOSE THIS WINDOW!!!
    echo Left !seconds! seconds...
    timeout /t 1 >nul
    set /a seconds-=1
    cls
    goto wait
)

echo Launching the program...
start "" "LanEmu.exe"
del install.bat
