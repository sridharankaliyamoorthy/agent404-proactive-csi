<!-- PROJECT TITLE -->
  <h1 align="center">RetenX - (ProActive_CSI_Agent_404)</h1>
   <h2> AI-Powered Multi-Agent Enterprise Risk Detection & IBM Watsonx Orchestrate Integration</h2>
 <div id="header" align="center">
</div>
<h2 align="center">
 Description
</h2>
<p align="center"> <strong>Introducing RETENX:</strong>
  An AI-powered multi-agent system that proactively detects hidden customer, procurement, and financial risks before they escalate, enabling enterprise teams to act intelligently and prevent revenue loss in real time.<br>
  <strong>Built to Win | Built for Enterprise | Built on IBM watsonx</strong>
</p>

<p align="center"> 

[![IBM watsonx](https://img.shields.io/badge/IBM-watsonx-blue)]()
[![Multi-Agent](https://img.shields.io/badge/Architecture-Multi--Agent-green)]()
[![Workflows](https://img.shields.io/badge/Workflows-6-orange)]()
[![Revenue Protected](https://img.shields.io/badge/Revenue%20Protected-%24612K-success)]() </p>

## Table of Contents

<details>
<summary>RETENX</summary>
  
- [Application Description](#application-description)
- [Table of Contents](#table-of-contents)
- [Contributing](#contributing)
- [Authors](#authors)
- [License](#license)

</details>

## TRY the prototype
[RETENX on IBM Cloud](https://au-syd.watson-orchestrate.cloud.ibm.com/chat)


## Interact with the UI
[RETENX UI](https://retenx-dashboard.vercel.app/)

## 🎥 Demo
Watch a short walkthrough of RETENX in action on YouTube:

[![RETENX Demo](https://img.youtube.com/vi/M1RukOQQRPA/0.jpg)](https://www.youtube.com/watch?v=M1RukOQQRPA)

## 🎥 Project Pitch
Watch the entire project pitch here:

[RETENX Project Pitch](https://youtu.be/1qU1zd38QGY)

## TRY these test queries that showcase all 6 IBM services
[Test QUERIES](https://docs.google.com/document/d/1SfE3XwLRSJOGmq4Pnv6ntCWn14RWQOfvnqB2yGgayZE/edit?usp=sharing)

---

## 🎯 Problem Statement

Enterprises are losing **millions in revenue** because:

- 💔 **Churn signals are invisible** until it's too late
- 📦 **Procurement risks** trigger customer frustration  
- 👥 **Customer Success teams operate manually** with no unified intelligence
- 💰 **No proactive revenue protection** system exists
- 🔗 **Disconnected systems** lead to slow, scattered interventions

**Result:** 18% annual churn rate, $millions lost, reactive (not proactive) customer success.

---

## 💡 Solution Statement
A **three-agent AI system** built on **IBM watsonx Orchestrate** that:

✅ **Predicts customer churn** 30-60 days early (89% accuracy)  
✅ **Detects procurement risks** that affect customers  
✅ **Calculates revenue at risk** in real-time  
✅ **Triggers autonomous interventions** across 13+ enterprise systems  
✅ **Coordinates 3 intelligent agents** (CS, Procurement, Revenue)  
✅ **Generates executive briefings** automatically  
✅ **Voice-first operations** for hands-free management

---

## Technology Stack

| Technology | Description                 |
| ---------- | --------------------------- |
| Python     | Programming Language        |
| Docker     | Deployment CI/CD Pipeline   |
| Streamlit    |  an open-source app framework that is a breeze to get started with. |
| React     | a JavaScript library for building user interfaces. |
| JavaScript     | a programming language and core technology of the Web. |
| watsonx.ai      | Churn prediction, LLM reasoning, intervention recommendations.           |
| watsonx Orchestrate     | Multi-agent coordination & workflow execution.  |
| Natural Language Understanding (NLU)	    |Sentiment & emotion analysis. |
| Speech-to-Text    | Voice-first operations. |
|Text-to-Speech| Voice responses & briefings.|
|Cloudant|  Customer health data & analytics storage.|

## Features

### 1️⃣ **Customer Success Intelligence Agent**
- Predicts churn probability using watsonx.ai
- Analyzes sentiment using IBM NLU
- Extracts customer health signals
- Recommends interventions automatically
- Voice-first operations (STT/TTS)

### 2️⃣ **Procurement Intelligence Agent**
- Monitors vendor performance
- Predicts delivery delays
- Flags contract risks
- Correlates vendor issues → customer impact
- Triggers cross-team escalation tasks

### 3️⃣ **Revenue Protection Agent**
- Calculates ARR/MRR at risk
- Monitors contract value exposure
- Generates CFO briefings
- 🎯 Recommends intervention investments
- Models financial scenarios

**Orchestration Layer:** IBM watsonx Orchestrate coordinates all 3 agents

---

# 🟦 IBM Watsonx Orchestrate Integration (Full Documentation)

---

## 1. Digital Skill Manifest

RETENX registers a digital skill to allow Watsonx Orchestrate to run enterprise risk assessments:

```json
{
  "name": "retenx_risk_scan",
  "displayName": "RETENX Enterprise Risk Scan",
  "description": "Runs a multi-agent enterprise risk assessment across customer, procurement, and financial operations.",
  "type": "rest",
  "input": {
    "schema": {
      "type": "object",
      "properties": {
        "entity_id": { "type": "string" },
        "risk_type": { "type": "string" }
      },
      "required": ["entity_id"]
    }
  },
  "output": {
    "schema": {
      "type": "object",
      "properties": {
        "risk_score": { "type": "number" },
        "alerts": { "type": "array" },
        "recommendations": { "type": "array" }
      }
    }
  },
  "endpoint": {
    "method": "POST",
    "url": "https://<your-endpoint>/api/orchestrate/retenx/scan"
  }
}
```

---

## 2. Orchestrate Workflow Architecture

```
┌───────────────────────────────────────────┐
│         IBM Watsonx Orchestrate           │
│         (Workflow & Scheduler)            │
└──────────────────────┬────────────────────┘
                       │ invokes
                       │
             ┌─────────▼─────────┐
             │  RETENX REST API  │
             │ /orchestrate/scan │
             └─────────┬─────────┘
                       │ distributes
       ┌────────────┬───┴───────────────┬────────────┐
       │Customer    │Procurement        │Financial   │
       │Risk Agent  │Risk Agent         │Risk Agent  │
       └──────┬─────┴─────────┬─────────┴───────┬────┘
              │               │                 │
              └─────┬─────────┴───────┬─────────┘
                    │   Aggregation   │
                    └────────┬────────┘
                       ┌─────▼─────┐
                       │ Decision  │
                       │ Logic     │
                       └─────┬─────┘
       ┌──────────────────────┼────────────────────────┐
       │                      │                        │
Low Risk:             Medium Risk:                High Risk:
 Auto-approve         Escalate to Manager         Notify Slack
 Log to Cloudant      Manager Review              Create Incident
                                                 Notify Stakeholders
```

---

## 3. Example Payloads

**Request:**
```json
{
  "entity_id": "SUPPLIER-183",
  "risk_type": "procurement"
}
```
**Response:**
```json
{
  "risk_score": 82.4,
  "alerts": [
    "Vendor mismatch with procurement records",
    "Unusual transaction volume"
  ],
  "recommendations": [
    "Manual review required",
    "Temporarily suspend high-volume procurement orders"
  ]
}
```

---

## 4. Automation Flow Summary

- **Low Risk:**  
  → Auto-approved and logged in Cloudant

- **Medium Risk:**  
  → Routed for manager approval

- **High Risk:**  
  → Slack escalation  
  → Incident created  
  → Notifies procurement/finance/security

---

## 🚀 Quick Start

### **Option 1: Run Demo Locally (2 minutes)**

```bash
cd agent404-proactive-csi
./scripts/run_demo.sh
```

## Security & Secrets Management

All IBM Cloud and external service credentials are loaded exclusively from environment variables. No API keys, instance IDs, account IDs, or project IDs exist in the repository history or current work...

### Workflow
1. Copy `.env.example` to `.env` and populate real values locally.
2. Keep `.env` out of version control (already ignored).
3. For CI/CD use platform secret stores:
  - GitHub Actions: `${{ secrets.MY_SECRET }}`.
  - IBM Cloud: configure environment variables or Secrets Manager.
4. Rotate keys immediately if exposure is suspected; update only `.env`.

### Automated Scanning
- `.gitleaks.toml` allowlists placeholders and ignores artifact paths.
- Run before each push:
```bash
gitleaks detect --config .gitleaks.toml
```

### Placeholder Convention
Docs show placeholders only: `<REDACTED_STT_API_KEY>`, `<REDACTED_NLU_INSTANCE_ID>`, `<REDACTED_CLOUDANT_ACCOUNT>`.

### Local Run
```bash
python -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt
cp .env.example .env  # fill with real keys
python app.py
```

### After IBM Account Reactivation
1. Generate NEW keys for STT, TTS, NLU, Cloudant, watsonx.ai project.
2. Update `.env` only; do not modify code to embed keys.
3. Validate with `gitleaks detect --config .gitleaks.toml` (expect no leaks).
4. Proceed with deployment per `docs/deployment/IBM_DEPLOYMENT_GUIDE.md`.

Open: **http://localhost:8501**

### **Option 2: Deploy to IBM watsonx Orchestrate (5 minutes)**

```bash
cd agent404-proactive-csi
./scripts/deploy_to_ibm.sh
```

Then open: **https://au-syd.watson-orchestrate.cloud.ibm.com/chat/**

### **Option 3: Test Agents Only**

```bash
cd agent404-proactive-csi
./scripts/test_agents.sh
```

---

## 🧪 Testing

### **Run All Tests**

```bash
python3 -m pytest tests/
```

### **Test Individual Agents**

```python
# Test Customer Success Agent
from agents.customer_success_agent import CustomerSuccessAgent
cs_agent = CustomerSuccessAgent()
critical = cs_agent.get_critical_customers()
print(f"Critical customers: {len(critical)}")

# Test churn prediction
churn_prob = cs_agent.predict_churn_probability("C-001")
print(f"Churn probability: {churn_prob*100:.1f}%")
```

### **Test Workflows**

```python
from workflows.orchestrator import WorkflowOrchestrator
orchestrator = WorkflowOrchestrator()

# Execute churn prediction workflow
result = orchestrator.workflow_churn_prediction("C-001")
print(f"Workflow completed: {len(result['steps'])} steps")

# Execute daily executive brief
brief = orchestrator.workflow_daily_executive_brief()
print(brief['executive_brief'])
```

---

## 🙏 Acknowledgments

- **IBM watsonx Team** - For incredible AI services
- **IBM watsonx Orchestrate Team** - For the powerful orchestration platform
- **client ** - For the opportunity

## Authors

| Name                   | Link                                                              | Role                                           |
| ---------------------- | ---------------------------------------------------------------  | ---------------------------------------------- |
| Sridharan Kaliyamoorthy | [GitHub](https://github.com/sridharankaliyamoorthy)              | Project Lead, AI Automation Engineer & Python Developer |
| Sandra Ashipala        | [GitHub](https://github.com/sandramsc)                           |Technical Project Manager                                |
| Piotr Karmelita        | [GitHub](https://github.com/p-karmelita)                         | Backend & Data                                 |

Sources

⭐ **If RETENX inspired you, please star this repo!** ⭐

## License

[![GitLicense](https://img.shields.io/badge/License-MIT-lime.svg)](https://github.com/sandramsc/RETENX/blob/main/LICENSE)
