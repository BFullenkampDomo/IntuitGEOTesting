# Testing Guide: Dynamic Rendering POC

This guide provides step-by-step instructions for testing the dynamic rendering proof-of-concept.

## Quick Start

1. **Add Domo Embed Code** to `index.html`
2. **Deploy** to a public URL (GitHub Pages, Netlify, or Vercel)
3. **Test** with rendering services
4. **Analyze** results

## Detailed Testing Steps

### Step 1: Prepare Your Test Page

1. Open `index.html` in a text editor
2. Locate the Domo embed section (around line 180)
3. Find the comment: `<!-- TODO: Insert actual Domo embed code below -->`
4. Replace the placeholder with your actual Domo embed code:

```html
<iframe 
    src="https://your-account.domo.com/embed/pages/abc123"
    width="100%" 
    height="600" 
    frameborder="0"
    allowfullscreen>
</iframe>
```

5. Remove or comment out the placeholder `embed-placeholder` div
6. Save the file

### Step 2: Test Locally First

Before deploying, test the page locally:

```bash
# Using Python 3
python3 -m http.server 8000

# Or using Node.js http-server
npx http-server -p 8000
```

Visit `http://localhost:8000` to verify:
- ✅ Page loads correctly
- ✅ Reference content is visible
- ✅ Domo embed loads (if accessible from your network)
- ✅ No console errors

### Step 3: Deploy to Public URL

#### Option A: GitHub Pages

1. Create a new GitHub repository
2. Push your files:
   ```bash
   git init
   git add .
   git commit -m "Initial commit - Domo rendering test"
   git remote add origin https://github.com/yourusername/IntuitGEOTesting.git
   git push -u origin main
   ```
3. Go to repository Settings → Pages
4. Select branch: `main`, folder: `/ (root)`
5. Your page will be at: `https://yourusername.github.io/IntuitGEOTesting/`

#### Option B: Netlify

1. Go to [netlify.com](https://netlify.com) and sign up/login
2. Drag and drop your project folder
3. Your page will be at: `https://your-project-name.netlify.app`
4. (Optional) Configure custom domain in settings

#### Option C: Vercel

1. Go to [vercel.com](https://vercel.com) and sign up/login
2. Click "New Project"
3. Import your repository or upload folder
4. Deploy with default settings
5. Your page will be at: `https://your-project-name.vercel.app`

### Step 4: Test with Rendering Services

#### Method 1: Using Provided Scripts

**Bash Script:**
```bash
chmod +x test-rendering.sh
./test-rendering.sh https://your-deployed-url.com
```

**Node.js Script:**
```bash
chmod +x test-rendering.js
node test-rendering.js https://your-deployed-url.com
```

#### Method 2: Manual Testing with Prerender.io

1. Sign up for free trial at [prerender.io](https://prerender.io)
2. Use their test URL:
   ```
   https://service.prerender.io/https://your-deployed-url.com
   ```
3. View the rendered HTML in your browser
4. Right-click → View Page Source to see the HTML
5. Search for Domo-related content

#### Method 3: Using Rendertron

1. Use Google's public Rendertron instance:
   ```
   https://render-tron.appspot.com/render/https://your-deployed-url.com
   ```
2. Or deploy your own instance (see [GitHub](https://github.com/GoogleChrome/rendertron))

#### Method 4: Browser DevTools Test

1. Open Chrome DevTools (F12)
2. Click the three dots menu → More Tools → Network Conditions
3. Set User-Agent to: `Googlebot/2.1 (+http://www.google.com/bot.html)`
4. Reload the page
5. Inspect the rendered content

### Step 5: Analyze Results

#### Check Reference Content

In the rendered HTML, search for:
- ✅ "Reference Content" text
- ✅ "Test Page Information" section
- ✅ Meta tags (`<meta name="description"`)
- ✅ Structured data (`<script type="application/ld+json">`)

**If visible:** ✅ Page structure is crawlable
**If not visible:** ❌ There's a problem with the rendering service or page

#### Check Domo Embed Content

In the rendered HTML, search for:
- ✅ `<iframe>` tags with Domo URLs
- ✅ Dashboard titles, metrics, or data
- ✅ Any content that appears to come from the Domo dashboard

**If visible:** ✅ Dynamic rendering works! Domo content is accessible
**If partially visible:** ⚠️ Some content blocked - document specific issues
**If not visible:** ❌ Iframe content not accessible - alternative approach needed

#### Document Findings

Update the "Test Results" section in `index.html` with:

1. **Test Configuration:**
   - Rendering service used
   - User-Agent tested
   - Test date
   - Test URL

2. **Findings:**
   - Reference content visibility
   - Domo iframe content visibility
   - Dashboard elements found
   - Technical issues encountered

3. **Recommendation:**
   - Next steps based on results
   - Required changes (if any)
   - Alternative approaches (if needed)

### Step 6: Screenshots and Documentation

1. **Take Screenshots:**
   - Original page (your browser)
   - Rendered HTML (from rendering service)
   - Compare side-by-side

2. **Save Rendered HTML:**
   ```bash
   curl "https://service.prerender.io/https://your-deployed-url.com" > rendered-output.html
   ```

3. **Create Comparison:**
   - Use a diff tool to compare original vs rendered HTML
   - Document what's different
   - Note missing or added content

## Troubleshooting

### Issue: Domo Embed Not Loading

**Possible Causes:**
- Incorrect embed URL
- Authentication required
- Network restrictions
- CORS issues

**Solutions:**
- Verify embed URL in Domo dashboard
- Check Domo embed permissions
- Test embed URL directly in browser
- Check browser console for errors

### Issue: Rendering Service Shows Empty Page

**Possible Causes:**
- Service requires JavaScript execution
- IP restrictions
- Authentication required
- Page not publicly accessible

**Solutions:**
- Verify page is publicly accessible
- Check if service requires JavaScript rendering
- Test with different User-Agent
- Check service logs/documentation

### Issue: Content Not Visible in Rendered HTML

**Possible Causes:**
- Content loads asynchronously (timing)
- Iframe sandbox restrictions
- X-Frame-Options headers
- Security policies

**Solutions:**
- Increase rendering wait time
- Check iframe sandbox attributes
- Verify CORS headers
- Test with different rendering services

## Expected Results Matrix

| Scenario | Reference Content | Domo Iframe | Dashboard Data | Result |
|----------|------------------|-------------|----------------|--------|
| Best Case | ✅ Visible | ✅ Visible | ✅ Extractable | ✅ Success - No changes needed |
| Partial | ✅ Visible | ⚠️ Partial | ⚠️ Some blocked | ⚠️ Partial - Document requirements |
| Failure | ✅ Visible | ❌ Not visible | ❌ Not accessible | ❌ Alternative needed |

## Next Steps Based on Results

### ✅ Success Scenario

1. Document the working configuration
2. Create implementation guide for Intuit's WordPress environment
3. Provide deployment checklist
4. Share findings with Domo team

### ⚠️ Partial Success Scenario

1. Document specific blockers
2. Create requirements document for Domo team:
   - IP allowlisting requirements
   - Header modifications needed
   - Authentication changes
   - Timing/rendering signals
3. Estimate timeline for Domo changes
4. Create fallback plan

### ❌ Failure Scenario

1. Document why dynamic rendering won't work
2. Create API endpoint requirements document
3. Define alternative approach:
   - Structured metadata endpoint
   - Content API
   - Webhook integration
4. Estimate effort for alternative solution

## Resources

- [Prerender.io Documentation](https://docs.prerender.io/)
- [Rendertron GitHub](https://github.com/GoogleChrome/rendertron)
- [Google Search Central - Dynamic Rendering](https://developers.google.com/search/docs/crawling-indexing/javascript/dynamic-rendering)
- [Domo Embed Documentation](https://developer.domo.com/docs/dev-studio/embedding)

## Support

For questions or issues:
1. Check the main README.md
2. Review HTML comments in index.html
3. Test with multiple rendering services
4. Verify deployment URL is accessible

---

**Remember:** This test is designed to validate feasibility quickly. The goal is to determine if dynamic rendering can work before investing in full implementation.

