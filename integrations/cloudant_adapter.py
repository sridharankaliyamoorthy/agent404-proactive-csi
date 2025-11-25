#!/usr/bin/env python3
"""
Cloudant Data Adapter
Integrates existing Cloudant tables with the ProActive CSI agents
"""

import os
from dotenv import load_dotenv
from ibmcloudant.cloudant_v1 import CloudantV1
from ibm_cloud_sdk_core.authenticators import IAMAuthenticator

class CloudantDataAdapter:
    """
    Adapter to work with existing Cloudant tables created by teammate
    """
    
    def __init__(self):
        """Initialize Cloudant connection"""
        load_dotenv()
        
        cloudant_url = os.getenv('CLOUDANT_URL')
        cloudant_apikey = os.getenv('CLOUDANT_APIKEY')
        
        if not cloudant_url or not cloudant_apikey:
            raise ValueError("Cloudant credentials not found in .env file")
        
        authenticator = IAMAuthenticator(cloudant_apikey)
        self.cloudant = CloudantV1(authenticator=authenticator)
        self.cloudant.set_service_url(cloudant_url)
        
        print("✅ Cloudant Data Adapter initialized")
    
    # ===== Customer Table Methods =====
    
    def get_all_customers(self, limit=1000):
        """
        Get all customers from customer_table
        Returns list of customer documents
        """
        try:
            result = self.cloudant.post_all_docs(
                db='customer_table',
                include_docs=True,
                limit=limit
            ).get_result()
            
            customers = []
            for row in result.get('rows', []):
                doc = row.get('doc', {})
                # Filter out design documents
                if not doc.get('_id', '').startswith('_design'):
                    customers.append(doc)
            
            print(f"📊 Retrieved {len(customers)} customers from Cloudant")
            return customers
            
        except Exception as e:
            print(f"⚠️ Error retrieving customers: {e}")
            return []
    
    def get_customer_by_id(self, customer_id):
        """Get specific customer by ID"""
        try:
            doc = self.cloudant.get_document(
                db='customer_table',
                doc_id=customer_id
            ).get_result()
            return doc
        except Exception as e:
            print(f"⚠️ Error retrieving customer {customer_id}: {e}")
            return None
    
    def get_high_risk_customers(self, churn_threshold=0.5, limit=100):
        """
        Get high-risk customers based on churn score
        """
        try:
            # Use Cloudant Query to find high churn customers
            selector = {
                'churn_score': {'$gte': churn_threshold}
            }
            
            result = self.cloudant.post_find(
                db='customer_table',
                selector=selector,
                limit=limit,
                sort=[{'churn_score': 'desc'}]
            ).get_result()
            
            customers = result.get('docs', [])
            print(f"🚨 Found {len(customers)} high-risk customers (churn >= {churn_threshold})")
            return customers
            
        except Exception as e:
            print(f"⚠️ Error finding high-risk customers: {e}")
            return []
    
    # ===== Procurement Table Methods =====
    
    def get_all_vendors(self, limit=1000):
        """
        Get all vendors from procurement_table
        """
        try:
            result = self.cloudant.post_all_docs(
                db='procurement_table',
                include_docs=True,
                limit=limit
            ).get_result()
            
            vendors = []
            for row in result.get('rows', []):
                doc = row.get('doc', {})
                if not doc.get('_id', '').startswith('_design'):
                    vendors.append(doc)
            
            print(f"📦 Retrieved {len(vendors)} vendors from Cloudant")
            return vendors
            
        except Exception as e:
            print(f"⚠️ Error retrieving vendors: {e}")
            return []
    
    def get_delayed_vendors(self, delay_threshold=1, limit=100):
        """
        Get vendors with delivery delays
        """
        try:
            selector = {
                'delay_days': {'$gte': delay_threshold}
            }
            
            result = self.cloudant.post_find(
                db='procurement_table',
                selector=selector,
                limit=limit,
                sort=[{'delay_days': 'desc'}]
            ).get_result()
            
            vendors = result.get('docs', [])
            print(f"⚠️  Found {len(vendors)} delayed vendors (delay >= {delay_threshold} days)")
            return vendors
            
        except Exception as e:
            print(f"⚠️ Error finding delayed vendors: {e}")
            return []
    
    def get_vendor_by_id(self, vendor_id):
        """Get specific vendor by ID"""
        try:
            doc = self.cloudant.get_document(
                db='procurement_table',
                doc_id=vendor_id
            ).get_result()
            return doc
        except Exception as e:
            print(f"⚠️ Error retrieving vendor {vendor_id}: {e}")
            return None
    
    # ===== Revenue Table Methods =====
    
    def get_all_revenue_records(self, limit=1000):
        """
        Get all revenue records from revenue_table
        """
        try:
            result = self.cloudant.post_all_docs(
                db='revenue_table',
                include_docs=True,
                limit=limit
            ).get_result()
            
            records = []
            for row in result.get('rows', []):
                doc = row.get('doc', {})
                if not doc.get('_id', '').startswith('_design'):
                    records.append(doc)
            
            print(f"💰 Retrieved {len(records)} revenue records from Cloudant")
            return records
            
        except Exception as e:
            print(f"⚠️ Error retrieving revenue records: {e}")
            return []
    
    def get_high_risk_revenue(self, risk_threshold=10000, limit=100):
        """
        Get high-risk revenue records (high ARR at risk)
        """
        try:
            selector = {
                'arr_at_risk': {'$gte': risk_threshold}
            }
            
            result = self.cloudant.post_find(
                db='revenue_table',
                selector=selector,
                limit=limit,
                sort=[{'arr_at_risk': 'desc'}]
            ).get_result()
            
            records = result.get('docs', [])
            print(f"💸 Found {len(records)} high-risk revenue records (ARR at risk >= ${risk_threshold:,})")
            return records
            
        except Exception as e:
            print(f"⚠️ Error finding high-risk revenue: {e}")
            return []
    
    def get_revenue_by_customer(self, customer_id):
        """Get revenue record for specific customer"""
        try:
            # Find by customer_id field
            selector = {
                'customer_id': customer_id
            }
            
            result = self.cloudant.post_find(
                db='revenue_table',
                selector=selector,
                limit=1
            ).get_result()
            
            docs = result.get('docs', [])
            return docs[0] if docs else None
            
        except Exception as e:
            print(f"⚠️ Error retrieving revenue for {customer_id}: {e}")
            return None
    
    # ===== Summary and Analytics =====
    
    def get_summary_statistics(self):
        """
        Get summary statistics across all tables
        """
        try:
            customers = self.get_all_customers()
            vendors = self.get_all_vendors()
            revenue_records = self.get_all_revenue_records()
            
            # Calculate statistics
            high_risk_customers = [c for c in customers if c.get('churn_score', 0) >= 0.7]
            delayed_vendors = [v for v in vendors if v.get('delay_days', 0) > 0]
            
            total_arr = sum(r.get('arr', 0) for r in revenue_records)
            total_arr_at_risk = sum(r.get('arr_at_risk', 0) for r in revenue_records)
            
            summary = {
                'total_customers': len(customers),
                'high_risk_customers': len(high_risk_customers),
                'total_vendors': len(vendors),
                'delayed_vendors': len(delayed_vendors),
                'total_revenue_records': len(revenue_records),
                'total_arr': total_arr,
                'total_arr_at_risk': total_arr_at_risk,
                'portfolio_risk_pct': (total_arr_at_risk / total_arr * 100) if total_arr > 0 else 0
            }
            
            return summary
            
        except Exception as e:
            print(f"⚠️ Error calculating summary: {e}")
            return {}
    
    def print_summary(self):
        """Print a formatted summary of Cloudant data"""
        summary = self.get_summary_statistics()
        
        print("\n" + "="*80)
        print("📊 CLOUDANT DATA SUMMARY")
        print("="*80)
        print(f"👥 Customers: {summary.get('total_customers', 0):,}")
        print(f"   🚨 High Risk: {summary.get('high_risk_customers', 0):,}")
        print(f"\n📦 Vendors: {summary.get('total_vendors', 0):,}")
        print(f"   ⚠️  Delayed: {summary.get('delayed_vendors', 0):,}")
        print(f"\n💰 Revenue:")
        print(f"   Total ARR: ${summary.get('total_arr', 0):,.0f}")
        print(f"   ARR at Risk: ${summary.get('total_arr_at_risk', 0):,.0f}")
        print(f"   Portfolio Risk: {summary.get('portfolio_risk_pct', 0):.1f}%")
        print("="*80 + "\n")


# Singleton instance
_cloudant_adapter = None

def get_cloudant_adapter():
    """Get singleton instance of Cloudant Data Adapter"""
    global _cloudant_adapter
    if _cloudant_adapter is None:
        _cloudant_adapter = CloudantDataAdapter()
    return _cloudant_adapter


if __name__ == "__main__":
    # Test the adapter
    print("\n🧪 Testing Cloudant Data Adapter\n")
    
    adapter = get_cloudant_adapter()
    
    # Print summary
    adapter.print_summary()
    
    # Test high-risk customers
    print("\n🚨 Top 5 High-Risk Customers:")
    high_risk = adapter.get_high_risk_customers(churn_threshold=0.7, limit=5)
    for i, customer in enumerate(high_risk, 1):
        print(f"{i}. {customer.get('customer_name', 'Unknown')} - "
              f"Churn Score: {customer.get('churn_score', 0):.2f}, "
              f"ARR: ${customer.get('arr', 0):,}")
    
    # Test delayed vendors
    print("\n⚠️  Top 5 Delayed Vendors:")
    delayed = adapter.get_delayed_vendors(delay_threshold=5, limit=5)
    for i, vendor in enumerate(delayed, 1):
        impact_severity = vendor.get('impact_severity', 0)
        # Convert to float if it's a string
        if isinstance(impact_severity, str):
            try:
                impact_severity = float(impact_severity)
            except:
                impact_severity = 0
        print(f"{i}. {vendor.get('vendor_name', 'Unknown')} - "
              f"Delay: {vendor.get('delay_days', 0)} days, "
              f"Impact Severity: {impact_severity:.2f}")
    
    # Test high-risk revenue
    print("\n💸 Top 5 High-Risk Revenue:")
    high_risk_rev = adapter.get_high_risk_revenue(risk_threshold=50000, limit=5)
    for i, record in enumerate(high_risk_rev, 1):
        print(f"{i}. {record.get('customer_id', 'Unknown')} - "
              f"ARR: ${record.get('arr', 0):,}, "
              f"At Risk: ${record.get('arr_at_risk', 0):,.0f}, "
              f"Churn Prob: {record.get('probability_of_churn', 0):.1%}")
    
    print("\n✅ Cloudant Data Adapter test complete!\n")

