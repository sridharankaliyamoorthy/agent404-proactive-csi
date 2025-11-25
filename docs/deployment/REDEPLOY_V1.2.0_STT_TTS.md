# 🚀 Redeployment Guide - v1.2.0 (STT & TTS Integration)

**Redeploy ProActive CSI Agent with Complete Audio STT & TTS Integration**

---

## ✅ Changes in v1.2.0

**Version:** 1.2.0  
**Release Date:** January 2025  
**Focus:** Complete IBM Watson STT & TTS Audio Integration

### What's New:

1. **✅ Complete STT Integration**
   - IBM Watson Speech-to-Text API integration
   - POST /v1/recognize method support
   - Voice command processing capability

2. **✅ Complete TTS Integration**
   - IBM Watson Text-to-Speech API integration
   - POST /v1/synthesize method support
   - Voice response generation capability

3. **✅ Enhanced Agent Configuration**
   - Detailed STT/TTS API instructions
   - Voice-first capabilities documentation
   - Complete voice workflow examples

4. **✅ New Documentation**
   - STT Integration Guide
   - TTS Integration Guide
   - STT/TTS Testing Guide

---

## 🎯 Quick Redeployment Steps (5 Minutes)

### **STEP 1: Access IBM watsonx Orchestrate** (1 minute)

1. Open: **https://cloud.ibm.com/watsonx/orchestrate**
   - Or direct: **https://au-syd.watson-orchestrate.cloud.ibm.com/build/manage**

2. Login with your IBM Cloud credentials

3. Select your instance: **f16c2181-a811-4d84-8e15-33cfebe50928**

---

### **STEP 2: Update Agent Configuration** (2 minutes)

1. Go to **"Skills"** or **"All agents"** in the left sidebar

2. Find **"ProActive_CSI_Agent_404"**

3. Click **"Edit"** or **"Update"** button

4. Click **"Import from file"** or **"Upload new configuration"**

5. Upload the updated file:
   - **File:** `proactive-csi-agent-orchestrate.yaml`
   - **Location:** `agent404-proactive-csi/proactive-csi-agent-orchestrate.yaml`

6. **Verify the update:**
   - Check version shows: **1.2.0**
   - Confirm STT/TTS sections are present
   - Review updated instructions section

7. Click **"Save"** or **"Update"**

---

### **STEP 3: Verify STT/TTS Service Connections** (1 minute)

1. Go to **"Connections"** or **"Integrations"**

2. **Verify Speech-to-Text connection:**
   - Connection name: **"STT - Voice Commands"**
   - API Key: `<REDACTED_STT_API_KEY>`
   - URL: `https://api.us-south.speech-to-text.watson.cloud.ibm.com/instances/<REDACTED_STT_INSTANCE_ID>`
   - Status: ✅ Connected

3. **Verify Text-to-Speech connection:**
   - Connection name: **"TTS - Voice Responses"**
   - API Key: `<REDACTED_TTS_API_KEY>`
   - URL: `https://api.us-south.text-to-speech.watson.cloud.ibm.com/instances/298e2b63-de83-427c-b77d-156c0976eed7`
   - Status: ✅ Connected

4. **If services not connected:**
   - Click **"Add Connection"**
   - Select **"Speech to Text"** or **"Text to Speech"**
   - Enter credentials above
   - Click **"Connect"**

---

### **STEP 4: Activate/Deploy Agent** (1 minute)

1. After saving the agent configuration

2. Click **"Activate"** or **"Publish"** button

3. Wait for deployment confirmation (usually 10-30 seconds)

4. Status should show: **✅ Active** or **✅ Deployed**

---

### **STEP 5: Test STT/TTS Integration** (1 minute)

1. Click on **"ProActive_CSI_Agent_404"** to open chat interface

2. **Test STT (Voice Command):**
   ```
   Query: "I'm driving, what's my priority today? Please process via voice command."
   
   Expected Response Should Include:
   ✅ "🎤 Processing voice command via IBM Speech-to-Text service"
   ✅ "API: POST /v1/recognize"
   ✅ "Model: en-US_BroadbandModel"
   ✅ Priority briefing content
   ```

3. **Test TTS (Voice Response):**
   ```
   Query: "Read me the executive briefing aloud using Text-to-Speech"
   
   Expected Response Should Include:
   ✅ "🔊 Generating voice response via IBM Text-to-Speech service"
   ✅ "API: POST /v1/synthesize"
   ✅ "Voice: en-US_MichaelV3Voice"
   ✅ "Format: audio/wav"
   ✅ Executive briefing content
   ```

4. **Test Complete Voice Workflow:**
   ```
   Query: "Using voice commands, give me a voice briefing on vendor delays"
   
   Expected Response Should Include:
   ✅ "🎤🔊 Complete voice workflow"
   ✅ STT processing mentioned
   ✅ TTS generation mentioned
   ✅ Vendor delay analysis
   ```

---

## ✅ Deployment Checklist

- [ ] Agent configuration updated to v1.2.0
- [ ] STT service connection verified
- [ ] TTS service connection verified
- [ ] Agent activated/deployed successfully
- [ ] STT integration tested
- [ ] TTS integration tested
- [ ] Complete voice workflow tested

---

## 🧪 Additional Test Queries

### STT Tests:
```
1. "What's my priority today? Process via voice command."
2. "Using Speech-to-Text, analyze customer C-001"
3. "I'm driving, give me a hands-free voice command summary"
```

### TTS Tests:
```
1. "Read me the revenue at risk analysis aloud"
2. "Generate voice briefing using Text-to-Speech"
3. "Speak the executive summary aloud"
```

### Combined Tests:
```
1. "Using voice commands, provide a voice briefing on critical customers"
2. "Voice-first: What customers need attention? Read the response aloud"
3. "Hands-free mode: Generate and speak the daily briefing"
```

---

## 📊 Expected Response Indicators

### ✅ STT Working:
- Agent mentions "IBM Speech-to-Text" or "STT"
- API endpoint referenced: "POST /v1/recognize"
- Model mentioned: "en-US_BroadbandModel"
- Voice command processed correctly

### ✅ TTS Working:
- Agent mentions "IBM Text-to-Speech" or "TTS"
- API endpoint referenced: "POST /v1/synthesize"
- Voice mentioned: "en-US_MichaelV3Voice"
- Format mentioned: "audio/wav"
- Audio generation confirmed

### ✅ Both Working:
- Complete voice workflow mentioned
- Both STT and TTS referenced in same response
- Hands-free operation confirmed

---

## 🔧 Troubleshooting

### If Agent Update Fails:

1. **Check Configuration File:**
   - Verify `proactive-csi-agent-orchestrate.yaml` is valid YAML
   - Check for syntax errors
   - Ensure all sections are properly formatted

2. **Check Service Connections:**
   - Verify STT/TTS services are connected
   - Test service credentials
   - Check service status in IBM Cloud

3. **Check Version:**
   - Confirm version is 1.2.0 in VERSION file
   - Verify changelog includes STT/TTS notes

### If STT/TTS Not Working:

1. **Verify Services Connected:**
   - Go to Connections section
   - Check STT and TTS are connected
   - Test service connections

2. **Check Agent Instructions:**
   - Verify agent instructions mention STT/TTS
   - Check API endpoint references
   - Confirm voice/model specifications

3. **Test Services Directly:**
   - Use cURL to test STT API
   - Use cURL to test TTS API
   - Verify credentials are valid

---

## 📚 Related Documentation

- **STT Integration Guide:** `docs/testing/STT_INTEGRATION_GUIDE.md`
- **TTS Integration Guide:** `docs/testing/TTS_INTEGRATION_GUIDE.md`
- **STT/TTS Testing Guide:** `docs/testing/STT_TTS_IBM_TESTING.md`
- **Quick Start Guide:** `docs/deployment/IBM_PORTAL_QUICK_START.md`
- **Deployment Guide:** `docs/deployment/IBM_PORTAL_DEPLOYMENT.md`

---

## 🎯 Success Indicators

After redeployment, you should see:

✅ Agent version updated to **1.2.0**  
✅ STT service connection active  
✅ TTS service connection active  
✅ Agent mentions STT/TTS in voice-related queries  
✅ Voice workflow examples work correctly  
✅ All test queries produce expected responses  

---

## 📞 Support

If you encounter issues:

1. Check the troubleshooting section above
2. Review the integration guides
3. Test services directly via cURL
4. Verify credentials are correct
5. Check IBM Cloud service status

---

**Version:** 1.2.0  
**Last Updated:** January 2025  
**Status:** Ready for Redeployment ✅

---

## 🚀 Quick Redeployment Commands

**From your local machine:**

```bash
cd /Users/ishwaryasridharan/Desktop/Hackathon_2025/Agentic_AI/agent404-proactive-csi

# Verify changes are committed
git status

# Verify version
cat VERSION  # Should show: 1.2.0

# Verify agent configuration
cat proactive-csi-agent-orchestrate.yaml | grep -i "STT\|TTS"  # Should show STT/TTS sections
```

**Then manually upload to IBM Orchestrate portal as described above.**

---

**Ready to redeploy with complete STT & TTS integration! 🎤🔊**

