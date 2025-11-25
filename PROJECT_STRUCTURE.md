# 📁 Project Structure

## 🗂️ Organization

```
agent404-proactive-csi-2.0/
│
├── 📄 app.py                    # Main Streamlit application (LOCAL)
├── 📄 requirements.txt          # Python dependencies
├── 📄 README.md                 # Main project documentation
│
├── 📁 agents/                   # AI Agents
│   ├── customer_success_agent.py
│   ├── procurement_agent.py
│   └── revenue_agent.py
│
├── 📁 workflows/                # Workflow Orchestration
│   └── orchestrator.py
│
├── 📁 data/                     # Data Files
│   ├── customer_success_data.csv
│   ├── procurement_vendor_data.csv
│   ├── revenue_exposure_data.csv
│   ├── support_tickets.csv
│   ├── customer_comms.csv
│   └── contracts.csv
│
├── 📁 docs/                     # Documentation
│   ├── deployment/              # Deployment guides
│   │   ├── DEEPNOTE_DEPLOY_NOW.md
│   │   ├── DEEPNOTE_INSTRUCTIONS.md
│   │   ├── DEEPNOTE_QUICK_START.md
│   │   ├── DEEPNOTE_SETUP.md
│   │   ├── Deepnote_Setup.ipynb
│   │   ├── deepnote_app.py
│   │   ├── run_deepnote.py
│   │   └── UPLOAD_CHECKLIST.txt
│   │
│   └── setup/                   # Setup guides
│       └── RUN_LOCALLY.md
│
├── 📁 website/                  # Next.js Frontend (Vercel)
│   └── (Next.js project files)
│
└── 📁 config/                   # Configuration files
    └── (IBM agent configs, etc.)
```

## 🚀 Quick Start

### Local Development
```bash
streamlit run app.py
```
Access at: http://localhost:8501

### Deepnote Deployment
See: `docs/deployment/DEEPNOTE_DEPLOY_NOW.md`

### Vercel Deployment
See: `website/` folder and `vercel.json`

## 📋 Main Files

- **app.py** - Main Streamlit application (use this for local)
- **requirements.txt** - Install dependencies
- **README.md** - Project overview

## 📚 Documentation

- **Local Setup**: `docs/setup/RUN_LOCALLY.md`
- **Deepnote**: `docs/deployment/DEEPNOTE_DEPLOY_NOW.md`
- **Project Info**: `README.md`

