# 🐳 Docker Deployment to IBM - Quick Reference

## ⚡ One-Command Deployment

```bash
./scripts/docker/deploy_ibm_docker.sh
```

## 📋 What It Does

1. ✅ Builds Docker image with all dependencies
2. ✅ Deploys agent to IBM watsonx Orchestrate (AU-Sydney)
3. ✅ Verifies deployment
4. ✅ Cleans up container

## 🔑 Credentials

The script automatically uses:
- API Key from `ibm-credentials_Orchestrate_data_Updated.json`
- Or from environment variable `WATSONX_ORCHESTRATE_APIKEY`

## ✅ Success Output

After deployment, you'll see:
```
✅ Agent deployed successfully!
🌐 Access your agent at:
   https://au-syd.watson-orchestrate.cloud.ibm.com/build/manage
```

## 📚 Full Documentation

- **Complete Guide:** `docs/deployment/DOCKER_IBM_DEPLOYMENT.md`
- **Quick Start:** `docs/deployment/DOCKER_QUICK_START.md`

---

**Ready to deploy? Run:** `./scripts/docker/deploy_ibm_docker.sh`
