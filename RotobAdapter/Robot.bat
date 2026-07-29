@echo off & title Robot

echo %~dp0

sc query "RobotAdapter" >nul 2>&1
if %errorlevel% equ 0 (
    echo RobotAdapter Service detected, restarting soon.
    goto RESTART
) else (
    echo RobotAdapter Service doesn't exist, installing now.
    goto INSTALL
)

:INSTALL
set install_path=%~dp0
sc create RobotAdapter displayname= "RobotAdapter" binpath= "%install_path%RobotAdapter.exe" start= auto
echo RobotAdapter Service installed.
net start RobotAdapter
goto Exit

:RESTART
net stop RobotAdapter
net start RobotAdapter
echo RobotAdapter Service restarted.

:Exit
exit /b 0
