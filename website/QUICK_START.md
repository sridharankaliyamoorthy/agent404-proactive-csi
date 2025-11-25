# 🚀 Quick Start Guide

## ✅ Website Status: WORKING

The website is integrated and ready to use!

## 🖥️ Local Development

### Start the Development Server

```bash
cd website
npm run dev
```

**Then open:** http://localhost:3000

### What You Should See

- ✅ Header with RETENX branding
- ✅ 4 KPI cards (Revenue at Risk, Churn Probability, etc.)
- ✅ Revenue Protection chart
- ✅ Churn Prediction chart
- ✅ IBM AI Agent widget
- ✅ Customer Health chart
- ✅ Risk Factors list

## 📦 Build for Production

```bash
cd website
npm run build
npm start
```

## 🌐 Deploy to Vercel

### Option 1: Deploy from Root (Recommended)

```bash
# From project root
vercel
```

The root `vercel.json` is configured to automatically:
- Build from the `website/` folder
- Detect Next.js framework
- Deploy successfully

### Option 2: Deploy from Website Folder

```bash
cd website
vercel
```

## 🔧 Troubleshooting

### Port Already in Use

If port 3000 is busy:
```bash
# Kill existing process
pkill -f "next dev"

# Or use a different port
PORT=3001 npm run dev
```

### Build Errors

```bash
cd website
rm -rf .next node_modules
npm install
npm run build
```

### Page Not Loading

1. Check if server is running: `curl http://localhost:3000`
2. Check browser console for errors (F12)
3. Verify all components are in `website/components/`
4. Check that `website/app/page.tsx` exists

## ✅ Verification Checklist

- [ ] `npm install` completed successfully
- [ ] `npm run build` completed without errors
- [ ] `npm run dev` starts server on port 3000
- [ ] Page loads at http://localhost:3000
- [ ] All components render correctly
- [ ] No console errors in browser

## 📝 Notes

- **Backend (Python)**: Still works independently at `http://localhost:8501`
- **Frontend (Next.js)**: Runs at `http://localhost:3000`
- **No Conflicts**: Both can run simultaneously

