# 🚀 IBM Cloud Deployment Guide

## RETENX Dashboard - Deploy to IBM Cloud

This guide covers deploying the RETENX Dashboard to IBM Cloud using **IBM Cloud Code Engine** (recommended) or **IBM Cloud Foundry**.

---

## 📋 Prerequisites

1. **IBM Cloud Account**: Sign up at [cloud.ibm.com](https://cloud.ibm.com)
2. **IBM Cloud CLI**: Install the IBM Cloud CLI
   ```bash
   # macOS
   curl -fsSL https://clis.cloud.ibm.com/install/osx | sh
   
   # Linux
   curl -fsSL https://clis.cloud.ibm.com/install/linux | sh
   ```
3. **Docker**: Required for Code Engine deployment
   - Install from [docker.com](https://www.docker.com/get-started)

---

## 🎯 Option 1: IBM Cloud Code Engine (Recommended)

### Step 1: Install IBM Cloud CLI Plugins

```bash
ibmcloud plugin install code-engine
ibmcloud plugin install container-registry
```

### Step 2: Login to IBM Cloud

```bash
ibmcloud login
# Or for federated accounts:
ibmcloud login --sso
```

### Step 3: Set Target Region

```bash
ibmcloud target -r us-south
# Or: eu-gb, eu-de, au-syd, etc.
```

### Step 4: Create Container Registry Namespace

```bash
ibmcloud cr namespace-add retenx-dashboard
```

### Step 5: Build and Push Docker Image

```bash
cd website/business-dashboard

# Build the Docker image
docker build -t us.icr.io/retenx-dashboard/retenx-dashboard:latest .

# Login to IBM Container Registry
ibmcloud cr login

# Push the image
docker push us.icr.io/retenx-dashboard/retenx-dashboard:latest
```

### Step 6: Create Code Engine Project

```bash
ibmcloud ce project create --name retenx-dashboard-project
ibmcloud ce project select --name retenx-dashboard-project
```

### Step 7: Create Code Engine Application

```bash
ibmcloud ce application create \
  --name retenx-dashboard \
  --image us.icr.io/retenx-dashboard/retenx-dashboard:latest \
  --registry-secret ibmcloud-cr-secret \
  --port 3000 \
  --cpu 1 \
  --memory 2G \
  --min-scale 1 \
  --max-scale 3
```

### Step 8: Get Application URL

```bash
ibmcloud ce application get --name retenx-dashboard
```

Your dashboard will be available at the provided URL!

---

## 🎯 Option 2: IBM Cloud Foundry

### Step 1: Install Cloud Foundry CLI

```bash
# macOS
brew install cloudfoundry/tap/cf-cli

# Or download from: https://github.com/cloudfoundry/cli/releases
```

### Step 2: Login to IBM Cloud

```bash
ibmcloud login
ibmcloud target --cf
```

### Step 3: Build the Application

```bash
cd website/business-dashboard
npm install
npm run build
```

### Step 4: Deploy to Foundry

```bash
ibmcloud cf push retenx-dashboard -f manifest.yml
```

### Step 5: Get Application URL

```bash
ibmcloud cf apps
```

---

## 🔧 Configuration Files

### Dockerfile
- Optimized multi-stage build
- Production-ready Next.js standalone output
- Runs on port 3000

### manifest.yml
- Cloud Foundry configuration
- Memory: 512MB
- Node.js buildpack

---

## 🌐 Environment Variables (Optional)

If you need environment variables:

```bash
# For Code Engine
ibmcloud ce application update --name retenx-dashboard \
  --env NODE_ENV=production

# For Foundry
ibmcloud cf set-env retenx-dashboard NODE_ENV production
```

---

## 📝 Quick Deploy Script

Create a deploy script:

```bash
#!/bin/bash
# deploy-ibm.sh

cd website/business-dashboard

# Build Docker image
docker build -t us.icr.io/retenx-dashboard/retenx-dashboard:latest .

# Push to registry
ibmcloud cr login
docker push us.icr.io/retenx-dashboard/retenx-dashboard:latest

# Update Code Engine app
ibmcloud ce application update --name retenx-dashboard \
  --image us.icr.io/retenx-dashboard/retenx-dashboard:latest
```

---

## 🔍 Troubleshooting

### Issue: Build fails
- Check Node.js version (should be 20+)
- Ensure all dependencies are in package.json

### Issue: Container won't start
- Check logs: `ibmcloud ce application logs --name retenx-dashboard`
- Verify port 3000 is exposed

### Issue: Image push fails
- Verify you're logged in: `ibmcloud cr login`
- Check namespace exists: `ibmcloud cr namespace-list`

---

## 📚 Resources

- [IBM Cloud Code Engine Docs](https://cloud.ibm.com/docs/codeengine)
- [IBM Cloud Foundry Docs](https://cloud.ibm.com/docs/cloud-foundry)
- [Next.js Deployment](https://nextjs.org/docs/deployment)

---

**Your RETENX Dashboard will be live on IBM Cloud!** 🎉

