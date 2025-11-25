"""
Quick launcher for Deepnote
Run this in a Deepnote notebook cell or terminal
"""

import subprocess
import sys
import os

# Install dependencies if needed
print("📦 Checking dependencies...")
try:
    import streamlit
    import plotly
    import pandas
    print("✅ All dependencies installed")
except ImportError:
    print("⚠️ Installing missing dependencies...")
    subprocess.check_call([sys.executable, "-m", "pip", "install", "-q", "streamlit", "plotly", "pandas"])

# Run Streamlit
print("🚀 Starting Streamlit app...")
print("📍 Deepnote will provide a URL in the output below")
print("=" * 50)

# Use the optimized app file
app_file = "deepnote_app.py" if os.path.exists("deepnote_app.py") else "app.py"

subprocess.run([
    sys.executable, "-m", "streamlit", "run",
    app_file,
    "--server.port", "8501",
    "--server.address", "0.0.0.0",
    "--server.headless", "true",
    "--server.enableCORS", "false",
    "--server.enableXsrfProtection", "false"
])

