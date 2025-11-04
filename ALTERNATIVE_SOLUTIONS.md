# Alternative Solutions - If Domo Can't Provide Metadata API

**Date:** November 4, 2025  
**Scenario:** Domo cannot provide structured metadata API capability right now  
**Question:** What can Intuit do in the meantime to achieve SEO/AI crawlability?

## Immediate Workarounds (No Domo Changes Required)

### Option 1: Manual Metadata Embedding ✅ **RECOMMENDED**

**How It Works:**
- Intuit manually adds dashboard metadata to each page that embeds Domo
- Metadata is embedded as structured data (JSON-LD) in the HTML
- Search engines and AI crawlers can index this metadata
- Domo iframe still provides visual display to users

**Implementation:**
1. **Intuit creates metadata for each Domo dashboard:**
   - Dashboard title
   - Dashboard description
   - Key metrics (names and values)
   - Chart types and summaries
   - Dashboard purpose/context

2. **Embed metadata in WordPress page:**
   ```html
   <script type="application/ld+json">
   {
     "@context": "https://schema.org",
     "@type": "DataVisualization",
     "name": "Sales Dashboard Q4 2024",
     "description": "Real-time sales metrics including revenue, conversions, and regional breakdown",
     "about": {
       "@type": "Thing",
       "name": "Sales Performance"
     },
     "metric": [
       {
         "@type": "QuantitativeValue",
         "name": "Total Revenue",
         "value": "$2.5M"
       },
       {
         "@type": "QuantitativeValue",
         "name": "Conversion Rate",
         "value": "3.2%"
       }
     ]
   }
   </script>
   ```

3. **Benefits:**
   - ✅ No Domo changes required
   - ✅ Can implement immediately
   - ✅ Full SEO/AI crawlability
   - ✅ Maintains iframe for visual display
   - ✅ Works with current WordPress setup

4. **Limitations:**
   - ⚠️ Manual process (requires maintenance)
   - ⚠️ Metadata may become outdated if dashboard changes
   - ⚠️ Requires Intuit team to maintain metadata

**Effort:** Low - Can be implemented in days/weeks

---

### Option 2: Hybrid Approach - Iframe + Page-Level Content ✅

**How It Works:**
- Add descriptive content **around** the Domo iframe on the page
- This content is crawlable by search engines and AI
- Iframe provides visual dashboard, content provides context

**Implementation:**
1. **Add descriptive HTML content on the page:**
   ```html
   <div class="dashboard-description">
     <h2>Sales Dashboard Q4 2024</h2>
     <p>This dashboard provides real-time insights into our sales performance, including:</p>
     <ul>
       <li><strong>Total Revenue:</strong> $2.5M (up 15% from last quarter)</li>
       <li><strong>Conversion Rate:</strong> 3.2% (industry average: 2.8%)</li>
       <li><strong>Top Performing Region:</strong> West Coast (35% of total revenue)</li>
     </ul>
   </div>
   
   <div class="domo-embed-container">
     <iframe src="https://embed.domo.com/embed/pages/rm0yK"></iframe>
   </div>
   
   <div class="dashboard-insights">
     <h3>Key Insights</h3>
     <p>The dashboard shows strong performance in Q4, with the West Coast region...</p>
   </div>
   ```

2. **Benefits:**
   - ✅ No Domo changes required
   - ✅ Can implement immediately
   - ✅ Search engines can index the descriptive content
   - ✅ AI crawlers can understand dashboard context
   - ✅ Provides context around the dashboard

3. **Limitations:**
   - ⚠️ Content is static (not dynamic from dashboard)
   - ⚠️ Requires content updates when dashboard changes
   - ⚠️ May not capture all dashboard metrics

**Effort:** Low - Can be implemented immediately

---

### Option 3: Screenshot/Image with Alt Text ✅

**How It Works:**
- Take periodic screenshots of Domo dashboard
- Embed screenshot with descriptive alt text and structured data
- AI crawlers can "see" the dashboard via image analysis
- Maintain iframe for interactive view

**Implementation:**
1. **Create screenshot of dashboard:**
   - Manual: Take screenshot periodically
   - Automated: Use screenshot service (if available)

2. **Embed with descriptive markup:**
   ```html
   <figure>
     <img src="dashboard-screenshot.png" 
          alt="Sales Dashboard Q4 2024 showing $2.5M revenue, 3.2% conversion rate, and regional breakdown">
     <figcaption>
       Sales Dashboard Q4 2024 - Real-time metrics including revenue, conversions, and regional performance
     </figcaption>
   </figure>
   
   <!-- Hidden structured data for AI crawlers -->
   <script type="application/ld+json">
   {
     "@context": "https://schema.org",
     "@type": "ImageObject",
     "contentUrl": "dashboard-screenshot.png",
     "description": "Sales Dashboard showing Q4 2024 performance metrics"
   }
   </script>
   ```

3. **Benefits:**
   - ✅ No Domo changes required
   - ✅ AI crawlers can analyze images
   - ✅ Provides visual context
   - ✅ Can combine with iframe

4. **Limitations:**
   - ⚠️ Screenshots become outdated
   - ⚠️ Manual process unless automated
   - ⚠️ Image analysis may not extract all metrics accurately

**Effort:** Medium - Requires screenshot automation or manual process

---

### Option 4: Domo Public Pages (If Available) ✅

**How It Works:**
- If Domo has public/shareable pages feature, use those
- Public pages may have better SEO than embeds
- Link to public pages instead of (or in addition to) iframe embeds

**Implementation:**
1. **Check if Domo has public pages feature**
2. **Create public shareable links for dashboards**
3. **Use public pages for SEO, iframe for embedding**

**Benefits:**
- ✅ May have better SEO than embeds
- ✅ No API required

**Limitations:**
- ⚠️ May not be available in all Domo plans
- ⚠️ May have different security/privacy implications
- ⚠️ Still may not extract all content

**Effort:** Low - If feature exists

---

### Option 5: Wait-and-See with Current Setup ✅

**How It Works:**
- Keep current iframe embedding
- Document requirements for Domo
- Plan for future metadata API implementation
- Focus on other SEO improvements

**Benefits:**
- ✅ No immediate changes required
- ✅ Can plan for future solution
- ✅ Focus resources elsewhere

**Limitations:**
- ❌ No improvement in SEO/AI crawlability
- ❌ Dashboard content not discoverable
- ❌ May miss AI search opportunities

**Effort:** None

---

## Recommended Approach: Hybrid Solution

**Best Option for Immediate Implementation:**

1. **Manual Metadata Embedding** (Option 1)
   - Add structured data (JSON-LD) to pages
   - Include dashboard title, description, key metrics
   - Update periodically or when dashboards change

2. **Page-Level Descriptive Content** (Option 2)
   - Add HTML content around iframe
   - Describe dashboard purpose and key insights
   - Provides context for search engines and AI

3. **Combined Implementation:**
   ```html
   <!-- Page-level content (crawlable) -->
   <article>
     <h1>Sales Dashboard Q4 2024</h1>
     <p>This interactive dashboard provides real-time insights into...</p>
     <ul>
       <li>Total Revenue: $2.5M</li>
       <li>Conversion Rate: 3.2%</li>
     </ul>
   </article>
   
   <!-- Structured data (for AI crawlers) -->
   <script type="application/ld+json">
   {
     "@context": "https://schema.org",
     "@type": "DataVisualization",
     "name": "Sales Dashboard Q4 2024",
     "description": "...",
     "metric": [...]
   }
   </script>
   
   <!-- Domo iframe (visual display) -->
   <iframe src="https://embed.domo.com/embed/pages/rm0yK"></iframe>
   ```

**Benefits:**
- ✅ Immediate implementation (no Domo changes)
- ✅ Full SEO/AI crawlability
- ✅ Maintains visual dashboard
- ✅ Can be implemented in WordPress today

---

## Implementation Timeline

### Phase 1: Immediate (Week 1-2)
- Add structured data (JSON-LD) to key pages
- Add descriptive content around Domo iframes
- Test with search engines and AI crawlers

### Phase 2: Short-term (Month 1-3)
- Expand to all Domo-embedded pages
- Create templates for metadata
- Establish maintenance process

### Phase 3: Long-term (Future)
- Request Domo metadata API
- Migrate to automated solution when available
- Reduce manual maintenance

---

## Cost-Benefit Analysis

| Solution | Implementation Time | Ongoing Maintenance | SEO/AI Benefit | Domo Changes Required |
|----------|-------------------|-------------------|----------------|---------------------|
| Manual Metadata | 1-2 weeks | Medium | High | None |
| Page-Level Content | Immediate | Low | Medium-High | None |
| Screenshot Approach | 2-4 weeks | High | Medium | None |
| Public Pages | 1 week | Low | Medium | None* |
| Wait for API | None | None | Low | Required |

---

## Next Steps

1. **Implement Option 1 + Option 2 (Hybrid):**
   - Add structured data to WordPress pages
   - Add descriptive content around Domo iframes
   - Test with AI crawlers (ChatGPT, Claude, Perplexity)

2. **Document Requirements for Domo:**
   - Create formal request for metadata API
   - Include use cases and benefits
   - Plan for future migration

3. **Monitor Results:**
   - Track SEO improvements
   - Monitor AI crawler traffic
   - Measure visibility in AI search results

4. **Plan for Future:**
   - When Domo provides API, migrate to automated solution
   - Reduce manual maintenance
   - Improve accuracy and timeliness

---

## Conclusion

**Even without Domo metadata API, Intuit can achieve SEO/AI crawlability through:**

1. ✅ **Manual metadata embedding** (structured data)
2. ✅ **Page-level descriptive content** (crawlable HTML)
3. ✅ **Combined approach** (best of both worlds)

**These solutions can be implemented immediately** without requiring any Domo product changes, providing a path forward while waiting for Domo's metadata API capability.

