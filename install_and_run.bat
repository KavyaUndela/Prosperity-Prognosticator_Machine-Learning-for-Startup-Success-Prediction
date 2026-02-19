@echo off
REM Prosperity Prognosticator - Automated Setup Script
REM This script will install Python and dependencies, then run the app

echo.
echo ========================================
echo Prosperity Prognosticator Setup
echo ========================================
echo.

REM Check if we're in the right directory
if not exist "app.py" (
    echo ERROR: app.py not found. Please run from project directory.
    pause
    exit /b 1
)

echo Step 1: Locating Python...
if exist "python-portable\python.exe" (
    echo Found portable Python
    set PYTHON_EXE=python-portable\python.exe
    goto :skip_download
)

echo Step 2: Downloading Python 3.12.1...
powershell -Command "Invoke-WebRequest -Uri 'https://www.python.org/ftp/python/3.12.1/python-3.12.1-embed-amd64.zip' -OutFile 'python-3.12.1-embed-amd64.zip' -UseBasicParsing"

if not exist "python-3.12.1-embed-amd64.zip" (
    echo ERROR: Failed to download Python
    pause
    exit /b 1
)

echo Step 3: Extracting Python...
powershell -Command "Expand-Archive -Path 'python-3.12.1-embed-amd64.zip' -DestinationPath 'python-portable' -Force"

set PYTHON_EXE=python-portable\python.exe

:skip_download
echo.
echo Step 4: Installing pip...
%PYTHON_EXE% -m ensurepip --default-pip 2>nul || (
    echo Downloading pip bootstrap...
    powershell -Command "Invoke-WebRequest -Uri 'https://bootstrap.pypa.io/get-pip.py' -OutFile 'get-pip.py' -UseBasicParsing"
    %PYTHON_EXE% get-pip.py
)

echo Step 5: Installing Flask and dependencies...
%PYTHON_EXE% -m pip install Flask scikit-learn pandas numpy joblib seaborn matplotlib -q

echo.
echo ✓ Setup complete!
echo.
echo Step 6: Starting application...
echo Access the app at: http://127.0.0.1:5000/
echo Press Ctrl+C to stop
echo.

%PYTHON_EXE% app.py

pause
