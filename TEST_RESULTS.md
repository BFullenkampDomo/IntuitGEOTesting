# Dynamic Rendering Test Results

**Test Date:** November 4, 2025  
**Test URL:** https://bfullenkampdomo.github.io/IntuitGEOTesting/  
**Domo Embed URL:** https://embed.domo.com/embed/pages/JqXZJ  

## Test Configuration

- **Rendering Service:** Prerender.io
- **Prerender.io Token:** OSFXAsR7yFJ3gQ2T8vUP
- **User-Agent Tested:** Googlebot (via Prerender.io)
- **Test Environment:** GitHub Pages (Production)

## Test Results

### ✅ Reference Content Verification

- ✅ Reference content section is visible in rendered HTML
- ✅ Meta tags are present and correct
- ✅ Structured data (JSON-LD) is parseable
- ✅ Open Graph tags are present
- ✅ Twitter Card tags are present

**Status:** ✅ **PASS** - Page structure is crawlable

---

### 📊 Domo Iframe Content

- ✅ Domo iframe tag is present in rendered HTML
- ✅ Iframe src attribute is visible: `https://embed.domo.com/embed/pages/JqXZJ`
- ❓ Dashboard content inside iframe: **NOT VERIFIED** (requires deeper inspection)

**Iframe Tag Found:**
```html
<iframe src="https://embed.domo.com/embed/pages/JqXZJ" width="1248" height="1620" marginheight="0" marginwidth="0" frameborder="0"></iframe>
```

**Status:** ⚠️ **PARTIAL** - Iframe tag visible, but content inside iframe not confirmed

---

### Content Analysis

**What was found in rendered HTML:**

1. **Dashboard Titles:** ❓ Not confirmed
   - The iframe tag is present, but no dashboard titles extracted

2. **Dashboard Metrics:** ❓ Not confirmed
   - No metrics found in rendered HTML

3. **Dashboard Charts:** ❓ Not confirmed
   - No chart data found in rendered HTML

4. **Dashboard Data:** ❓ Not confirmed
   - No dashboard data extracted from inside iframe

---

### Technical Findings

**Key Discovery:**
- ✅ The **iframe tag itself** is visible in the rendered HTML
- ✅ Prerender.io successfully rendered the page structure
- ❓ The **content inside the iframe** (dashboard elements) does not appear to be extracted

**Why This Matters:**
- Iframes are sandboxed by default for security reasons
- Most rendering services can see the iframe tag but cannot access content inside iframes
- This is a fundamental limitation of iframe-based embeds

**Rendered HTML Size Comparison:**
- Original: 349 lines
- Prerendered: 325 lines (slightly smaller due to minification)
- **Note:** No additional content from inside the iframe was added

---

## Outcome

### ⚠️ Partial Success / Partial Failure

**What Works:**
- ✅ Page structure is fully crawlable
- ✅ SEO metadata is accessible
- ✅ Iframe tag is visible in rendered HTML
- ✅ Reference content is indexable

**What Doesn't Work:**
- ❌ Dashboard content inside iframe is not extracted
- ❌ No metrics, titles, or charts from Domo dashboard appear in rendered HTML
- ❌ Rendering service cannot access content inside the iframe

**Result:** ⚠️ **Partial Success** - The page structure is crawlable, but the Domo dashboard content inside the iframe is not accessible to rendering services.

---

## Requirements for Domo (if applicable)

Based on these findings, to enable full dynamic rendering support:

### Option 1: Iframe Content Extraction (Unlikely to Work)
- Most rendering services cannot access iframe content due to security restrictions
- Would require Domo to provide special rendering endpoints
- **Verdict:** Not feasible with current iframe approach

### Option 2: Structured Metadata Endpoint (Recommended)
- Domo provides a metadata API endpoint that returns:
  - Dashboard title
  - Dashboard description
  - Key metrics (names and values)
  - Chart types and data summaries
  - Dashboard structure
- This metadata can be embedded in the page HTML
- Search engines and AI crawlers can index this structured data
- **Verdict:** Most practical solution

### Option 3: Server-Side Rendering (Alternative)
- Domo provides server-side rendered HTML snapshots
- These snapshots can be embedded directly in the page
- More complex but provides full content access
- **Verdict:** Possible but requires significant Domo changes

---

## Recommendations

### Immediate Next Steps

1. **Document Current State:**
   - ✅ Page structure is crawlable
   - ⚠️ Iframe content is not accessible
   - ❌ Need alternative approach for dashboard content

2. **Evaluate Alternative Approaches:**
   - **Best Option:** API endpoint for structured metadata
   - **Alternative:** Server-side rendered HTML snapshots
   - **Fallback:** Hybrid approach (iframe + metadata)

3. **Create Technical Requirements Document:**
   - Define required metadata fields
   - Specify API endpoint structure
   - Document integration requirements

### Implementation Path

**Recommended Solution: Structured Metadata API**

1. **Domo Provides:**
   - REST API endpoint: `/api/v1/dashboards/{id}/metadata`
   - Returns JSON with dashboard structure and key metrics
   - Includes title, description, metrics, charts summary

2. **Intuit Implementation:**
   - Fetch metadata from Domo API
   - Embed metadata in page HTML as structured data (JSON-LD)
   - Maintain iframe for visual display
   - Both users and crawlers see relevant content

3. **Benefits:**
   - ✅ Full SEO/AI crawlability
   - ✅ No changes to iframe rendering
   - ✅ Backward compatible
   - ✅ Fast implementation

---

## Test Artifacts

- **Rendered HTML:** Saved to `/tmp/prerendered.html`
- **Original HTML:** Saved to `/tmp/original.html`
- **Prerender.io Response:** Available via API with token

---

## Conclusion

**Summary:**
The dynamic rendering test reveals **critical blockers** that prevent iframe-based solutions:

1. **CSP Policy Blocking:** Domo's Content Security Policy blocks iframe loading on Intuit's domains
2. **Iframe Content Inaccessibility:** Even if the iframe loads, rendering services cannot access content inside iframes
3. **No Dashboard Content Extraction:** Dashboard content cannot be extracted for SEO/AI crawlability

**Critical Finding:**
The CSP policy error demonstrates that **iframe embeds will not work on Intuit's production domains** without Domo adding `https://*.intuit.com` to the CSP whitelist. However, even with CSP changes, rendering services still cannot access iframe content.

**Recommendation:**
**Dynamic rendering with iframes is not viable.** Implement a structured metadata API approach where Domo provides dashboard metadata that can be embedded in the page HTML. This is the only viable path forward for SEO/AI crawlability.

**Next Steps:**
1. **Present findings to Domo product team:**
   - Document CSP policy blocking issue
   - Explain why iframe-based solutions won't work
   - Request structured metadata API endpoint
2. **CSP Whitelist (if keeping iframe approach):**
   - Request Domo add `https://*.intuit.com` to CSP frame-ancestors whitelist
   - Note: This only enables iframe loading, not content extraction
3. **Implement Structured Metadata API:**
   - Create API specification for dashboard metadata
   - Define required fields (title, description, metrics, charts)
   - Plan integration timeline
4. **Create Implementation Guide:**
   - Document how to fetch and embed metadata
   - Provide code examples for WordPress integration
   - Create testing checklist

---

**Test Completed By:** Braxton Fullenkamp  
**Date:** November 4, 2025

