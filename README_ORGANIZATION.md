# 📁 Project Organization - Quick Reference

## 🎯 Quick Access

### Deploy
```bash
./deploy_ibm.sh          # CLI deployment
./deploy_docker.sh       # Docker deployment
```

### Documentation
- **Deployment:** `docs/deployment/`
- **Features:** `docs/features/`
- **Guides:** `docs/guides/`
- **Testing:** `docs/testing/`

### Key Files
- **Test Queries:** `docs/guides/TEST_QUERIES.txt`
- **Deployment Guide:** `docs/deployment/COMPLETE_DEPLOYMENT_SUMMARY.md`
- **Docker Guide:** `docs/deployment/DOCKER_DEPLOYMENT_GUIDE.md`
- **Cloudant Guide:** `docs/features/CLOUDANT_README.md`

---

## 📂 Folder Structure

```
agent404-proactive-csi-2.0/
├── README.md                    # Start here
├── CHANGELOG.md                 # Version history
├── deploy_ibm.sh                # Quick CLI deploy
├── deploy_docker.sh             # Quick Docker deploy
│
├── agents/                      # Agent code
├── config/                      # Configuration
├── data/                        # Data files
├── docker/                      # Docker files
├── docs/                        # All documentation
│   ├── deployment/              # Deployment guides
│   ├── features/               # Feature docs
│   ├── guides/                 # User guides
│   ├── commits/                # Commit summaries
│   ├── testing/                # Testing guides
│   └── troubleshooting/        # Troubleshooting
├── integrations/               # Integration code
├── scripts/                     # Scripts
└── workflows/                  # Workflow code
```

---

**For detailed structure, see:** `docs/PROJECT_STRUCTURE.md`

