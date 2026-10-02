@echo off
rem Double-click to run DevFolio locally at http://localhost:5242 (SQL Server LocalDB)
setlocal
cd /d "%~dp0"
title DevFolio - http://localhost:5242

where dotnet >nul 2>nul
if errorlevel 1 (
    echo [!] .NET SDK is not installed. Install .NET 8 SDK from https://dotnet.microsoft.com/download
    pause
    exit /b 1
)

rem The Development database DevFolioDb_Dev is created on SQL Server LocalDB on first start.
where sqllocaldb >nul 2>nul
if errorlevel 1 (
    echo [!] SQL Server LocalDB is not installed. Install it with Visual Studio or SQL Server Express,
    echo     or set ConnectionStrings__DefaultConnection to another server.
    pause
    exit /b 1
)
sqllocaldb start MSSQLLocalDB >nul

start "" cmd /c "timeout /t 10 >nul & start http://localhost:5242"
echo.
echo DevFolio is starting at http://localhost:5242
echo Admin sign-in stays off until Admin:Username and Admin:PasswordHash are set ^(see README^).
echo Close this window to stop it.
echo.
dotnet run --launch-profile http
if errorlevel 1 (
    echo.
    echo [!] Something went wrong. Read the messages above.
    pause
    exit /b 1
)
