# 🚀 IBM Portal - Quick Start (5 Minutes)

**Deploy ProActive CSI to IBM watsonx Orchestrate - Updated Credentials**

---

## ✅ Your IBM watsonx Orchestrate Instance

**Region:** Australia Sydney (au-syd)  
**Instance ID:** f16c2181-a811-4d84-8e15-33cfebe50928

**Portal URLs:**
- Main: https://cloud.ibm.com/watsonx/orchestrate
- Direct API: https://api.au-syd.watson-orchestrate.cloud.ibm.com/

---

## 🎯 5-Minute Deployment Steps

### **STEP 1: Login to IBM Portal** (1 minute)

1. Open: **https://cloud.ibm.com/watsonx/orchestrate**
2. Login with your IBM Cloud credentials
3. Select your watsonx Orchestrate instance
4. You should see your instance: `f16c2181-a811-4d84-8e15-33cfebe50928`

---

### **STEP 2: Upload Agent Configuration** (1 minute)

1. In the left sidebar, click **"Skills"**
2. Click **"Add skill"** or **"Import skill"** button
3. Click **"Upload from file"**
4. Select file: **`proactive-csi-agent.yaml`**
   - Location: `/Users/ishwaryasridharan/Desktop/Hackathon_2025/Agentic_AI/agent404-proactive-csi/proactive-csi-agent.yaml`
5. Name it: **"ProActive CSI - Agent 404"**
6. Description: **"Enterprise Revenue & Risk Intelligence Agent"**
7. Click **"Import"** or **"Create"**

---

### **STEP 3: Connect IBM Services** (2 minutes)

Navigate to **"Connections"** or **"Integrations"** and add:

#### **Service 1: Natural Language Understanding**
```
Name: NLU - Sentiment Analysis
API Key: <REDACTED_NLU_API_KEY>
URL: https://api.us-south.natural-language-understanding.watson.cloud.ibm.com/instances/<REDACTED_NLU_INSTANCE_ID>
Region: us-south
```

#### **Service 2: Speech to Text**
```
Name: STT - Voice Commands
API Key: <REDACTED_STT_API_KEY>
URL: https://api.us-south.speech-to-text.watson.cloud.ibm.com/instances/<REDACTED_STT_INSTANCE_ID>
Region: us-south
```

#### **Service 3: Text to Speech**
```
Name: TTS - Voice Responses
API Key: <REDACTED_TTS_API_KEY>
URL: https://api.us-south.text-to-speech.watson.cloud.ibm.com/instances/298e2b63-de83-427c-b77d-156c0976eed7
Region: us-south
```

#### **Service 4: Cloudant Database**
```
Name: Cloudant - Customer Data
API Key: TalYEKH8YIFL1Hqu0Gx4QZP6IBE-43s8Cl2Fm7a-CyBK
URL: https://<REDACTED_CLOUDANT_ACCOUNT>.cloudantnosqldb.appdomain.cloud
Username: <REDACTED_CLOUDANT_ACCOUNT>
```

---

### **STEP 4: Test Your Deployment** (1 minute)

In the Orchestrate chat interface, try these commands:

```
✅ "What's my priority today?"
✅ "Tell me about customer C-001"
✅ "Show critical customers"
✅ "Generate executive brief"
```

**Expected Response:**
- Agent should respond with customer intelligence
- Show churn probabilities
- List critical customers
- Display interventions

---

## 🎬 Demo Workflows for Judges

### **Workflow 1: Customer Intelligence**
```
Command: "Analyze customer C-001"

Expected Output:
- Customer: Acme Corp
- Churn Risk: 83.5%
- Risk Level: CRITICAL
- Contract Value: $65,000
- Recommended Interventions: 5 actions
```

### **Workflow 2: Procurement Alert**
```
Command: "Show vendor delays"

Expected Output:
- Vendors with delays: 3
- Worst delay: GlobalSupply Co (16 days)
- Affected customers: Multiple
- ARR at risk: $197,897
```

### **Workflow 3: Executive Brief**
```
Command: "Generate daily executive brief"

Expected Output:
- Critical customers: 4
- Total ARR at risk: $197,897
- Vendor delays: 3
- Recommended actions: 5+
- Revenue protection strategy
```

---

## 🔧 Quick Troubleshooting

### **Issue: Can't find Skills section**
**Solution:** Look for "Apps", "Custom skills", or "Builder" in the sidebar

### **Issue: Upload failed**
**Solution:** 
- Check file is `proactive-csi-agent.yaml`
- File size should be < 100KB
- YAML syntax is valid

### **Issue: Services not connecting**
**Solution:**
- Double-check API keys (no extra spaces)
- Verify URLs are complete
- Try reconnecting each service

### **Issue: Commands not working**
**Solution:**
- Make sure skill is "Published" or "Active"
- Check service connections are green/active
- Try simple command first: "Hello"

---

## 🎯 Testing Checklist

Before the hackathon demo, verify:

- [ ] Login to IBM portal works
- [ ] ProActive CSI skill is uploaded
- [ ] All 4 services are connected (green status)
- [ ] Test command works: "What's my priority today?"
- [ ] Customer analysis works: "Tell me about customer C-001"
- [ ] Executive brief generates successfully
- [ ] Multi-agent coordination visible in responses

---

## 💡 Pro Tips for Judges

**What Makes This Impressive:**

1. **Real IBM Deployment**
   - Show you're on actual IBM infrastructure
   - Point out your instance ID in URL
   - Demonstrate cloud-native deployment

2. **Live Multi-Agent Coordination**
   - Execute workflows in real-time
   - Show agents communicating
   - Display data from Cloudant

3. **Voice Commands** (If enabled)
   - Click microphone icon
   - Speak: "What's my priority today?"
   - Show voice transcription

4. **Professional UI**
   - IBM's professional interface
   - Enterprise-grade presentation
   - Production-ready appearance

---

## 📊 Expected Results

After successful deployment, you should have:

✅ **Skill Active:** ProActive CSI visible in your skills list  
✅ **Services Connected:** 4 IBM services (NLU, STT, TTS, Cloudant)  
✅ **Workflows Running:** All 6 workflows executable  
✅ **Data Flowing:** Customer intelligence displayed  
✅ **Demo Ready:** Can show to judges immediately  

---

## 🚀 You're Ready!

**Your Setup:**
- ✅ Updated credentials configured
- ✅ Australia Sydney region
- ✅ Instance ID: f16c2181-a811-4d84-8e15-33cfebe50928
- ✅ All IBM services ready
- ✅ YAML configuration file ready

**Next Step:**
1. Open: https://cloud.ibm.com/watsonx/orchestrate
2. Follow steps above
3. Test with simple commands
4. Demo to judges!

---

## 📞 Quick Access URLs

**Main Portal:**
```
https://cloud.ibm.com/watsonx/orchestrate
```

**Direct API Access:**
```
https://api.au-syd.watson-orchestrate.cloud.ibm.com/instances/f16c2181-a811-4d84-8e15-33cfebe50928
```

**Instance Dashboard:**
```
https://cloud.ibm.com/watsonx/orchestrate/instances/f16c2181-a811-4d84-8e15-33cfebe50928
```

---

## 🏆 Good Luck!

You have everything you need for an impressive IBM portal demo!

**Key Points to Emphasize:**
- ✅ Running on real IBM infrastructure (not local)
- ✅ Multi-agent coordination (3 agents working together)
- ✅ 6 IBM services integrated
- ✅ Production-ready deployment
- ✅ Enterprise-grade solution

**GO WIN THAT HACKATHON!** 🚀

---

<div align="center">

**ProActive CSI - Agent 404**  
*Deployed on IBM watsonx Orchestrate*  
*Australia Sydney Region*

**Instance:** f16c2181-a811-4d84-8e15-33cfebe50928

</div>

