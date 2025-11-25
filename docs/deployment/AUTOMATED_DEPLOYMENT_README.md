# 🚀 Automated Deployment to IBM Cloud

## ✅ What's Automated

I've created **3 automated deployment scripts** that will:

1. ✅ **Upload all data to Cloudant** (2,993 records)
2. ✅ **Deploy agent to IBM watsonx Orchestrate**
3. ✅ **Verify deployment**
4. ✅ **Test the agent**

---

## 📋 Available Scripts

### 1. **deploy_via_api.py** (Recommended)
**Fully automated via REST API**

```bash
cd agent404-proactive-csi
python3 deploy_via_api.py
```

**What it does:**
- Loads environment variables from `.env`
- Uploads all CSV data to Cloudant automatically
- Gets IAM token from API key
- Deploys agent via REST API
- Verifies deployment

### 2. **auto_deploy_python.py**
**Python-based automated deployment**

```bash
cd agent404-proactive-csi
python3 auto_deploy_python.py
```

**What it does:**
- Loads environment variables
- Uploads data to Cloudant
- Sets up Orchestrate environment
- Deploys agent via CLI
- Verifies deployment

### 3. **auto_deploy_full_automated.sh**
**Bash script for full automation**

```bash
cd agent404-proactive-csi
./auto_deploy_full_automated.sh
```

**What it does:**
- All steps automated in bash
- Uploads data
- Deploys agent
- Verifies deployment

---

## 🎯 Quick Start

### Run Automated Deployment:

```bash
cd /Users/ishwaryasridharan/Desktop/Hackathon_2025/Agentic_AI/agent404-proactive-csi

# Option 1: Via REST API (Recommended)
python3 deploy_via_api.py

# Option 2: Via Python script
python3 auto_deploy_python.py

# Option 3: Via Bash script
./auto_deploy_full_automated.sh
```

---

## 📊 What Gets Deployed

### Data Uploaded to Cloudant:
- ✅ customer_success_data.csv (501 records)
- ✅ procurement_vendor_data.csv (501 records)
- ✅ revenue_exposure_data.csv (501 records)
- ✅ support_tickets.csv (501 records)
- ✅ customer_comms.csv (488 records)
- ✅ contracts.csv (501 records)

**Total: 2,993 records**

### Agent Deployed:
- ✅ ProActive_CSI_Agent_404
- ✅ Version: 1.2.0
- ✅ All 6 IBM services configured
- ✅ 3 specialized agents
- ✅ 6 autonomous workflows

---

## 🔧 Prerequisites

### Environment Variables (in `.env`):
```bash
ORCHESTRATE_API_KEY=IYKkTGru14JfJWkl_G7xh6Y4UTa4qSPYPZE5M0Smk4AV
ORCHESTRATE_ENDPOINT=https://api.au-syd.watson-orchestrate.cloud.ibm.com/instances/f16c2181-a811-4d84-8e15-33cfebe50928
CLOUDANT_API_KEY=TalYEKH8YIFL1Hqu0Gx4QZP6IBE-43s8Cl2Fm7a-CyBK
CLOUDANT_URL=https://<REDACTED_CLOUDANT_ACCOUNT>.cloudantnosqldb.appdomain.cloud
```

### Required Files:
- ✅ `proactive-csi-agent-orchestrate.yaml` (agent configuration)
- ✅ `data/*.csv` (6 CSV files with data)
- ✅ `scripts/upload_data_to_cloudant.py` (data upload script)

---

## 🧪 After Deployment

### Test Your Agent:

1. **Open IBM Portal:**
   ```
   https://cloud.ibm.com/watsonx/orchestrate
   ```

2. **Find Your Agent:**
   - Look for "ProActive_CSI_Agent_404"
   - Click to open chat interface

3. **Test Queries:**
   ```
   "Good morning, what's my priority today?"
   "Tell me about Acme Corporation"
   "What vendors have delays?"
   "Calculate revenue at risk"
   "Read me the executive briefing aloud using Text-to-Speech"
   ```

---

## 📝 Deployment Status

After running the script, you'll see:

✅ **Data Upload:** All 2,993 records uploaded to Cloudant  
✅ **Agent Deployment:** Agent deployed to IBM watsonx Orchestrate  
✅ **Verification:** Agent listed and accessible  
✅ **Ready to Test:** Agent ready for queries  

---

## 🚨 Troubleshooting

### Issue: API authentication fails
**Solution:** Check `ORCHESTRATE_API_KEY` in `.env` file

### Issue: Data upload fails
**Solution:** Check `CLOUDANT_API_KEY` and `CLOUDANT_URL` in `.env`

### Issue: Agent deployment fails
**Solution:** 
- Verify agent YAML file exists
- Check API key has correct permissions
- Try manual upload via Web UI as fallback

### Issue: CLI authentication issues
**Solution:** Use `deploy_via_api.py` which uses REST API directly

---

## 📚 Additional Resources

- **Full Deployment Guide:** `DEPLOYMENT_COMPLETE_GUIDE.md`
- **Test Queries:** `IBM_TEST_QUERIES.md`
- **Deployment Proof:** `DEPLOYMENT_PROOF.md`

---

## ✅ Success Criteria

Deployment is successful when:

✅ All data uploaded to Cloudant (2,993 records)  
✅ Agent deployed to IBM watsonx Orchestrate  
✅ Agent appears in agent list  
✅ Agent responds to test queries  
✅ All services connected (STT, TTS, NLU, watsonx.ai)  

---

**Status:** ✅ Ready for Automated Deployment  
**Last Updated:** November 22, 2025

