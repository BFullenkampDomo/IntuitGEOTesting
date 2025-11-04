#!/bin/bash

# Test different Prerender.io API options and settings
# This script systematically tests various Prerender.io configurations

URL="https://bfullenkampdomo.github.io/IntuitGEOTesting/"
TOKEN="OSFXAsR7yFJ3gQ2T8vUP"

echo "Testing Prerender.io with different settings..."
echo "=============================================="
echo ""

# Test 1: Basic render with token
echo "Test 1: Basic render with X-Prerender-Token header"
echo "---"
curl -s "https://service.prerender.io/${URL}" -H "X-Prerender-Token: ${TOKEN}" | grep -o '<iframe[^>]*>' | head -1
echo ""
echo ""

# Test 2: Wait for window.prerenderReady
echo "Test 2: Wait for window.prerenderReady flag"
echo "---"
curl -s "https://service.prerender.io/${URL}" -H "X-Prerender-Token: ${TOKEN}" -H "X-Prerender-Wait-For: window.prerenderReady" | grep -o '<iframe[^>]*>' | head -1
echo ""
echo ""

# Test 3: Wait for 10 seconds
echo "Test 3: Wait 10 seconds (10000ms)"
echo "---"
curl -s "https://service.prerender.io/${URL}" -H "X-Prerender-Token: ${TOKEN}" -H "X-Prerender-Wait-For: 10000" | grep -o '<iframe[^>]*>' | head -1
echo ""
echo ""

# Test 4: Wait for 15 seconds
echo "Test 4: Wait 15 seconds (15000ms)"
echo "---"
curl -s "https://service.prerender.io/${URL}" -H "X-Prerender-Token: ${TOKEN}" -H "X-Prerender-Wait-For: 15000" | grep -o '<iframe[^>]*>' | head -1
echo ""
echo ""

# Test 5: URL with token parameter
echo "Test 5: URL with token parameter"
echo "---"
curl -s "https://service.prerender.io/render?token=${TOKEN}&url=${URL}" | grep -o '<iframe[^>]*>' | head -1
echo ""
echo ""

# Test 6: Check for dashboard content in rendered HTML
echo "Test 6: Checking for dashboard content (titles, metrics, charts)"
echo "---"
curl -s "https://service.prerender.io/${URL}" -H "X-Prerender-Token: ${TOKEN}" -H "X-Prerender-Wait-For: window.prerenderReady" > /tmp/test-prerender.html
echo "Rendered HTML size: $(wc -l < /tmp/test-prerender.html) lines"
echo "Iframe tags found: $(grep -o '<iframe[^>]*>' /tmp/test-prerender.html | wc -l)"
echo "Dashboard-related content (excluding iframe/embed tags):"
grep -i "dashboard\|chart\|metric\|data\|value\|kpi" /tmp/test-prerender.html | grep -v "embed\|iframe\|Domo\|DOMO\|Test\|POC" | head -5
echo ""
echo ""

# Test 7: Check iframe src attribute
echo "Test 7: Iframe src attribute"
echo "---"
grep -o 'src="[^"]*"' /tmp/test-prerender.html | grep -i "domo\|embed" | head -3
echo ""
echo ""

echo "Testing complete!"
echo ""
echo "Note: Iframe content extraction is limited by same-origin policy."
echo "Even with wait times, Prerender.io cannot access content inside cross-origin iframes."

