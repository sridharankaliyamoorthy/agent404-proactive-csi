#!/bin/bash

# Business Dashboard - GitHub to Vercel Deployment Script
# Run this script to deploy your dashboard to Vercel

echo "🚀 Business Dashboard Deployment Script"
echo "========================================"
echo ""

# Check if git is initialized
if [ ! -d .git ]; then
    echo "📦 Initializing git repository..."
    git init
    echo "✅ Git initialized"
else
    echo "✅ Git already initialized"
fi

# Stage all files
echo ""
echo "📝 Staging files..."
git add .

# Commit
echo ""
echo "💾 Committing changes..."
git commit -m "feat: Initial commit - Modern Business Dashboard

- Next.js 16 with TypeScript
- Tailwind CSS for styling
- Recharts for data visualization
- KPI cards, charts, and analytics
- Dark/light theme support
- Fully responsive design
- Ready for Vercel deployment"

echo ""
echo "🔗 Next steps:"
echo ""
echo "1. Create a new repository on GitHub:"
echo "   https://github.com/new"
echo ""
echo "2. Connect your local repository to GitHub:"
echo "   git branch -M main"
echo "   git remote add origin https://github.com/YOUR_USERNAME/business-dashboard.git"
echo "   git push -u origin main"
echo ""
echo "3. Deploy to Vercel:"
echo "   - Go to https://vercel.com"
echo "   - Click 'New Project'"
echo "   - Import your GitHub repository"
echo "   - Click 'Deploy'"
echo ""
echo "4. Your dashboard will be live at:"
echo "   https://your-project.vercel.app"
echo ""
echo "✨ Done! Your dashboard is ready to deploy!"
echo ""
echo "Current URL: http://localhost:3000"
echo ""

