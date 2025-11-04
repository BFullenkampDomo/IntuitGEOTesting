# Jupyter Notebook Solution - Implementation Guide

**Date:** November 4, 2025  
**Solution:** Use Domo's Jupyter/Python support to automate metadata extraction  
**Status:** ✅ Ready for implementation

## Overview

This solution uses Domo's built-in Jupyter notebook support to:
1. Extract dashboard metadata from Domo API
2. Format as structured data (JSON-LD)
3. Push to WordPress via REST API

**No Domo product changes required** - uses existing Domo Python/Jupyter capabilities!

## Prerequisites

### 1. Domo API Access
- ✅ Client ID and Client Secret
- ✅ API access enabled in Domo account
- ✅ Dashboard read permissions
- ✅ Python SDK access (if available) or direct API calls

### 2. WordPress Access
- ✅ WordPress REST API enabled
- ✅ Application Password created (WordPress → Users → Your Profile → Application Passwords)
- ✅ Page update permissions

### 3. Jupyter Environment
- ✅ Domo Jupyter notebook access
- ✅ Or external Jupyter environment with Domo API access

## Implementation Steps

### Step 1: Set Up Domo API Credentials

1. **Get Domo API Credentials:**
   - Go to Domo → Admin → API
   - Create new Client ID and Client Secret
   - Note the API host (usually `api.domo.com`)

2. **Create `.env` file:**
   ```env
   DOMO_CLIENT_ID=your-client-id
   DOMO_CLIENT_SECRET=your-client-secret
   DOMO_API_HOST=api.domo.com
   ```

### Step 2: Set Up WordPress API Access

1. **Create Application Password:**
   - WordPress → Users → Your Profile
   - Scroll to "Application Passwords"
   - Create new password (e.g., "Domo Metadata Sync")
   - Save the generated password

2. **Add to `.env` file:**
   ```env
   WORDPRESS_URL=https://your-wordpress-site.com
   WORDPRESS_USERNAME=your-username
   WORDPRESS_APP_PASSWORD=your-app-password
   ```

### Step 3: Create Dashboard Mapping

Map Domo dashboard IDs to WordPress page IDs:

```python
DASHBOARD_MAPPING = {
    'rm0yK': 12345,  # Domo dashboard ID -> WordPress page ID
    'JqXZJ': 12346,  # Add more as needed
}
```

### Step 4: Install Required Packages

In Domo Jupyter notebook or Python environment:

```bash
pip install requests python-dotenv
```

Or if using Domo Python SDK:
```bash
pip install pydomo requests python-dotenv
```

### Step 5: Run the Notebook

1. **Open Jupyter notebook** (`domo-metadata-extractor.ipynb`)
2. **Run cells in order**
3. **Verify results** in WordPress

### Step 6: Schedule Automation

**Option A: Domo Jupyter Scheduling**
- Use Domo's built-in scheduling for Jupyter notebooks
- Set to run daily/weekly

**Option B: External Scheduling**
- Export notebook as Python script
- Run via cron, AWS Lambda, or other scheduler
- Example cron: `0 2 * * * /usr/bin/python3 /path/to/domo-metadata-extractor.py`

## Domo API Endpoints Used

### Get Dashboard Info
```
GET https://api.domo.com/v1/pages/{dashboard_id}
Authorization: bearer {access_token}
```

### Get Dashboard Cards
```
GET https://api.domo.com/v1/pages/{dashboard_id}/cards
Authorization: bearer {access_token}
```

**Note:** Actual Domo API endpoints may vary. Check Domo API documentation for your account.

## WordPress Integration

### Option 1: Append to Page Content
- Adds structured data as `<script>` tag in page content
- Simple but mixes content with metadata

### Option 2: Custom Meta Field (Recommended)
- Stores structured data in WordPress custom meta field
- WordPress theme outputs in `<head>` section
- Cleaner separation of concerns

### Option 3: Plugin Integration
- Create custom WordPress plugin
- Provides better control and management
- More complex but more maintainable

## Example Output

The script generates JSON-LD structured data like:

```json
{
  "@context": "https://schema.org",
  "@type": "DataVisualization",
  "name": "Sales Dashboard Q4 2024",
  "description": "Real-time sales metrics and performance",
  "dateModified": "2024-11-04T12:00:00Z",
  "metric": [
    {
      "@type": "QuantitativeValue",
      "name": "Total Revenue",
      "value": "$2.5M",
      "unitText": "currency"
    },
    {
      "@type": "QuantitativeValue",
      "name": "Conversion Rate",
      "value": "3.2%",
      "unitText": "percentage"
    }
  ]
}
```

## Benefits

✅ **Automated** - Runs on schedule, no manual work  
✅ **Uses Existing APIs** - No Domo product changes  
✅ **Accurate** - Pulls directly from Domo  
✅ **Scalable** - Processes multiple dashboards  
✅ **Maintainable** - Standard Python/Jupyter  
✅ **Flexible** - Easy to customize  

## Troubleshooting

### Domo API Authentication Issues
- Verify Client ID and Secret are correct
- Check API permissions in Domo admin
- Ensure API host is correct for your region

### WordPress API Issues
- Verify Application Password is correct
- Check WordPress REST API is enabled
- Verify user has page update permissions

### Metadata Extraction Issues
- Check Domo API endpoint structure (may vary)
- Verify dashboard IDs are correct
- Review API response structure

## Next Steps

1. **Test with Single Dashboard:**
   - Start with one dashboard
   - Verify metadata extraction
   - Test WordPress update

2. **Expand to Multiple Dashboards:**
   - Add more dashboard mappings
   - Test batch processing
   - Verify all updates

3. **Schedule Automation:**
   - Set up daily/weekly schedule
   - Monitor for errors
   - Review logs

4. **Optimize:**
   - Adjust metadata extraction based on needs
   - Customize structured data format
   - Improve error handling

## Support

For issues:
1. Check Domo API documentation
2. Review WordPress REST API documentation
3. Test API endpoints manually (Postman/curl)
4. Review Jupyter notebook logs

---

**This solution provides automated metadata extraction using Domo's existing Python/Jupyter capabilities!**

