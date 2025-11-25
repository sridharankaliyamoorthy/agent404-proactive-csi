#!/bin/bash

# Deploy using correct instance URL and API key
# Based on IBM watsonx Orchestrate CLI cheat sheet

cd "$(dirname "$0")"

GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo "╔═══════════════════════════════════════════════════════════════╗"
echo "║  🚀 Deploy ProActive CSI - With Correct Instance              ║"
echo "╚═══════════════════════════════════════════════════════════════╝"
echo ""

# API Key from user
# Load environment variables
if [ -f "../../.env" ]; then
    export $(grep -v '^#' ../../.env | xargs)
fi

if [ -z "$ORCHESTRATE_API_KEY" ]; then
    echo "❌ Error: ORCHESTRATE_API_KEY not found in .env"
    exit 1
fi

export API_KEY="$ORCHESTRATE_API_KEY"

echo -e "${BLUE}📋 Step 1: Get Correct Instance URL${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "The instance ID 'f16c2181-a811-4d84-8e15-33cfebe50928' doesn't exist."
echo "We need the correct instance URL from your IBM Portal."
echo ""
echo "To get it:"
echo "1. Go to: https://cloud.ibm.com/watsonx/orchestrate"
echo "2. Click on your instance (or create one if needed)"
echo "3. Go to: Settings → API details"
echo "4. Copy the 'Service instance URL'"
echo ""
read -p "Paste the Service instance URL here: " INSTANCE_URL

if [ -z "$INSTANCE_URL" ]; then
    echo -e "${RED}❌ No URL provided${NC}"
    exit 1
fi

echo ""
echo -e "${BLUE}📋 Step 2: Remove old environment${NC}"
echo "y" | orchestrate env remove --name production-au 2>/dev/null || true

echo ""
echo -e "${BLUE}📋 Step 3: Add environment with correct URL${NC}"
orchestrate env add -n production-au -u "$INSTANCE_URL" --type mcsp 2>&1 | grep -v "Warning" || {
    echo -e "${YELLOW}⚠️  Environment may already exist${NC}"
}

echo ""
echo -e "${BLUE}📋 Step 4: Activate environment with API key${NC}"
orchestrate env activate --api-key "$API_KEY" production-au 2>&1 | grep -v "Warning" || {
    echo -e "${RED}❌ Failed to activate. Check instance URL and API key.${NC}"
    exit 1
}

echo ""
echo -e "${GREEN}✅ Environment activated${NC}"

echo ""
echo -e "${BLUE}📋 Step 5: Verify environment${NC}"
orchestrate env list

echo ""
echo -e "${BLUE}📋 Step 6: Deploy agent${NC}"
orchestrate agents import -f proactive-csi-agent-orchestrate.yaml 2>&1

if [ $? -eq 0 ]; then
    echo ""
    echo -e "${GREEN}═══════════════════════════════════════════════════════════════${NC}"
    echo -e "${GREEN}✅ DEPLOYMENT SUCCESSFUL!${NC}"
    echo -e "${GREEN}═══════════════════════════════════════════════════════════════${NC}"
    echo ""
    echo -e "${BLUE}Next Steps:${NC}"
    echo "1. Go to: https://cloud.ibm.com/watsonx/orchestrate"
    echo "2. Click: Build → Agent Builder"
    echo "3. Find: ProActive_CSI_Agent_404"
    echo "4. Click to open and test"
    echo ""
    echo -e "${BLUE}Test Query:${NC}"
    echo '  "Good morning, what'\''s my priority today?"'
    echo ""
else
    echo ""
    echo -e "${RED}❌ Deployment failed${NC}"
    echo -e "${YELLOW}Verify:${NC}"
    echo "  - Instance URL is correct"
    echo "  - API key is valid"
    echo "  - Instance exists and is accessible"
fi

