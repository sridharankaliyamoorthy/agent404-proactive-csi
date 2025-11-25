#!/bin/bash

# RETENX Dashboard - IBM Cloud Deployment Script
# This script deploys the Next.js dashboard to IBM Cloud Code Engine

set -e

echo "🚀 Starting IBM Cloud Deployment..."

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Configuration
PROJECT_NAME="retenx-dashboard"
IMAGE_NAME="us.icr.io/retenx-dashboard/retenx-dashboard:latest"
APP_NAME="retenx-dashboard"

# Step 1: Check if logged in
echo -e "${BLUE}Step 1: Checking IBM Cloud login...${NC}"
if ! ibmcloud account show &> /dev/null; then
    echo -e "${YELLOW}Please login to IBM Cloud first:${NC}"
    echo "ibmcloud login"
    exit 1
fi
echo -e "${GREEN}✓ Logged in${NC}"

# Step 2: Set target region (default: us-south)
echo -e "${BLUE}Step 2: Setting target region...${NC}"
ibmcloud target -r us-south
echo -e "${GREEN}✓ Region set${NC}"

# Step 3: Create namespace if it doesn't exist
echo -e "${BLUE}Step 3: Creating container registry namespace...${NC}"
if ! ibmcloud cr namespace-list | grep -q "retenx-dashboard"; then
    ibmcloud cr namespace-add retenx-dashboard
    echo -e "${GREEN}✓ Namespace created${NC}"
else
    echo -e "${GREEN}✓ Namespace exists${NC}"
fi

# Step 4: Login to container registry
echo -e "${BLUE}Step 4: Logging into container registry...${NC}"
ibmcloud cr login
echo -e "${GREEN}✓ Logged into registry${NC}"

# Step 5: Build Docker image
echo -e "${BLUE}Step 5: Building Docker image...${NC}"
docker build -t $IMAGE_NAME .
echo -e "${GREEN}✓ Image built${NC}"

# Step 6: Push image to registry
echo -e "${BLUE}Step 6: Pushing image to registry...${NC}"
docker push $IMAGE_NAME
echo -e "${GREEN}✓ Image pushed${NC}"

# Step 7: Create or select Code Engine project
echo -e "${BLUE}Step 7: Setting up Code Engine project...${NC}"
if ! ibmcloud ce project get --name ${PROJECT_NAME}-project &> /dev/null; then
    ibmcloud ce project create --name ${PROJECT_NAME}-project
    echo -e "${GREEN}✓ Project created${NC}"
else
    echo -e "${GREEN}✓ Project exists${NC}"
fi
ibmcloud ce project select --name ${PROJECT_NAME}-project

# Step 8: Create or update application
echo -e "${BLUE}Step 8: Deploying application...${NC}"
if ibmcloud ce application get --name $APP_NAME &> /dev/null; then
    echo -e "${YELLOW}Application exists, updating...${NC}"
    ibmcloud ce application update --name $APP_NAME \
        --image $IMAGE_NAME \
        --cpu 1 \
        --memory 2G \
        --min-scale 1 \
        --max-scale 3
    echo -e "${GREEN}✓ Application updated${NC}"
else
    echo -e "${YELLOW}Creating new application...${NC}"
    ibmcloud ce application create \
        --name $APP_NAME \
        --image $IMAGE_NAME \
        --registry-secret ibmcloud-cr-secret \
        --port 3000 \
        --cpu 1 \
        --memory 2G \
        --min-scale 1 \
        --max-scale 3
    echo -e "${GREEN}✓ Application created${NC}"
fi

# Step 9: Get application URL
echo -e "${BLUE}Step 9: Getting application URL...${NC}"
APP_URL=$(ibmcloud ce application get --name $APP_NAME --output json | grep -o '"url":"[^"]*' | cut -d'"' -f4)
echo -e "${GREEN}✓ Deployment complete!${NC}"
echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}🎉 Your RETENX Dashboard is live!${NC}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BLUE}URL: ${APP_URL}${NC}"
echo ""
echo "To view logs: ibmcloud ce application logs --name $APP_NAME"
echo "To update: Run this script again"

