# 📁 Project Structure

## Overview

This document describes the organized folder structure of the ProActive CSI Agent 404 project.

---

## 📂 Root Directory

```
agent404-proactive-csi-2.0/
├── README.md                    # Main project README
├── CHANGELOG.md                 # Version history and changes
├── LICENSE                      # Project license
├── VERSION                      # Current version (2.6.0)
├── requirements.txt             # Python dependencies
├── app.py                       # Main Streamlit application
│
├── deploy_ibm.sh                # Quick CLI deployment script
├── deploy_docker.sh             # Quick Docker deployment script
│
├── agents/                       # Agent implementations
│   ├── __init__.py
│   ├── customer_success_agent.py
│   ├── procurement_agent.py
│   └── revenue_agent.py
│
├── config/                       # Configuration files
│   ├── proactive-csi-agent-orchestrate.yaml
│   └── proactive-csi-agent.yaml
│
├── data/                         # Data files (CSV)
│   ├── contracts.csv
│   ├── customer_comms.csv
│   ├── customer_success_data.csv
│   ├── procurement_vendor_data.csv
│   ├── revenue_exposure_data.csv
│   └── support_tickets.csv
│
├── docker/                       # Docker files
│   ├── Dockerfile
│   ├── Dockerfile.ibm
│   ├── docker-compose.yml
│   ├── docker-compose.ibm.yml
│   └── deploy_with_docker.sh
│
├── docs/                         # Documentation
│   ├── deployment/               # Deployment guides
│   ├── features/                 # Feature documentation
│   ├── guides/                   # User guides and test queries
│   ├── project_management/       # Project summaries
│   ├── commits/                  # Commit summaries
│   ├── testing/                  # Testing guides
│   └── troubleshooting/         # Troubleshooting guides
│
├── integrations/                 # Integration modules
│   ├── __init__.py
│   ├── cloudant_adapter.py
│   └── ibm_services.py
│
├── scripts/                      # Scripts
│   ├── deployment/               # Deployment scripts
│   ├── docker/                   # Docker scripts
│   ├── testing/                  # Testing scripts
│   └── run_demo.sh
│
├── tests/                        # Unit tests
│   ├── __init__.py
│   └── test_agents.py
│
├── workflows/                    # Workflow orchestrators
│   ├── __init__.py
│   └── orchestrator.py
│
└── logs/                         # Log files (gitignored)
```

---

## 📚 Documentation Structure

### `docs/deployment/`
Deployment guides and instructions:
- `COMPLETE_DEPLOYMENT_SUMMARY.md` - Full deployment guide
- `DEPLOYMENT_SUMMARY.md` - Quick deployment summary
- `DEPLOY_NOW_WITH_CLOUDANT.md` - Cloudant deployment guide
- `IBM_DEPLOYMENT_GUIDE.md` - IBM deployment guide
- `DOCKER_DEPLOYMENT_GUIDE.md` - Docker deployment guide
- `DOCKER_DEPLOYMENT_SUMMARY.md` - Docker quick reference
- Plus other deployment-related docs

### `docs/features/`
Feature documentation:
- `CLOUDANT_README.md` - Cloudant integration guide
- `CLOUDANT_INTEGRATION.md` - Integration details
- `CLOUDANT_INTEGRATION_COMPLETE.md` - Complete guide
- `CLOUDANT_QUICK_REFERENCE.md` - Quick reference
- Plus other feature docs

### `docs/guides/`
User guides and test resources:
- `TEST_QUERIES.txt` - Test queries for agent
- `DATA_COMPARISON_REPORT.md` - CSV vs Cloudant comparison
- Plus other guides

### `docs/project_management/`
Project management documents:
- Project summaries
- Status reports
- Action plans

### `docs/commits/`
Commit summaries:
- `COMMIT_SUCCESS.md` - Commit success notes
- `FINAL_COMMIT_SUMMARY.md` - Final commit summary
- `PRE_COMMIT_SUMMARY.md` - Pre-commit checklist

### `docs/testing/`
Testing guides:
- Testing procedures
- Test scripts documentation

### `docs/troubleshooting/`
Troubleshooting guides:
- Common issues and solutions
- Fix guides

---

## 🚀 Scripts Structure

### `scripts/deployment/`
Deployment scripts:
- `deploy_auto_ibm_cli.sh` - Automated CLI deployment
- `deploy_to_ibm_orchestrate_now.sh` - Portal deployment
- `auto_deploy_with_cloudant.sh` - Cloudant deployment
- Plus other deployment scripts

### `scripts/docker/`
Docker scripts:
- `deploy_to_ibm.sh` - Docker deployment script
- Plus other Docker scripts

### `scripts/testing/`
Testing scripts:
- `test_cloudant_connection.py` - Cloudant connection test
- `test_cloudant_integration.sh` - Integration test
- `explore_cloudant_data.py` - Data explorer
- Plus other testing scripts

---

## 📋 Quick Access Files

### Root Level (Quick Access)
- `deploy_ibm.sh` - CLI deployment (one command)
- `deploy_docker.sh` - Docker deployment (one command)
- `README.md` - Main documentation
- `CHANGELOG.md` - Version history

---

## 🎯 File Organization Principles

1. **Root Level**: Only essential files for quick access
2. **Documentation**: Organized by category in `docs/`
3. **Scripts**: Organized by purpose in `scripts/`
4. **Code**: Organized by module/feature
5. **Data**: All data files in `data/`
6. **Config**: All configuration in `config/`

---

## 📖 Key Documentation Files

### Getting Started
- `README.md` - Start here
- `docs/guides/QUICK_START.md` - Quick start guide

### Deployment
- `docs/deployment/COMPLETE_DEPLOYMENT_SUMMARY.md` - Full guide
- `docs/deployment/DOCKER_DEPLOYMENT_GUIDE.md` - Docker guide
- `deploy_ibm.sh` - Quick CLI deploy
- `deploy_docker.sh` - Quick Docker deploy

### Testing
- `docs/guides/TEST_QUERIES.txt` - Test queries
- `docs/testing/TESTING_GUIDE.md` - Testing guide

### Features
- `docs/features/CLOUDANT_README.md` - Cloudant guide
- `docs/features/CLOUDANT_INTEGRATION.md` - Integration details

---

## 🔍 Finding Files

### By Purpose

**Deploy:**
- CLI: `deploy_ibm.sh` or `scripts/deployment/deploy_auto_ibm_cli.sh`
- Docker: `deploy_docker.sh` or `docker/deploy_with_docker.sh`

**Documentation:**
- Deployment: `docs/deployment/`
- Features: `docs/features/`
- Guides: `docs/guides/`

**Testing:**
- Queries: `docs/guides/TEST_QUERIES.txt`
- Scripts: `scripts/testing/`

**Configuration:**
- Agent config: `config/proactive-csi-agent-orchestrate.yaml`
- Environment: `.env` (not in git)

---

## ✅ Organization Benefits

1. **Clear Structure** - Easy to find files
2. **Logical Grouping** - Related files together
3. **Quick Access** - Important files at root
4. **Scalable** - Easy to add new files
5. **Professional** - Industry-standard structure

---

**Last Updated:** $(date)  
**Version:** 2.6.0

