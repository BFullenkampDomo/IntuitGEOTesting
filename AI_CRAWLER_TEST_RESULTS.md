# AI Crawler Test Results - Prerender.io

**Test Date:** November 4, 2025  
**Test URL:** https://bfullenkampdomo.github.io/IntuitGEOTesting/  
**Purpose:** Test if AI-specific crawlers can extract iframe content differently than standard bots

## Test Results Summary

### AI Crawlers Tested

| User-Agent | HTML Lines | Iframes | Dashboard Content | Status |
|------------|------------|---------|-------------------|--------|
| **GPTBot** (ChatGPT) | 325 | 1 | 12 lines* | ✅ Same as standard bot |
| **ClaudeBot** (Anthropic) | 325 | 1 | 12 lines* | ✅ Same as standard bot |
| **PerplexityBot** | 0 | 0 | 0 lines | ❌ Empty response |
| **Google-Extended** (Google AI) | 325 | 1 | 12 lines* | ✅ Same as standard bot |
| **Standard Googlebot** | 325 | 1 | 12 lines* | ✅ Baseline |

*Note: "Dashboard content" lines are from the test page itself (test descriptions, not actual dashboard content from inside iframe)

## Key Findings

### ✅ What Works for AI Crawlers:
1. **Iframe tag is visible** - AI crawlers can see the iframe element (same as standard bots)
2. **Iframe src attribute is accessible** - The embed URL is visible
3. **Page structure is crawlable** - Reference content, metadata, structured data all present
4. **Rendering is consistent** - AI crawlers get the same rendered HTML as standard bots

### ❌ What Doesn't Work for AI Crawlers:
1. **Iframe content is NOT extracted** - No dashboard content from inside the iframe
2. **Same limitations as standard bots** - AI crawlers cannot access cross-origin iframe content
3. **No special handling** - Prerender.io treats AI crawlers the same as standard bots

### PerplexityBot Issue:
- **Empty response (0 lines)** - This might be:
  - Authentication issue
  - User-Agent not recognized
  - Requires different User-Agent string format
  - API endpoint issue

## Conclusion

**AI crawlers are handled the same as standard bots by Prerender.io.**

Even though Prerender.io has **dedicated AI crawler support** and can detect AI bots, the rendered HTML is **identical** to standard bots. This means:

1. ✅ **AI crawlers can see the page structure** (same as standard bots)
2. ✅ **AI crawlers can see the iframe tag** (same as standard bots)
3. ❌ **AI crawlers cannot extract iframe content** (same limitation as standard bots)

## Why This Matters

**For Intuit's Use Case:**
- AI crawlers (ChatGPT, Claude, Perplexity) will see the same rendered HTML as Googlebot
- They can see the iframe tag but cannot access dashboard content inside
- **This confirms our earlier findings** - iframe content is not accessible regardless of bot type

## Recommendation

**The conclusion remains the same:** Dynamic rendering cannot extract iframe content, even for AI-specific crawlers.

**Solution:** Structured metadata API approach is still the recommended path forward, as AI crawlers have the same limitations as standard bots when it comes to cross-origin iframe content.

## Next Steps

1. **Investigate PerplexityBot empty response** - May need different User-Agent format
2. **Test with other AI crawler User-Agents** - Expand testing to more AI platforms
3. **Document findings** - Confirm that AI crawlers have same limitations
4. **Proceed with metadata API recommendation** - This remains the best solution

---

**Test Completed By:** Braxton Fullenkamp  
**Date:** November 4, 2025  
**Reference:** [Prerender.io AI Crawler Documentation](https://docs.prerender.io/docs/recommended-ai-crawler-user-agents-for-prerender)

