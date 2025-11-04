#!/bin/bash

# Dynamic Rendering Test Script
# This script tests your deployed page with various rendering services

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if URL is provided
if [ -z "$1" ]; then
    echo -e "${RED}Error: Please provide a URL to test${NC}"
    echo "Usage: ./test-rendering.sh <your-url>"
    echo "Example: ./test-rendering.sh https://your-project.netlify.app"
    exit 1
fi

URL="$1"
echo -e "${GREEN}Testing Dynamic Rendering for: ${URL}${NC}\n"

# Test 1: Prerender.io
echo -e "${YELLOW}Test 1: Prerender.io${NC}"
echo "Testing with: https://service.prerender.io/${URL}"
echo "---"
curl -s "https://service.prerender.io/${URL}" | head -50
echo -e "\n---\n"

# Test 2: Rendertron
echo -e "${YELLOW}Test 2: Rendertron${NC}"
echo "Testing with: https://render-tron.appspot.com/render/${URL}"
echo "---"
curl -s "https://render-tron.appspot.com/render/${URL}" | head -50
echo -e "\n---\n"

# Test 3: Googlebot User-Agent
echo -e "${YELLOW}Test 3: Googlebot User-Agent${NC}"
echo "Testing with Googlebot User-Agent..."
echo "---"
curl -s -A "Googlebot/2.1 (+http://www.google.com/bot.html)" "${URL}" | head -50
echo -e "\n---\n"

# Test 4: ChatGPT User-Agent
echo -e "${YELLOW}Test 4: ChatGPT User-Agent${NC}"
echo "Testing with ChatGPT User-Agent..."
echo "---"
curl -s -A "ChatGPT-User" "${URL}" | head -50
echo -e "\n---\n"

echo -e "${GREEN}Testing complete!${NC}"
echo ""
echo "Next steps:"
echo "1. Review the rendered HTML output above"
echo "2. Check if Domo iframe content is visible"
echo "3. Compare with the original page source"
echo "4. Document findings in the test results section"

