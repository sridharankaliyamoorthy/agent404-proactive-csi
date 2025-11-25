# 🚀 IBM WATSONX ORCHESTRATE DEPLOYMENT - STEP BY STEP

## 📋 Quick Reference Card

**File to Upload:**
```
/Users/ishwaryasridharan/Desktop/Hackathon_2025/agent404-proactive-csi-2.0/config/proactive-csi-agent-orchestrate.yaml
```

**Agent Name:** ProActive_CSI_Agent_404

---

## 🎯 STEP-BY-STEP GUIDE

### STEP 1: Login to IBM Cloud ☁️

1. Open your browser
2. Go to: **https://cloud.ibm.com/login**
3. Enter your IBM Cloud credentials
4. Complete 2FA if prompted
5. Wait for redirect to IBM Cloud dashboard

---

### STEP 2: Navigate to watsonx Orchestrate 🎯

**Option A: Direct Link**
- Go to: **https://au-syd.watson-orchestrate.cloud.ibm.com/build/manage**

**Option B: Navigate from Dashboard**
1. Click **"watsonx"** in top navigation menu
2. Select **"Orchestrate"** from dropdown
3. Click **"Agents"** or **"All agents"** in left sidebar

---

### STEP 3: Import Your Agent 📁

1. Look for one of these buttons:
   - **"Create agent"**
   - **"Import agent"**
   - **"+ New agent"**
   - **"Add"**

2. Click the button

3. Select **"Import from file"** or **"Upload YAML"**

4. Click **"Choose file"** or **"Browse"**

5. Navigate to and select:
   ```
   config/proactive-csi-agent-orchestrate.yaml
   ```

6. Click **"Open"** or **"Upload"**

7. Wait 5-10 seconds for upload

**Expected Result:**
- Agent name appears: **ProActive_CSI_Agent_404**
- Description is visible
- Status shows as "Draft" or "Not configured"

---

### STEP 4: Connect IBM Services 🔌

Click on **"Connections"**, **"Integrations"**, or **"Services"** tab

#### Service 1: Speech-to-Text 🎤

1. Click **"Add connection"** or **"Connect service"**
2. Select **"Speech to Text"** from list
3. Enter (use environment variables, do NOT hardcode):
   ```
   API Key: <REDACTED_STT_API_KEY>
   URL: https://api.us-south.speech-to-text.watson.cloud.ibm.com/instances/<REDACTED_STT_INSTANCE_ID>
   ```
4. Click **"Test connection"** (optional)
5. Click **"Connect"** or **"Save"**

**Status should show:** ✅ **Connected** (green)

---

#### Service 2: Text-to-Speech 🔊

1. Click **"Add connection"**
2. Select **"Text to Speech"**
3. Enter:
   ```
   API Key: <REDACTED_TTS_API_KEY>
   URL: https://api.us-south.text-to-speech.watson.cloud.ibm.com/instances/<REDACTED_TTS_INSTANCE_ID>
   ```
4. Click **"Connect"** or **"Save"**

**Status should show:** ✅ **Connected** (green)

---

#### Service 3: Natural Language Understanding 🧠

1. Click **"Add connection"**
2. Select **"Natural Language Understanding"**
3. Enter:
   ```
   API Key: <REDACTED_NLU_API_KEY>
   URL: https://api.us-south.natural-language-understanding.watson.cloud.ibm.com/instances/<REDACTED_NLU_INSTANCE_ID>
   ```
4. Click **"Connect"** or **"Save"**

**Status should show:** ✅ **Connected** (green)

---

#### Service 4: Cloudant (NEW! Your Teammate's Data) 🗄️

1. Click **"Add connection"**
2. Select **"Cloudant"** or **"Cloudant NoSQL Database"**
3. Enter:
   ```
   API Key: <REDACTED_CLOUDANT_API_KEY>
   URL: https://<REDACTED_CLOUDANT_ACCOUNT>.cloudantnosqldb.appdomain.cloud
   ```
4. Click **"Connect"** or **"Save"**

**Status should show:** ✅ **Connected** (green)

**This connection gives you access to:**
- 500 customers with churn predictions
- 500 vendors with delivery tracking
- $132.3M portfolio data
- $67.2M at risk calculations

---

#### Service 5: watsonx.ai 🤖

1. Click **"Add connection"**
2. Select **"watsonx.ai"**
3. Enter:
   ```
   Project ID: <REDACTED_WATSONX_PROJECT_ID>
   Region: us-south
   ```
4. Click **"Connect"** or **"Save"**

**Status should show:** ✅ **Connected** (green)

---

### STEP 5: Verify All Connections ✅

Check that all 5 services show:
- ✅ Speech-to-Text: **Connected**
- ✅ Text-to-Speech: **Connected**
- ✅ Natural Language Understanding: **Connected**
- ✅ Cloudant: **Connected**
- ✅ watsonx.ai: **Connected**

---

### STEP 6: Save Configuration 💾

1. Look for **"Save"** button (usually top-right corner)
2. Click **"Save"**
3. Wait for confirmation message
4. Verify no error messages appear

---

### STEP 7: Activate/Publish Agent 🚀

1. Look for one of these buttons:
   - **"Activate"**
   - **"Publish"**
   - **"Deploy"**
   - **"Make live"**

2. Click the button

3. Wait 10-30 seconds for activation

4. Status should change to:
   - ✅ **Active**
   - ✅ **Published**
   - ✅ **Live**
   - ✅ **Deployed**

---

### STEP 8: Get Deployment URL 🔗

1. Look for one of these options:
   - **"Share"** button
   - **"Get link"** button
   - **"Copy URL"** button
   - **"Chat URL"** link
   - **"Test"** button

2. Click to reveal the URL

3. **Copy the full URL**

4. Save it for submission

**URL Format:**
```
https://au-syd.watson-orchestrate.cloud.ibm.com/assistants/[your-agent-id]
```

---

### STEP 9: Test Your Agent 🧪

Click on your agent to open the chat interface

#### Test 1: Portfolio Overview
**Query:**
```
Show me my portfolio overview
```

**Expected Response:**
- Total ARR: $132.3M
- ARR at Risk: $67.2M (50.8%)
- High-risk customers: 56
- Delayed vendors: 491

---

#### Test 2: High-Risk Customers
**Query:**
```
Who are my top 3 at-risk customers?
```

**Expected Response:**
1. Summit Enterprises - 148 (86% churn, $353K ARR)
2. CloudFirst Systems - 140 (85% churn, $73K ARR)
3. Gamma Corporation - 499 (84% churn, $377K ARR)

---

#### Test 3: Vendor Delays
**Query:**
```
What vendor delays are impacting customers?
```

**Expected Response:**
- List of delayed vendors
- Customer impact analysis
- Delay days and severity
- Affected customer lists

---

#### Test 4: Financial Impact
**Query:**
```
Calculate the financial impact of top risks
```

**Expected Response:**
- Revenue scenarios (best/worst/expected case)
- ROI calculations
- Intervention recommendations
- Financial metrics

---

#### Test 5: Executive Briefing
**Query:**
```
Generate an executive briefing
```

**Expected Response:**
- Comprehensive summary
- Top risks prioritized
- Action items
- Financial impact
- Strategic recommendations

---

## 📸 Screenshots to Capture

Take screenshots of:

1. **Agent Overview Page**
   - Shows agent name: ProActive_CSI_Agent_404
   - Status: Active/Published
   - All services connected

2. **Service Connections Page**
   - All 5 services with green checkmarks
   - Cloudant connection visible

3. **Test Query Results**
   - At least 3 successful test queries
   - Real data showing in responses

4. **Deployment URL**
   - URL visible and copied
   - Agent accessible

---

## ✅ Success Checklist

Your deployment is successful when:

- ✅ Agent imported and visible
- ✅ Agent name: ProActive_CSI_Agent_404
- ✅ All 5 services connected (green status)
- ✅ Cloudant connected with real data
- ✅ Agent activated/published
- ✅ Deployment URL obtained
- ✅ All test queries work
- ✅ Real data appears in responses ($132.3M portfolio)
- ✅ No error messages

---

## 🐛 Troubleshooting

### Issue: Can't find import button
**Solution:**
- Look for "+" icon, "Add", "Create", or "Import" in the UI
- Try refreshing the page
- Check if you're in the correct section (Agents/Skills)

### Issue: Upload failed
**Solution:**
- Verify file is exactly: `proactive-csi-agent-orchestrate.yaml`
- File size should be ~33KB
- Try refreshing and uploading again
- Check browser console for errors

### Issue: Service won't connect
**Solution:**
- Double-check API key (no extra spaces)
- Verify URL is complete and correct
- Try disconnecting and reconnecting
- Ensure service instance is active in IBM Cloud

### Issue: Cloudant connection fails
**Solution:**
- Verify credentials match .env file
- Test connection locally first:
  ```bash
  python3 scripts/testing/test_cloudant_connection.py
  ```
- Check API key permissions
- Ensure URL includes `https://`

### Issue: Agent not responding
**Solution:**
- Verify agent is "Active" or "Published"
- Check all services are connected (green)
- Try a simple test: "Hello"
- Refresh the page
- Check service connections again

---

## 🎊 What Makes Your Deployment Special

Your IBM watsonx Orchestrate deployment includes:

✅ **Real Data from Cloudant:**
- 500 actual customers with churn predictions
- 500 real vendors with delivery tracking
- 500 revenue records with financial metrics

✅ **$132.3M Portfolio:**
- Real ARR calculations
- Actual risk assessments
- Financial impact analysis

✅ **Multi-Agent Intelligence:**
- Customer Success Agent
- Procurement Intelligence Agent
- Revenue Protection Agent

✅ **5 IBM Services Integrated:**
- Speech-to-Text (voice input)
- Text-to-Speech (voice output)
- Natural Language Understanding (sentiment analysis)
- Cloudant (data storage)
- watsonx.ai (AI/ML models)

✅ **Production Ready:**
- Full workflow automation
- Real-time risk monitoring
- Executive reporting
- Intervention recommendations

---

## 📞 Need Help?

- **Detailed Guide:** `DEPLOY_NOW_WITH_CLOUDANT.md`
- **Cloudant Info:** `CLOUDANT_README.md`
- **Quick Reference:** `docs/features/CLOUDANT_QUICK_REFERENCE.md`

---

## 🎯 After Deployment

Once deployed, you can:
1. Share the deployment URL with your team
2. Demo the agent with real data queries
3. Generate executive briefings
4. Show portfolio management ($132.3M)
5. Demonstrate multi-agent coordination
6. Submit for hackathon evaluation

---

**Status**: 🟢 **READY TO DEPLOY**

**Good luck with your deployment!** 🚀

---

*ProActive CSI - Agent 404*  
*Enterprise Revenue & Risk Intelligence Agent*  
*IBM watsonx Orchestrate Hackathon 2025*

