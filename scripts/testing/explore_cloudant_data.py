#!/usr/bin/env python3
"""
Explore Existing Cloudant Databases
Shows what data is already available in your teammate's Cloudant instance
"""

import os
import sys
from dotenv import load_dotenv
from ibmcloudant.cloudant_v1 import CloudantV1
from ibm_cloud_sdk_core.authenticators import IAMAuthenticator

def explore_cloudant_data():
    """Explore existing Cloudant databases"""
    
    print("\n🔍 Exploring Cloudant Data\n")
    print("="*80)
    
    # Load environment variables
    load_dotenv()
    
    # Get credentials
    cloudant_url = os.getenv('CLOUDANT_URL')
    cloudant_apikey = os.getenv('CLOUDANT_APIKEY')
    
    if not cloudant_url or not cloudant_apikey:
        print("❌ ERROR: Cloudant credentials not found in .env file")
        return False
    
    try:
        # Initialize Cloudant client
        print("🔌 Connecting to Cloudant...")
        authenticator = IAMAuthenticator(cloudant_apikey)
        cloudant = CloudantV1(authenticator=authenticator)
        cloudant.set_service_url(cloudant_url)
        
        # List all databases
        all_dbs = cloudant.get_all_dbs().get_result()
        print(f"\n📚 Found {len(all_dbs)} databases:")
        print("="*80)
        
        for db_name in all_dbs:
            print(f"\n📊 Database: {db_name}")
            print("-"*80)
            
            try:
                # Get database info
                db_info = cloudant.get_database_information(db=db_name).get_result()
                doc_count = db_info.get('doc_count', 0)
                size_bytes = db_info.get('sizes', {}).get('file', 0)
                size_mb = size_bytes / (1024 * 1024) if size_bytes > 0 else 0
                
                print(f"   📄 Documents: {doc_count:,}")
                print(f"   💾 Size: {size_mb:.2f} MB")
                
                # Get sample documents
                if doc_count > 0:
                    try:
                        result = cloudant.post_all_docs(
                            db=db_name,
                            limit=3,
                            include_docs=True
                        ).get_result()
                        
                        docs = result.get('rows', [])
                        
                        if docs:
                            print(f"\n   📝 Sample Documents:")
                            for i, row in enumerate(docs, 1):
                                doc = row.get('doc', {})
                                doc_id = doc.get('_id', 'unknown')
                                
                                # Remove internal fields for cleaner display
                                display_doc = {k: v for k, v in doc.items() if not k.startswith('_')}
                                
                                print(f"\n   Document {i} (ID: {doc_id}):")
                                
                                # Show first few fields
                                field_count = 0
                                for key, value in display_doc.items():
                                    if field_count < 5:  # Limit to 5 fields
                                        if isinstance(value, str) and len(str(value)) > 50:
                                            value = str(value)[:50] + "..."
                                        print(f"      • {key}: {value}")
                                        field_count += 1
                                
                                if len(display_doc) > 5:
                                    print(f"      ... and {len(display_doc) - 5} more fields")
                    
                    except Exception as e:
                        print(f"   ⚠️  Could not retrieve sample documents: {e}")
                
            except Exception as e:
                print(f"   ⚠️  Error accessing database: {e}")
        
        print("\n" + "="*80)
        print("✅ Exploration complete!")
        print("="*80)
        
        # Summary
        print("\n📋 Summary:")
        print(f"   • Total databases: {len(all_dbs)}")
        print(f"   • Your databases: {', '.join(all_dbs)}")
        
        # Recommendations
        print("\n💡 Recommendations:")
        if 'customer_table' in all_dbs:
            print("   ✅ customer_table exists - your teammate has customer data")
        if 'procurement_table' in all_dbs:
            print("   ✅ procurement_table exists - your teammate has procurement data")
        if 'revenue_table' in all_dbs:
            print("   ✅ revenue_table exists - your teammate has revenue data")
        if 'proactive_csi' in all_dbs:
            print("   ✅ proactive_csi exists - main application database is ready")
        else:
            print("   ℹ️  proactive_csi created - ready for agent data storage")
        
        print("\n🎯 Next Steps:")
        print("   1. Review the data structures in existing tables")
        print("   2. Decide if you want to:")
        print("      - Use existing tables directly")
        print("      - Copy data to 'proactive_csi' database")
        print("      - Use both (existing + new)")
        print("   3. Update agents to use Cloudant data")
        
        return True
        
    except Exception as e:
        print(f"\n❌ EXPLORATION FAILED!")
        print(f"   Error: {str(e)}")
        return False

if __name__ == "__main__":
    success = explore_cloudant_data()
    sys.exit(0 if success else 1)

