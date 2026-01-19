@echo off
REM GitHub Pages Local Testing Script for Windows
REM This script helps you test the site locally before pushing to GitHub

setlocal enabledelayedexpansion

echo.
echo ================================
echo EaglercraftX GitHub Pages Setup
echo ================================
echo.

REM Check if Java is installed
java -version >nul 2>&1
if errorlevel 1 (
    echo Error: Java is not installed or not in PATH
    echo Please install Java 11 or later (Java 17 recommended)
    exit /b 1
)

echo Java version:
java -version
echo.

REM Check which step to run
if "%1%"=="build" goto build
if "%1%"=="" goto build

if "%1%"=="serve" goto serve
if "%1%"=="" goto build

if "%1%"=="help" goto help

:build
echo Step 1: Compiling EPK...
if not exist "CompileEPK.bat" (
    echo Error: CompileEPK.bat not found
    exit /b 1
)
call CompileEPK.bat
if errorlevel 1 exit /b 1
echo EPK compilation complete!
echo.

echo Step 2: Compiling JavaScript...
if not exist "CompileJS.bat" (
    echo Error: CompileJS.bat not found
    exit /b 1
)
call CompileJS.bat
if errorlevel 1 exit /b 1
echo JavaScript compilation complete!
echo.

:serve
echo Step 3: Starting local HTTP server...
echo.

cd javascript
echo Server running at: http://localhost:8000/
echo Press Ctrl+C to stop
echo.
python -m http.server 8000
if errorlevel 1 (
    python3 -m http.server 8000
)
exit /b 0

:help
echo Usage: setup-github-pages.bat [command]
echo.
echo Commands:
echo   (no command)  - Build and serve locally
echo   build         - Only compile the project
echo   serve         - Only start local server (assumes already built)
echo   help          - Show this help message
echo.
exit /b 0
