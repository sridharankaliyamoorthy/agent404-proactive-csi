# 🚀 Deepnote Setup Guide

## Quick Start

1. **Import this project to Deepnote:**
   - Go to https://deepnote.com
   - Click "New Project" → "Import from GitHub" (if you have it on GitHub)
   - OR upload the project folder directly

2. **Install Dependencies:**
   ```bash
   pip install -r requirements.txt
   ```

3. **Run Streamlit:**
   ```bash
   streamlit run app.py --server.port 8501 --server.address 0.0.0.0
   ```

4. **Access the App:**
   - Deepnote will show a URL in the output
   - Click on it to open the app in a new tab

## Alternative: Run in Deepnote Notebook

Create a new notebook cell and run:

```python
!pip install streamlit plotly pandas -q

import subprocess
import sys

# Run streamlit
subprocess.run([
    sys.executable, "-m", "streamlit", "run", 
    "app.py",
    "--server.port", "8501",
    "--server.address", "0.0.0.0",
    "--server.headless", "true"
])
```

## Deepnote-Specific Optimizations

- Use `0.0.0.0` as address to allow external access
- Port 8501 is typically available
- Deepnote handles the URL forwarding automatically

## Troubleshooting

- If port 8501 is busy, try 8502, 8503, etc.
- Make sure all data files are uploaded to Deepnote
- Check that agents folder is in the project root

