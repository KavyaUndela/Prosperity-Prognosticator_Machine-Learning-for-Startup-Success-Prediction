@echo off
REM Run script for Prosperity Prognosticator

echo.
echo ========================================
echo Prosperity Prognosticator
echo ========================================
echo.

REM Check if virtual environment exists
if not exist "venv" (
    echo ERROR: Virtual environment not found
    echo Please run setup.bat first
    pause
    exit /b 1
)

REM Activate virtual environment
echo Activating virtual environment...
call venv\Scripts\activate.bat

REM Run the Flask app
echo.
echo Starting Flask application...
echo.
echo Access the application at: http://127.0.0.1:5000/
echo.
echo Press Ctrl+C to stop the server
echo.

python app.py

pause
