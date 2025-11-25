#!/bin/bash
#
# Remove sensitive files from entire Git history
# This will remove these files from ALL commits in ALL branches
#
# Files to remove:
# - docs/deployment/IBM_PORTAL_DEPLOYMENT.md
# - scripts/deployment/quick_deploy.sh
# - integrations/ibm_services.py
# - .env (if exists)
#

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

cd "$PROJECT_ROOT"

echo "╔═══════════════════════════════════════════════════════════════════════════╗"
echo "║     Remove Sensitive Files from Entire Git History                        ║"
echo "╚═══════════════════════════════════════════════════════════════════════════╝"
echo ""

# Check if git-filter-repo is installed
if ! command -v git-filter-repo &> /dev/null; then
    echo "❌ git-filter-repo is not installed"
    echo ""
    echo "Install it with:"
    echo "  pip install git-filter-repo"
    exit 1
fi

echo "⚠️  WARNING: This will rewrite Git history!"
echo "   - All commits will be rewritten"
echo "   - You will need to force push: git push --force --all"
echo "   - All collaborators must re-clone the repository"
echo ""
read -p "Continue? (yes/no): " confirm

if [ "$confirm" != "yes" ]; then
    echo "❌ Aborted"
    exit 1
fi

echo ""
echo "📋 Creating backup..."
BACKUP_DIR="/tmp/agent404-git-backup-$(date +%Y%m%d_%H%M%S)"
git clone --mirror . "$BACKUP_DIR" 2>/dev/null || {
    cd /tmp
    git clone "$PROJECT_ROOT" "agent404-backup-$(date +%Y%m%d_%H%M%S)"
    cd "$PROJECT_ROOT"
}
echo "✅ Backup created: $BACKUP_DIR"

echo ""
echo "🧹 Removing sensitive files from Git history..."

# Remove each file from entire history
FILES_TO_REMOVE=(
    "docs/deployment/IBM_PORTAL_DEPLOYMENT.md"
    "scripts/deployment/quick_deploy.sh"
    "integrations/ibm_services.py"
)

for file in "${FILES_TO_REMOVE[@]}"; do
    echo "   Removing: $file"
    git-filter-repo --path "$file" --invert-paths --force --quiet || {
        echo "   ⚠️  File not found in history: $file"
    }
done

# Also remove .env if it exists
if git log --all --format="%H" -- ".env" 2>/dev/null | head -1 > /dev/null; then
    echo "   Removing: .env"
    git-filter-repo --path ".env" --invert-paths --force --quiet
fi

echo ""
echo "✅ Sensitive files removed from Git history!"
echo ""
echo "📋 Verification:"
for file in "${FILES_TO_REMOVE[@]}"; do
    count=$(git log --all --oneline -- "$file" 2>/dev/null | wc -l | tr -d ' ')
    if [ "$count" -eq 0 ]; then
        echo "   ✅ $file - Removed from all commits"
    else
        echo "   ⚠️  $file - Still found in $count commits"
    fi
done

echo ""
echo "📋 Next steps:"
echo "1. Review the changes: git log --all --oneline"
echo "2. Force push to remote:"
echo "   git push --force --all"
echo "   git push --force --tags"
echo ""
echo "⚠️  IMPORTANT: Notify all collaborators to re-clone the repository!"
echo ""
echo "📦 Backup location: $BACKUP_DIR"

