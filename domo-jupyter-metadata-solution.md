# Domo Jupyter Notebook Solution - Automated Metadata Extraction

**Date:** November 4, 2025  
**Solution:** Use Domo's Python/Jupyter support to extract dashboard metadata and push to WordPress  
**Benefits:** Automated, no Domo product changes required, uses existing Domo capabilities

## Overview

Domo supports Python via Jupyter notebooks, which means we can:
1. **Connect to Domo API** to extract dashboard metadata
2. **Process dashboard information** (titles, metrics, charts, data)
3. **Format as structured data** (JSON-LD)
4. **Push to WordPress** via REST API

This provides **automated metadata extraction** without requiring Domo to build new API endpoints!

## Architecture

```
┌─────────────┐
│ Domo API    │
│ (Existing)  │
└──────┬──────┘
       │
       │ Python/Jupyter
       │ Notebook
       ▼
┌─────────────┐
│ Extract     │
│ Metadata    │
└──────┬──────┘
       │
       │ Format as
       │ JSON-LD
       ▼
┌─────────────┐
│ WordPress   │
│ REST API    │
└─────────────┘
```

## Implementation Steps

### Step 1: Domo API Access

Domo provides Python SDK for accessing dashboard data:

```python
import domo
from domo import Domo

# Authenticate with Domo
domo_instance = Domo(
    'your-client-id',
    'your-client-secret',
    api_host='api.domo.com'
)
```

### Step 2: Extract Dashboard Metadata

Use Domo API to get dashboard information:

```python
# Get dashboard details
dashboard_id = 'rm0yK'
dashboard = domo_instance.dashboard.get(dashboard_id)

# Extract metadata
dashboard_title = dashboard.title
dashboard_description = dashboard.description
# ... extract other metadata
```

### Step 3: Format as Structured Data

Convert to JSON-LD format for SEO/AI crawlability:

```python
structured_data = {
    "@context": "https://schema.org",
    "@type": "DataVisualization",
    "name": dashboard_title,
    "description": dashboard_description,
    "metric": [
        # Extract metrics from dashboard
    ]
}
```

### Step 4: Push to WordPress

Use WordPress REST API to update page metadata:

```python
import requests

wordpress_url = 'https://your-wordpress-site.com/wp-json/wp/v2/pages/{page_id}'
headers = {
    'Authorization': 'Bearer YOUR_TOKEN',
    'Content-Type': 'application/json'
}

# Update page with structured data
response = requests.post(
    wordpress_url,
    headers=headers,
    json={'meta': {'structured_data': structured_data}}
)
```

## Sample Jupyter Notebook

See `domo-metadata-extractor.ipynb` for complete implementation.

## Benefits

✅ **Automated** - Runs on schedule, no manual work  
✅ **Uses Existing APIs** - No Domo product changes required  
✅ **Accurate** - Pulls directly from Domo dashboards  
✅ **Scalable** - Can process multiple dashboards  
✅ **Maintainable** - Python/Jupyter is standard tooling  

## Requirements

1. **Domo API Access:**
   - Client ID and Client Secret
   - API access enabled
   - Dashboard read permissions

2. **WordPress Access:**
   - REST API enabled
   - Authentication token (Application Password or OAuth)
   - Page update permissions

3. **Infrastructure:**
   - Jupyter notebook environment (Domo provides this)
   - Or run Python script on schedule (cron, AWS Lambda, etc.)

## Next Steps

1. Set up Domo API credentials
2. Create Jupyter notebook with extraction logic
3. Set up WordPress REST API authentication
4. Test with single dashboard
5. Schedule to run automatically (daily/weekly)

---

**This solution leverages Domo's existing Python/Jupyter capabilities to automate metadata extraction!**

