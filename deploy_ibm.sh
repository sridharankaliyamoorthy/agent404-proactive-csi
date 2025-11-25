#!/bin/bash
# Quick deployment script - runs the full automated CLI deployment

cd "$(dirname "$0")"
exec ./scripts/deployment/deploy_auto_ibm_cli.sh

