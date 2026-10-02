@echo off
rem Double-click to run the DevFolio test suite
setlocal
cd /d "%~dp0"
title DevFolio - tests

where dotnet >nul 2>nul
if errorlevel 1 (
    echo [!] .NET SDK is not installed. Install .NET 8 SDK from https://dotnet.microsoft.com/download
    pause
    exit /b 1
)

echo Running tests...
dotnet test DevFolio.sln
if errorlevel 1 goto :fail

echo.
echo All tests passed.
pause
goto :eof

:fail
echo.
echo [!] Some tests failed. Read the messages above.
pause
exit /b 1
