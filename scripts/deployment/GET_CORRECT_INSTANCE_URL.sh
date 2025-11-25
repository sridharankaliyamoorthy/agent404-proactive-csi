#!/bin/bash

echo "╔═══════════════════════════════════════════════════════════════╗"
echo "║  🔍 Get Correct Instance URL from IBM Portal                 ║"
echo "╚═══════════════════════════════════════════════════════════════╝"
echo ""
echo "📋 Steps:"
echo "1. Open: https://cloud.ibm.com/watsonx/orchestrate"
echo "2. Login with your IBM Cloud credentials"
echo "3. Click on your watsonx Orchestrate instance"
echo "4. Click: Settings (gear icon) → API details tab"
echo "5. Copy the 'Service instance URL'"
echo ""
echo "The URL should look like:"
echo "  https://api.[region].watson-orchestrate.cloud.ibm.com/instances/[instance-id]"
echo ""
read -p "Paste the Service instance URL here: " INSTANCE_URL

if [ -z "$INSTANCE_URL" ]; then
    echo "❌ No URL provided"
    exit 1
fi

echo ""
echo "✅ URL received: $INSTANCE_URL"
echo ""
echo "📋 Now updating environment..."
echo ""

# Remove old environment
echo "y" | orchestrate env remove --name production-au 2>/dev/null || true

# Add new environment
orchestrate env add -n production-au -u "$INSTANCE_URL" --type mcsp

echo ""
echo "📋 Activating environment..."
echo "Please enter your watsonx Orchestrate API key when prompted:"
echo "(Get it from: Settings → API details → Generate API key)"
echo ""

orchestrate env activate production-au

echo ""
echo "📋 Deploying agent..."
orchestrate agents import -f proactive-csi-agent-orchestrate.yaml

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ DEPLOYMENT SUCCESSFUL!"
    echo ""
    echo "Next: Go to https://cloud.ibm.com/watsonx/orchestrate"
    echo "      Click: Build → Agent Builder"
    echo "      Find: ProActive_CSI_Agent_404"
else
    echo ""
    echo "❌ Deployment failed. Check the error above."
fi

