#!/bin/bash
# Quick Test Script for Cloudant Integration
# Run this to verify everything is working

echo "🧪 Testing Cloudant Integration"
echo "================================"
echo ""

cd "$(dirname "$0")/../.."

echo "1️⃣ Testing connection..."
python3 scripts/testing/test_cloudant_connection.py

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Connection test passed!"
    echo ""
    echo "2️⃣ Testing data adapter..."
    python3 integrations/cloudant_adapter.py
    
    if [ $? -eq 0 ]; then
        echo ""
        echo "================================"
        echo "✅ ALL TESTS PASSED!"
        echo "================================"
        echo ""
        echo "🎉 Cloudant is fully integrated and working!"
        echo ""
        echo "Next steps:"
        echo "  • Run your app: streamlit run app.py"
        echo "  • Update agents to use Cloudant data"
        echo "  • Deploy to production"
        echo ""
    else
        echo ""
        echo "⚠️  Data adapter test failed"
        echo "Check the error messages above"
    fi
else
    echo ""
    echo "❌ Connection test failed!"
    echo "Check your .env file and credentials"
fi

