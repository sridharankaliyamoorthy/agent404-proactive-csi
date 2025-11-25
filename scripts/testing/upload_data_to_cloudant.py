#!/usr/bin/env python3
"""
Upload CSV Data to Cloudant Database
Uploads all CSV files from the data/ directory to Cloudant
"""

import os
import sys
import pandas as pd
from datetime import datetime
from dotenv import load_dotenv
from ibmcloudant.cloudant_v1 import CloudantV1
from ibm_cloud_sdk_core.authenticators import IAMAuthenticator

def upload_data_to_cloudant():
    """Upload all CSV data to Cloudant"""
    
    print("\n📤 Uploading Data to Cloudant\n")
    print("="*60)
    
    # Load environment variables
    load_dotenv()
    
    # Get credentials
    cloudant_url = os.getenv('CLOUDANT_URL')
    cloudant_apikey = os.getenv('CLOUDANT_APIKEY')
    database_name = os.getenv('CLOUDANT_DATABASE', 'proactive_csi')
    
    if not cloudant_url or not cloudant_apikey:
        print("❌ ERROR: Cloudant credentials not found in .env file")
        return False
    
    try:
        # Initialize Cloudant client
        print("🔌 Connecting to Cloudant...")
        authenticator = IAMAuthenticator(cloudant_apikey)
        cloudant = CloudantV1(authenticator=authenticator)
        cloudant.set_service_url(cloudant_url)
        
        # Ensure database exists
        all_dbs = cloudant.get_all_dbs().get_result()
        if database_name not in all_dbs:
            print(f"📋 Creating database '{database_name}'...")
            cloudant.put_database(db=database_name).get_result()
            print(f"✅ Database created")
        
        # Get project root directory
        project_root = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
        data_dir = os.path.join(project_root, 'data')
        
        print(f"\n📁 Data directory: {data_dir}")
        
        # CSV files to upload
        csv_files = {
            'customer_success_data.csv': 'customers',
            'procurement_vendor_data.csv': 'vendors',
            'contracts.csv': 'contracts',
            'support_tickets.csv': 'support_tickets',
            'customer_comms.csv': 'customer_comms',
            'revenue_exposure_data.csv': 'revenue'
        }
        
        total_uploaded = 0
        
        for csv_file, doc_type in csv_files.items():
            file_path = os.path.join(data_dir, csv_file)
            
            if not os.path.exists(file_path):
                print(f"\n⚠️  File not found: {csv_file}")
                continue
            
            print(f"\n📄 Processing: {csv_file}")
            
            # Read CSV
            df = pd.read_csv(file_path)
            print(f"   Found {len(df)} records")
            
            # Convert to documents
            documents = []
            for _, row in df.iterrows():
                doc = row.to_dict()
                doc['type'] = doc_type
                doc['uploaded_at'] = datetime.now().isoformat()
                
                # Generate unique ID
                if 'customer_id' in doc:
                    doc['_id'] = f"{doc_type}_{doc['customer_id']}_{len(documents)}"
                elif 'vendor_id' in doc:
                    doc['_id'] = f"{doc_type}_{doc['vendor_id']}_{len(documents)}"
                elif 'contract_id' in doc:
                    doc['_id'] = f"{doc_type}_{doc['contract_id']}"
                elif 'ticket_id' in doc:
                    doc['_id'] = f"{doc_type}_{doc['ticket_id']}"
                else:
                    doc['_id'] = f"{doc_type}_{len(documents)}"
                
                documents.append(doc)
            
            # Upload in batches
            batch_size = 100
            for i in range(0, len(documents), batch_size):
                batch = documents[i:i+batch_size]
                
                try:
                    result = cloudant.post_bulk_docs(
                        db=database_name,
                        bulk_docs={'docs': batch}
                    ).get_result()
                    
                    uploaded_count = len([r for r in result if r.get('ok')])
                    total_uploaded += uploaded_count
                    print(f"   ✅ Uploaded batch {i//batch_size + 1}: {uploaded_count} records")
                    
                except Exception as e:
                    print(f"   ⚠️  Batch upload error: {e}")
        
        # Get database info
        db_info = cloudant.get_database_information(db=database_name).get_result()
        
        print("\n" + "="*60)
        print(f"✅ Upload Complete!")
        print(f"   Total documents uploaded: {total_uploaded}")
        print(f"   Database documents: {db_info.get('doc_count', 0)}")
        print("="*60 + "\n")
        
        return True
        
    except Exception as e:
        print(f"\n❌ UPLOAD FAILED!")
        print(f"   Error: {str(e)}")
        return False

if __name__ == "__main__":
    success = upload_data_to_cloudant()
    sys.exit(0 if success else 1)

