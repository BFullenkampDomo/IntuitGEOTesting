#!/bin/bash

# Test Prerender.io with AI-specific crawler User-Agents
# This tests if AI crawlers can see iframe content differently

URL="https://bfullenkampdomo.github.io/IntuitGEOTesting/"
TOKEN="OSFXAsR7yFJ3gQ2T8vUP"

echo "Testing Prerender.io with AI Crawler User-Agents"
echo "================================================"
echo ""

# Test 1: GPTBot (ChatGPT)
echo "Test 1: GPTBot (ChatGPT) User-Agent"
echo "---"
curl -s "https://service.prerender.io/${URL}" \
  -H "X-Prerender-Token: ${TOKEN}" \
  -H "User-Agent: GPTBot" > /tmp/gptbot-rendered.html
echo "Rendered HTML size: $(wc -l < /tmp/gptbot-rendered.html) lines"
echo "Iframe tags: $(grep -o '<iframe[^>]*>' /tmp/gptbot-rendered.html | wc -l)"
echo "Iframe src: $(grep -o 'src="[^"]*"' /tmp/gptbot-rendered.html | grep -i domo | head -1)"
echo "Dashboard content found: $(grep -i "dashboard\|chart\|metric\|data\|value" /tmp/gptbot-rendered.html | grep -v "embed\|iframe\|Domo\|DOMO\|Test\|POC" | wc -l | tr -d ' ') lines"
echo ""
echo ""

# Test 2: ClaudeBot (Anthropic)
echo "Test 2: ClaudeBot (Anthropic) User-Agent"
echo "---"
curl -s "https://service.prerender.io/${URL}" \
  -H "X-Prerender-Token: ${TOKEN}" \
  -H "User-Agent: anthropic-ai" > /tmp/claudebot-rendered.html
echo "Rendered HTML size: $(wc -l < /tmp/claudebot-rendered.html) lines"
echo "Iframe tags: $(grep -o '<iframe[^>]*>' /tmp/claudebot-rendered.html | wc -l)"
echo "Iframe src: $(grep -o 'src="[^"]*"' /tmp/claudebot-rendered.html | grep -i domo | head -1)"
echo "Dashboard content found: $(grep -i "dashboard\|chart\|metric\|data\|value" /tmp/claudebot-rendered.html | grep -v "embed\|iframe\|Domo\|DOMO\|Test\|POC" | wc -l | tr -d ' ') lines"
echo ""
echo ""

# Test 3: PerplexityBot
echo "Test 3: PerplexityBot User-Agent"
echo "---"
curl -s "https://service.prerender.io/${URL}" \
  -H "X-Prerender-Token: ${TOKEN}" \
  -H "User-Agent: PerplexityBot" > /tmp/perplexitybot-rendered.html
echo "Rendered HTML size: $(wc -l < /tmp/perplexitybot-rendered.html) lines"
echo "Iframe tags: $(grep -o '<iframe[^>]*>' /tmp/perplexitybot-rendered.html | wc -l)"
echo "Iframe src: $(grep -o 'src="[^"]*"' /tmp/perplexitybot-rendered.html | grep -i domo | head -1)"
echo "Dashboard content found: $(grep -i "dashboard\|chart\|metric\|data\|value" /tmp/perplexitybot-rendered.html | grep -v "embed\|iframe\|Domo\|DOMO\|Test\|POC" | wc -l | tr -d ' ') lines"
echo ""
echo ""

# Test 4: Google-Extended (Google AI)
echo "Test 4: Google-Extended (Google AI) User-Agent"
echo "---"
curl -s "https://service.prerender.io/${URL}" \
  -H "X-Prerender-Token: ${TOKEN}" \
  -H "User-Agent: google-extended" > /tmp/google-extended-rendered.html
echo "Rendered HTML size: $(wc -l < /tmp/google-extended-rendered.html) lines"
echo "Iframe tags: $(grep -o '<iframe[^>]*>' /tmp/google-extended-rendered.html | wc -l)"
echo "Iframe src: $(grep -o 'src="[^"]*"' /tmp/google-extended-rendered.html | grep -i domo | head -1)"
echo "Dashboard content found: $(grep -i "dashboard\|chart\|metric\|data\|value" /tmp/google-extended-rendered.html | grep -v "embed\|iframe\|Domo\|DOMO\|Test\|POC" | wc -l | tr -d ' ') lines"
echo ""
echo ""

# Test 5: Compare with standard Googlebot
echo "Test 5: Standard Googlebot (for comparison)"
echo "---"
curl -s "https://service.prerender.io/${URL}" \
  -H "X-Prerender-Token: ${TOKEN}" \
  -H "User-Agent: Googlebot/2.1 (+http://www.google.com/bot.html)" > /tmp/googlebot-rendered.html
echo "Rendered HTML size: $(wc -l < /tmp/googlebot-rendered.html) lines"
echo "Iframe tags: $(grep -o '<iframe[^>]*>' /tmp/googlebot-rendered.html | wc -l)"
echo "Iframe src: $(grep -o 'src="[^"]*"' /tmp/googlebot-rendered.html | grep -i domo | head -1)"
echo "Dashboard content found: $(grep -i "dashboard\|chart\|metric\|data\|value" /tmp/googlebot-rendered.html | grep -v "embed\|iframe\|Domo\|DOMO\|Test\|POC" | wc -l | tr -d ' ') lines"
echo ""
echo ""

# Summary Comparison
echo "================================================"
echo "Summary Comparison"
echo "================================================"
echo ""
echo "User-Agent          | HTML Lines | Iframes | Dashboard Content"
echo "--------------------|------------|---------|------------------"
printf "GPTBot              | %10s | %7s | %17s\n" \
  "$(wc -l < /tmp/gptbot-rendered.html | tr -d ' ')" \
  "$(grep -o '<iframe[^>]*>' /tmp/gptbot-rendered.html | wc -l | tr -d ' ')" \
  "$(grep -i "dashboard\|chart\|metric\|data\|value" /tmp/gptbot-rendered.html | grep -v "embed\|iframe\|Domo\|DOMO\|Test\|POC" | wc -l | tr -d ' ')"
printf "ClaudeBot           | %10s | %7s | %17s\n" \
  "$(wc -l < /tmp/claudebot-rendered.html | tr -d ' ')" \
  "$(grep -o '<iframe[^>]*>' /tmp/claudebot-rendered.html | wc -l | tr -d ' ')" \
  "$(grep -i "dashboard\|chart\|metric\|data\|value" /tmp/claudebot-rendered.html | grep -v "embed\|iframe\|Domo\|DOMO\|Test\|POC" | wc -l | tr -d ' ')"
printf "PerplexityBot       | %10s | %7s | %17s\n" \
  "$(wc -l < /tmp/perplexitybot-rendered.html | tr -d ' ')" \
  "$(grep -o '<iframe[^>]*>' /tmp/perplexitybot-rendered.html | wc -l | tr -d ' ')" \
  "$(grep -i "dashboard\|chart\|metric\|data\|value" /tmp/perplexitybot-rendered.html | grep -v "embed\|iframe\|Domo\|DOMO\|Test\|POC" | wc -l | tr -d ' ')"
printf "Google-Extended     | %10s | %7s | %17s\n" \
  "$(wc -l < /tmp/google-extended-rendered.html | tr -d ' ')" \
  "$(grep -o '<iframe[^>]*>' /tmp/google-extended-rendered.html | wc -l | tr -d ' ')" \
  "$(grep -i "dashboard\|chart\|metric\|data\|value" /tmp/google-extended-rendered.html | grep -v "embed\|iframe\|Domo\|DOMO\|Test\|POC" | wc -l | tr -d ' ')"
printf "Standard Googlebot  | %10s | %7s | %17s\n" \
  "$(wc -l < /tmp/googlebot-rendered.html | tr -d ' ')" \
  "$(grep -o '<iframe[^>]*>' /tmp/googlebot-rendered.html | wc -l | tr -d ' ')" \
  "$(grep -i "dashboard\|chart\|metric\|data\|value" /tmp/googlebot-rendered.html | grep -v "embed\|iframe\|Domo\|DOMO\|Test\|POC" | wc -l | tr -d ' ')"
echo ""
echo ""
echo "Testing complete!"
echo ""
echo "Note: Iframe content extraction is still limited by same-origin policy,"
echo "but AI crawlers may be handled differently by Prerender.io."

