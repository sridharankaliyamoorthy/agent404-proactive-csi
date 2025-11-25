# 🎬 Demo Test Queries - Showcasing All 6 IBM Services

## 🎯 Demo Overview

This guide provides test queries specifically designed to showcase all 6 IBM watsonx services integrated in ProActive CSI Agent 404:

1. **watsonx.ai** - AI/ML predictions and reasoning
2. **watsonx Orchestrate** - Multi-agent coordination
3. **Natural Language Understanding (NLU)** - Sentiment analysis
4. **Speech-to-Text (STT)** - Voice input processing
5. **Text-to-Speech (TTS)** - Voice output generation
6. **Cloudant** - Data storage and retrieval (1,502 records)

---

## 🚀 Quick Demo Flow (5 Minutes)

### Step 1: Portfolio Overview (Cloudant + watsonx.ai)
**Query:** "Show me my portfolio overview"

**What it demonstrates:**
- ✅ Cloudant: Retrieves 500 customers, 500 vendors, 500 revenue records
- ✅ watsonx.ai: Analyzes data and generates insights
- ✅ watsonx Orchestrate: Coordinates data retrieval and analysis

**Expected Response:**
- $132.3M total ARR
- $67.2M at risk (50.8%)
- 56 high-risk customers
- 491 delayed vendors

---

### Step 2: Churn Prediction (watsonx.ai + NLU)
**Query:** "Who are my top 3 at-risk customers and why?"

**What it demonstrates:**
- ✅ watsonx.ai: Churn prediction (89% accuracy)
- ✅ NLU: Sentiment analysis of customer communications
- ✅ Cloudant: Retrieves customer data with churn scores
- ✅ watsonx Orchestrate: Coordinates Customer Success Agent

**Expected Response:**
- List of top 3 customers with churn scores
- Sentiment analysis from communications
- Risk factors identified
- Intervention recommendations

---

### Step 3: Procurement Impact (Cloudant + watsonx.ai)
**Query:** "What vendor delays are impacting my customers?"

**What it demonstrates:**
- ✅ Cloudant: Retrieves vendor and customer data
- ✅ watsonx.ai: Correlates vendor delays to customer impact
- ✅ watsonx Orchestrate: Coordinates Procurement and CS Agents

**Expected Response:**
- List of delayed vendors
- Affected customers identified
- Impact severity calculated
- Revenue at risk quantified

---

### Step 4: Revenue Protection (watsonx.ai + Cloudant)
**Query:** "Calculate the financial impact of my top risks"

**What it demonstrates:**
- ✅ watsonx.ai: Financial scenario modeling
- ✅ Cloudant: Revenue data retrieval
- ✅ watsonx Orchestrate: Coordinates Revenue Protection Agent

**Expected Response:**
- $67.2M ARR at risk breakdown
- Best/worst/most likely scenarios
- ROI projections
- Action recommendations

---

### Step 5: Executive Briefing (All Services)
**Query:** "Generate an executive action plan"

**What it demonstrates:**
- ✅ watsonx.ai: Generates comprehensive briefing
- ✅ Cloudant: Aggregates all data
- ✅ watsonx Orchestrate: Coordinates all 3 agents
- ✅ TTS: Can generate voice briefing (if voice enabled)

**Expected Response:**
- Executive summary
- Top priorities
- Financial impact
- Recommended actions
- Timeline and owners

---

## 📋 Complete Demo Test Queries

### Category 1: Portfolio & Overview (Cloudant + watsonx.ai)

1. **"Show me my portfolio overview"**
   - Services: Cloudant, watsonx.ai, watsonx Orchestrate
   - Shows: Total ARR, risk metrics, customer/vendor counts

2. **"What's the health of my customer portfolio?"**
   - Services: Cloudant, watsonx.ai
   - Shows: Health scores, risk distribution, trends

3. **"Give me an executive summary"**
   - Services: All services
   - Shows: Comprehensive overview with insights

---

### Category 2: Churn Prediction (watsonx.ai + NLU + Cloudant)

4. **"Who are my top 3 at-risk customers?"**
   - Services: watsonx.ai, Cloudant, watsonx Orchestrate
   - Shows: Churn prediction, risk ranking

5. **"Analyze churn risk for Acme Corporation"**
   - Services: watsonx.ai, NLU, Cloudant
   - Shows: Specific customer analysis with sentiment

6. **"Which customers are likely to churn in the next 30 days?"**
   - Services: watsonx.ai, Cloudant
   - Shows: Time-based churn predictions

7. **"What's causing high churn risk for my customers?"**
   - Services: watsonx.ai, NLU, Cloudant
   - Shows: Root cause analysis with sentiment insights

---

### Category 3: Procurement & Vendor (Cloudant + watsonx.ai)

8. **"What vendor delays are impacting customers?"**
   - Services: Cloudant, watsonx.ai, watsonx Orchestrate
   - Shows: Vendor-customer correlation

9. **"Show me vendor performance metrics"**
   - Services: Cloudant, watsonx.ai
   - Shows: Vendor analytics and trends

10. **"Which customers are affected by vendor delays?"**
    - Services: Cloudant, watsonx.ai
    - Shows: Cross-functional impact analysis

11. **"What procurement risks do I have?"**
    - Services: Cloudant, watsonx.ai
    - Shows: Risk identification and quantification

---

### Category 4: Revenue & Financial (watsonx.ai + Cloudant)

12. **"Calculate the financial impact of top risks"**
    - Services: watsonx.ai, Cloudant, watsonx Orchestrate
    - Shows: Financial modeling and scenarios

13. **"What's my ARR at risk?"**
    - Services: Cloudant, watsonx.ai
    - Shows: Revenue exposure ($67.2M)

14. **"Generate a revenue protection strategy"**
    - Services: watsonx.ai, Cloudant
    - Shows: Strategic recommendations

15. **"What's the ROI of protecting my at-risk customers?"**
    - Services: watsonx.ai, Cloudant
    - Shows: ROI calculations and projections

---

### Category 5: Multi-Agent Coordination (watsonx Orchestrate)

16. **"Analyze how procurement delays are affecting customer satisfaction"**
    - Services: watsonx Orchestrate, watsonx.ai, Cloudant, NLU
    - Shows: Cross-agent coordination

17. **"Show me a complete risk view combining customer, procurement, and revenue risks"**
    - Services: watsonx Orchestrate, all agents
    - Shows: Unified risk dashboard

18. **"What actions should Customer Success, Procurement, and Finance teams take?"**
    - Services: watsonx Orchestrate, all agents
    - Shows: Coordinated action plan

---

### Category 6: Voice Operations (STT + TTS)

19. **"Good morning, what's my priority today?"** (Voice-friendly)
    - Services: STT, watsonx.ai, watsonx Orchestrate, TTS
    - Shows: Voice-first operations

20. **"Tell me about Acme Corporation"** (Voice-friendly)
    - Services: STT, watsonx.ai, NLU, Cloudant, TTS
    - Shows: Voice-based customer inquiry

21. **"Read me the executive briefing"** (Voice-friendly)
    - Services: STT, watsonx.ai, TTS
    - Shows: Voice output generation

---

### Category 7: Sentiment Analysis (NLU)

22. **"What's the sentiment of my customer communications?"**
    - Services: NLU, Cloudant
    - Shows: Sentiment analysis across communications

23. **"Which customers have negative sentiment?"**
    - Services: NLU, Cloudant, watsonx.ai
    - Shows: Sentiment-based risk identification

24. **"Analyze the sentiment of support tickets"**
    - Services: NLU, Cloudant
    - Shows: Ticket sentiment analysis

---

### Category 8: Data Analytics (Cloudant)

25. **"How many customers do I have?"**
    - Services: Cloudant
    - Shows: Data retrieval (500 customers)

26. **"What's the total value of my portfolio?"**
    - Services: Cloudant
    - Shows: Data aggregation ($132.3M ARR)

27. **"Show me the distribution of risk levels"**
    - Services: Cloudant, watsonx.ai
    - Shows: Data analysis and visualization

---

## 🎯 Recommended Demo Sequence (10 Minutes)

### Opening (2 min)
1. "Show me my portfolio overview"
   - Establishes scale: $132.3M ARR, 500 customers

### Problem Identification (3 min)
2. "Who are my top 3 at-risk customers?"
   - Shows churn prediction capability
3. "What vendor delays are impacting customers?"
   - Shows procurement-customer correlation

### Solution Demonstration (4 min)
4. "Calculate the financial impact of top risks"
   - Shows revenue protection
5. "Generate an executive action plan"
   - Shows multi-agent coordination

### Closing (1 min)
6. "What's my ARR at risk?"
   - Reinforces value: $67.2M at risk

---

## 🎤 Voice Demo Queries (If Voice Enabled)

### Voice Input Examples

1. **"Good morning, what's my priority today?"**
   - STT processes → Agent responds → TTS outputs

2. **"Tell me about my top at-risk customer"**
   - STT → Analysis → TTS response

3. **"Read me the executive briefing"**
   - STT → Generate briefing → TTS reads it

---

## 📊 Service Coverage Matrix

| Query Category | watsonx.ai | Orchestrate | NLU | STT | TTS | Cloudant |
|---------------|------------|-------------|-----|-----|-----|----------|
| Portfolio Overview | ✅ | ✅ | | | | ✅ |
| Churn Prediction | ✅ | ✅ | ✅ | | | ✅ |
| Procurement | ✅ | ✅ | | | | ✅ |
| Revenue | ✅ | ✅ | | | | ✅ |
| Multi-Agent | ✅ | ✅ | ✅ | | | ✅ |
| Voice Operations | ✅ | ✅ | | ✅ | ✅ | |
| Sentiment | | | ✅ | | | ✅ |
| Data Analytics | ✅ | | | | | ✅ |

---

## 💡 Demo Tips

### For Judges
1. **Start with portfolio overview** - Shows scale immediately
2. **Show multi-agent coordination** - Unique differentiator
3. **Demonstrate real-time analysis** - Live data from Cloudant
4. **Highlight voice capabilities** - If available
5. **End with executive briefing** - Shows complete solution

### For Audience
1. **Use natural language** - Agent understands conversational queries
2. **Ask follow-up questions** - Shows context awareness
3. **Request specific data** - Demonstrates data access
4. **Ask for recommendations** - Shows AI reasoning

---

## 🎬 Sample Demo Script

**Opening:**
"Let me show you how ProActive CSI Agent 404 works. First, let's see the overall portfolio."

**Query 1:** "Show me my portfolio overview"
*[Wait for response showing $132.3M ARR, 56 high-risk customers]*

**Transition:**
"Now let's identify the highest risk customers using AI churn prediction."

**Query 2:** "Who are my top 3 at-risk customers?"
*[Wait for response with churn scores and reasons]*

**Transition:**
"Let's see how procurement issues affect customers - this is unique to our solution."

**Query 3:** "What vendor delays are impacting customers?"
*[Wait for response showing vendor-customer correlation]*

**Transition:**
"Now let's calculate the financial impact."

**Query 4:** "Calculate the financial impact of top risks"
*[Wait for response showing $67.2M at risk]*

**Closing:**
"Finally, let's generate an executive action plan."

**Query 5:** "Generate an executive action plan"
*[Wait for comprehensive briefing]*

**Summary:**
"In 5 queries, we've demonstrated all 6 IBM services working together to protect $67.2M in revenue."

---

## ✅ Quick Reference

**Top 5 Demo Queries:**
1. "Show me my portfolio overview"
2. "Who are my top 3 at-risk customers?"
3. "What vendor delays are impacting customers?"
4. "Calculate the financial impact of top risks"
5. "Generate an executive action plan"

**Voice Demo Queries:**
1. "Good morning, what's my priority today?"
2. "Tell me about Acme Corporation"
3. "Read me the executive briefing"

---

**Ready for Demo!** 🚀

All queries are designed to showcase the full power of the 6 IBM watsonx services integrated in ProActive CSI Agent 404.

