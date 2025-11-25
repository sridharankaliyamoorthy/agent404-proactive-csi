# GitHub Support Request - Purge Sensitive Data

**Submit this at:** https://support.github.com/request

---

**Subject:** Urgent: Purge Orphaned Commits Containing Exposed API Keys

**Category:** Security → Remove sensitive data from repository

**Repository URLs:**
- https://github.com/sridharankaliyamoorthy/agent404-proactive-csi
- https://github.com/sridharankaliyamoorthy/Agentic_AI_test

---

**Message:**

Hello GitHub Support,

I need to permanently purge orphaned commits containing exposed IBM Cloud API keys from GitHub's cache.

**Repository 1: agent404-proactive-csi**

Orphaned commits to purge:
```
19c3093cdfc261ae696468c1b1183392830a9f84
f41c28f25431bc1db86302ae4e3989b1ee42e815
4afdf40fdd11d5a0885aac0f44ce71a55978f335
```

Direct URLs currently accessible:
- https://github.com/sridharankaliyamoorthy/agent404-proactive-csi/blob/19c3093cdfc261ae696468c1b1183392830a9f84/IBM_PORTAL_DEPLOYMENT.md
- https://github.com/sridharankaliyamoorthy/agent404-proactive-csi/blob/f41c28f25431bc1db86302ae4e3989b1ee42e815/integrations/ibm_services.py
- https://github.com/sridharankaliyamoorthy/agent404-proactive-csi/blob/4afdf40fdd11d5a0885aac0f44ce71a55978f335/scripts/deployment/quick_deploy.sh

**Repository 2: Agentic_AI_test**

Orphaned commit to purge:
```
b618c7e7135279aa32addc86205f36191207c249
```

Direct URL currently accessible:
- https://github.com/sridharankaliyamoorthy/Agentic_AI_test/blob/b618c7e7135279aa32addc86205f36191207c249/.env

---

**Remediation steps already completed:**

✅ History rewritten using git-filter-repo
✅ Sensitive files removed from all active branches
✅ Force-pushed cleaned history to origin
✅ All tags deleted and recreated
✅ Local reflog expired and garbage collection completed
✅ Commits are now orphaned (not part of any branch)
✅ Exposed API keys already rotated by IBM Security

**Current status:**
- Commits are orphaned but still cached on GitHub servers
- Security scan (gitleaks) shows 0 active leaks
- New repository clones do not include these commits

**Request:**
Please run server-side garbage collection to permanently remove these orphaned commits from GitHub's object database, making the direct URLs return 404.

**Urgency:**
IBM Security has suspended our cloud account due to these exposures. Keys are already disabled, but we need complete removal for compliance.

**Timeline:**
This is blocking our hackathon project submission deadline. Please expedite if possible.

Thank you for your assistance.

Best regards,
[Your Name]
[Your Email]

---

**Expected Response Time:** 24-48 hours
**Result:** Links will return 404 "Not Found"
