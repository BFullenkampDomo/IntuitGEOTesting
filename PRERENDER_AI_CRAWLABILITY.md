# Prerender.io AI Crawlability Settings - Latest Research

**Research Date:** November 4, 2025  
**Source:** [Prerender.io Documentation](https://docs.prerender.io/docs/recommended-ai-crawler-user-agents-for-prerender)

## Overview

Prerender.io has introduced **new AI crawlability features** to ensure your content appears in AI-generated search results and summaries. This is critical for sites like Intuit that need to be discoverable by AI platforms.

## Key Finding: AI Crawler Support

Prerender.io now supports **major AI crawlers** including:
- **ChatGPT** (GPTBot, openai/chatgpt)
- **Claude** (Anthropic/Claude)
- **Perplexity** (PerplexityBot)
- **Google AI** (google-extended)
- **Bing AI** (microsoft/bing ai)
- And many more...

## Impact Example

According to Prerender.io documentation, **one customer received over 700,000 requests from ChatGPT in just 30 days** after adding the `GPTBot` user agent.

## Recommended AI Crawler User-Agents

### Major AI Search Crawlers

**ChatGPT / OpenAI:**
- `openai/chatgpt`
- `chatgpt-user`
- `gptbot`
- `chatgpt-user/1.0`

**Claude / Anthropic:**
- `anthropic/claude`
- `anthropic-ai`
- `anthropic/claude`

**Google AI:**
- `google-extended`
- `googleother`

**Microsoft / Bing AI:**
- `microsoft/bing ai`
- `bingbot/ai`
- `bingpreview`

**Perplexity:**
- `perplexity`
- `perplexitybot`
- `perplexitybot/1.0`

**Cohere:**
- `cohere`
- `cohere-ai`
- `cohere-crawler`

### Emerging AI Platforms

- `bytedance/tiktok`
- `bytespider`
- `bytespiderbot`
- `baiduspider-render`
- `baiduspider-ai`
- `yourbot` (you.com)
- `you-bot`
- `neevabot`
- `hugging-face-ai`
- `huggingfacebot`

### AI-Powered Social & Content Platforms

- `linkedinbot/ai`
- `facebookexternalhit/ai`
- `facebookbot`
- `twitterbot`
- `redditbot`

### AI Research & Specialized Crawlers

- `ccbot` (common crawl)
- `airesearchbot`
- `research-crawler`
- `diffbot`
- `scaleai`
- `scale-crawler`

## How to Add AI Crawlers

### For Direct API Usage (Our Test Case)

Since we're using Prerender.io's API directly (not a middleware integration), we can test with different User-Agent headers:

```bash
# Test with ChatGPT User-Agent
curl -s "https://service.prerender.io/URL" \
  -H "X-Prerender-Token: TOKEN" \
  -H "User-Agent: GPTBot"

# Test with Claude User-Agent
curl -s "https://service.prerender.io/URL" \
  -H "X-Prerender-Token: TOKEN" \
  -H "User-Agent: anthropic-ai"

# Test with Perplexity User-Agent
curl -s "https://service.prerender.io/URL" \
  -H "X-Prerender-Token: TOKEN" \
  -H "User-Agent: PerplexityBot"
```

### For Middleware Integrations

If you're using Prerender.io middleware (Express, Rails, NGINX, etc.), you can add these User-Agents to your crawler list. See [How to Add Additional Bots](https://docs.prerender.io/docs/how-to-add-additional-bots) for detailed instructions.

## New Features

### 1. Enhanced Dashboard
- Filter by domain and crawler type
- Analyze custom date ranges
- Monitor AI bot interactions
- Track rendering performance

### 2. AI Crawler Detection
- Automatically detects AI crawlers
- Serves prerendered content to AI bots
- Improves visibility in AI-generated results

### 3. Strategic Partnerships
- Partnership with OtterlyAI for AI search analytics
- Helps organizations strengthen AI search presence

## Testing with AI Crawlers

### What We Should Test

1. **Test with AI-specific User-Agents:**
   - Does Prerender.io render differently for AI crawlers?
   - Can AI crawlers see iframe content?
   - Does the rendering service handle AI crawlers differently?

2. **Compare Results:**
   - Standard bot (Googlebot) vs AI bot (GPTBot)
   - Does AI bot get more content?
   - Are there differences in rendered HTML?

3. **Iframe Content for AI:**
   - Can AI crawlers extract iframe content?
   - Does Prerender.io handle iframe content differently for AI bots?

## Why This Matters for Intuit

1. **AI Search Visibility:** Intuit content needs to appear in ChatGPT, Claude, and Perplexity results
2. **Domo Dashboard Discovery:** AI platforms need to understand Domo dashboard content
3. **SEO Evolution:** AI search is becoming as important as traditional search
4. **Competitive Advantage:** Early adoption of AI crawlability improves visibility

## Next Steps

1. **Test with AI Crawler User-Agents:**
   - Test with GPTBot, ClaudeBot, PerplexityBot
   - Compare results with standard bots
   - Document findings

2. **Iframe Content Analysis:**
   - Check if AI crawlers can see iframe content differently
   - Test if Prerender.io handles AI bots differently

3. **Implementation:**
   - If using Prerender.io middleware, add AI crawler User-Agents
   - Configure Intuit's WordPress integration
   - Monitor AI bot traffic

## References

- [Recommended AI Crawler User-Agents](https://docs.prerender.io/docs/recommended-ai-crawler-user-agents-for-prerender)
- [How to Add Additional Bots](https://docs.prerender.io/docs/how-to-add-additional-bots)
- [Enhanced Dashboard Documentation](https://docs.prerender.io/docs/introducing-the-new-prerender.io-dashboard-enhanced-crawling-rendering-insights)

---

**Key Insight:** Prerender.io now has **dedicated AI crawler support** that we haven't tested yet. This could potentially change our findings if AI crawlers are handled differently than standard bots.

