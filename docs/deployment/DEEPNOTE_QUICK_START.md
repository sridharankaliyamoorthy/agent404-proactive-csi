# 🚀 Deepnote Quick Start

## Option 1: Upload & Run (Recommended)

1. **Go to https://deepnote.com and sign in**

2. **Create New Project:**
   - Click "New Project"
   - Choose "Upload files" or "Import from GitHub"

3. **Upload these files/folders:**
   - `deepnote_app.py` (or `app.py`)
   - `agents/` folder
   - `data/` folder
   - `requirements.txt`
   - `workflow_orchestrator.py`

4. **Open Terminal in Deepnote and run:**
   ```bash
   pip install -r requirements.txt
   python run_deepnote.py
   ```

5. **Or run in a Notebook cell:**
   ```python
   !pip install streamlit plotly pandas -q
   !python run_deepnote.py
   ```

## Option 2: Direct Notebook Cell

Copy this into a Deepnote notebook cell:

```python
# Install dependencies
!pip install streamlit plotly pandas -q

# Run the app
import subprocess
import sys

subprocess.run([
    sys.executable, "-m", "streamlit", "run",
    "deepnote_app.py",  # or "app.py"
    "--server.port", "8501",
    "--server.address", "0.0.0.0",
    "--server.headless", "true"
])
```

## What to Expect

- Deepnote will show a URL in the output
- Click the URL to open your Streamlit app
- The app will be accessible in a new tab
- All features work the same as local version

## Troubleshooting

- **Port busy?** Change `8501` to `8502` or `8503`
- **Import errors?** Make sure all folders are uploaded
- **IBM Agent not loading?** Check internet connection in Deepnote

## Benefits of Deepnote

✅ Cloud-based - no local setup needed
✅ Shareable URLs for demos
✅ Persistent environment
✅ Better for presentations
✅ No port forwarding needed
