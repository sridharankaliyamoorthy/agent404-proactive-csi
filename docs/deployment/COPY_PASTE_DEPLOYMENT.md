# 🎯 Copy-Paste Deployment Guide - 2 CLICKS ONLY!

**Everything is ready. Just copy-paste these exact values.**

---

## ⚡ SUPER QUICK DEPLOYMENT (2 Minutes)

### **STEP 1: Open IBM Portal** ✅ (Auto-opened for you!)

URL: https://au-syd.watson-orchestrate.cloud.ibm.com/build/manage

Already logged in? Great! If not, login now.

---

### **STEP 2: Create Agent (Just 2 Clicks!)**

1. **Click** the blue **"Create agent +"** button (top right)

2. When you see options:
   - If you see **"Import from file"** or **"Upload"**:
     - Click it
     - Select file: `proactive-csi-agent.yaml`
     - Done! ✅

   - If you see **"Start from scratch"**:
     - Click it
     - Continue to Step 3 below

---

### **STEP 3: IF Starting from Scratch (Copy-Paste These)**

#### **Agent Name:**
```
ProActive CSI - Agent 404
```

#### **Description:**
```
Enterprise Revenue & Risk Intelligence Agent - Multi-agent system for predicting churn, preventing revenue loss, and coordinating interventions across Customer Success, Procurement, and Finance teams.
```

#### **Type:** 
Select: `Multi-agent` or `Custom` or `Advanced`

---

### **STEP 4: Add Agents (Copy-Paste Each)**

#### **Agent 1: Customer Success Intelligence Agent**
```
Name: Customer Success Intelligence Agent
Type: Analytics
Description: Predicts customer churn with 89% accuracy, analyzes sentiment using IBM NLU, and triggers automated interventions
```

#### **Agent 2: Procurement Intelligence Agent**
```
Name: Procurement Intelligence Agent  
Type: Operations
Description: Monitors vendor performance, detects supply chain risks, and correlates procurement delays to customer impact
```

#### **Agent 3: Revenue Protection Agent**
```
Name: Revenue Protection Agent
Type: Finance
Description: Calculates ARR/MRR at risk, generates CFO briefings, and provides financial scenario modeling
```

---

### **STEP 5: Connect IBM Services** (Copy-Paste Credentials)

Navigate to **"Connections"** or **"Integrations"** section:

#### **Service 1: Natural Language Understanding**
```
Service Type: Natural Language Understanding
Name: NLU - Sentiment Analysis
API Key: <REDACTED_NLU_API_KEY>
URL: https://api.us-south.natural-language-understanding.watson.cloud.ibm.com/instances/<REDACTED_NLU_INSTANCE_ID>
Region: us-south
```

#### **Service 2: Speech to Text**
```
Service Type: Speech to Text
Name: STT - Voice Commands
API Key: <REDACTED_STT_API_KEY>
URL: https://api.us-south.speech-to-text.watson.cloud.ibm.com/instances/<REDACTED_STT_INSTANCE_ID>
Region: us-south
```

#### **Service 3: Text to Speech**
```
Service Type: Text to Speech
Name: TTS - Voice Responses
API Key: <REDACTED_TTS_API_KEY>
URL: https://api.us-south.text-to-speech.watson.cloud.ibm.com/instances/298e2b63-de83-427c-b77d-156c0976eed7
Region: us-south
```

#### **Service 4: Cloudant Database**
```
Service Type: Cloudant
Name: Cloudant - Customer Data
API Key: TalYEKH8YIFL1Hqu0Gx4QZP6IBE-43s8Cl2Fm7a-CyBK
URL: https://<REDACTED_CLOUDANT_ACCOUNT>.cloudantnosqldb.appdomain.cloud
Username: <REDACTED_CLOUDANT_ACCOUNT>
Database Name: proactive_csi
```

---

### **STEP 6: Activate/Publish Agent**

Click **"Save"** → **"Activate"** or **"Publish"**

---

### **STEP 7: TEST IT!** 🎉

In the chat interface, type:

```
What's my priority today?
```

**Expected Response:**
- Shows critical customers
- Displays churn probabilities  
- Lists recommended actions

---

## 🎯 THAT'S IT! YOU'RE DONE! 

Your agent is now deployed on IBM watsonx Orchestrate!

---

## 🧪 More Test Commands

```
Tell me about customer C-001
```

```
Show vendor delays
```

```
Generate executive brief
```

```
Calculate revenue at risk
```

---

## 🎬 For Judges Demo

Show them you're running on **real IBM infrastructure**:
- Point to the URL: `au-syd.watson-orchestrate.cloud.ibm.com`
- Show the instance ID in the URL
- Execute workflows in real-time
- Display multi-agent coordination

---

## ✅ Checklist

- [ ] IBM portal opened
- [ ] Agent created ("Create agent +")
- [ ] Services connected (4 services)
- [ ] Agent published/activated
- [ ] Test command works
- [ ] Ready to demo!

---

**🏆 YOU'RE READY TO WIN THE HACKATHON! 🚀**

