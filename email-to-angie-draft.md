# Email Draft to Angie - Updated with Test Findings

---

Hi Angie,

Thanks for the follow-up on this! I really appreciate your team's thorough investigation into the llms.txt approach.

I've conducted a comprehensive proof-of-concept test to validate dynamic rendering solutions for Domo embeds, and I want to share the findings with you. This will help us align on the best path forward.

## Test Findings Summary

We set up a public test page with a Domo embedded dashboard and tested it extensively with Prerender.io (a leading dynamic rendering service), including:

- Multiple rendering configurations (wait times, window.prerenderReady flags)
- AI-specific crawlers (ChatGPT/GPTBot, Claude, Perplexity, Google-Extended)
- Various API endpoints and settings
- Different authentication methods

**Key Finding:** Dynamic rendering services can see the Domo iframe tag and render the page structure, but **they cannot extract content from inside the iframe** due to browser security restrictions (same-origin policy). This is a fundamental limitation that cannot be bypassed by rendering middleware.

**What Works:**
- ✅ Page structure is fully crawlable (reference content, SEO metadata, structured data)
- ✅ Iframe tag is visible in rendered HTML
- ✅ Rendering services successfully render the page

**What Doesn't Work:**
- ❌ Dashboard content inside iframe is not extractable
- ❌ No metrics, titles, or charts from Domo dashboard appear in rendered HTML
- ❌ This limitation applies to both standard bots and AI crawlers

## Recommended Solution: Automated Metadata Extraction

Based on our testing, here's the approach that will actually work for your GEO optimization goals:

### **Option 1: Domo Jupyter Notebook Solution (Recommended)**

Domo supports Python via Jupyter notebooks, which means we can create an automated solution that:

1. **Extracts metadata from Domo dashboards** using Domo's existing API
2. **Formats it as structured data** (JSON-LD) for SEO/AI crawlability
3. **Pushes to WordPress** via REST API automatically

This solution:
- ✅ **Uses existing Domo capabilities** (no product changes required)
- ✅ **Fully automated** (runs on schedule, no manual work)
- ✅ **Accurate** (pulls directly from Domo dashboards)
- ✅ **Scalable** (processes multiple dashboards)
- ✅ **Provides full SEO/AI crawlability** (structured data is indexable)

I've created a complete Jupyter notebook solution that's ready to implement. It extracts dashboard titles, descriptions, metrics, and chart information, then formats it as structured data and pushes it to WordPress.

**Timeline:** Can be implemented in 1-2 weeks with proper access to Domo API and WordPress.

### **Option 2: Manual Metadata Embedding (Immediate Alternative)**

If the Jupyter solution needs more time to set up, we can implement manual metadata embedding immediately:

- Add structured data (JSON-LD) to each WordPress page with Domo embeds
- Include dashboard title, description, and key metrics
- Provides SEO/AI crawlability while we work on automation

**Timeline:** Can be implemented immediately.

### **Option 3: Domo Metadata API Endpoint (Long-term)**

While we can't provide traditional SSR + `<script>` embed today, our engineering team has proposed creating an API endpoint that returns structured metadata about embedded dashboards. This would provide:

- Dashboard title, description, key metrics
- Summary statistics in structured format
- Text-based representation of visualizations

This would require scoping and development work from Domo's product team, but it's conceptually achievable and would provide a more robust long-term solution.

## Why Dynamic Rendering Won't Work

I want to be transparent: we tested dynamic rendering extensively, and while it works for page structure, it cannot extract iframe content. This isn't a Domo limitation—it's a fundamental browser security restriction (same-origin policy) that applies to all cross-origin iframes.

The rendering services can see the iframe tag but cannot access the content inside, regardless of:
- Wait times or rendering delays
- Special flags or settings
- Bot type (standard or AI crawlers)
- Rendering service used

## Recommended Path Forward

**Immediate Solution (Week 1-2):**
- Implement Domo Jupyter notebook solution for automated metadata extraction
- Or start with manual metadata embedding for immediate SEO benefits

**Short-term (Month 1-3):**
- Expand automated solution to all Domo-embedded pages
- Monitor and optimize metadata quality

**Long-term (Future):**
- Evaluate Domo metadata API endpoint for even more robust solution
- Reduce manual maintenance when API is available

## Questions for Your Team

To move forward, I need to understand:

1. **Domo API Access:** Do you have Domo API credentials (Client ID/Secret) that we can use for the Jupyter notebook solution?
2. **WordPress Access:** Can we set up WordPress Application Password for REST API access?
3. **Timeline Urgency:** Is this blocking your launch, or can we implement in phases?
4. **Crawlability Scope:** Which specific crawlers matter most? (Google/Bing vs. ChatGPT/Claude/Perplexity?)
5. **Content Requirements:** What level of detail do crawlers need? (Titles/descriptions vs. full data tables?)

## Immediate Next Steps

I'd love to set up a technical discovery call with:

- Your platform engineering team
- Our Domo product/engineering representatives
- Review the Jupyter notebook solution I've created

This would let us:
- Review the test findings together
- Discuss the Jupyter notebook implementation
- Align on the best path forward
- Provide accurate timelines

## Bottom Line

While dynamic rendering middleware won't work for extracting iframe content, we have a proven solution using Domo's existing Python/Jupyter capabilities that can achieve your GEO optimization goals. The Jupyter notebook approach provides automated, accurate metadata extraction without requiring Domo to rewrite our core architecture.

I've documented all test findings, the Jupyter notebook solution, and implementation guides. Would a technical discovery call make sense as a next step? I can coordinate schedules this week if you're available.

Thanks again for your patience as we work through this together!

Best regards,
[Your name]

---

**Attachments/Resources:**
- Test Results Summary
- Jupyter Notebook Solution
- Implementation Guide
- Alternative Solutions Document

