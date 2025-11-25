# 🚀 Vercel Deployment Guide for RETENX Dashboard

## Prerequisites

1. **GitHub Account** - Your code needs to be on GitHub
2. **Vercel Account** - Sign up at [vercel.com](https://vercel.com) (free)
3. **Node.js** - Installed locally (for testing)

## Step-by-Step Deployment

### Step 1: Prepare Your Code

1. **Navigate to the dashboard directory:**
   ```bash
   cd business-dashboard
   ```

2. **Test the build locally (optional but recommended):**
   ```bash
   npm install
   npm run build
   ```
   
   If the build succeeds, you're ready to deploy!

### Step 2: Push to GitHub

1. **Initialize git (if not already done):**
   ```bash
   git init
   git add .
   git commit -m "Ready for Vercel deployment"
   ```

2. **Create a new repository on GitHub:**
   - Go to [github.com](https://github.com)
   - Click "New repository"
   - Name it (e.g., `retenx-dashboard`)
   - Don't initialize with README
   - Click "Create repository"

3. **Push your code:**
   ```bash
   git remote add origin https://github.com/YOUR_USERNAME/retenx-dashboard.git
   git branch -M main
   git push -u origin main
   ```

### Step 3: Deploy to Vercel

#### Option A: Deploy via Vercel Dashboard (Recommended)

1. **Go to Vercel:**
   - Visit [vercel.com](https://vercel.com)
   - Sign up/Login with GitHub

2. **Import your project:**
   - Click "Add New..." → "Project"
   - Select your GitHub repository (`retenx-dashboard`)
   - Click "Import"

3. **Configure project:**
   - **Framework Preset:** Next.js (auto-detected)
   - **Root Directory:** `business-dashboard` (if deploying from monorepo)
   - **Build Command:** `npm run build` (default)
   - **Output Directory:** `.next` (default)
   - **Install Command:** `npm install` (default)

4. **Environment Variables (if needed):**
   - If you have any `.env` files, add them here
   - For this project, no environment variables are required

5. **Deploy:**
   - Click "Deploy"
   - Wait 2-3 minutes for build to complete
   - Your site will be live! 🎉

#### Option B: Deploy via Vercel CLI

1. **Install Vercel CLI:**
   ```bash
   npm i -g vercel
   ```

2. **Login to Vercel:**
   ```bash
   vercel login
   ```

3. **Deploy:**
   ```bash
   cd business-dashboard
   vercel
   ```
   
   Follow the prompts:
   - Link to existing project? No
   - Project name: retenx-dashboard
   - Directory: ./
   - Override settings? No

4. **Deploy to production:**
   ```bash
   vercel --prod
   ```

### Step 4: Custom Domain (Optional)

1. Go to your project on Vercel dashboard
2. Click "Settings" → "Domains"
3. Add your custom domain
4. Follow DNS configuration instructions

## Post-Deployment

### Access Your Dashboard

After deployment, you'll get a URL like:
- `https://retenx-dashboard.vercel.app`

### Automatic Deployments

- Every push to `main` branch = Production deployment
- Every push to other branches = Preview deployment
- Pull requests = Preview deployment with unique URL

## Troubleshooting

### Build Fails

1. **Check build logs in Vercel dashboard**
2. **Common issues:**
   - Missing dependencies → Check `package.json`
   - TypeScript errors → Run `npm run build` locally first
   - Environment variables → Add them in Vercel dashboard

### IBM Agent Not Loading

The IBM Watson Orchestrate agent should work, but if it doesn't:
- Check browser console for errors
- Verify the orchestration ID is correct
- Ensure CORS is properly configured

### Styling Issues

- Clear browser cache
- Check if Tailwind CSS is building correctly
- Verify `tailwind.config.ts` is correct

## Quick Commands Reference

```bash
# Local development
npm run dev

# Build locally
npm run build

# Test production build
npm run build && npm run start

# Deploy to Vercel (CLI)
vercel

# Deploy to production (CLI)
vercel --prod
```

## Project Structure

```
business-dashboard/
├── app/              # Next.js app directory
├── components/       # React components
├── lib/             # Utilities and data
├── public/          # Static assets
├── package.json     # Dependencies
├── next.config.ts   # Next.js config
├── tailwind.config.ts # Tailwind config
└── vercel.json      # Vercel config (optional)
```

## Support

If you encounter issues:
1. Check Vercel build logs
2. Test build locally first
3. Check Next.js documentation
4. Check Vercel documentation

---

**Happy Deploying! 🚀**

