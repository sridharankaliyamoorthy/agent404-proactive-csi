#!/bin/bash

# Docker-based deployment to IBM watsonx Orchestrate
# This script builds and runs a Docker container to deploy the agent to IBM

set -e

echo "╔═══════════════════════════════════════════════════════════════════════════╗"
echo "║     🐳 Docker Deployment to IBM watsonx Orchestrate 🐳                     ║"
echo "╚═══════════════════════════════════════════════════════════════════════════╝"
echo ""

cd /Users/ishwaryasridharan/Desktop/Hackathon_2025/Agentic_AI/agent404-proactive-csi

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo "❌ Docker is not running. Please start Docker Desktop first."
    exit 1
fi

# Check if orchestrate CLI is available (for verification)
if ! command -v orchestrate &> /dev/null; then
    echo "⚠️  orchestrate CLI not found locally (will use container version)"
fi

# Step 1: Build Docker image
echo "📍 Step 1: Building Docker image for IBM deployment..."
echo ""
docker-compose -f docker-compose.ibm.yml build

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Docker image built successfully!"
    echo ""
    
    # Step 2: Deploy using Docker container
    echo "📍 Step 2: Deploying to IBM watsonx Orchestrate..."
    echo ""
    docker-compose -f docker-compose.ibm.yml up --abort-on-container-exit
    
    if [ $? -eq 0 ]; then
        echo ""
        echo "╔═══════════════════════════════════════════════════════════════════════════╗"
        echo "║              ✅ DOCKER DEPLOYMENT TO IBM COMPLETE! ✅                      ║"
        echo "╚═══════════════════════════════════════════════════════════════════════════╝"
        echo ""
        echo "🎉 Your agent has been deployed to IBM watsonx Orchestrate!"
        echo ""
        echo "🌐 Access your agent at:"
        echo "   https://au-syd.watson-orchestrate.cloud.ibm.com/build/manage"
        echo ""
        echo "🧪 Test your agent with queries like:"
        echo "   • 'What's my priority today?'"
        echo "   • 'Show me critical customers at risk'"
        echo ""
    else
        echo ""
        echo "❌ Deployment failed. Check logs above."
        exit 1
    fi
else
    echo ""
    echo "❌ Docker build failed"
    exit 1
fi

# Cleanup (remove container after deployment)
echo ""
echo "📍 Cleaning up..."
docker-compose -f docker-compose.ibm.yml down
echo "✅ Cleanup complete"

