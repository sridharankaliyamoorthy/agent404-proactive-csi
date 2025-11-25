#!/bin/bash

# ProActive CSI - Launch Demo Script
# Quick start script to run the Streamlit demo

echo "🚀 ProActive CSI - Agent 404"
echo "================================"
echo ""

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 is not installed. Please install Python 3.8 or higher."
    exit 1
fi

# Check if pip is installed
if ! command -v pip3 &> /dev/null; then
    echo "❌ pip3 is not installed. Please install pip."
    exit 1
fi

# Install dependencies if not already installed
echo "📦 Checking dependencies..."
pip3 install -q -r requirements.txt 2>/dev/null || {
    echo "Installing dependencies..."
    pip3 install -r requirements.txt
}

echo "✅ Dependencies installed"
echo ""

# Load environment variables from .env (required) instead of hardcoding secrets
if [ -f .env ]; then
    # shellcheck disable=SC2046
    export $(grep -v '^#' .env | grep -v '^$' | xargs)
else
    echo "❌ Missing .env file containing required credentials."
    echo "   Please create one based on .env.example and retry."
    exit 1
fi

# Verify required service credentials are present
required_vars=( \
    NATURAL_LANGUAGE_UNDERSTANDING_APIKEY \
    NATURAL_LANGUAGE_UNDERSTANDING_URL \
    SPEECH_TO_TEXT_APIKEY \
    SPEECH_TO_TEXT_URL \
    TEXT_TO_SPEECH_APIKEY \
    TEXT_TO_SPEECH_URL \
)
missing=()
for v in "${required_vars[@]}"; do
    if [ -z "${!v}" ]; then
        missing+=("$v")
    fi
done
if [ ${#missing[@]} -gt 0 ]; then
    echo "❌ Missing required environment variables: ${missing[*]}"
    echo "   Populate them in .env (see .env.example)."
    exit 1
fi

echo "🌐 Starting Streamlit demo..."
echo ""
echo "📊 Demo will open at: http://localhost:8501"
echo ""
echo "Press Ctrl+C to stop the demo"
echo ""

# Run Streamlit
streamlit run app.py

