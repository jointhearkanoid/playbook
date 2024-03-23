@echo off
setlocal

:: Navegar a la clave del Registro y obtener el valor de EditionID
for /f "tokens=3" %%a in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v EditionID 2^>nul ^| find "EditionID"') do (
    set "EditionID=%%a"
)

:: Verificar el valor de EditionID y realizar las acciones correspondientes
if /i "%EditionID%"=="Professional" (
    reg import "2. Deshabilitar Sincronización.reg"
    goto :end
) elseif /i "%EditionID%"=="Home" (
    REGEDIT /s "2. Deshabilitar Sincronización.reg"
    goto :end
) else (
    echo La edición no coincide con ninguna acción definida.
)

:end
endlocal