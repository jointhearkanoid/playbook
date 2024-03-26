@echo off
setlocal

:: Navigate to the registry key and get the EditionID value
for /f "tokens=3" %%a in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v EditionID 2^>nul ^| find "EditionID"') do (
    set "EditionID=%%a"
)

:: Check the value of EditionID and take corresponding actions
if /i "%EditionID%"=="Professional" (
    reg import "Tweakes.reg"
    goto :end
) else if /i "%EditionID%"=="Core" (
    REGEDIT /s "Tweakes.reg"
    goto :end
) else (
    echo Edition does not match any defined action.
)

:end
endlocal
