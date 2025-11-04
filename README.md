# Domo Dynamic Rendering Proof-of-Concept Test

## Overview

This test validates whether a dynamic rendering solution can successfully crawl and index content from Domo's embedded dashboards - the core requirement for achieving Intuit's GEO (Google Engine Optimization) and AI crawlability goals.

## What We're Testing

**The fundamental question:** Can a rendering service "see inside" a Domo iframe embed and extract the dashboard content (metrics, charts, data) in a way that search engines and AI crawlers can index?

## Test Structure

The test page (`index.html`) contains:

1. **Reference Content Section** - Verifies the page loaded correctly
2. **Domo Dashboard Embed** - The iframe embed to test
3. **SEO Metadata** - Meta tags and structured data for verification
4. **Test Results Template** - Placeholder for documenting findings

## How to Run the Test

### Step 1: Add Your Domo Embed Code

1. Open `index.html`
2. Find the `<!-- TODO: Insert actual Domo embed code below -->` comment
3. Replace the placeholder with your actual Domo embed iframe code
4. Remove or comment out the placeholder `embed-placeholder` div

### Step 2: Deploy to Public URL

Choose one of these deployment options:

#### Option A: GitHub Pages (Free)

1. Push this repository to GitHub
2. Go to Settings → Pages
3. Select branch and folder (usually `main` and `/root`)
4. Your page will be available at `https://yourusername.github.io/IntuitGEOTesting/`


### Step 3: Test with Dynamic Rendering Service

#### Option A: Prerender.io (Recommended)

1. Sign up for free trial at [prerender.io](https://prerender.io)
2. Use their API or browser extension:
   ```
   https://service.prerender.io/https://your-deployed-url.com
   ```
3. View the rendered HTML to see what crawlers see

#### Option B: Rendertron

1. Use Google's Rendertron service:
   ```
   https://render-tron.appspot.com/render/https://your-deployed-url.com
   ```
2. Or deploy your own instance

#### Option C: Browser Rendering Test

1. Use Chrome DevTools with User-Agent override:
   - Open DevTools → Network Conditions
   - Set User-Agent to: `Googlebot/2.1 (+http://www.google.com/bot.html)`
   - Reload page and inspect rendered content

#### Option D: Custom Script

Use the provided `test-rendering.sh` script to test with curl:

```bash
./test-rendering.sh https://your-deployed-url.com
```

### Step 4: Analyze Results

Inspect the rendered HTML output to determine:

1. **Reference Content**
   - ✅ Is the reference content section visible?
   - ✅ Are metadata tags present?
   - ✅ Is structured data (JSON-LD) parseable?

2. **Domo Iframe Content**
   - ✅ Is the Domo iframe visible in the HTML?
   - ✅ Are dashboard elements (titles, metrics, charts, data) extractable?
   - ✅ Is the content meaningful and indexable for SEO/AI purposes?

3. **Technical Issues**
   - ⚠️ Are there any blocked requests?
   - ⚠️ Are there authentication errors?
   - ⚠️ Are there timing issues (content not loaded)?

## Expected Outcomes

### ✅ Success (Best Case)

- Rendering service successfully accesses and renders Domo dashboard content
- Dashboard data appears as semantic HTML in the snapshot
- **Result:** Solution works out-of-the-box with no Domo changes needed

### ⚠️ Partial Success (Most Likely)

- Some content is visible but blocked by specific technical constraints
- Issues identified: IP restrictions, authentication, security headers, timing
- **Result:** Document specific requirements for Domo to enable full support

### ❌ Failure (Requires Alternative)

- Iframe content is completely inaccessible to rendering service
- Security or architectural limitations prevent content extraction
- **Result:** Pivot to API endpoint approach where Domo provides structured metadata

## Timeline

- **Setup:** 15-30 minutes (create test page, deploy)
- **Testing:** 10-15 minutes (run rendering tests)
- **Analysis:** 15-30 minutes (review results, document findings)
- **Total:** ~1 hour for complete proof-of-concept

## Deliverables

After testing, document:

1. **Test Results:** Screenshots/video of what crawlers can see
2. **Technical Findings:** What works, what doesn't, and why
3. **Requirements List:** Specific changes needed (if any) from Domo
4. **Recommendation:** Best path forward based on results

## Next Steps After Testing

### If Successful:
- Provide Intuit with implementation guidance for their WordPress environment
- Document configuration requirements
- Create deployment checklist

### If Blockers Identified:
- Create technical requirements document for Domo product team
- Include estimated timeline and effort
- Document specific IP allowlisting, header modifications, or rendering signals needed

### If Alternative Needed:
- Shift discussion to API endpoint approach
- Define clear scope and timeline
- Create API specification document

## Troubleshooting

### Iframe Not Loading
- Check Domo embed URL is correct
- Verify embed token/permissions
- Check browser console for errors
- Verify CORS headers

### Rendering Service Shows Empty Page
- Check if service requires JavaScript execution
- Verify page is publicly accessible
- Check for IP restrictions
- Test with different User-Agent strings

### Content Not Visible in Rendered HTML
- Check if content loads asynchronously (timing issues)
- Verify iframe sandbox attributes
- Check for X-Frame-Options headers
- Test with different rendering wait times

## Resources

- [Prerender.io Documentation](https://docs.prerender.io/)
- [Rendertron GitHub](https://github.com/GoogleChrome/rendertron)
- [Google Search Central - Dynamic Rendering](https://developers.google.com/search/docs/crawling-indexing/javascript/dynamic-rendering)
- [Schema.org JSON-LD](https://schema.org/docs/gs.html)

## Support

For questions or issues with this test:
1. Review the test page HTML comments
2. Check browser console for errors
3. Verify deployment URL is accessible
4. Test with multiple rendering services

---

**Note:** This is a low-risk, high-value validation test that will definitively answer whether dynamic rendering can solve Intuit's crawlability requirements without requiring major platform changes from Domo.

