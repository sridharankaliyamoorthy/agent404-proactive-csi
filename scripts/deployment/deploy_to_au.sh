#!/bin/bash

# Simple deployment script for Australia Sydney environment

echo "╔═══════════════════════════════════════════════════════════════════════════╗"
echo "║  Deploying ProActive CSI Agent to Australia Sydney Environment           ║"
echo "╚═══════════════════════════════════════════════════════════════════════════╝"
echo ""

cd /Users/ishwaryasridharan/Desktop/Hackathon_2025/Agentic_AI/agent404-proactive-csi

echo "📍 Step 1: Activating production-au environment..."
echo "   You'll be prompted for your API key"
echo ""
orchestrate env activate production-au

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Environment activated!"
    echo ""
    echo "📍 Step 2: Importing agent..."
    orchestrate agents import -f proactive-csi-agent-orchestrate.yaml
    
    if [ $? -eq 0 ]; then
        echo ""
        echo "✅ Agent deployed successfully!"
        echo ""
        echo "📍 Step 3: Listing agents to verify..."
        orchestrate agents list | head -20
        echo ""
        echo "🎉 DONE! Refresh your browser to see ProActive_CSI_Agent_404"
        echo "   URL: https://au-syd.watson-orchestrate.cloud.ibm.com/build/manage"
    else
        echo "❌ Agent import failed"
    fi
else
    echo "❌ Environment activation failed"
fi

