# 🚀 DEPLOY NOW - With Cloudant Integration

## ✅ Status: Ready to Deploy with Real Data!

Your ProActive CSI project is now enhanced with:
- ✅ **500 customers** with churn scores from Cloudant
- ✅ **500 vendors** with delivery tracking from Cloudant
- ✅ **500 revenue records** with risk metrics from Cloudant
- ✅ **$132.3M portfolio** under management
- ✅ **All IBM services** configured

---

## 🎯 Choose Your Deployment Method

### Option 1: Local Streamlit Demo (Fastest - 2 minutes)
### Option 2: IBM watsonx Orchestrate (Production - 15 minutes)

---

## 🏃 OPTION 1: Local Streamlit Demo

Perfect for testing with real Cloudant data!

### Step 1: Install Dependencies

```bash
cd /Users/ishwaryasridharan/Desktop/Hackathon_2025/agent404-proactive-csi-2.0

# Install Python packages
pip3 install -r requirements.txt
```

### Step 2: Verify Cloudant Connection

```bash
# Test that Cloudant is accessible
python3 scripts/testing/test_cloudant_connection.py
```

Expected output:
```
✅ CONNECTION SUCCESSFUL!
✅ Database 'proactive_csi' exists
   Documents: 0
```

### Step 3: Run the Application

```bash
# Start Streamlit app
streamlit run app.py
```

The app will open at: **http://localhost:8501**

### Step 4: Explore with Real Data

Navigate through the pages:
1. **🏠 Dashboard** - See portfolio overview ($132.3M ARR)
2. **🔮 Customer Intelligence** - Analyze 500 customers
3. **📦 Procurement Monitor** - Track 500 vendors
4. **💰 Revenue Protection** - View $67.2M at risk
5. **⚡ Workflows** - Test 6 autonomous workflows
6. **📊 Executive Brief** - Generate reports

---

## 🌐 OPTION 2: IBM watsonx Orchestrate Deployment

Deploy to production with full IBM integration!

### Prerequisites Checklist

- ✅ IBM Cloud account with access to watsonx Orchestrate
- ✅ Agent configuration file: `config/proactive-csi-agent-orchestrate.yaml`
- ✅ Cloudant credentials in `.env` file
- ✅ IBM Watson service credentials

### Step-by-Step Deployment

#### 1. Login to IBM Cloud

Open browser and go to:
```
https://cloud.ibm.com/login
```

Complete authentication (username, password, 2FA if required).

#### 2. Navigate to watsonx Orchestrate

After login, go to:
```
https://au-syd.watson-orchestrate.cloud.ibm.com/build/manage
```

Or navigate via:
- Click **"watsonx"** in top menu
- Select **"Orchestrate"**
- Click **"Agents"** or **"All agents"**

#### 3. Import Agent Configuration

1. **Click "Create agent"** or **"Import agent"** button
2. **Select "Import from file"**
3. **Upload this file:**
   ```
   /Users/ishwaryasridharan/Desktop/Hackathon_2025/agent404-proactive-csi-2.0/config/proactive-csi-agent-orchestrate.yaml
   ```
4. **Wait for upload** (5-10 seconds)

Expected result:
- Agent name: **ProActive_CSI_Agent_404**
- Description visible
- Configuration loaded

#### 4. Configure IBM Services

Go to **"Connections"** or **"Integrations"** tab:

##### Service 1: Speech-to-Text
- **Service:** Speech-to-Text
- **API Key:** `<REDACTED_STT_API_KEY>`
- **URL:** `https://api.us-south.speech-to-text.watson.cloud.ibm.com/instances/<REDACTED_STT_INSTANCE_ID>`
- Click **"Connect"**

##### Service 2: Text-to-Speech
- **Service:** Text-to-Speech
- **API Key:** `<REDACTED_TTS_API_KEY>`
- **URL:** `https://api.us-south.text-to-speech.watson.cloud.ibm.com/instances/<REDACTED_TTS_INSTANCE_ID>`
- Click **"Connect"**

##### Service 3: Natural Language Understanding
- **Service:** Natural Language Understanding
- **API Key:** `<REDACTED_NLU_API_KEY>`
- **URL:** `https://api.us-south.natural-language-understanding.watson.cloud.ibm.com/instances/<REDACTED_NLU_INSTANCE_ID>`
- Click **"Connect"**

##### Service 4: Cloudant (NEW! - Your Teammate's Data)
- **Service:** Cloudant NoSQL Database
- **API Key:** `<REDACTED_CLOUDANT_API_KEY>`
- **URL:** `https://<REDACTED_CLOUDANT_ACCOUNT>.cloudantnosqldb.appdomain.cloud`
- Click **"Connect"**

##### Service 5: watsonx.ai
- **Service:** watsonx.ai
- **Project ID:** `<REDACTED_WATSONX_PROJECT_ID>`
- **Region:** us-south
- Click **"Connect"**

Expected result:
- All 5 services show ✅ **Connected** status

#### 5. Save & Activate Agent

1. **Click "Save"** button (top-right)
2. **Wait for confirmation** message
3. **Click "Activate"** or **"Publish"** button
4. **Wait 10-30 seconds** for activation

Status should show:
- ✅ **Active**
- ✅ **Deployed**
- ✅ All services: **Connected**

#### 6. Get Deployment URL

Look for one of these buttons:
- **"Share"**
- **"Chat URL"**
- **"Test URL"**
- **"Copy Link"**

Copy the URL - this is your **Application URL** for submission.

Expected format:
```
https://au-syd.watson-orchestrate.cloud.ibm.com/[agent-path]
```

#### 7. Test the Agent

Click on your agent to open chat interface and test:

**Test 1: Customer Intelligence with Real Data**
```
Query: "What customers are at high risk?"
```
Expected: List of actual high-risk customers from Cloudant (56 customers with churn ≥ 70%)

**Test 2: Revenue Analysis**
```
Query: "Calculate total revenue at risk"
```
Expected: Real numbers from Cloudant ($67.2M at risk from $132.3M portfolio)

**Test 3: Vendor Tracking**
```
Query: "Which vendors have delays?"
```
Expected: Real vendor data from Cloudant (491 delayed vendors)

**Test 4: Executive Brief**
```
Query: "Generate executive briefing"
```
Expected: Comprehensive briefing with real data

**Test 5: Voice Operations**
```
Query: "Read me the top risks using Text-to-Speech"
```
Expected: TTS-enabled response with audio

---

## 📊 What Makes This Special

Your deployment now includes:

✅ **Real Data from Cloudant:**
- 500 customers with actual churn predictions
- 500 vendors with delivery tracking
- 500 revenue records with financial metrics

✅ **$132.3M Portfolio:**
- Real ARR numbers
- Actual risk calculations
- Financial impact analysis

✅ **56 High-Risk Customers:**
- Identified from real data
- Ready for intervention
- Prioritized by churn probability

✅ **491 Vendor Delays:**
- Tracked in real-time
- Customer impact correlated
- Action items ready

---

## 🎯 Demo Script with Real Data

Use this for presentations:

### Introduction
```
"I'd like to show you ProActive CSI, an AI agent system managing a $132 million 
portfolio with real customer and vendor data."
```

### Query 1: Portfolio Overview
```
"Show me my portfolio overview"
```
*Shows: $132.3M ARR, $67.2M at risk (50.8%), 56 high-risk customers*

### Query 2: Top Risks
```
"Who are my top 3 at-risk customers?"
```
*Shows: 
1. Summit Enterprises - 148 (86% churn, $353K ARR)
2. CloudFirst Systems - 140 (85% churn, $73K ARR)
3. Gamma Corporation - 499 (84% churn, $377K ARR)*

### Query 3: Vendor Issues
```
"What vendor delays are impacting customers?"
```
*Shows: 491 delayed vendors with customer impact analysis*

### Query 4: Financial Impact
```
"Calculate the financial impact of top risks"
```
*Shows: Revenue scenarios, ROI calculations, intervention costs*

### Query 5: Action Plan
```
"Generate an action plan for the highest risk customer"
```
*Shows: AI-generated intervention strategy with specific actions*

---

## 🐛 Troubleshooting

### Issue: Cloudant Connection Failed
**Solution:**
```bash
# Verify credentials in .env file
cat .env | grep CLOUDANT

# Test connection
python3 scripts/testing/test_cloudant_connection.py
```

### Issue: No Data Showing
**Solution:**
```bash
# Verify data in Cloudant
python3 scripts/testing/explore_cloudant_data.py

# Check database status
python3 integrations/cloudant_adapter.py
```

### Issue: Import Failed in Orchestrate
**Solution:**
- Verify file is: `config/proactive-csi-agent-orchestrate.yaml`
- Check file size is ~20KB
- Try refreshing the page
- Verify YAML syntax is valid

### Issue: Services Not Connecting
**Solution:**
- Double-check API keys (no extra spaces)
- Verify URLs are complete
- Ensure services are active in IBM Cloud
- Try reconnecting each service individually

---

## 📸 Proof to Capture

Take screenshots of:

1. **Agent Overview**
   - Agent name: ProActive_CSI_Agent_404
   - Status: Active/Deployed
   - All services connected (green indicators)

2. **Service Connections**
   - STT: ✅ Connected
   - TTS: ✅ Connected
   - NLU: ✅ Connected
   - Cloudant: ✅ Connected (NEW!)
   - watsonx.ai: ✅ Connected

3. **Real Data Queries**
   - Portfolio overview showing $132.3M
   - High-risk customer list
   - Vendor delay tracking
   - Revenue at risk calculations

4. **Deployment URL**
   - Copy the full URL
   - Verify it's accessible

---

## ✅ Success Criteria

Deployment is successful when:

✅ Agent is **Active/Deployed** in IBM Portal  
✅ All 5 services show **Connected** status  
✅ Real data appears in query responses  
✅ Cloudant integration working ($132.3M portfolio visible)  
✅ All test queries return expected responses  
✅ Deployment URL is accessible  

---

## 🎊 You're Ready!

Your ProActive CSI agent is now enhanced with:
- ✅ 500 real customers from Cloudant
- ✅ 500 real vendors from Cloudant
- ✅ $132.3M real portfolio data
- ✅ 56 high-risk customers identified
- ✅ $67.2M at risk calculated
- ✅ Full IBM service integration

**Choose your deployment method above and get started!**

---

## 📚 Quick Links

- **Cloudant Integration**: `CLOUDANT_README.md`
- **Quick Reference**: `docs/features/CLOUDANT_QUICK_REFERENCE.md`
- **Full Deployment Guide**: `docs/deployment/DEPLOYMENT_COMPLETE_GUIDE.md`
- **Test Queries**: `docs/features/IBM_TEST_QUERIES.md`

---

**Status**: 🟢 READY TO DEPLOY

**Estimated Time**: 
- Local: 2 minutes
- IBM Orchestrate: 15 minutes

**Confidence**: High - All components verified with real data ✅

