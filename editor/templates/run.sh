#!/usr/bin/env bash
# ============================================================================
#  RUN SCRIPT FOR REALISTIC MODULAR PYGAME WORLD (macOS/Linux)
# ============================================================================
# This script automates setup and launch:
# 1) Create a virtual environment if needed
# 2) Install dependencies
# 3) Run the world viewer
# ============================================================================

set -euo pipefail

echo "Checking for Python 3..."
if ! command -v python3 >/dev/null 2>&1; then
    echo "Python 3 is not installed or not in PATH."
    echo "Please install Python 3.8+ and try again."
    exit 1
fi

echo "Checking for virtual environment..."
if [ ! -d "venv" ]; then
    echo "Creating virtual environment (this may take a moment)..."
    python3 -m venv venv
fi

echo "Activating environment..."
# shellcheck disable=SC1091
source "venv/bin/activate"

echo "Installing dependencies..."
python -m pip install -r requirements.txt

echo "Launching World Viewer..."
python run_world.py
