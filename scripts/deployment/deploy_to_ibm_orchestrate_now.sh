#!/bin/bash
# Deploy ProActive CSI to IBM watsonx Orchestrate
# Run this script to open the IBM portal and get deployment instructions

echo ""
echo "╔══════════════════════════════════════════════════════════════════╗"
echo "║                                                                  ║"
echo "║        🚀 DEPLOYING TO IBM WATSONX ORCHESTRATE 🚀                ║"
echo "║                                                                  ║"
echo "╚══════════════════════════════════════════════════════════════════╝"
echo ""

# Check if configuration file exists
CONFIG_FILE="config/proactive-csi-agent-orchestrate.yaml"
if [ ! -f "$CONFIG_FILE" ]; then
    echo "❌ Configuration file not found: $CONFIG_FILE"
    exit 1
fi

echo "✅ Configuration file found: $CONFIG_FILE"
echo "   Size: $(wc -c < "$CONFIG_FILE" | xargs) bytes"
echo ""

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📋 DEPLOYMENT STEPS"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "STEP 1: Login to IBM Cloud"
echo "   Opening: https://cloud.ibm.com/login"
echo ""
open "https://cloud.ibm.com/login" 2>/dev/null || echo "   Please open manually: https://cloud.ibm.com/login"
sleep 2

echo "STEP 2: Navigate to watsonx Orchestrate"
echo "   After login, opening: https://au-syd.watson-orchestrate.cloud.ibm.com/build/manage"
echo ""
open "https://au-syd.watson-orchestrate.cloud.ibm.com/build/manage" 2>/dev/null || echo "   Please open manually: https://au-syd.watson-orchestrate.cloud.ibm.com/build/manage"
sleep 2

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📁 FILE TO UPLOAD"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "File: $(pwd)/$CONFIG_FILE"
echo ""

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🔑 IBM SERVICE CREDENTIALS"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "Service 1: SPEECH-TO-TEXT"
echo "   API Key: <REDACTED_STT_API_KEY>"
echo "   URL: https://api.us-south.speech-to-text.watson.cloud.ibm.com/instances/<REDACTED_STT_INSTANCE_ID>"
echo ""

echo "Service 2: TEXT-TO-SPEECH"
echo "   API Key: <REDACTED_TTS_API_KEY>"
echo "   URL: https://api.us-south.text-to-speech.watson.cloud.ibm.com/instances/298e2b63-de83-427c-b97d-156c0976eed7"
echo ""

echo "Service 3: NATURAL LANGUAGE UNDERSTANDING"
echo "   API Key: <REDACTED_NLU_API_KEY>"
echo "   URL: https://api.us-south.natural-language-understanding.watson.cloud.ibm.com/instances/79459c2d-4e21-4593-963e-6e9964afe1a3"
echo ""

echo "Service 4: CLOUDANT (NEW! - Your Teammate's Data)"
echo "   API Key: <REDACTED_CLOUDANT_API_KEY>"
echo "   URL: https://<REDACTED_CLOUDANT_ACCOUNT>.cloudantnosqldb.appdomain.cloud"
echo ""

echo "Service 5: WATSONX.AI"
echo "   Project ID: <REDACTED_WATSONX_PROJECT_ID>"
echo "   Region: us-south"
echo ""

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📝 DEPLOYMENT CHECKLIST"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "In the IBM watsonx Orchestrate portal:"
echo ""
echo "□ 1. Click 'Create agent' or 'Import agent'"
echo "□ 2. Select 'Import from file'"
echo "□ 3. Upload: $CONFIG_FILE"
echo "□ 4. Go to 'Connections' or 'Integrations' tab"
echo "□ 5. Connect Speech-to-Text service"
echo "□ 6. Connect Text-to-Speech service"
echo "□ 7. Connect Natural Language Understanding service"
echo "□ 8. Connect Cloudant service (NEW!)"
echo "□ 9. Connect watsonx.ai service"
echo "□ 10. Click 'Save'"
echo "□ 11. Click 'Activate' or 'Publish'"
echo "□ 12. Copy deployment URL"
echo "□ 13. Test with sample queries"
echo ""

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🧪 TEST QUERIES (After Deployment)"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "Test 1: \"Show me my portfolio overview\""
echo "Test 2: \"Who are my top 3 at-risk customers?\""
echo "Test 3: \"What vendor delays are impacting customers?\""
echo "Test 4: \"Calculate the financial impact of top risks\""
echo "Test 5: \"Generate an executive action plan\""
echo ""

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ READY TO DEPLOY!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "📚 For detailed instructions, open:"
echo "   DEPLOY_NOW_WITH_CLOUDANT.md"
echo ""
echo "🎯 Your deployment includes:"
echo "   • 500 customers from Cloudant"
echo "   • 500 vendors from Cloudant"
echo "   • \$132.3M portfolio under management"
echo "   • \$67.2M at risk identified"
echo "   • 56 high-risk customers"
echo ""
echo "Good luck! 🚀"
echo ""


