#!/bin/bash
#
# Complete Cleanup Script
# - Removes sensitive files from working directory
# - Cleans Git history of sensitive files
# - Removes unwanted/temporary files
#

set -e

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$PROJECT_ROOT"

echo "╔═══════════════════════════════════════════════════════════════════════════╗"
echo "║     Complete Repository Cleanup                                           ║"
echo "╚═══════════════════════════════════════════════════════════════════════════╝"
echo ""

# Step 1: Remove sensitive files from working directory
echo "📋 Step 1: Removing sensitive files from working directory..."
SENSITIVE_FILES=(
    "docs/deployment/IBM_PORTAL_DEPLOYMENT.md"
    "scripts/deployment/quick_deploy.sh"
    ".env"
    ".env.local"
    ".env.production"
)

for file in "${SENSITIVE_FILES[@]}"; do
    if [ -f "$file" ] || [ -d "$file" ]; then
        echo "   Removing: $file"
        rm -rf "$file"
    fi
done

# Step 2: Remove credential files
echo ""
echo "📋 Step 2: Removing credential files..."
find . -name "*credentials*.json" -not -path "./.git/*" -type f -delete 2>/dev/null || true
find . -name "*api_key*" -not -path "./.git/*" -type f -delete 2>/dev/null || true
find . -name "*apikey*" -not -path "./.git/*" -type f -delete 2>/dev/null || true
find . -name "ibm-credentials*.json" -not -path "./.git/*" -type f -delete 2>/dev/null || true

# Step 3: Remove temporary files
echo ""
echo "📋 Step 3: Removing temporary files..."
find . -name "*.tmp" -not -path "./.git/*" -type f -delete 2>/dev/null || true
find . -name "*.log" -not -path "./.git/*" -not -path "./logs/*" -type f -delete 2>/dev/null || true
find . -name ".DS_Store" -not -path "./.git/*" -type f -delete 2>/dev/null || true
find . -name "__pycache__" -not -path "./.git/*" -type d -exec rm -rf {} + 2>/dev/null || true

# Step 4: Clean Git history
echo ""
echo "📋 Step 4: Cleaning Git history..."

if ! command -v git-filter-repo &> /dev/null; then
    echo "   ⚠️  git-filter-repo not found. Installing..."
    pip install git-filter-repo || {
        echo "   ❌ Failed to install git-filter-repo"
        echo "   Please install manually: pip install git-filter-repo"
        exit 1
    }
fi

# Create backup
echo "   Creating backup..."
BACKUP_DIR="/tmp/agent404-git-backup-$(date +%Y%m%d_%H%M%S)"
git clone --mirror . "$BACKUP_DIR" 2>/dev/null || {
    cd /tmp
    git clone "$PROJECT_ROOT" "agent404-backup-$(date +%Y%m%d_%H%M%S)"
    cd "$PROJECT_ROOT"
}
echo "   ✅ Backup created: $BACKUP_DIR"

# Remove sensitive files from ALL Git history
echo ""
echo "   Removing sensitive files from Git history..."
FILES_TO_REMOVE=(
    "docs/deployment/IBM_PORTAL_DEPLOYMENT.md"
    "scripts/deployment/quick_deploy.sh"
    "integrations/ibm_services.py"
)

for file in "${FILES_TO_REMOVE[@]}"; do
    if git log --all --format="%H" -- "$file" 2>/dev/null | head -1 > /dev/null; then
        echo "   Removing: $file"
        git-filter-repo --path "$file" --invert-paths --force --quiet || true
    else
        echo "   ✅ $file - Not in Git history"
    fi
done

# Remove .env from history if it exists
if git log --all --format="%H" -- ".env" 2>/dev/null | head -1 > /dev/null; then
    echo "   Removing: .env"
    git-filter-repo --path ".env" --invert-paths --force --quiet || true
fi

# Restore remote
git remote add origin https://github.com/sridharankaliyamoorthy/agent404-proactive-csi.git 2>/dev/null || true

# Step 5: Verify cleanup
echo ""
echo "📋 Step 5: Verifying cleanup..."
echo ""
for file in "${FILES_TO_REMOVE[@]}"; do
    count=$(git log --all --oneline -- "$file" 2>/dev/null | wc -l | tr -d ' ')
    if [ "$count" -eq 0 ]; then
        echo "   ✅ $file - Removed from all commits"
    else
        echo "   ⚠️  $file - Still found in $count commits"
    fi
done

# Check for hardcoded credentials in history
echo ""
echo "   Checking for hardcoded credentials in Git history..."
CREDENTIALS=(
    "8c593427-3768-4ae1-a695-b9bcbe84b21e"
    "IYKkTGru14JfJWkl_G7xh6Y4UTa4qSPYPZE5M0Smk4AV"
    "f01bbce3-de41-430e-bd9b-5c00a082588a-bluemix"
)

for cred in "${CREDENTIALS[@]}"; do
    count=$(git log --all -S "$cred" --oneline 2>/dev/null | wc -l | tr -d ' ')
    if [ "$count" -eq 0 ]; then
        echo "   ✅ Credential pattern removed from history"
    else
        echo "   ⚠️  Credential pattern found in $count commits"
    fi
done

echo ""
echo "╔═══════════════════════════════════════════════════════════════════════════╗"
echo "║                    ✅ CLEANUP COMPLETE! ✅                                ║"
echo "╚═══════════════════════════════════════════════════════════════════════════╝"
echo ""
echo "📋 Next Steps:"
echo ""
echo "1. Review the changes:"
echo "   git log --all --oneline"
echo ""
echo "2. Force push to GitHub (⚠️ This will overwrite GitHub history):"
echo "   git push --force --all"
echo "   git push --force --tags"
echo ""
echo "3. Verify on GitHub:"
echo "   - Check that old commit URLs return 404"
echo "   - Search repository for hardcoded credentials (should return 0 results)"
echo ""
echo "⚠️  IMPORTANT:"
echo "   - All collaborators must re-clone the repository"
echo "   - Commit hashes will be different after cleanup"
echo "   - GitHub may cache old views for a few hours"
echo ""
echo "📦 Backup location: $BACKUP_DIR"
echo ""

