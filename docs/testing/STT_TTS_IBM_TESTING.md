# 🎤 STT & TTS Testing Guide for IBM watsonx Orchestrate

**Testing Speech-to-Text and Text-to-Speech in Deployed Agent**

---

## 🌐 Access Your Agent

**Web UI:** https://au-syd.watson-orchestrate.cloud.ibm.com/build/manage

1. Go to "All agents"
2. Click on "ProActive_CSI_Agent_404"
3. Use the chat interface to test

---

## 🧪 Test Category 1: Voice Command Recognition (STT)

These queries test if the agent understands voice-related commands and can process them correctly.

### Test 1.1: Voice Command - Priority Query
```
Query: "What's my priority today? Please respond with voice briefing."

Expected Response Should Include:
• Structured priority briefing
• Mention of voice briefing capability
• Response indicating Text-to-Speech will be used
• Full priority breakdown with critical customers
```

### Test 1.2: Voice Command - Customer Query
```
Query: "Tell me about customer C-001 using voice response"

Expected Response Should Include:
• Customer details for C-001 (Acme Corp)
• Churn probability and risk level
• Mention of voice response capability
• Full customer analysis
```

### Test 1.3: Voice Command - Executive Brief
```
Query: "Generate daily executive brief and read it aloud"

Expected Response Should Include:
• Complete executive brief
• Mention of Text-to-Speech delivery
• Voice briefing confirmation
• All key metrics and recommendations
```

### Test 1.4: Voice Command - Churn Analysis
```
Query: "Analyze churn risk for all customers and provide voice summary"

Expected Response Should Include:
• Churn analysis for all customers
• Voice summary option mentioned
• Critical customers highlighted
• Risk breakdown
```

### Test 1.5: Hands-Free Query
```
Query: "I'm driving, can you give me a voice briefing on vendor delays?"

Expected Response Should Include:
• Vendor delay analysis
• Voice briefing format
• Hands-free operation confirmation
• Spoken summary available
```

---

## 🧪 Test Category 2: Voice Response Generation (TTS)

These queries test if the agent can generate voice responses and confirm TTS is working.

### Test 2.1: Voice Briefing Request
```
Query: "Read me the executive briefing aloud"

Expected Response Should Include:
• Executive brief content
• Confirmation that TTS is being used
• Voice generation status
• Audio response or TTS confirmation
```

### Test 2.2: Voice Morning Briefing
```
Query: "Good morning, give me a voice briefing of what I need to know today"

Expected Response Should Include:
• Morning briefing content
• Voice format confirmation
• Priority items listed
• TTS voice selection (Michael or Allison)
```

### Test 2.3: Voice Alert Request
```
Query: "Alert me with voice if any critical customers are at risk"

Expected Response Should Include:
• Critical customer list
• Voice alert confirmation
• TTS notification setup
• Real-time alert capability mentioned
```

### Test 2.4: Voice Summary Request
```
Query: "Summarize the revenue at risk and speak it to me"

Expected Response Should Include:
• Revenue at risk calculation
• Voice summary generation
• TTS response confirmation
• Financial breakdown
```

### Test 2.5: Voice Customer Analysis
```
Query: "Analyze customer C-003 and provide voice analysis"

Expected Response Should Include:
• Customer C-003 analysis (TechGlobal Inc)
• Voice analysis format
• TTS generation confirmation
• Complete customer intelligence
```

---

## 🧪 Test Category 3: Combined STT/TTS Workflow

These queries test the complete voice-first workflow from input to output.

### Test 3.1: Complete Voice Interaction
```
Query: "Using voice commands, tell me my priority customers and read the analysis aloud"

Expected Response Should Include:
• Priority customer list
• STT processing confirmation
• Customer analysis
• TTS response generation
• Complete voice workflow execution
```

### Test 3.2: Voice Workflow Execution
```
Query: "Execute workflow 6 using voice and provide voice response"

Expected Response Should Include:
• Workflow 6 execution confirmation
• Procurement-Customer Bridge workflow results
• Voice response generation
• STT/TTS integration confirmation
```

### Test 3.3: Voice Daily Briefing
```
Query: "Generate and read me the daily executive briefing using Text-to-Speech"

Expected Response Should Include:
• Complete executive brief
• TTS generation status
• Voice reading confirmation
• All briefing sections
```

---

## ✅ Verification Checklist

After testing in IBM Orchestrate, verify:

### STT (Speech-to-Text) Integration
- [ ] Agent recognizes voice command queries
- [ ] Agent confirms STT service usage
- [ ] Agent can process voice-related instructions
- [ ] Agent mentions voice command capability in responses

### TTS (Text-to-Speech) Integration
- [ ] Agent confirms TTS response generation
- [ ] Agent mentions voice briefing capability
- [ ] Agent references Text-to-Speech service
- [ ] Agent offers voice format responses

### Combined Voice Workflow
- [ ] Agent processes voice commands (STT)
- [ ] Agent generates voice responses (TTS)
- [ ] Agent confirms both services are used
- [ ] Agent provides complete voice-first experience

---

## 🎯 Expected Response Patterns

### When STT is Working:
- Agent mentions "Speech-to-Text" or "voice commands"
- Agent confirms understanding voice queries
- Agent processes voice-related instructions correctly
- Agent references hands-free operation capability

### When TTS is Working:
- Agent mentions "Text-to-Speech" or "voice response"
- Agent confirms generating voice/audio output
- Agent references voice briefing capability
- Agent mentions speaking or reading aloud

### When Both are Working:
- Agent confirms complete voice workflow
- Agent processes STT input and generates TTS output
- Agent provides voice-first experience
- Agent references both services in responses

---

## 📊 Sample Test Results to Look For

### Successful STT Response:
```
✅ Agent understands voice commands
✅ STT service is configured
✅ Voice queries processed correctly
✅ Hands-free operation supported
```

### Successful TTS Response:
```
✅ Voice briefing generated
✅ Text-to-Speech service active
✅ Audio output available
✅ Voice responses working
```

### Successful Combined Response:
```
✅ Complete voice workflow functional
✅ STT → Processing → TTS working
✅ Voice-first operations enabled
✅ Both services integrated
```

---

## 🔧 Troubleshooting

### If STT Not Mentioned:
- Verify agent instructions include STT references
- Check if voice command queries are processed
- Confirm agent understands voice-related requests

### If TTS Not Working:
- Verify agent instructions mention TTS responses
- Check if voice briefing requests are handled
- Confirm Text-to-Speech service is configured

### If No Voice Response:
- Verify IBM services are connected in Orchestrate
- Check agent instructions include voice capabilities
- Confirm STT/TTS credentials are valid

---

## 🚀 Quick Test Commands for IBM Orchestrate

Copy-paste these directly into the chat:

```
1. "What's my priority today? Please respond with voice briefing."

2. "Generate daily executive brief and read it aloud using Text-to-Speech"

3. "I'm driving, give me a voice summary of critical customers"

4. "Read me the revenue at risk analysis aloud"

5. "Using voice commands, analyze customer C-003 and speak the results"

6. "Provide a voice briefing on vendor delays"

7. "Good morning, give me a voice briefing of today's priorities"

8. "Execute workflow 6 and provide voice response"

9. "Summarize churn risk and read it to me using Text-to-Speech"

10. "Voice-first: What customers need my attention today?"
```

---

## 📝 Notes

1. **IBM watsonx Orchestrate Interface:**
   - Voice input may require browser microphone access
   - Voice output may be provided as audio file or stream
   - Check browser console for any audio playback issues

2. **Service Connection:**
   - Verify STT/TTS services are connected in Orchestrate
   - Check service credentials in Connections section
   - Ensure services are active and accessible

3. **Agent Instructions:**
   - Agent should explicitly mention STT/TTS in responses
   - Agent should confirm voice workflow execution
   - Agent should reference both services when appropriate

---

## 🎯 What to Look For in Agent Responses

### ✅ Successful Indicators:

1. **STT Mentioned:**
   - "I can process voice commands using Speech-to-Text"
   - "Voice command received and processed"
   - "Hands-free operation enabled"

2. **TTS Mentioned:**
   - "Generating voice briefing using Text-to-Speech"
   - "Voice response available"
   - "Reading briefing aloud via TTS"

3. **Both Services:**
   - "Processing voice command (STT) → Generating voice response (TTS)"
   - "Complete voice workflow executed"
   - "Voice-first operation confirmed"

### ❌ Missing Indicators:

- No mention of voice capabilities
- No STT/TTS service references
- No voice response confirmations
- No audio output available

---

**Last Updated:** January 2025  
**Agent Version:** 1.1.0  
**Testing Status:** Ready ✅

---

## 🔗 Related Documentation

- **LLM Analytics Testing:** `docs/testing/LLM_ANALYTICS_TESTING.md`
- **Deployment Guide:** `docs/deployment/IBM_PORTAL_DEPLOYMENT.md`
- **Agent Configuration:** `proactive-csi-agent-orchestrate.yaml`

---

## 💡 Tips for Demo

When demonstrating voice capabilities:

1. **Show Voice Commands:**
   - Type voice-related queries
   - Point out agent confirms STT processing

2. **Show Voice Responses:**
   - Request voice briefings
   - Highlight TTS generation confirmation

3. **Emphasize Integration:**
   - Show both STT and TTS working together
   - Demonstrate hands-free operation capability

4. **Business Value:**
   - Explain CSMs can use while driving
   - Highlight accessibility benefits
   - Show productivity gains from voice-first operations

---

**Ready to test voice capabilities in IBM watsonx Orchestrate! 🎤**

