#!/bin/bash

# Setup script for Prosperity Prognosticator on macOS/Linux

echo ""
echo "========================================"
echo "Prosperity Prognosticator Setup Script"
echo "========================================"
echo ""

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "ERROR: Python 3 is not installed"
    echo "Please install Python 3 from https://www.python.org/"
    exit 1
fi

echo "[1/5] Python 3 is installed"
python3 --version

# Create virtual environment
echo ""
echo "[2/5] Creating virtual environment..."
python3 -m venv venv
if [ $? -ne 0 ]; then
    echo "ERROR: Failed to create virtual environment"
    exit 1
fi

# Activate virtual environment
echo ""
echo "[3/5] Activating virtual environment..."
source venv/bin/activate
if [ $? -ne 0 ]; then
    echo "ERROR: Failed to activate virtual environment"
    exit 1
fi

# Upgrade pip
echo ""
echo "[4/5] Upgrading pip..."
python -m pip install --upgrade pip
if [ $? -ne 0 ]; then
    echo "WARNING: pip upgrade had issues, continuing anyway"
fi

# Install requirements
echo ""
echo "[5/5] Installing dependencies..."
pip install -r requirements.txt
if [ $? -ne 0 ]; then
    echo "ERROR: Failed to install dependencies"
    exit 1
fi

echo ""
echo "========================================"
echo "Setup Complete!"
echo "========================================"
echo ""
echo "To start the application:"
echo "  1. Run: source venv/bin/activate"
echo "  2. Run: python app.py"
echo "  3. Open browser: http://127.0.0.1:5000/"
echo ""
