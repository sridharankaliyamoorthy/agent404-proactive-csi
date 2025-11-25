# 🔑 Fix API Key & Deploy - Quick Guide

## ❌ Current Issue

The Orchestrate API key is invalid or expired:
```
Error: Provided API key could not be found., Status code: 400
```

## ✅ Solution: Get New IBM Cloud API Key

### Step 1: Get IBM Cloud API Key (2 minutes)

1. **Go to IBM Cloud API Keys:**
   ```
   https://cloud.ibm.com/iam/apikeys
   ```

2. **Click "Create an IBM Cloud API key"**

3. **Name it:** `proactive-csi-deployment`

4. **Click "Create"**

5. **Copy the API key immediately** (you won't see it again!)

6. **Save it securely**

---

### Step 2: Deploy Using New API Key

#### Option A: CLI Deployment (After getting new key)

```bash
cd /Users/ishwaryasridharan/Desktop/Hackathon_2025/Agentic_AI/agent404-proactive-csi

# Activate environment with NEW API key
orchestrate env activate production-au
# Paste your NEW API key when prompted

# Deploy agent
orchestrate agents import --file proactive-csi-agent-orchestrate.yaml

# Verify
orchestrate agents list
```

#### Option B: Web UI Deployment (Recommended - No API key needed!)

**This is the easiest and most reliable method:**

1. **Open IBM Portal:**
   ```
   https://cloud.ibm.com/watsonx/orchestrate
   ```

2. **Login with your IBM Cloud account**

3. **Navigate to Agents:**
   - Click "All agents" or "Skills" in left sidebar
   - Click "Create agent" or "Import agent"

4. **Upload Configuration:**
   - Click "Import from file"
   - Navigate to:
     ```
     /Users/ishwaryasridharan/Desktop/Hackathon_2025/Agentic_AI/agent404-proactive-csi/
     ```
   - Select: `proactive-csi-agent-orchestrate.yaml`
   - Click "Open"

5. **Connect Services:**
   - Go to "Connections" or "Integrations" tab
   - Add these services using credentials from `ibm_services.py`:

   **NLU:**
   - API Key: `<REDACTED_NLU_API_KEY>`
   - URL: `https://api.us-south.natural-language-understanding.watson.cloud.ibm.com/instances/79459c2d-4e21-4593-963e-6e9964afe1a3`

   **STT:**
   - API Key: `<REDACTED_STT_API_KEY>`
   - URL: `https://api.us-south.speech-to-text.watson.cloud.ibm.com/instances/<REDACTED_STT_INSTANCE_ID>`

   **TTS:**
   - API Key: `<REDACTED_TTS_API_KEY>`
   - URL: `https://api.us-south.text-to-speech.watson.cloud.ibm.com/instances/298e2b63-de83-427c-b77d-156c0976eed7`

   **Cloudant:**
   - API Key: `TalYEKH8YIFL1Hqu0Gx4QZP6IBE-43s8Cl2Fm7a-CyBK`
   - URL: `https://<REDACTED_CLOUDANT_ACCOUNT>.cloudantnosqldb.appdomain.cloud`

6. **Activate:**
   - Click "Save"
   - Click "Activate" or "Publish"
   - Wait for confirmation

7. **Test:**
   - Open chat interface
   - Type: `Good morning, what's my priority today?`

---

## 🚀 Quick Deploy Script (After getting new API key)

Create a file `deploy_with_new_key.sh`:

```bash
#!/bin/bash
cd /Users/ishwaryasridharan/Desktop/Hackathon_2025/Agentic_AI/agent404-proactive-csi

echo "🔑 Enter your NEW IBM Cloud API key:"
read -s NEW_API_KEY

echo "Activating environment..."
echo "$NEW_API_KEY" | orchestrate env activate production-au

echo "Deploying agent..."
orchestrate agents import --file proactive-csi-agent-orchestrate.yaml

echo "Verifying..."
orchestrate agents list | grep -i "proactive"
```

Run it:
```bash
chmod +x deploy_with_new_key.sh
./deploy_with_new_key.sh
```

---

## 📋 All Credentials from ibm_services.py

**NLU:**
- API Key: `<REDACTED_NLU_API_KEY>`
- URL: `https://api.us-south.natural-language-understanding.watson.cloud.ibm.com/instances/79459c2d-4e21-4593-963e-6e9964afe1a3`

**STT:**
- API Key: `<REDACTED_STT_API_KEY>`
- URL: `https://api.us-south.speech-to-text.watson.cloud.ibm.com/instances/<REDACTED_STT_INSTANCE_ID>`

**TTS:**
- API Key: `<REDACTED_TTS_API_KEY>`
- URL: `https://api.us-south.text-to-speech.watson.cloud.ibm.com/instances/298e2b63-de83-427c-b77d-156c0976eed7`

**Cloudant:**
- API Key: `TalYEKH8YIFL1Hqu0Gx4QZP6IBE-43s8Cl2Fm7a-CyBK`
- URL: `https://<REDACTED_CLOUDANT_ACCOUNT>.cloudantnosqldb.appdomain.cloud`

**Orchestrate:**
- URL: `https://api.au-syd.watson-orchestrate.cloud.ibm.com/instances/f16c2181-a811-4d84-8e15-33cfebe50928`
- API Key: **NEED NEW ONE** from https://cloud.ibm.com/iam/apikeys

---

## ✅ Recommended: Use Web UI

**Why Web UI is better:**
- ✅ No API key issues
- ✅ Visual interface
- ✅ Easy service connections
- ✅ Immediate feedback
- ✅ More reliable

**Just go to:** https://cloud.ibm.com/watsonx/orchestrate

---

## 🎯 Next Steps

1. **Get new API key:** https://cloud.ibm.com/iam/apikeys
2. **OR use Web UI:** https://cloud.ibm.com/watsonx/orchestrate
3. **Upload:** `proactive-csi-agent-orchestrate.yaml`
4. **Connect services** using credentials above
5. **Test:** `Good morning, what's my priority today?`

**You're almost there! 🚀**

