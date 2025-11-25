#!/bin/bash

# Docker Build and Run Script for ProActive CSI Agent 404

set -e  # Exit on error

echo "╔═══════════════════════════════════════════════════════════════════════════╗"
echo "║        🐳 Docker Build & Run - ProActive CSI Agent 404 🐳                 ║"
echo "╚═══════════════════════════════════════════════════════════════════════════╝"
echo ""

cd /Users/ishwaryasridharan/Desktop/Hackathon_2025/Agentic_AI/agent404-proactive-csi

# Check if .env.docker exists
if [ ! -f ".env.docker" ]; then
    echo "⚠️  .env.docker file not found!"
    echo "   Creating from template..."
    cp .env.docker.template .env.docker
    echo "   ✅ Template created. Please edit .env.docker with your credentials."
    echo ""
    read -p "Press Enter after editing .env.docker to continue..." || exit 1
fi

# Step 1: Build Docker image
echo "📍 Step 1: Building Docker image..."
echo ""
docker-compose build

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Docker image built successfully!"
    echo ""
    
    # Step 2: Run container
    echo "📍 Step 2: Starting container..."
    echo ""
    docker-compose up -d
    
    if [ $? -eq 0 ]; then
        echo ""
        echo "✅ Container started successfully!"
        echo ""
        
        # Step 3: Show logs
        echo "📍 Step 3: Container logs (last 20 lines)..."
        echo ""
        docker-compose logs --tail=20
        
        echo ""
        echo "╔═══════════════════════════════════════════════════════════════════════════╗"
        echo "║                    ✅ DOCKER DEPLOYMENT COMPLETE! ✅                       ║"
        echo "╚═══════════════════════════════════════════════════════════════════════════╝"
        echo ""
        echo "🌐 Access your application at:"
        echo "   http://localhost:8501"
        echo ""
        echo "📋 Useful commands:"
        echo "   • View logs:    docker-compose logs -f"
        echo "   • Stop:         docker-compose down"
        echo "   • Restart:      docker-compose restart"
        echo "   • Status:       docker-compose ps"
        echo "   • Shell access: docker-compose exec proactive-csi-agent bash"
        echo ""
    else
        echo "❌ Container start failed"
        exit 1
    fi
else
    echo "❌ Docker build failed"
    exit 1
fi

