# 🔗 Cloudant Integration Guide

## Overview

Your teammate has set up Cloudant database for data storage. The credentials have been integrated into the project.

## ✅ What's Been Set Up

1. **Environment Variables** - Cloudant credentials added to `.env` file:
   - `CLOUDANT_URL`: Your Cloudant instance URL
   - `CLOUDANT_APIKEY`: IAM API key for authentication
   - `CLOUDANT_DATABASE`: Database name (default: `proactive_csi`)

2. **Test Scripts** - Two new scripts created:
   - `test_cloudant_connection.py`: Verify connection
   - `upload_data_to_cloudant.py`: Upload CSV data to Cloudant

3. **Integration** - The `ibm_services.py` already has full Cloudant support built-in

## 🚀 Quick Start

### Step 1: Test the Connection

```bash
cd /Users/ishwaryasridharan/Desktop/Hackathon_2025/agent404-proactive-csi-2.0
python3 scripts/testing/test_cloudant_connection.py
```

This will:
- ✅ Verify credentials are working
- ✅ Connect to Cloudant
- ✅ Check/create the `proactive_csi` database
- ✅ Display database information

### Step 2: Upload Data (Optional)

If you want to upload your CSV data to Cloudant:

```bash
python3 scripts/testing/upload_data_to_cloudant.py
```

This will upload all CSV files from the `data/` directory:
- `customer_success_data.csv` → customers
- `procurement_vendor_data.csv` → vendors
- `contracts.csv` → contracts
- `support_tickets.csv` → support_tickets
- `customer_comms.csv` → customer_comms
- `revenue_exposure_data.csv` → revenue

### Step 3: Verify Integration

Run the app and test Cloudant features:

```bash
streamlit run app.py
```

## 📋 Cloudant Features Available

The `IBMServicesManager` class in `integrations/ibm_services.py` provides:

### Data Storage
```python
from integrations.ibm_services import get_ibm_services

services = get_ibm_services()

# Store customer health record
services.store_customer_health_record(
    customer_id="CUST001",
    health_data={"risk_level": "HIGH", "churn_probability": 0.75}
)

# Store intervention record
services.store_intervention_record({
    "customer_id": "CUST001",
    "intervention_type": "Executive Engagement",
    "status": "Scheduled"
})
```

### Data Retrieval
```python
# Query customer history
history = services.query_customer_history("CUST001")

# Get all customers
customers = services.get_all_customers()

# Get all vendors
vendors = services.get_all_vendors()

# Get analytics dashboard data
analytics = services.get_analytics_dashboard_data()
```

### Audio Storage (TTS)
```python
# Generate speech and upload to Cloudant
result = services.synthesize_speech(
    text="Hello, this is a test",
    upload_to_cloudant=True
)

# Returns download URL
download_url = result['cloudant_url']
```

## 🔧 Configuration

### Environment Variables

Your `.env` file is already configured with:

```env
CLOUDANT_URL=https://<REDACTED_CLOUDANT_ACCOUNT>.cloudantnosqldb.appdomain.cloud
CLOUDANT_APIKEY=<REDACTED_CLOUDANT_API_KEY>
CLOUDANT_DATABASE=proactive_csi
```

### Database Schema

The `proactive_csi` database stores documents with types:
- `customers` - Customer records
- `vendors` - Vendor records
- `contracts` - Contract records
- `support_tickets` - Support ticket records
- `customer_comms` - Customer communication records
- `revenue` - Revenue exposure records
- `customer_health` - Customer health snapshots
- `intervention` - Intervention records
- `tts_audio` - Text-to-speech audio files

## 🧪 Testing

### Test Connection Only
```bash
python3 scripts/testing/test_cloudant_connection.py
```

Expected output:
```
🔍 Testing Cloudant Connection
============================================================
📋 Cloudant URL: https://76b733f5...
🔑 API Key: **********8SaD
🔌 Connecting to Cloudant...
✅ CONNECTION SUCCESSFUL!
```

### Test Data Upload
```bash
python3 scripts/testing/upload_data_to_cloudant.py
```

Expected output:
```
📤 Uploading Data to Cloudant
============================================================
📄 Processing: customer_success_data.csv
   Found 50 records
   ✅ Uploaded batch 1: 50 records
...
✅ Upload Complete!
```

## 🔍 Troubleshooting

### Connection Issues

If connection fails:

1. **Check credentials**:
   ```bash
   cat .env | grep CLOUDANT
   ```

2. **Verify URL format**:
   - Should start with `https://`
   - Should end with `.cloudantnosqldb.appdomain.cloud`

3. **Test API key**:
   - Make sure there are no extra spaces
   - API key should be 43 characters long

### Database Issues

If database operations fail:

1. **Check database exists**:
   - Run test connection script
   - It will auto-create the database if missing

2. **Check permissions**:
   - API key should have Manager role
   - Verify in IBM Cloud console

### Upload Issues

If data upload fails:

1. **Check CSV files**:
   ```bash
   ls -la data/*.csv
   ```

2. **Check file permissions**:
   ```bash
   chmod 644 data/*.csv
   ```

## 📚 Additional Resources

- [IBM Cloudant Documentation](https://cloud.ibm.com/docs/Cloudant)
- [Python SDK Documentation](https://github.com/IBM/cloudant-python-sdk)
- Project Documentation: `docs/features/CLOUDANT_FIX.md`

## 🤝 Team Coordination

Your teammate's Cloudant setup is now integrated! The credentials are:
- ✅ Stored in `.env` (ignored by git for security)
- ✅ Referenced in `.env.example` for team members
- ✅ Used by `ibm_services.py` automatically
- ✅ Ready for production use

## 🎯 Next Steps

1. **Test the connection**: Run the test script
2. **Upload data** (optional): Run the upload script
3. **Deploy**: Your app will automatically use Cloudant
4. **Monitor**: Check Cloudant dashboard in IBM Cloud

## 📝 Notes

- The `.env` file is in `.gitignore` for security
- Share credentials securely with team members (not via git)
- Use `.env.example` as a template for new team members
- Cloudant operations are optional - CSV fallback is available

---

**Status**: ✅ Cloudant integration complete and ready to use!

