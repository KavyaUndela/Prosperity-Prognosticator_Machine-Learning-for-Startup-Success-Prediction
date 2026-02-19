#!/bin/bash

# Run script for Prosperity Prognosticator on macOS/Linux

echo ""
echo "========================================"
echo "Prosperity Prognosticator"
echo "========================================"
echo ""

# Check if virtual environment exists
if [ ! -d "venv" ]; then
    echo "ERROR: Virtual environment not found"
    echo "Please run setup.sh first"
    exit 1
fi

# Activate virtual environment
echo "Activating virtual environment..."
source venv/bin/activate

# Run the Flask app
echo ""
echo "Starting Flask application..."
echo ""
echo "Access the application at: http://127.0.0.1:5000/"
echo ""
echo "Press Ctrl+C to stop the server"
echo ""

python app.py
