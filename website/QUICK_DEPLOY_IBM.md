# ⚡ Quick Deploy to IBM Cloud

## 🚀 Fastest Way to Deploy

### Prerequisites
1. IBM Cloud account: [cloud.ibm.com](https://cloud.ibm.com)
2. IBM Cloud CLI installed
3. Docker installed

### One-Command Deploy

```bash
cd website/business-dashboard
./deploy-ibm.sh
```

That's it! The script will:
1. ✅ Check IBM Cloud login
2. ✅ Create container registry namespace
3. ✅ Build Docker image
4. ✅ Push to IBM Container Registry
5. ✅ Create/update Code Engine project
6. ✅ Deploy application
7. ✅ Show you the live URL

---

## 📝 Manual Steps (if script doesn't work)

### 1. Login to IBM Cloud
```bash
ibmcloud login
ibmcloud target -r us-south
```

### 2. Install Plugins
```bash
ibmcloud plugin install code-engine
ibmcloud plugin install container-registry
```

### 3. Build & Push
```bash
cd website/business-dashboard

# Build
docker build -t us.icr.io/retenx-dashboard/retenx-dashboard:latest .

# Login & Push
ibmcloud cr login
docker push us.icr.io/retenx-dashboard/retenx-dashboard:latest
```

### 4. Deploy
```bash
# Create project
ibmcloud ce project create --name retenx-dashboard-project
ibmcloud ce project select --name retenx-dashboard-project

# Create app
ibmcloud ce application create \
  --name retenx-dashboard \
  --image us.icr.io/retenx-dashboard/retenx-dashboard:latest \
  --port 3000 \
  --cpu 1 \
  --memory 2G
```

### 5. Get URL
```bash
ibmcloud ce application get --name retenx-dashboard
```

---

## 🔄 Update Deployment

Just run the script again:
```bash
./deploy-ibm.sh
```

---

## 📚 Full Documentation

See `IBM_CLOUD_DEPLOYMENT.md` for detailed instructions.

---

**Your dashboard will be live on IBM Cloud in minutes!** 🎉

