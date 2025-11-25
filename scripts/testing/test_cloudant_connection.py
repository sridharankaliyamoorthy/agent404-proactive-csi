#!/usr/bin/env python3
"""
Test Cloudant Database Connection
Verifies that the Cloudant credentials are working properly
"""

import os
import sys
from dotenv import load_dotenv
from ibmcloudant.cloudant_v1 import CloudantV1
from ibm_cloud_sdk_core.authenticators import IAMAuthenticator

def test_cloudant_connection():
    """Test Cloudant database connection"""
    
    print("\n🔍 Testing Cloudant Connection\n")
    print("="*60)
    
    # Load environment variables
    load_dotenv()
    
    # Get credentials
    cloudant_url = os.getenv('CLOUDANT_URL')
    cloudant_apikey = os.getenv('CLOUDANT_APIKEY')
    
    print(f"📋 Cloudant URL: {cloudant_url}")
    print(f"🔑 API Key: {'*' * 10}{cloudant_apikey[-4:] if cloudant_apikey else 'NOT FOUND'}")
    
    if not cloudant_url or not cloudant_apikey:
        print("\n❌ ERROR: Cloudant credentials not found in .env file")
        print("\nPlease ensure your .env file contains:")
        print("  CLOUDANT_URL=your_cloudant_url")
        print("  CLOUDANT_APIKEY=your_cloudant_api_key")
        return False
    
    try:
        # Initialize Cloudant client
        print("\n🔌 Connecting to Cloudant...")
        authenticator = IAMAuthenticator(cloudant_apikey)
        cloudant = CloudantV1(authenticator=authenticator)
        cloudant.set_service_url(cloudant_url)
        
        # Test connection by getting server info
        print("🔍 Testing connection...")
        server_info = cloudant.get_server_information().get_result()
        
        print("\n✅ CONNECTION SUCCESSFUL!")
        print(f"   Version: {server_info.get('version', 'unknown')}")
        print(f"   Vendor: {server_info.get('vendor', {}).get('name', 'unknown')}")
        
        # List databases
        print("\n📚 Listing databases...")
        all_dbs = cloudant.get_all_dbs().get_result()
        print(f"   Found {len(all_dbs)} databases")
        
        # Check for proactive_csi database
        database_name = 'proactive_csi'
        if database_name in all_dbs:
            print(f"\n✅ Database '{database_name}' exists")
            
            # Get database info
            db_info = cloudant.get_database_information(db=database_name).get_result()
            print(f"   Documents: {db_info.get('doc_count', 0)}")
            print(f"   Size: {db_info.get('sizes', {}).get('file', 0):,} bytes")
            print(f"   Disk Size: {db_info.get('sizes', {}).get('active', 0):,} bytes")
        else:
            print(f"\n⚠️  Database '{database_name}' not found")
            print(f"   Available databases: {', '.join(all_dbs[:5])}")
            
            # Create database
            try:
                print(f"\n📋 Creating database '{database_name}'...")
                cloudant.put_database(db=database_name).get_result()
                print(f"✅ Database '{database_name}' created successfully!")
            except Exception as e:
                print(f"⚠️  Could not create database: {e}")
        
        print("\n" + "="*60)
        print("✅ Cloudant is configured and ready to use!")
        print("="*60 + "\n")
        
        return True
        
    except Exception as e:
        print(f"\n❌ CONNECTION FAILED!")
        print(f"   Error: {str(e)}")
        print("\nPossible issues:")
        print("  1. Check if the CLOUDANT_URL is correct")
        print("  2. Check if the CLOUDANT_APIKEY is valid")
        print("  3. Ensure you have network access to Cloudant")
        print("  4. Verify the API key has proper permissions")
        return False

if __name__ == "__main__":
    success = test_cloudant_connection()
    sys.exit(0 if success else 1)

