#!/bin/bash

# Deploy with new API key and correct Service instance URL

echo "╔═══════════════════════════════════════════════════════════════════════════╗"
echo "║     Deploy to AU with New API Key                                        ║"
echo "╚═══════════════════════════════════════════════════════════════════════════╝"
echo ""

cd /Users/ishwaryasridharan/Desktop/Hackathon_2025/Agentic_AI/agent404-proactive-csi

# Load environment variables
if [ -f "../../.env" ]; then
    export $(grep -v '^#' ../../.env | xargs)
fi

if [ -z "$ORCHESTRATE_API_KEY" ]; then
    echo "❌ Error: ORCHESTRATE_API_KEY not found in .env"
    exit 1
fi

API_KEY="$ORCHESTRATE_API_KEY"

echo "📋 API Key: [SECURED] (✅ Ready)"
echo ""
echo "📋 Please provide the Service instance URL from:"
echo "   Settings → API details tab in watsonx Orchestrate"
echo ""
echo "   It should look like:"
echo "   https://api.au-syd.watson-orchestrate.cloud.ibm.com/instances/XXXX-XXXX-XXXX"
echo ""
read -p "Enter Service instance URL (or press Enter to try current): " SERVICE_URL

if [ -z "$SERVICE_URL" ]; then
    SERVICE_URL="https://api.au-syd.watson-orchestrate.cloud.ibm.com/instances/f16c2181-a811-4d84-8e15-33cfebe50928"
    echo "Using default (might not work): $SERVICE_URL"
fi

echo ""
echo "📍 Step 1: Removing old environment..."
orchestrate env remove --name production-au 2>/dev/null || true

echo ""
echo "📍 Step 2: Adding environment with Service instance URL..."
orchestrate env add -n production-au -u "$SERVICE_URL" --type mcsp

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Environment added!"
    echo ""
    echo "📍 Step 3: Activating with new API key..."
    echo "$API_KEY" | orchestrate env activate production-au 2>&1 | grep -v "Warning: Password input" || {
        echo ""
        echo "⚠️  Trying manual activation..."
        orchestrate env activate production-au
    }
    
    # Check if activated
    if orchestrate env list | grep -q "production-au.*active"; then
        echo ""
        echo "✅ Environment activated!"
        echo ""
        echo "📍 Step 4: Deploying agent..."
        orchestrate agents import -f proactive-csi-agent-orchestrate.yaml
        
        if [ $? -eq 0 ]; then
            echo ""
            echo "╔═══════════════════════════════════════════════════════════════════════════╗"
            echo "║                    ✅ DEPLOYMENT SUCCESSFUL! ✅                          ║"
            echo "╚═══════════════════════════════════════════════════════════════════════════╝"
            echo ""
            orchestrate agents list | grep -i "ProActive\|Name" | head -10
            echo ""
            echo "🌐 Access your agent at:"
            echo "   https://au-syd.watson-orchestrate.cloud.ibm.com/build/manage"
            echo ""
            echo "🗑️  To delete 'delete' agent:"
            echo "   orchestrate agents remove --name delete --kind native"
        else
            echo "❌ Agent deployment failed"
        fi
    else
        echo ""
        echo "⚠️  Environment not activated. Please check:"
        echo "   1. Service instance URL is correct (from Settings → API details)"
        echo "   2. API key is valid"
        echo ""
        echo "   Try manually:"
        echo "   orchestrate env activate production-au"
        echo "   (Enter API key when prompted)"
    fi
else
    echo "❌ Failed to add environment"
fi

