# Test Results Template

**Test Date:** [Date]  
**Tester Name:** [Name]  
**Test URL:** [Deployed URL]  

## Test Configuration

- **Rendering Service:** [Prerender.io / Rendertron / Custom / Other]
- **User-Agent Tested:** [Googlebot / ChatGPT / Claude / Other]
- **Test Environment:** [Production / Staging]
- **Domo Embed URL:** [Domo embed URL if applicable]

## Test Results

### Reference Content Verification

- [ ] Reference content section is visible in rendered HTML
- [ ] Meta tags are present and correct
- [ ] Structured data (JSON-LD) is parseable
- [ ] Open Graph tags are present
- [ ] Twitter Card tags are present

**Status:** ✅ Pass / ⚠️ Partial / ❌ Fail  
**Notes:** [Any observations about reference content]

---

### Domo Iframe Content

- [ ] Domo iframe tag is present in rendered HTML
- [ ] Iframe src attribute is visible
- [ ] Dashboard content is extractable from rendered HTML
- [ ] Dashboard titles are visible
- [ ] Dashboard metrics are visible
- [ ] Dashboard charts/data are visible

**Status:** ✅ Success / ⚠️ Partial Success / ❌ Failure  
**Notes:** [Detailed observations about Domo content visibility]

---

### Content Analysis

**What was found in rendered HTML:**

1. **Dashboard Titles:** [Yes / No / Partial]
   - Details: [List any titles found]

2. **Dashboard Metrics:** [Yes / No / Partial]
   - Details: [List any metrics found]

3. **Dashboard Charts:** [Yes / No / Partial]
   - Details: [Describe chart data found]

4. **Dashboard Data:** [Yes / No / Partial]
   - Details: [Describe data found]

---

### Technical Issues

**Errors Encountered:**
- [ ] IP restrictions
- [ ] Authentication errors
- [ ] CORS issues
- [ ] Timing issues (content not loaded)
- [ ] Security headers blocking access
- [ ] X-Frame-Options blocking
- [ ] Other: [Describe]

**Blockers Identified:**
[List any technical blockers that prevent full success]

---

## Screenshots

- [ ] Screenshot of original page
- [ ] Screenshot of rendered HTML
- [ ] Comparison view

**Screenshot URLs/Locations:**
[Add links or paths to screenshots]

---

## Rendered HTML Sample

**Sample of rendered HTML (first 1000 characters):**
```
[Paste sample HTML here]
```

**Key findings in rendered HTML:**
[List specific content found]

---

## Comparison: Original vs Rendered

| Element | Original Page | Rendered HTML | Status |
|---------|--------------|---------------|--------|
| Reference Content | ✅ | [✅/❌] | [Match/Mismatch] |
| Domo Iframe Tag | ✅ | [✅/❌] | [Match/Mismatch] |
| Dashboard Titles | ✅ | [✅/❌/⚠️] | [Match/Mismatch] |
| Dashboard Metrics | ✅ | [✅/❌/⚠️] | [Match/Mismatch] |
| Dashboard Charts | ✅ | [✅/❌/⚠️] | [Match/Mismatch] |
| Structured Data | ✅ | [✅/❌] | [Match/Mismatch] |

---

## Outcome

### ✅ Success (Best Case)
- Rendering service successfully accesses and renders Domo dashboard content
- Dashboard data appears as semantic HTML in the snapshot
- **Result:** Solution works out-of-the-box with no Domo changes needed

### ⚠️ Partial Success (Most Likely)
- Some content is visible but blocked by specific technical constraints
- Issues identified: [List specific issues]
- **Result:** We document specific requirements for Domo to enable full support

### ❌ Failure (Requires Alternative)
- Iframe content is completely inaccessible to rendering service
- Security or architectural limitations prevent content extraction
- **Result:** Pivot to API endpoint approach where Domo provides structured metadata

**Selected Outcome:** [✅ / ⚠️ / ❌]

---

## Requirements for Domo (if applicable)

If partial success or failure, document specific requirements:

### IP Allowlisting
- [ ] Required
- IP ranges to allowlist: [List IP ranges]

### Header Modifications
- [ ] Required
- Headers to modify: [List headers]

### Authentication Changes
- [ ] Required
- Changes needed: [Describe]

### Rendering Signals
- [ ] Required
- Signals needed: [Describe]

### Other Requirements
[List any other requirements]

---

## Recommendations

### Immediate Next Steps

1. [Action item 1]
2. [Action item 2]
3. [Action item 3]

### Implementation Path

**If Success:**
- [ ] Provide Intuit with implementation guidance
- [ ] Create WordPress integration guide
- [ ] Document configuration requirements

**If Partial Success:**
- [ ] Create technical requirements document for Domo
- [ ] Estimate timeline for Domo changes
- [ ] Create fallback plan

**If Failure:**
- [ ] Document API endpoint requirements
- [ ] Define alternative approach scope
- [ ] Estimate effort for alternative solution

---

## Additional Notes

[Any additional observations, findings, or recommendations]

---

## Test Artifacts

- Rendered HTML file: [Path/URL]
- Screenshots: [Path/URL]
- Video recording: [Path/URL] (if applicable)
- Logs: [Path/URL]

---

**Test Completed By:** [Name]  
**Date:** [Date]  
**Reviewed By:** [Name] (if applicable)

