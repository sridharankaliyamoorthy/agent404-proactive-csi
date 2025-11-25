# 🌐 Website Integration Guide

## Overview

This project now includes both:
1. **Python Backend** - Streamlit application (`app.py`) with agents and workflows
2. **Next.js Website** - Vercel-deployed frontend in the `website/` folder

Both components are **completely isolated** and won't interfere with each other.

---

## 📁 Project Structure

```
agent404-proactive-csi-2.0/
├── website/              # Next.js frontend (Vercel deployment)
│   ├── app/             # Next.js app directory
│   ├── components/      # React components
│   ├── lib/            # Utilities
│   ├── public/         # Static assets
│   ├── package.json    # Frontend dependencies
│   └── vercel.json     # Vercel config (website-specific)
│
├── agents/              # Python agents (unchanged)
├── workflows/           # Python workflows (unchanged)
├── integrations/       # Python integrations (unchanged)
├── app.py              # Streamlit backend (unchanged)
├── requirements.txt    # Python dependencies (unchanged)
└── vercel.json         # Root Vercel config (points to website/)
```

---

## 🚀 Running the Website Locally

### Prerequisites

- Node.js 18+ installed
- npm or yarn

### Steps

```bash
# Navigate to website folder
cd website

# Install dependencies
npm install

# Run development server
npm run dev
```

Visit: **http://localhost:3000**

---

## 🚀 Running the Python Backend

The Python backend remains unchanged and can run independently:

```bash
# From project root
streamlit run app.py
```

Visit: **http://localhost:8501**

---

## 📦 Deploying to Vercel

### Method 1: Deploy from Root (Recommended)

```bash
# From project root
vercel
```

The root `vercel.json` automatically:
- Builds from the `website/` folder
- Uses Next.js framework detection
- Deploys only the frontend

### Method 2: Deploy from Website Folder

```bash
cd website
vercel
```

---

## ✅ What's Protected

### Python Backend (Unchanged)
- ✅ All Python code in `agents/`, `workflows/`, `integrations/`
- ✅ `app.py` Streamlit application
- ✅ `requirements.txt` and Python dependencies
- ✅ All data files in `data/`
- ✅ All scripts in `scripts/`
- ✅ All documentation in `docs/`

### Website (Isolated)
- ✅ All Next.js code in `website/` folder
- ✅ Frontend dependencies in `website/package.json`
- ✅ Build artifacts in `website/.next/` (gitignored)
- ✅ Node modules in `website/node_modules/` (gitignored)

---

## 🔧 Configuration Files

### Root `vercel.json`
- Configures Vercel to build from `website/` folder
- Sets up Next.js framework detection
- Handles routing

### `website/vercel.json`
- Website-specific Vercel configuration
- Can override root settings if needed

### `.gitignore`
- Updated to exclude:
  - `website/.next/` (Next.js build output)
  - `website/node_modules/` (dependencies)
  - `website/.vercel` (Vercel deployment cache)

---

## 🎯 Development Workflow

### Working on Website
```bash
cd website
npm run dev
# Make changes to website files
# Test at http://localhost:3000
```

### Working on Backend
```bash
# From project root
streamlit run app.py
# Make changes to Python files
# Test at http://localhost:8501
```

### Both Running Simultaneously
- Website: `http://localhost:3000`
- Backend: `http://localhost:8501`
- No conflicts! ✅

---

## 📝 Notes

1. **No Conflicts**: The website and backend are completely separate
2. **Independent Deployment**: Website deploys to Vercel, backend can deploy separately
3. **Shared Repository**: Both live in the same Git repo but don't interfere
4. **Future Integration**: If you want to connect the website to the backend API, you can add API routes in `website/app/api/`

---

## 🆘 Troubleshooting

### Website won't build
```bash
cd website
rm -rf node_modules .next
npm install
npm run build
```

### Vercel deployment fails
- Check that `website/package.json` exists
- Verify `website/next.config.ts` is valid
- Check Vercel build logs for specific errors

### Port conflicts
- Website uses port 3000 (Next.js default)
- Backend uses port 8501 (Streamlit default)
- Change ports if needed in respective configs

---

## ✅ Integration Complete!

Your website is now integrated and ready to deploy. The Python backend remains completely untouched and functional.

**Next Steps:**
1. Test the website locally: `cd website && npm run dev`
2. Deploy to Vercel: `vercel` (from root or website folder)
3. Continue developing either component independently

