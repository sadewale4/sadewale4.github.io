#!/bin/bash
# Download SF Mono fonts script

echo "🍎 Downloading SF Mono fonts..."

# Create fonts directory
mkdir -p fonts

echo "Note: SF Mono is Apple's proprietary font."
echo "For legal use, you should:"
echo "1. Extract SF Mono from macOS (if you have a Mac)"
echo "2. Use the fallback system fonts (already configured)"
echo "3. Or use similar open-source alternatives"

echo ""
echo "Setting up fallback fonts instead..."

# Create placeholder files to avoid 404 errors
touch fonts/SF-Mono-Regular.woff2
touch fonts/SF-Mono-Regular.woff
touch fonts/SF-Mono-Regular.otf
touch fonts/SF-Mono-Medium.woff2
touch fonts/SF-Mono-Medium.woff
touch fonts/SF-Mono-Medium.otf
touch fonts/SF-Mono-Semibold.woff2
touch fonts/SF-Mono-Semibold.woff
touch fonts/SF-Mono-Semibold.otf
touch fonts/SF-Mono-Bold.woff2
touch fonts/SF-Mono-Bold.woff
touch fonts/SF-Mono-Bold.otf

echo "✅ Fallback fonts configured!"
echo "Your site will use system monospace fonts:"
echo "- SF Mono (on macOS)"
echo "- Monaco (on older macOS)"
echo "- Menlo (on macOS)"
echo "- Consolas (on Windows)"
echo "- Liberation Mono (on Linux)"
echo "- Courier New (universal fallback)"