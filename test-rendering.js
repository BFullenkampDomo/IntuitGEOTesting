#!/usr/bin/env node

/**
 * Dynamic Rendering Test Script (Node.js version)
 * Tests your deployed page with various rendering services
 */

const https = require('https');
const http = require('http');

// Colors for terminal output
const colors = {
  reset: '\x1b[0m',
  red: '\x1b[31m',
  green: '\x1b[32m',
  yellow: '\x1b[33m',
  blue: '\x1b[34m',
};

function log(message, color = 'reset') {
  console.log(`${colors[color]}${message}${colors.reset}`);
}

function fetch(url, options = {}) {
  return new Promise((resolve, reject) => {
    const urlObj = new URL(url);
    const protocol = urlObj.protocol === 'https:' ? https : http;
    
    const req = protocol.get(url, options, (res) => {
      let data = '';
      res.on('data', (chunk) => {
        data += chunk;
      });
      res.on('end', () => {
        resolve({ status: res.statusCode, headers: res.headers, body: data });
      });
    });
    
    req.on('error', (error) => {
      reject(error);
    });
    
    req.setTimeout(30000, () => {
      req.destroy();
      reject(new Error('Request timeout'));
    });
  });
}

async function testRenderingService(name, url, description) {
  log(`\n${description}`, 'yellow');
  log(`Testing: ${url}`, 'blue');
  log('---', 'reset');
  
  try {
    const response = await fetch(url);
    log(`Status: ${response.status}`, response.status === 200 ? 'green' : 'red');
    
    // Extract key content indicators
    const body = response.body;
    const hasReferenceContent = body.includes('Reference Content');
    const hasDomoEmbed = body.includes('Domo Dashboard Embed') || body.includes('domo');
    const hasIframe = body.includes('<iframe') || body.includes('iframe');
    const hasMetadata = body.includes('application/ld+json');
    
    log('\nContent Analysis:', 'yellow');
    log(`  Reference Content: ${hasReferenceContent ? '✅' : '❌'}`, hasReferenceContent ? 'green' : 'red');
    log(`  Domo Embed Section: ${hasDomoEmbed ? '✅' : '❌'}`, hasDomoEmbed ? 'green' : 'red');
    log(`  Iframe Tags: ${hasIframe ? '✅' : '❌'}`, hasIframe ? 'green' : 'red');
    log(`  Structured Data: ${hasMetadata ? '✅' : '❌'}`, hasMetadata ? 'green' : 'red');
    
    // Show first 500 characters of HTML
    log('\nHTML Preview (first 500 chars):', 'yellow');
    log(body.substring(0, 500).replace(/\n/g, ' ') + '...', 'reset');
    
    return {
      name,
      status: response.status,
      hasReferenceContent,
      hasDomoEmbed,
      hasIframe,
      hasMetadata,
    };
  } catch (error) {
    log(`Error: ${error.message}`, 'red');
    return { name, error: error.message };
  }
}

async function main() {
  const url = process.argv[2];
  
  if (!url) {
    log('Error: Please provide a URL to test', 'red');
    log('Usage: node test-rendering.js <your-url>', 'yellow');
    log('Example: node test-rendering.js https://your-project.netlify.app', 'yellow');
    process.exit(1);
  }
  
  log(`\n🚀 Testing Dynamic Rendering for: ${url}`, 'green');
  log('=' .repeat(60), 'reset');
  
  const results = [];
  
  // Test 1: Prerender.io
  const prerenderToken = process.env.PRERENDER_TOKEN || 'OSFXAsR7yFJ3gQ2T8vUP';
  const prerenderUrl = prerenderToken 
    ? `https://service.prerender.io/render?token=${prerenderToken}&url=${encodeURIComponent(url)}`
    : `https://service.prerender.io/${url}`;
  results.push(await testRenderingService('Prerender.io', prerenderUrl, 'Test 1: Prerender.io'));
  
  // Test 2: Rendertron
  const rendertronUrl = `https://render-tron.appspot.com/render/${url}`;
  results.push(await testRenderingService('Rendertron', rendertronUrl, 'Test 2: Rendertron'));
  
  // Test 3: Direct fetch with Googlebot User-Agent
  try {
    const googlebotResponse = await fetch(url, {
      headers: {
        'User-Agent': 'Googlebot/2.1 (+http://www.google.com/bot.html)',
      },
    });
    results.push(await testRenderingService('Googlebot Direct', url, 'Test 3: Direct fetch with Googlebot User-Agent'));
  } catch (error) {
    log(`Error testing direct fetch: ${error.message}`, 'red');
  }
  
  // Summary
  log('\n' + '='.repeat(60), 'reset');
  log('📊 Test Summary', 'green');
  log('='.repeat(60), 'reset');
  
  results.forEach((result) => {
    if (result.error) {
      log(`\n${result.name}: ❌ Error - ${result.error}`, 'red');
    } else {
      log(`\n${result.name}:`, 'yellow');
      log(`  Status: ${result.status}`, result.status === 200 ? 'green' : 'red');
      log(`  Reference Content: ${result.hasReferenceContent ? '✅' : '❌'}`);
      log(`  Domo Embed: ${result.hasDomoEmbed ? '✅' : '❌'}`);
      log(`  Iframe Tags: ${result.hasIframe ? '✅' : '❌'}`);
      log(`  Structured Data: ${result.hasMetadata ? '✅' : '❌'}`);
    }
  });
  
  log('\n✅ Testing complete!', 'green');
  log('\nNext steps:', 'yellow');
  log('1. Review the rendered HTML output above');
  log('2. Check if Domo iframe content is visible in rendered HTML');
  log('3. Compare with the original page source');
  log('4. Document findings in the test results section of index.html');
}

main().catch((error) => {
  log(`Fatal error: ${error.message}`, 'red');
  process.exit(1);
});

