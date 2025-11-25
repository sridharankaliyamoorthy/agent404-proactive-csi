# 🚀 Run Locally - Quick Guide

## ✅ Your App is Running!

**Access at:** http://localhost:8502

---

## 🎯 Quick Start

### Option 1: Already Running (Current)
The app is already running in the background!

**Just open:** http://localhost:8502

### Option 2: Start Fresh

```bash
cd /Users/ishwaryasridharan/Desktop/Hackathon_2025/agent404-proactive-csi-2.0
streamlit run app.py
```

This will:
- Start the app on http://localhost:8501 (or next available port)
- Open your browser automatically
- Show the dashboard

---

## 📋 Available Pages

1. **🏠 Modern Dashboard** - Single-page demo with:
   - KPI metrics
   - Interactive charts (Revenue & Churn)
   - IBM Agent chat widget
   - Customer health visualization
   - Risk factors
   - Top at-risk customers

2. **🤖 IBM Agent Chat** - Full-page chat interface
   - Uses your exact IBM script
   - Full-screen chat experience

3. **📊 Classic Dashboard** - Original dashboard
4. **🔮 Customer Intelligence** - Customer analysis
5. **📦 Procurement Monitor** - Vendor tracking
6. **💰 Revenue Protection** - Revenue analytics
7. **⚡ Workflows** - Execute workflows
8. **📊 Executive Brief** - Executive reports

---

## 🔧 Troubleshooting

### Port Already in Use?
```bash
streamlit run app.py --server.port 8503
```

### Stop the App
```bash
pkill -f "streamlit run"
```

### Restart the App
```bash
pkill -f "streamlit run"
streamlit run app.py
```

### Check if Running
```bash
ps aux | grep streamlit
```

---

## ✨ Features

✅ **IBM Agent Integration** - Your exact script
✅ **Real Data** - All metrics from your agents
✅ **Interactive Charts** - Plotly visualizations
✅ **Responsive Design** - Works on all screens
✅ **Single-Page Demo** - Perfect for presentations

---

## 💡 Tips

- **For Demos:** Use the Modern Dashboard page
- **For Chat:** Use the IBM Agent Chat page
- **For Analysis:** Explore other pages
- **Refresh:** Click the refresh button in Streamlit

---

## 🎉 Enjoy!

Your dashboard is ready to use locally. No cloud account needed!

