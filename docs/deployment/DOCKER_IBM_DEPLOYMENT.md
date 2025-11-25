# 🐳 Docker Deployment to IBM watsonx Orchestrate

**Complete guide for deploying ProActive CSI Agent 404 to IBM using Docker**

---

## 📋 Overview

This guide shows how to deploy your agent to IBM watsonx Orchestrate using Docker. Docker provides:
- ✅ Consistent deployment environment
- ✅ Isolated dependencies
- ✅ Easy CI/CD integration
- ✅ Reproducible deployments

---

## 🚀 Quick Start

### One-Command Deployment

```bash
cd /Users/ishwaryasridharan/Desktop/Hackathon_2025/Agentic_AI/agent404-proactive-csi
./scripts/docker/deploy_ibm_docker.sh
```

That's it! The script will:
1. Build Docker image
2. Deploy agent to IBM watsonx Orchestrate
3. Verify deployment
4. Clean up

---

## 📝 Prerequisites

### 1. Install Docker

**MacOS:**
```bash
# Install Docker Desktop from: https://www.docker.com/products/docker-desktop
# Or via Homebrew:
brew install --cask docker
```

**Linux:**
```bash
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
```

**Verify installation:**
```bash
docker --version
docker-compose --version
```

---

### 2. Verify Files

Ensure these files exist:
- ✅ `Dockerfile.ibm`
- ✅ `docker-compose.ibm.yml`
- ✅ `proactive-csi-agent-orchestrate.yaml`
- ✅ `scripts/docker/deploy_to_ibm.sh`
- ✅ `scripts/docker/deploy_ibm_docker.sh`

---

## 🔧 Method 1: Automated Deployment (Recommended)

### Step 1: Make Script Executable

```bash
chmod +x scripts/docker/deploy_ibm_docker.sh
```

### Step 2: Run Deployment

```bash
./scripts/docker/deploy_ibm_docker.sh
```

**What happens:**
1. ✅ Builds Docker image with all dependencies
2. ✅ Runs container to deploy agent
3. ✅ Activates IBM watsonx Orchestrate environment
4. ✅ Imports/updates agent
5. ✅ Verifies deployment
6. ✅ Cleans up container

---

## 🔧 Method 2: Manual Docker Deployment

### Step 1: Build Image

```bash
docker-compose -f docker-compose.ibm.yml build
```

### Step 2: Deploy

```bash
docker-compose -f docker-compose.ibm.yml up
```

### Step 3: Cleanup (Optional)

```bash
docker-compose -f docker-compose.ibm.yml down
```

---

## 🔧 Method 3: Docker Run (One-liner)

```bash
docker build -f Dockerfile.ibm -t proactive-csi-ibm .
docker run --rm \
  -v "$(pwd)/proactive-csi-agent-orchestrate.yaml:/app/proactive-csi-agent-orchestrate.yaml:ro" \
  -v "$(pwd)/ibm-credentials_Orchestrate_data_Updated.json:/app/ibm-credentials_Orchestrate_data_Updated.json:ro" \
  -e WATSONX_ORCHESTRATE_APIKEY="9-atsNvf8mx0ymZLaGgZwe28rhyZvLcX_QUQlyDb12rg" \
  proactive-csi-ibm
```

---

## 🔑 Credentials Setup

### Option 1: Environment Variables

Set these before running:

```bash
export WATSONX_ORCHESTRATE_APIKEY="9-atsNvf8mx0ymZLaGgZwe28rhyZvLcX_QUQlyDb12rg"
export WATSONX_ORCHESTRATE_URL="https://api.au-syd.watson-orchestrate.cloud.ibm.com/instances/f16c2181-a811-4d84-8e15-33cfebe50928"
```

### Option 2: Mounted Credentials File

The Docker setup will automatically use:
- `ibm-credentials_Orchestrate_data_Updated.json` (mounted as volume)

### Option 3: Docker Compose Environment

Edit `docker-compose.ibm.yml` and set environment variables:

```yaml
environment:
  - WATSONX_ORCHESTRATE_APIKEY=your_api_key_here
  - WATSONX_ORCHESTRATE_URL=your_service_url_here
```

---

## 📊 Docker Image Structure

**Dockerfile.ibm includes:**
- ✅ Python 3.11 base image
- ✅ IBM watsonx Orchestrate CLI
- ✅ All Python dependencies
- ✅ Agent configuration files
- ✅ Deployment scripts

**Image builds:**
- ✅ Contains all dependencies
- ✅ Isolated environment
- ✅ Ready for deployment

---

## 🔄 CI/CD Integration

### GitHub Actions Example

Create `.github/workflows/deploy-to-ibm.yml`:

```yaml
name: Deploy to IBM watsonx Orchestrate

on:
  push:
    branches: [ main ]
  workflow_dispatch:

jobs:
  deploy:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v3
    
    - name: Set up Docker Buildx
      uses: docker/setup-buildx-action@v2
    
    - name: Build Docker image
      run: docker build -f Dockerfile.ibm -t proactive-csi-ibm .
    
    - name: Deploy to IBM
      env:
        WATSONX_ORCHESTRATE_APIKEY: ${{ secrets.WATSONX_ORCHESTRATE_APIKEY }}
      run: |
        docker run --rm \
          -v "$(pwd)/proactive-csi-agent-orchestrate.yaml:/app/proactive-csi-agent-orchestrate.yaml:ro" \
          -e WATSONX_ORCHESTRATE_APIKEY="$WATSONX_ORCHESTRATE_APIKEY" \
          proactive-csi-ibm
```

---

## 🐛 Troubleshooting

### Issue: "Docker is not running"

**Solution:**
```bash
# Start Docker Desktop (Mac/Windows)
# Or start Docker daemon (Linux)
sudo systemctl start docker
```

---

### Issue: "orchestrate CLI not found in container"

**Solution:**
The Dockerfile.ibm includes:
```dockerfile
RUN pip install --no-cache-dir watsonx-orchestrate-cli
```

If still failing, rebuild:
```bash
docker-compose -f docker-compose.ibm.yml build --no-cache
```

---

### Issue: "Permission denied" on scripts

**Solution:**
```bash
chmod +x scripts/docker/*.sh
```

Or rebuild Docker image (permissions set in Dockerfile).

---

### Issue: "Environment activation failed"

**Solutions:**
1. ✅ Verify API key is correct
2. ✅ Check credentials file is mounted
3. ✅ Verify service URL is correct
4. ✅ Don't use `--type mcsp` flag (use default auth)

---

### Issue: Container exits immediately

**Check logs:**
```bash
docker-compose -f docker-compose.ibm.yml logs
```

**Or run interactively:**
```bash
docker run -it --rm \
  -v "$(pwd)/proactive-csi-agent-orchestrate.yaml:/app/proactive-csi-agent-orchestrate.yaml:ro" \
  -v "$(pwd)/ibm-credentials_Orchestrate_data_Updated.json:/app/ibm-credentials_Orchestrate_data_Updated.json:ro" \
  proactive-csi-ibm bash
```

---

## ✅ Deployment Checklist

Before deploying:

- [ ] Docker is installed and running
- [ ] `Dockerfile.ibm` exists
- [ ] `docker-compose.ibm.yml` exists
- [ ] `proactive-csi-agent-orchestrate.yaml` is correct
- [ ] Credentials file exists or env vars set
- [ ] Scripts are executable: `chmod +x scripts/docker/*.sh`
- [ ] Network connectivity to IBM Cloud

---

## 📋 Deployment Commands Reference

### Build Only
```bash
docker-compose -f docker-compose.ibm.yml build
```

### Deploy
```bash
docker-compose -f docker-compose.ibm.yml up
```

### View Logs
```bash
docker-compose -f docker-compose.ibm.yml logs -f
```

### Clean Up
```bash
docker-compose -f docker-compose.ibm.yml down
docker rmi proactive-csi-ibm-deploy:latest  # Remove image
```

### Rebuild from Scratch
```bash
docker-compose -f docker-compose.ibm.yml build --no-cache
docker-compose -f docker-compose.ibm.yml up
```

---

## 🎯 Advantages of Docker Deployment

1. ✅ **Consistency** - Same environment every time
2. ✅ **Isolation** - No local dependencies needed
3. ✅ **Portability** - Run anywhere Docker runs
4. ✅ **CI/CD Ready** - Easy to automate
5. ✅ **Reproducible** - Same results every deployment
6. ✅ **Clean** - No local environment pollution

---

## 🚀 Next Steps

After deployment:

1. ✅ Verify agent in web UI: https://au-syd.watson-orchestrate.cloud.ibm.com/build/manage
2. ✅ Test agent with queries
3. ✅ Monitor deployment logs
4. ✅ Update agent as needed (re-run deployment script)

---

## 📚 Related Documentation

- **IBM Deployment Guide:** `docs/deployment/IBM_DEPLOYMENT_GUIDE.md`
- **Deployment Cheat Sheet:** `docs/deployment/DEPLOYMENT_CHEAT_SHEET.md`
- **Local Docker Setup:** See `Dockerfile` and `docker-compose.yml` for local development

---

**Last Updated:** 2025-01-XX  
**Docker Version:** Latest  
**Python Version:** 3.11  
**Status:** ✅ Ready for Production

