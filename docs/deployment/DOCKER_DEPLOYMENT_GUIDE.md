# 🐳 Docker-Based IBM watsonx Orchestrate Deployment Guide

## Overview

This guide provides a fully automated Docker-based deployment process for ProActive CSI Agent 404 to IBM watsonx Orchestrate, following the IBM Hackathon Guide methodology.

---

## 🚀 Quick Start

### One-Command Deployment

```bash
./docker/deploy_with_docker.sh
```

That's it! The script will:
1. ✅ Check Docker installation
2. ✅ Load credentials from `.env`
3. ✅ Verify configuration file
4. ✅ Build Docker image
5. ✅ Deploy to IBM watsonx Orchestrate
6. ✅ Verify deployment

---

## 📋 Prerequisites

### Required
- ✅ **Docker** installed and running
- ✅ **Docker Compose** (or `docker compose` command)
- ✅ **IBM Cloud Account** with watsonx Orchestrate access
- ✅ **Credentials** in `.env` file

### Verify Docker Installation

```bash
docker --version
docker-compose --version  # or: docker compose version
```

---

## 🔧 Setup

### 1. Environment Variables

Ensure your `.env` file contains:

```bash
# IBM watsonx Orchestrate
WATSONX_ORCHESTRATE_APIKEY=your-api-key-here
WATSONX_ORCHESTRATE_URL=https://api.au-syd.watson-orchestrate.cloud.ibm.com/instances/your-instance-id

# Cloudant (optional but recommended)
CLOUDANT_URL=your-cloudant-url
CLOUDANT_APIKEY=your-cloudant-apikey
```

### 2. Configuration File

Verify agent configuration exists:
```bash
config/proactive-csi-agent-orchestrate.yaml
```

---

## 🐳 Docker Deployment Process

### Step-by-Step

1. **Check Docker**
   ```bash
   docker --version
   ```

2. **Load Credentials**
   - Automatically loads from `.env`
   - Falls back to defaults if not found

3. **Verify Configuration**
   - Checks for `config/proactive-csi-agent-orchestrate.yaml`
   - Validates file size and structure

4. **Build Docker Image**
   ```bash
   docker build -f docker/Dockerfile.ibm -t proactive-csi-ibm-deploy:latest .
   ```

5. **Deploy to IBM**
   - Runs container with deployment script
   - Automatically configures environment
   - Imports agent configuration
   - Verifies deployment

---

## 📁 Docker Files Structure

```
docker/
├── Dockerfile.ibm              # IBM deployment Docker image
├── docker-compose.ibm.yml      # Docker Compose configuration
├── deploy_with_docker.sh        # Main deployment script
└── docker-compose.yml          # General Docker Compose

scripts/docker/
└── deploy_to_ibm.sh            # Internal deployment script
```

---

## 🔍 How It Works

### Docker Image (`Dockerfile.ibm`)

The Docker image includes:
- ✅ Python 3.11 environment
- ✅ IBM watsonx Orchestrate CLI
- ✅ All project dependencies
- ✅ Deployment scripts
- ✅ Agent configuration

### Deployment Process

1. **Build Phase:**
   - Creates Docker image with all dependencies
   - Installs IBM watsonx Orchestrate CLI
   - Copies project files

2. **Runtime Phase:**
   - Starts container with credentials
   - Sets up orchestrate environment
   - Activates environment with API key
   - Imports agent configuration
   - Verifies deployment

3. **Cleanup Phase:**
   - Removes container after deployment
   - Preserves image for future use

---

## 🎯 Usage Examples

### Basic Deployment

```bash
cd /path/to/agent404-proactive-csi-2.0
./docker/deploy_with_docker.sh
```

### With Custom Credentials

```bash
export WATSONX_ORCHESTRATE_APIKEY="your-key"
export WATSONX_ORCHESTRATE_URL="your-url"
./docker/deploy_with_docker.sh
```

### Manual Docker Compose

```bash
cd docker
docker-compose -f docker-compose.ibm.yml up
```

---

## 🔧 Troubleshooting

### Issue: Docker not found

**Solution:**
```bash
# Install Docker
# macOS: brew install docker
# Linux: sudo apt-get install docker.io
# Windows: Download from docker.com
```

### Issue: Permission denied

**Solution:**
```bash
# Add user to docker group (Linux)
sudo usermod -aG docker $USER
# Log out and back in
```

### Issue: Build fails

**Solution:**
```bash
# Check Docker is running
docker ps

# Check disk space
df -h

# Clean Docker cache
docker system prune -a
```

### Issue: Deployment fails

**Solution:**
```bash
# Check credentials
cat .env | grep WATSONX

# Verify configuration file
ls -lh config/proactive-csi-agent-orchestrate.yaml

# Check logs
docker logs proactive-csi-ibm-deploy
```

---

## 📊 Deployment Verification

After deployment, verify:

1. **Check Agent List:**
   ```bash
   docker run --rm -e WATSONX_ORCHESTRATE_APIKEY="$WATSONX_ORCHESTRATE_APIKEY" \
     proactive-csi-ibm-deploy:latest \
     orchestrate agents list
   ```

2. **Access IBM Portal:**
   - Go to: https://au-syd.watson-orchestrate.cloud.ibm.com/build/manage
   - Look for: `ProActive_CSI_Agent_404`

3. **Test Agent:**
   - Use queries from `TEST_QUERIES.txt`
   - Example: "Show me my portfolio overview"

---

## 🔐 Security Best Practices

### Credentials Management

1. **Never commit `.env` file**
   - Already in `.gitignore`
   - Use `.env.example` as template

2. **Use environment variables**
   ```bash
   export WATSONX_ORCHESTRATE_APIKEY="your-key"
   ```

3. **Rotate credentials regularly**
   - Generate new API keys periodically
   - Update `.env` file

### Docker Security

1. **Use read-only volumes**
   - Configuration files mounted as read-only
   - Prevents accidental modifications

2. **Clean up containers**
   - Containers removed after deployment
   - No persistent credential storage

3. **Image security**
   - Use official base images
   - Keep dependencies updated

---

## 📈 Advantages of Docker Deployment

### ✅ Isolation
- Clean environment for each deployment
- No conflicts with local dependencies
- Consistent across different machines

### ✅ Reproducibility
- Same environment every time
- No "works on my machine" issues
- Easy to share with team

### ✅ Automation
- Fully automated process
- No manual steps required
- CI/CD ready

### ✅ Portability
- Works on any Docker-supported platform
- macOS, Linux, Windows compatible
- Cloud deployment ready

---

## 🔄 Comparison: Docker vs CLI

| Feature | Docker Deployment | CLI Deployment |
|---------|------------------|----------------|
| **Isolation** | ✅ Complete | ❌ Uses local env |
| **Dependencies** | ✅ Included | ⚠️ Must install |
| **Portability** | ✅ High | ⚠️ Platform specific |
| **Speed** | ⚠️ Slower (build) | ✅ Faster |
| **Reproducibility** | ✅ High | ⚠️ Medium |
| **CI/CD Ready** | ✅ Yes | ⚠️ Requires setup |

---

## 🎯 When to Use Docker

### Use Docker When:
- ✅ You want complete isolation
- ✅ Deploying in CI/CD pipelines
- ✅ Team members have different environments
- ✅ Need reproducible deployments
- ✅ Deploying to cloud platforms

### Use CLI When:
- ✅ Quick local testing
- ✅ Already have CLI installed
- ✅ Need faster iteration
- ✅ Simple one-time deployment

---

## 📚 Additional Resources

### IBM Hackathon Guide
- Follows official IBM watsonx Orchestrate Hackathon Guide
- Aligns with best practices
- Compatible with hackathon requirements

### Documentation
- `COMPLETE_DEPLOYMENT_SUMMARY.md` - Full deployment guide
- `DATA_COMPARISON_REPORT.md` - Data verification
- `TEST_QUERIES.txt` - Test queries

### IBM Resources
- [watsonx Orchestrate Documentation](https://cloud.ibm.com/docs/watson-orchestrate)
- [Docker Documentation](https://docs.docker.com)
- [IBM Cloud Documentation](https://cloud.ibm.com/docs)

---

## ✅ Success Checklist

After deployment, verify:

- [x] Docker image built successfully
- [x] Container ran without errors
- [x] Agent appears in IBM portal
- [x] Agent responds to test queries
- [x] All services connected
- [x] Cloudant data accessible

---

## 🎊 Summary

**Docker-based deployment provides:**
- ✅ Fully automated process
- ✅ Isolated environment
- ✅ Reproducible deployments
- ✅ CI/CD ready
- ✅ Follows IBM Hackathon Guide

**Quick Command:**
```bash
./docker/deploy_with_docker.sh
```

---

**Status:** ✅ Production Ready  
**Version:** 2.5.0  
**Last Updated:** $(date)

---

*For issues or questions, refer to troubleshooting section or check Docker logs.*

