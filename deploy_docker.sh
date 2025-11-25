#!/bin/bash
# Quick wrapper for Docker deployment

cd "$(dirname "$0")"
exec ./docker/deploy_with_docker.sh

