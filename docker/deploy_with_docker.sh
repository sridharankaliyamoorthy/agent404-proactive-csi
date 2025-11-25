#!/bin/bash
# Fully Automated Docker-based IBM watsonx Orchestrate Deployment
# Follows IBM Hackathon Guide process

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

echo ""
echo "╔══════════════════════════════════════════════════════════════════╗"
echo "║                                                                  ║"
echo "║     🐳 DOCKER-BASED IBM DEPLOYMENT (Hackathon Guide) 🐳         ║"
echo "║                                                                  ║"
echo "╚══════════════════════════════════════════════════════════════════╝"
echo ""

# Get project root
PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$PROJECT_ROOT"

echo -e "${CYAN}📁 Project Directory: $PROJECT_ROOT${NC}"
echo ""

# Step 1: Check Docker
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "${BLUE}STEP 1: Checking Docker${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

if ! command -v docker &> /dev/null; then
    echo -e "${RED}❌ Docker not found. Please install Docker first.${NC}"
    echo "   Install from: https://www.docker.com/get-started"
    exit 1
fi

if ! command -v docker-compose &> /dev/null && ! docker compose version &> /dev/null; then
    echo -e "${RED}❌ Docker Compose not found. Please install Docker Compose.${NC}"
    exit 1
fi

echo -e "${GREEN}✅ Docker installed${NC}"
DOCKER_VERSION=$(docker --version)
echo "   $DOCKER_VERSION"
echo ""

# Step 2: Load environment variables
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "${BLUE}STEP 2: Loading Credentials${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

ENV_FILE="$PROJECT_ROOT/.env"
if [ -f "$ENV_FILE" ]; then
    echo -e "${BLUE}Loading credentials from .env file...${NC}"
    export $(grep -v '^#' "$ENV_FILE" | grep -v '^$' | xargs)
    echo -e "${GREEN}✅ Environment variables loaded${NC}"
else
    echo -e "${YELLOW}⚠️  .env file not found, using default credentials${NC}"
fi

# Set credentials with defaults
WATSONX_ORCHESTRATE_APIKEY="${WATSONX_ORCHESTRATE_APIKEY:-${ORCHESTRATE_API_KEY:-9-atsNvf8mx0ymZLaGgZwe28rhyZvLcX_QUQlyDb12rg}}"
WATSONX_ORCHESTRATE_URL="${WATSONX_ORCHESTRATE_URL:-${ORCHESTRATE_URL:-https://api.au-syd.watson-orchestrate.cloud.ibm.com/instances/f16c2181-a811-4d84-8e15-33cfebe50928}}"

export WATSONX_ORCHESTRATE_APIKEY
export WATSONX_ORCHESTRATE_URL

echo -e "${GREEN}✅ Credentials configured${NC}"
echo "   API Key: ${WATSONX_ORCHESTRATE_APIKEY:0:20}..."
echo "   URL: $WATSONX_ORCHESTRATE_URL"
echo ""

# Step 3: Verify configuration file
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "${BLUE}STEP 3: Verifying Configuration${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

CONFIG_FILE="$PROJECT_ROOT/config/proactive-csi-agent-orchestrate.yaml"
if [ ! -f "$CONFIG_FILE" ]; then
    echo -e "${RED}❌ Configuration file not found: $CONFIG_FILE${NC}"
    exit 1
fi

CONFIG_SIZE=$(wc -c < "$CONFIG_FILE" | xargs)
echo -e "${GREEN}✅ Configuration file found${NC}"
echo "   File: $CONFIG_FILE"
echo "   Size: $CONFIG_SIZE bytes"
echo ""

# Step 4: Build Docker image
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "${BLUE}STEP 4: Building Docker Image${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

cd "$PROJECT_ROOT/docker"

echo -e "${BLUE}Building Docker image for IBM deployment...${NC}"
docker build -f Dockerfile.ibm -t proactive-csi-ibm-deploy:latest ..

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✅ Docker image built successfully${NC}"
else
    echo -e "${RED}❌ Docker build failed${NC}"
    exit 1
fi
echo ""

# Step 5: Deploy using Docker Compose
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "${BLUE}STEP 5: Deploying to IBM watsonx Orchestrate${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Fix config file path in docker-compose
# Create a temporary docker-compose file with correct paths
TEMP_COMPOSE="/tmp/docker-compose-ibm-temp.yml"
cat > "$TEMP_COMPOSE" << EOF
services:
  deploy-to-ibm:
    image: proactive-csi-ibm-deploy:latest
    container_name: proactive-csi-ibm-deploy
    environment:
      - WATSONX_ORCHESTRATE_APIKEY=${WATSONX_ORCHESTRATE_APIKEY}
      - WATSONX_ORCHESTRATE_URL=${WATSONX_ORCHESTRATE_URL}
    volumes:
      - ${CONFIG_FILE}:/app/config/proactive-csi-agent-orchestrate.yaml:ro
      - ${PROJECT_ROOT}:/app:ro
    networks:
      - deploy-network
    restart: "no"

networks:
  deploy-network:
    driver: bridge
EOF

echo -e "${BLUE}Starting deployment container...${NC}"

# Use docker compose or docker-compose
if docker compose version &> /dev/null; then
    docker compose -f "$TEMP_COMPOSE" up --remove-orphans
else
    docker-compose -f "$TEMP_COMPOSE" up --remove-orphans
fi

DEPLOY_STATUS=$?

# Cleanup
rm -f "$TEMP_COMPOSE"

if [ $DEPLOY_STATUS -eq 0 ]; then
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo -e "${GREEN}✅ DEPLOYMENT COMPLETE!${NC}"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo -e "${CYAN}🌐 Access your agent:${NC}"
    echo "   ${BLUE}https://au-syd.watson-orchestrate.cloud.ibm.com/build/manage${NC}"
    echo ""
    echo -e "${CYAN}📋 Next Steps:${NC}"
    echo "   1. Open IBM Portal (link above)"
    echo "   2. Find: ProActive_CSI_Agent_404"
    echo "   3. Test with queries from TEST_QUERIES.txt"
    echo ""
else
    echo ""
    echo -e "${RED}❌ Deployment failed${NC}"
    exit 1
fi

# Cleanup container
echo -e "${BLUE}Cleaning up container...${NC}"
docker rm -f proactive-csi-ibm-deploy 2>/dev/null || true

echo ""
echo -e "${GREEN}🎉 Docker deployment process completed!${NC}"
echo ""

exit 0

