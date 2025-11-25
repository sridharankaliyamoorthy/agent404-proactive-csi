#!/bin/bash

# Deploy to AU following IBM documentation exactly

echo "╔═══════════════════════════════════════════════════════════════════════════╗"
echo "║     Deploy to Australia Sydney (Following IBM Documentation)             ║"
echo "╚═══════════════════════════════════════════════════════════════════════════╝"
echo ""

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$PROJECT_ROOT"

if [ -f .env ]; then
    # shellcheck disable=SC2046
    export $(grep -v '^#' .env | grep -v '^$' | xargs)
fi

API_KEY="${ORCHESTRATE_API_KEY:-${WATSONX_ORCHESTRATE_APIKEY}}"

echo "📋 According to IBM documentation:"
echo "   1. Go to Settings > API details tab"
echo "   2. Copy the 'Service instance URL'"
echo "   3. Use that URL below"
echo ""
echo "   Current URL we're trying:"
echo "   https://api.au-syd.watson-orchestrate.cloud.ibm.com/instances/f16c2181-a811-4d84-8e15-33cfebe50928"
echo ""
read -p "Enter the Service instance URL from Settings (or press Enter to try current): " SERVICE_URL

if [ -z "$SERVICE_URL" ]; then
        SERVICE_URL="$ORCHESTRATE_URL"
fi

if [ -z "$API_KEY" ]; then
    echo "❌ Missing ORCHESTRATE_API_KEY. Set it in .env before running." 1>&2
    exit 1
fi
if [ -z "$SERVICE_URL" ]; then
    echo "❌ Missing ORCHESTRATE_URL (service instance URL). Set it in .env." 1>&2
    exit 1
fi

echo ""
echo "📍 Step 1: Removing old environment..."
orchestrate env remove --name production-au 2>/dev/null || true

echo ""
echo "📍 Step 2: Adding environment (following IBM docs format)..."
echo "   URL: $SERVICE_URL"
echo ""
orchestrate env add -n production-au -u "$SERVICE_URL" --type mcsp --activate

if [ $? -eq 0 ]; then
    echo ""
    echo "📍 Step 3: Environment created! Now activating with API key..."
    echo ""
    echo "$API_KEY" | orchestrate env activate production-au 2>&1 | grep -v "Warning: Password input" || {
        echo ""
        echo "⚠️  Activation might need manual input. Please run:"
        echo "   orchestrate env activate production-au"
        echo "   (Enter API key manually)"
        echo ""
        read -p "Press Enter after you've activated the environment..."
    }
    
    echo ""
    echo "📍 Step 4: Deploying agent..."
    orchestrate agents import -f proactive-csi-agent-orchestrate.yaml
    
    if [ $? -eq 0 ]; then
        echo ""
        echo "╔═══════════════════════════════════════════════════════════════════════════╗"
        echo "║                    ✅ DEPLOYMENT SUCCESSFUL! ✅                          ║"
        echo "╚═══════════════════════════════════════════════════════════════════════════╝"
        echo ""
        echo "📍 Step 5: Verifying..."
        orchestrate agents list | head -15
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
    echo "❌ Failed to add environment"
    echo "   Please check the Service instance URL from Settings > API details"
fi

