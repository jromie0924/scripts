@echo off
set runningVMs=
for /f %%o in ('vboxmanage list runningvms') do (
    if %%o=="Ubuntu" set runningVMs=%%o
)

if "%runningVMs%"=="" (
    call virtualMachineStartup.bat
)
exit 0