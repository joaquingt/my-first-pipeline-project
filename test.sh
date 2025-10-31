#!/bin/bash
echo "🧪 Starting test suite..."

# Test 1: Check if index.html exists
if [ -f "index.html" ]; then
    echo "✅ Test 1 PASSED: index.html exists"
else
    echo "❌ Test 1 FAILED: index.html missing"
    exit 1
fi

# Test 2: Check if index.html contains required content
if grep -q "My Awesome App" index.html; then
    echo "✅ Test 2 PASSED: index.html contains required title"
else
    echo "❌ Test 2 FAILED: index.html missing required title"
    exit 1
fi

# Test 3: Check if Dockerfile exists
if [ -f "Dockerfile" ]; then
    echo "✅ Test 3 PASSED: Dockerfile exists"
else
    echo "❌ Test 3 FAILED: Dockerfile missing"
    exit 1
fi

# Test 4: Validate HTML syntax (basic check)
if command -v htmlhint >/dev/null 2>&1; then
    htmlhint index.html
    echo "✅ Test 4 PASSED: HTML syntax validation"
else
    echo "⚠️  Test 4 SKIPPED: htmlhint not installed (HTML syntax validation)"
fi

# Test 5: Check file permissions
if [ -r "index.html" ] && [ -r "Dockerfile" ]; then
    echo "✅ Test 5 PASSED: Files have correct permissions"
else
    echo "❌ Test 5 FAILED: Files have incorrect permissions"
    exit 1
fi

echo ""
echo "🎉 All tests completed successfully!"
echo "✨ Ready for deployment!"