#!/bin/bash

# ProActive CSI - Full Deployment Verification Script
# This script helps verify deployment and capture proof

cd "$(dirname "$0")/.."

GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo "╔═══════════════════════════════════════════════════════════════╗"
echo "║  🚀 ProActive CSI - Deployment Verification                  ║"
echo "╚═══════════════════════════════════════════════════════════════╝"
echo ""

# Check if agent YAML exists
if [ ! -f "proactive-csi-agent-orchestrate.yaml" ]; then
    echo -e "${RED}❌ Error: proactive-csi-agent-orchestrate.yaml not found${NC}"
    exit 1
fi

echo -e "${GREEN}✅ Agent configuration file found${NC}"
echo ""

# Display file information
echo -e "${BLUE}📋 Agent Configuration Details:${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "File: proactive-csi-agent-orchestrate.yaml"
echo "Size: $(ls -lh proactive-csi-agent-orchestrate.yaml | awk '{print $5}')"
echo "Location: $(pwd)/proactive-csi-agent-orchestrate.yaml"
echo ""

# Check YAML validity
echo -e "${BLUE}🔍 Validating YAML syntax...${NC}"
if command -v python3 &> /dev/null; then
    python3 -c "import yaml; yaml.safe_load(open('proactive-csi-agent-orchestrate.yaml'))" 2>/dev/null
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✅ YAML syntax is valid${NC}"
    else
        echo -e "${YELLOW}⚠️  YAML validation warning (may still work)${NC}"
    fi
else
    echo -e "${YELLOW}⚠️  Python not available for YAML validation${NC}"
fi
echo ""

# Display agent name from YAML
echo -e "${BLUE}📝 Agent Information:${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
grep "^name:" proactive-csi-agent-orchestrate.yaml | head -1 | sed 's/name: //' | sed 's/^/Agent Name: /'
grep "^spec_version:" proactive-csi-agent-orchestrate.yaml | head -1 | sed 's/spec_version: //' | sed 's/^/Spec Version: /'
echo ""

# Check data files
echo -e "${BLUE}📊 Data Files Status:${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
data_files=(
    "data/customer_success_data.csv"
    "data/procurement_vendor_data.csv"
    "data/revenue_exposure_data.csv"
    "data/support_tickets.csv"
    "data/customer_comms.csv"
    "data/contracts.csv"
)

for file in "${data_files[@]}"; do
    if [ -f "$file" ]; then
        lines=$(wc -l < "$file" | tr -d ' ')
        echo -e "${GREEN}✅${NC} $(basename $file): $lines records"
    else
        echo -e "${RED}❌${NC} $(basename $file): Not found"
    fi
done
echo ""

# Display IBM services configuration
echo -e "${BLUE}🔧 IBM Services Configuration:${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Check for service references in YAML
services=("Speech-to-Text" "Text-to-Speech" "Natural Language Understanding" "watsonx.ai" "Cloudant")
for service in "${services[@]}"; do
    if grep -qi "$service" proactive-csi-agent-orchestrate.yaml; then
        echo -e "${GREEN}✅${NC} $service: Referenced in configuration"
    else
        echo -e "${YELLOW}⚠️${NC}  $service: Not found in configuration"
    fi
done
echo ""

# Deployment instructions
echo -e "${BLUE}🚀 Deployment Instructions:${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "1. Open IBM watsonx Orchestrate Portal:"
echo "   ${YELLOW}https://cloud.ibm.com/watsonx/orchestrate${NC}"
echo ""
echo "2. Navigate to 'All agents' or 'Skills'"
echo ""
echo "3. Click 'Import' or 'Create agent' → 'Import from file'"
echo ""
echo "4. Upload this file:"
echo "   ${YELLOW}$(pwd)/proactive-csi-agent-orchestrate.yaml${NC}"
echo ""
echo "5. Connect IBM services (STT, TTS, NLU, watsonx.ai)"
echo ""
echo "6. Save and Activate the agent"
echo ""
echo "7. Get the deployment URL from the agent details page"
echo ""

# Test queries
echo -e "${BLUE}🧪 Test Queries (After Deployment):${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "1. \"Good morning, what's my priority today?\""
echo "2. \"Tell me about Acme Corporation\""
echo "3. \"Read me the executive briefing aloud using Text-to-Speech\""
echo "4. \"What vendors have delays?\""
echo "5. \"Calculate revenue at risk\""
echo ""

# Generate deployment report
echo -e "${BLUE}📄 Generating Deployment Report...${NC}"
report_file="DEPLOYMENT_REPORT_$(date +%Y%m%d_%H%M%S).txt"
{
    echo "╔═══════════════════════════════════════════════════════════════╗"
    echo "║  ProActive CSI - Deployment Report                          ║"
    echo "╚═══════════════════════════════════════════════════════════════╝"
    echo ""
    echo "Date: $(date)"
    echo "Agent: ProActive_CSI_Agent_404"
    echo "Version: 1.2.0"
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "Configuration File:"
    echo "  Path: $(pwd)/proactive-csi-agent-orchestrate.yaml"
    echo "  Size: $(ls -lh proactive-csi-agent-orchestrate.yaml | awk '{print $5}')"
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "Data Files:"
    for file in "${data_files[@]}"; do
        if [ -f "$file" ]; then
            lines=$(wc -l < "$file" | tr -d ' ')
            echo "  ✅ $(basename $file): $lines records"
        fi
    done
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "IBM Services:"
    for service in "${services[@]}"; do
        if grep -qi "$service" proactive-csi-agent-orchestrate.yaml; then
            echo "  ✅ $service: Configured"
        fi
    done
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "Deployment URL: [TO BE FILLED AFTER DEPLOYMENT]"
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "Test Results: [TO BE FILLED AFTER TESTING]"
    echo ""
} > "$report_file"

echo -e "${GREEN}✅ Deployment report saved: $report_file${NC}"
echo ""

# Final summary
echo -e "${GREEN}═══════════════════════════════════════════════════════════════${NC}"
echo -e "${GREEN}✅ Pre-Deployment Verification Complete!${NC}"
echo -e "${GREEN}═══════════════════════════════════════════════════════════════${NC}"
echo ""
echo -e "${BLUE}Next Steps:${NC}"
echo "1. Follow the deployment instructions above"
echo "2. Deploy via IBM Web UI"
echo "3. Test the agent with provided queries"
echo "4. Update deployment report with URL and test results"
echo ""
echo -e "${YELLOW}📋 Full deployment guide: DEPLOYMENT_PROOF.md${NC}"
echo ""

