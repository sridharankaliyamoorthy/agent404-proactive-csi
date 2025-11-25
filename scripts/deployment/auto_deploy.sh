#!/bin/bash

# ProActive CSI - Automated IBM watsonx Orchestrate Deployment
# This script automates the deployment process as much as possible

echo "╔═══════════════════════════════════════════════════════════════╗"
echo "║  🚀 ProActive CSI - Auto Deploy to IBM Orchestrate 🚀      ║"
echo "╚═══════════════════════════════════════════════════════════════╝"
echo ""

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Get script directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$SCRIPT_DIR"

echo -e "${BLUE}📋 Step 1: Checking prerequisites...${NC}"
echo ""

# Check if YAML file exists
YAML_FILE="proactive-csi-agent-orchestrate.yaml"
if [ ! -f "$YAML_FILE" ]; then
    echo -e "${RED}❌ Configuration file not found: $YAML_FILE${NC}"
    echo "Looking in: $(pwd)"
    exit 1
fi

echo -e "${GREEN}✅ Configuration file found: $YAML_FILE${NC}"
echo -e "${BLUE}   Size: $(ls -lh "$YAML_FILE" | awk '{print $5}')${NC}"
echo ""

# Check file size
FILE_SIZE=$(stat -f%z "$YAML_FILE" 2>/dev/null || stat -c%s "$YAML_FILE" 2>/dev/null)
if [ "$FILE_SIZE" -lt 1000 ]; then
    echo -e "${RED}❌ File seems too small. Please check the YAML file.${NC}"
    exit 1
fi

echo -e "${BLUE}📋 Step 2: Preparing deployment...${NC}"
echo ""

# Display agent info
echo -e "${BLUE}Agent Configuration:${NC}"
echo -e "  ${GREEN}Name:${NC} ProActive_CSI_Agent_404"
echo -e "  ${GREEN}Version:${NC} 1.2.0 (with STT & TTS)"
echo -e "  ${GREEN}File:${NC} $YAML_FILE"
echo -e "  ${GREEN}Location:${NC} $(pwd)/$YAML_FILE"
echo ""

# Check if IBM Cloud CLI is available (optional)
if command -v ibmcloud &> /dev/null; then
    echo -e "${GREEN}✅ IBM Cloud CLI detected${NC}"
    echo -e "${BLUE}   Checking login status...${NC}"
    if ibmcloud target &> /dev/null; then
        echo -e "${GREEN}✅ Logged in to IBM Cloud${NC}"
        ibmcloud target | head -3
    else
        echo -e "${YELLOW}⚠️  Not logged in to IBM Cloud${NC}"
        echo -e "${BLUE}   (This is optional - you can deploy via web UI)${NC}"
    fi
    echo ""
fi

echo -e "${BLUE}📋 Step 3: Opening IBM watsonx Orchestrate Portal...${NC}"
echo ""

# IBM Portal URLs
PORTAL_URL="https://cloud.ibm.com/watsonx/orchestrate"
DIRECT_URL="https://au-syd.watson-orchestrate.cloud.ibm.com/build/manage"

echo -e "${BLUE}Opening browser to:${NC}"
echo -e "  ${GREEN}Primary:${NC} $PORTAL_URL"
echo -e "  ${GREEN}Direct:${NC} $DIRECT_URL"
echo ""

# Try to open browser
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    open "$PORTAL_URL" 2>/dev/null && echo -e "${GREEN}✅ Browser opened!${NC}" || echo -e "${YELLOW}⚠️  Please manually open: $PORTAL_URL${NC}"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    xdg-open "$PORTAL_URL" 2>/dev/null && echo -e "${GREEN}✅ Browser opened!${NC}" || echo -e "${YELLOW}⚠️  Please manually open: $PORTAL_URL${NC}"
elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
    # Windows
    start "$PORTAL_URL" 2>/dev/null && echo -e "${GREEN}✅ Browser opened!${NC}" || echo -e "${YELLOW}⚠️  Please manually open: $PORTAL_URL${NC}"
else
    echo -e "${YELLOW}⚠️  Please manually open: $PORTAL_URL${NC}"
fi

echo ""
echo -e "${BLUE}═══════════════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}📋 DEPLOYMENT INSTRUCTIONS${NC}"
echo -e "${BLUE}═══════════════════════════════════════════════════════════════${NC}"
echo ""

echo -e "${GREEN}Step 1:${NC} In the IBM Portal (now open in your browser):"
echo "   • Click ${GREEN}'All agents'${NC} or ${GREEN}'Skills'${NC} in left sidebar"
echo "   • Click ${GREEN}'Create agent'${NC} or ${GREEN}'Import agent'${NC}"
echo ""

echo -e "${GREEN}Step 2:${NC} Upload your agent configuration:"
echo "   • Click ${GREEN}'Import from file'${NC} or ${GREEN}'Upload'${NC}"
echo "   • Navigate to: ${BLUE}$(pwd)${NC}"
echo "   • Select: ${GREEN}$YAML_FILE${NC}"
echo "   • Click ${GREEN}'Open'${NC} or ${GREEN}'Upload'${NC}"
echo ""

echo -e "${GREEN}Step 3:${NC} Connect IBM Services (if needed):"
echo "   • Go to ${GREEN}'Connections'${NC} or ${GREEN}'Integrations'${NC} tab"
echo "   • Verify/Add: STT, TTS, NLU, Cloudant"
echo ""

echo -e "${GREEN}Step 4:${NC} Activate your agent:"
echo "   • Click ${GREEN}'Save'${NC} button"
echo "   • Click ${GREEN}'Activate'${NC} or ${GREEN}'Publish'${NC}"
echo "   • Wait for confirmation (10-30 seconds)"
echo ""

echo -e "${GREEN}Step 5:${NC} Test your agent:"
echo "   • Click on your agent to open chat"
echo "   • Type: ${GREEN}'Good morning, what's my priority today?'${NC}"
echo "   • Verify agent responds correctly"
echo ""

echo -e "${BLUE}═══════════════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}📁 Your Files Are Ready:${NC}"
echo -e "${BLUE}═══════════════════════════════════════════════════════════════${NC}"
echo ""
echo -e "${GREEN}✅ Agent Configuration:${NC}"
echo -e "   File: ${BLUE}$(pwd)/$YAML_FILE${NC}"
echo -e "   Size: ${BLUE}$(ls -lh "$YAML_FILE" | awk '{print $5}')${NC}"
echo ""

# Display file path in a copy-friendly way
echo -e "${BLUE}📋 Quick Copy - File Path:${NC}"
echo -e "${GREEN}$(pwd)/$YAML_FILE${NC}"
echo ""

# Create a helper file with the path
HELPER_FILE="DEPLOY_FILE_PATH.txt"
echo "$(pwd)/$YAML_FILE" > "$HELPER_FILE"
echo -e "${GREEN}✅ File path saved to: $HELPER_FILE${NC}"
echo "   (You can copy this path when uploading)"
echo ""

echo -e "${BLUE}═══════════════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}🧪 Test Queries (After Deployment):${NC}"
echo -e "${BLUE}═══════════════════════════════════════════════════════════════${NC}"
echo ""
echo -e "${GREEN}1.${NC} Good morning, what's my priority today?"
echo -e "${GREEN}2.${NC} Tell me about Acme Corporation"
echo -e "${GREEN}3.${NC} Show churn trends this quarter"
echo -e "${GREEN}4.${NC} What vendors have delays?"
echo -e "${GREEN}5.${NC} Calculate revenue at risk"
echo -e "${GREEN}6.${NC} Generate executive briefing"
echo ""

echo -e "${BLUE}═══════════════════════════════════════════════════════════════${NC}"
echo -e "${GREEN}🎉 Deployment Setup Complete!${NC}"
echo -e "${BLUE}═══════════════════════════════════════════════════════════════${NC}"
echo ""
echo -e "${BLUE}📚 For detailed instructions, see:${NC}"
echo "   • DEPLOY_NOW_QUICK.md"
echo "   • DEPLOY_VIA_WEB_UI.md"
echo "   • IBM_DEPLOYMENT_ACTION_PLAN.md"
echo ""
echo -e "${GREEN}✅ Browser should be open with IBM Portal${NC}"
echo -e "${GREEN}✅ File path ready to copy${NC}"
echo -e "${GREEN}✅ All instructions displayed above${NC}"
echo ""
echo -e "${YELLOW}💡 Tip: Keep this terminal open to reference the file path${NC}"
echo ""
echo -e "${GREEN}Good luck with your deployment! 🚀${NC}"
echo ""

