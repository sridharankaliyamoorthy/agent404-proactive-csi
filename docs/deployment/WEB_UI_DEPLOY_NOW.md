# 🚀 Web UI Deployment - Do This Now!

## ✅ IBM Portal Should Be Open

If not, go to: **https://cloud.ibm.com/watsonx/orchestrate**

---

## 📋 Step-by-Step (5 Minutes)

### Step 1: Login
- Login with your IBM Cloud account
- Email: [your email]

### Step 2: Find Agents Section
- Look for **"All agents"** or **"Skills"** in left sidebar
- Click on it

### Step 3: Import Agent
- Click **"Create agent"** or **"Import agent"**
- Click **"Import from file"** or **"Upload"**
- Navigate to:
  ```
  /Users/ishwaryasridharan/Desktop/Hackathon_2025/Agentic_AI/agent404-proactive-csi/
  ```
- Select: **`proactive-csi-agent-orchestrate.yaml`**
- Click **"Open"** or **"Upload"**

### Step 4: Connect Services
Go to **"Connections"** or **"Integrations"** tab and add:

**1. Natural Language Understanding (NLU):**
-- API Key: `<REDACTED_NLU_API_KEY>`
-- URL: `https://api.us-south.natural-language-understanding.watson.cloud.ibm.com/instances/<REDACTED_NLU_INSTANCE_ID>`

**2. Speech-to-Text (STT):**
-- API Key: `<REDACTED_STT_API_KEY>`
-- URL: `https://api.us-south.speech-to-text.watson.cloud.ibm.com/instances/<REDACTED_STT_INSTANCE_ID>`

**3. Text-to-Speech (TTS):**
- API Key: `<REDACTED_TTS_API_KEY>`
- URL: `https://api.us-south.text-to-speech.watson.cloud.ibm.com/instances/298e2b63-de83-427c-b77d-156c0976eed7`

**4. Cloudant:**
- API Key: `TalYEKH8YIFL1Hqu0Gx4QZP6IBE-43s8Cl2Fm7a-CyBK`
- URL: `https://<REDACTED_CLOUDANT_ACCOUNT>.cloudantnosqldb.appdomain.cloud`

### Step 5: Activate
- Click **"Save"** button
- Click **"Activate"** or **"Publish"**
- Wait for confirmation (10-30 seconds)

### Step 6: Test
- Click on your agent to open chat
- Type: **`Good morning, what's my priority today?`**
- Verify agent responds correctly

---

## ✅ Success!

Once deployed, you'll have:
- ✅ Agent live in IBM watsonx Orchestrate
- ✅ All services connected
- ✅ Ready for hackathon submission!

---

## 📍 Quick File Path

**Copy this path when uploading:**
```
/Users/ishwaryasridharan/Desktop/Hackathon_2025/Agentic_AI/agent404-proactive-csi/proactive-csi-agent-orchestrate.yaml
```

---

**🚀 Go deploy now! The portal should be open in your browser!**

