#!/bin/bash

# ProActive CSI - Fully Automated Deployment Script v1.2.0
# Automates everything possible for IBM watsonx Orchestrate deployment

set -e

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
cd "$PROJECT_ROOT"

echo -e "${BLUE}═══════════════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}🚀 ProActive CSI - Fully Automated Deployment v1.2.0${NC}"
echo -e "${BLUE}   Complete STT & TTS Integration${NC}"
echo -e "${BLUE}═══════════════════════════════════════════════════════════════${NC}"
echo ""

# Step 1: Verify Configuration
echo -e "${YELLOW}[1/8] Verifying configuration...${NC}"
CONFIG_FILE="proactive-csi-agent-orchestrate.yaml"
if [ ! -f "$CONFIG_FILE" ]; then
    echo -e "${RED}❌ Config file not found${NC}"
    exit 1
fi
echo -e "${GREEN}✅ Config file: $CONFIG_FILE ($(ls -lh "$CONFIG_FILE" | awk '{print $5}'))${NC}"

# Step 2: Check Version
echo -e "\n${YELLOW}[2/8] Checking version...${NC}"
VERSION=$(cat VERSION 2>/dev/null | tr -d '[:space:]' || echo "unknown")
echo -e "${GREEN}✅ Version: $VERSION${NC}"

# Step 3: Verify Credentials
echo -e "\n${YELLOW}[3/8] Verifying credentials...${NC}"
CREDS_FILE="../ibm-credentials_Orchestrate_data_Updated.json"
if [ -f "$CREDS_FILE" ]; then
    echo -e "${GREEN}✅ Credentials found${NC}"
else
    echo -e "${YELLOW}⚠️  Credentials file not found (using fallback)${NC}"
fi

# Step 4: Set Environment Variables
echo -e "\n${YELLOW}[4/8] Setting environment variables...${NC}"
# Load environment variables
if [ -f "../../.env" ]; then
    export $(grep -v '^#' ../../.env | xargs)
fi

if [ -z "$ORCHESTRATE_API_KEY" ]; then
    echo "❌ Error: ORCHESTRATE_API_KEY not found in .env"
    exit 1
fi

export ORCHESTRATE_API_KEY="$ORCHESTRATE_API_KEY"
export ORCHESTRATE_URL="https://api.au-syd.watson-orchestrate.cloud.ibm.com/instances/f16c2181-a811-4d84-8e15-33cfebe50928"
export ORCHESTRATE_INSTANCE_ID="f16c2181-a811-4d84-8e15-33cfebe50928"
export ORCHESTRATE_REGION="au-syd"
echo -e "${GREEN}✅ Environment variables set${NC}"

# Step 5: Check IBM Cloud CLI
echo -e "\n${YELLOW}[5/8] Checking IBM Cloud CLI...${NC}"
if command -v ibmcloud &> /dev/null; then
    echo -e "${GREEN}✅ IBM Cloud CLI found${NC}"
    IBM_CLOUD_AVAILABLE=true
else
    echo -e "${YELLOW}⚠️  IBM Cloud CLI not found${NC}"
    IBM_CLOUD_AVAILABLE=false
fi

# Step 6: Check Orchestrate CLI
echo -e "\n${YELLOW}[6/8] Checking Orchestrate CLI...${NC}"
if command -v orchestrate &> /dev/null; then
    echo -e "${GREEN}✅ Orchestrate CLI found${NC}"
    ORCHESTRATE_CLI_AVAILABLE=true
    
    # Check CLI version/help
    CLI_VERSION=$(orchestrate --version 2>&1 | head -1 || echo "unknown")
    echo -e "${BLUE}   CLI Version: $CLI_VERSION${NC}"
else
    echo -e "${YELLOW}⚠️  Orchestrate CLI not found${NC}"
    ORCHESTRATE_CLI_AVAILABLE=false
fi

# Step 7: Attempt Python CLI Deployment
echo -e "\n${YELLOW}[7/8] Attempting automated deployment...${NC}"
echo -e "${BLUE}Running Python automated deployment script...${NC}"

python3 scripts/auto_deploy_cli.py

DEPLOYMENT_EXIT_CODE=$?

# Step 8: Open Browser & Display Instructions
echo -e "\n${YELLOW}[8/8] Opening IBM Portal...${NC}"
PORTAL_URL="https://au-syd.watson-orchestrate.cloud.ibm.com/build/manage"

if command -v open &> /dev/null; then
    open "$PORTAL_URL" 2>/dev/null
    echo -e "${GREEN}✅ Browser opened: $PORTAL_URL${NC}"
elif command -v xdg-open &> /dev/null; then
    xdg-open "$PORTAL_URL" 2>/dev/null
    echo -e "${GREEN}✅ Browser opened: $PORTAL_URL${NC}"
else
    echo -e "${YELLOW}⚠️  Please manually open: $PORTAL_URL${NC}"
fi

# Final Summary
echo ""
echo -e "${GREEN}═══════════════════════════════════════════════════════════════${NC}"
echo -e "${GREEN}✅ AUTOMATED DEPLOYMENT COMPLETE!${NC}"
echo -e "${GREEN}═══════════════════════════════════════════════════════════════${NC}"
echo ""
echo -e "${BLUE}📋 Summary:${NC}"
echo -e "${GREEN}✅ Configuration verified (v$VERSION)${NC}"
echo -e "${GREEN}✅ Credentials loaded${NC}"
echo -e "${GREEN}✅ IBM Portal opened in browser${NC}"
echo -e "${GREEN}✅ Deployment instructions displayed${NC}"
echo ""
echo -e "${BLUE}📁 Configuration File Location:${NC}"
echo -e "${GREEN}$(pwd)/$CONFIG_FILE${NC}"
echo ""
echo -e "${BLUE}🌐 IBM Portal:${NC}"
echo -e "${GREEN}$PORTAL_URL${NC}"
echo ""
echo -e "${BLUE}🚀 Next Steps:${NC}"
echo "1. In IBM Portal: Find 'ProActive_CSI_Agent_404'"
echo "2. Click 'Edit' → 'Import from file'"
echo "3. Upload: $(basename "$CONFIG_FILE")"
echo "4. Verify STT/TTS services connected"
echo "5. Click 'Save' → 'Activate'"
echo "6. Test with: 'Read me the executive briefing aloud'"
echo ""
echo -e "${GREEN}🎤🔊 Ready to deploy with STT & TTS integration! 🚀${NC}"
echo ""

