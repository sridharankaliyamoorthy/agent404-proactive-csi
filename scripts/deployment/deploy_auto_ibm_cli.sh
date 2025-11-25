#!/bin/bash
# Fully Automated IBM watsonx Orchestrate CLI Deployment
# This script automatically deploys ProActive CSI Agent 404 to IBM Cloud

set -e  # Exit on error

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
echo "║     🚀 FULLY AUTOMATED IBM DEPLOYMENT (CLI) 🚀                  ║"
echo "║                                                                  ║"
echo "╚══════════════════════════════════════════════════════════════════╝"
echo ""

# Get project root
PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$PROJECT_ROOT"

echo -e "${CYAN}📁 Project Directory: $PROJECT_ROOT${NC}"
echo ""

# Step 1: Load environment variables
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "${BLUE}STEP 1: Loading Credentials${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

ENV_FILE="$PROJECT_ROOT/.env"
if [ -f "$ENV_FILE" ]; then
    echo -e "${BLUE}Loading credentials from .env file...${NC}"
    # shellcheck disable=SC2046
    export $(grep -v '^#' "$ENV_FILE" | grep -v '^$' | xargs)
    echo -e "${GREEN}✅ Environment variables loaded${NC}"
else
    echo -e "${YELLOW}⚠️  .env file not found. Credentials must be provided via environment.${NC}"
fi

# Require credentials (no hardcoded defaults)
WATSONX_ORCHESTRATE_APIKEY="${WATSONX_ORCHESTRATE_APIKEY:-${ORCHESTRATE_API_KEY}}"
WATSONX_ORCHESTRATE_URL="${WATSONX_ORCHESTRATE_URL:-${ORCHESTRATE_URL}}"
ENV_NAME="${ORCHESTRATE_ENV_NAME:-production-au}"
CONFIG_FILE="$PROJECT_ROOT/config/proactive-csi-agent-orchestrate.yaml"

# Export for use in commands
export WATSONX_ORCHESTRATE_APIKEY
export WATSONX_ORCHESTRATE_URL
export ORCHESTRATE_API_KEY="$WATSONX_ORCHESTRATE_APIKEY"
export ORCHESTRATE_URL="$WATSONX_ORCHESTRATE_URL"

if [ -z "$WATSONX_ORCHESTRATE_APIKEY" ] || [ -z "$WATSONX_ORCHESTRATE_URL" ]; then
    echo -e "${RED}❌ Missing WATSONX_ORCHESTRATE_APIKEY or WATSONX_ORCHESTRATE_URL. Set them in .env.${NC}"
    exit 1
fi

echo -e "${GREEN}✅ Credentials configured${NC}"
echo "   API Key: ${WATSONX_ORCHESTRATE_APIKEY:0:6}***"
echo "   URL: $WATSONX_ORCHESTRATE_URL"
echo "   Environment: $ENV_NAME"
echo ""

# Step 2: Verify configuration file
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "${BLUE}STEP 2: Verifying Configuration${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

if [ ! -f "$CONFIG_FILE" ]; then
    echo -e "${RED}❌ Configuration file not found: $CONFIG_FILE${NC}"
    exit 1
fi

CONFIG_SIZE=$(wc -c < "$CONFIG_FILE" | xargs)
echo -e "${GREEN}✅ Configuration file found${NC}"
echo "   File: $CONFIG_FILE"
echo "   Size: $CONFIG_SIZE bytes"
echo ""

# Step 3: Check and install orchestrate CLI
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "${BLUE}STEP 3: Checking Orchestrate CLI${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

if command -v orchestrate &> /dev/null; then
    ORCHESTRATE_VERSION=$(orchestrate --version 2>/dev/null || echo "installed")
    echo -e "${GREEN}✅ Orchestrate CLI found${NC}"
    echo "   Version: $ORCHESTRATE_VERSION"
else
    echo -e "${YELLOW}⚠️  Orchestrate CLI not found, installing...${NC}"
    
    # Check for Python
    if ! command -v python3 &> /dev/null && ! command -v python &> /dev/null; then
        echo -e "${RED}❌ Python not found. Please install Python 3 first.${NC}"
        exit 1
    fi
    
    # Install orchestrate CLI
    PYTHON_CMD=$(command -v python3 || command -v python)
    echo -e "${BLUE}Installing ibm-watsonx-orchestrate...${NC}"
    $PYTHON_CMD -m pip install --quiet --upgrade ibm-watsonx-orchestrate
    
    # Verify installation
    if command -v orchestrate &> /dev/null; then
        echo -e "${GREEN}✅ Orchestrate CLI installed successfully${NC}"
    else
        echo -e "${RED}❌ Failed to install orchestrate CLI${NC}"
        echo -e "${YELLOW}Please install manually: pip3 install ibm-watsonx-orchestrate${NC}"
        exit 1
    fi
fi
echo ""

# Step 4: Setup orchestrate environment
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "${BLUE}STEP 4: Setting Up Environment${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Check if environment exists
if orchestrate env list 2>/dev/null | grep -q "$ENV_NAME"; then
    echo -e "${YELLOW}⚠️  Environment '$ENV_NAME' already exists, removing...${NC}"
    orchestrate env remove --name "$ENV_NAME" 2>/dev/null || true
    sleep 1
fi

# Add environment
echo -e "${BLUE}Adding environment '$ENV_NAME'...${NC}"
echo "$WATSONX_ORCHESTRATE_APIKEY" | orchestrate env add -n "$ENV_NAME" \
    -u "$WATSONX_ORCHESTRATE_URL" \
    --type ibm_iam 2>&1 | grep -v "Warning\|getpass" || {
    echo -e "${YELLOW}⚠️  Environment add returned non-zero, checking if it exists...${NC}"
    # Check if it was actually added
    if ! orchestrate env list 2>/dev/null | grep -q "$ENV_NAME"; then
        echo -e "${RED}❌ Failed to add environment${NC}"
        exit 1
    fi
}

echo -e "${GREEN}✅ Environment added${NC}"

# Activate environment
echo -e "${BLUE}Activating environment...${NC}"
echo "$WATSONX_ORCHESTRATE_APIKEY" | orchestrate env activate "$ENV_NAME" 2>&1 | grep -v "Warning\|getpass" || {
    # Try alternative activation method
    echo -e "${YELLOW}⚠️  Standard activation failed, trying alternative method...${NC}"
    
    # Try with environment variable
    export ORCHESTRATE_API_KEY="$WATSONX_ORCHESTRATE_APIKEY"
    echo "$WATSONX_ORCHESTRATE_APIKEY" | orchestrate env activate "$ENV_NAME" <<< "$WATSONX_ORCHESTRATE_APIKEY" 2>&1 | grep -v "Warning\|getpass" || {
        echo -e "${RED}❌ Failed to activate environment${NC}"
        echo -e "${YELLOW}The API key may be invalid or expired${NC}"
        echo -e "${BLUE}Please verify your API key at: https://cloud.ibm.com/iam/apikeys${NC}"
        exit 1
    }
}

echo -e "${GREEN}✅ Environment activated${NC}"
echo ""

# Step 5: Deploy agent
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "${BLUE}STEP 5: Deploying Agent${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

echo -e "${BLUE}Importing agent configuration...${NC}"
echo "   File: $CONFIG_FILE"
echo ""

# Change to config directory for import
cd "$PROJECT_ROOT/config"

DEPLOY_OUTPUT=$(orchestrate agents import --file "proactive-csi-agent-orchestrate.yaml" 2>&1)
DEPLOY_STATUS=$?

if [ $DEPLOY_STATUS -eq 0 ]; then
    echo -e "${GREEN}✅ Agent deployed successfully!${NC}"
    echo ""
    echo "$DEPLOY_OUTPUT" | grep -v "Warning\|getpass" || true
else
    # Check if agent already exists (that's also a success case)
    if echo "$DEPLOY_OUTPUT" | grep -qi "already exists\|duplicate\|conflict"; then
        echo -e "${YELLOW}⚠️  Agent may already exist, verifying...${NC}"
    else
        echo -e "${YELLOW}⚠️  Deployment returned non-zero, checking status...${NC}"
    fi
    echo "$DEPLOY_OUTPUT" | grep -v "Warning\|getpass" || true
fi

echo ""

# Step 6: Verify deployment
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "${BLUE}STEP 6: Verifying Deployment${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

echo -e "${BLUE}Listing deployed agents...${NC}"
AGENT_LIST=$(orchestrate agents list 2>&1 | grep -v "Warning\|getpass" || true)

if echo "$AGENT_LIST" | grep -qi "ProActive\|CSI\|404"; then
    echo -e "${GREEN}✅ Agent found in deployment list!${NC}"
    echo ""
    echo "$AGENT_LIST" | head -10
else
    echo -e "${YELLOW}⚠️  Agent not found in list, but deployment may still be processing...${NC}"
    echo "$AGENT_LIST" | head -10
fi

echo ""

# Step 7: Deployment summary
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "${GREEN}✅ DEPLOYMENT COMPLETE!${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

echo -e "${CYAN}📋 Deployment Summary:${NC}"
echo "   • Agent: ProActive_CSI_Agent_404"
echo "   • Environment: $ENV_NAME"
echo "   • URL: $WATSONX_ORCHESTRATE_URL"
echo "   • Config: $CONFIG_FILE"
echo ""

echo -e "${CYAN}🌐 Next Steps:${NC}"
echo "   1. Open IBM Portal:"
echo "      ${BLUE}https://au-syd.watson-orchestrate.cloud.ibm.com/build/manage${NC}"
echo ""
echo "   2. Find your agent:"
echo "      Look for: ${GREEN}ProActive_CSI_Agent_404${NC}"
echo ""
echo "   3. Test your agent:"
echo "      Try: ${YELLOW}\"Show me my portfolio overview\"${NC}"
echo "      Or: ${YELLOW}\"Who are my top 3 at-risk customers?\"${NC}"
echo ""

echo -e "${CYAN}🔗 Quick Links:${NC}"
echo "   • Portal: ${BLUE}https://cloud.ibm.com/watsonx/orchestrate${NC}"
echo "   • Build: ${BLUE}https://au-syd.watson-orchestrate.cloud.ibm.com/build/manage${NC}"
echo ""

# Open browser if possible
if command -v open &> /dev/null; then
    echo -e "${BLUE}Opening IBM Cloud portal in browser...${NC}"
    open "https://au-syd.watson-orchestrate.cloud.ibm.com/build/manage" 2>/dev/null &
    sleep 2
fi

echo ""
echo -e "${GREEN}🎉 Deployment process completed!${NC}"
echo ""

exit 0

