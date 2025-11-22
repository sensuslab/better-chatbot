#!/bin/bash

# MCP Configuration Save Issue - Quick Fix Script
# This script resolves issues with saving MCP configurations after UI rebranding

set -e

echo "═══════════════════════════════════════════════════════════"
echo "  MCP/Extensions Configuration Save - Quick Fix"
echo "═══════════════════════════════════════════════════════════"
echo ""

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_info() {
    echo "ℹ $1"
}

# Check if we're in the right directory
if [ ! -f "package.json" ]; then
    print_error "package.json not found. Please run this script from the project root."
    exit 1
fi

print_success "Found package.json"

# Step 1: Verify translation file
echo ""
print_info "Step 1: Verifying translation file..."
if [ -f "messages/en.json" ]; then
    print_success "Translation file exists"

    # Validate JSON syntax
    if command -v python3 &> /dev/null; then
        if python3 -m json.tool messages/en.json > /dev/null 2>&1; then
            print_success "Translation file JSON syntax is valid"
        else
            print_error "Translation file has invalid JSON syntax"
            exit 1
        fi
    elif command -v node &> /dev/null; then
        if node -e "require('./messages/en.json')" > /dev/null 2>&1; then
            print_success "Translation file JSON syntax is valid"
        else
            print_error "Translation file has invalid JSON syntax"
            exit 1
        fi
    else
        print_warning "Could not validate JSON (no python3 or node found)"
    fi
else
    print_error "Translation file not found at messages/en.json"
    exit 1
fi

# Step 2: Clean Next.js cache
echo ""
print_info "Step 2: Cleaning Next.js cache..."
if [ -d ".next" ]; then
    rm -rf .next
    print_success "Removed .next directory"
else
    print_warning ".next directory not found (already clean)"
fi

# Step 3: Clean node_modules cache (optional)
echo ""
read -p "Do you want to reinstall node_modules? (This may take a few minutes) [y/N] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    print_info "Step 3a: Removing node_modules..."
    rm -rf node_modules
    print_success "Removed node_modules directory"

    print_info "Step 3b: Running npm install..."
    npm install
    print_success "Dependencies reinstalled"
else
    print_info "Skipping node_modules reinstallation"
fi

# Step 4: Verify critical files unchanged
echo ""
print_info "Step 4: Verifying critical files..."

# Check if API route exists
if [ -f "src/app/api/mcp/route.ts" ]; then
    print_success "MCP API route exists"
else
    print_error "MCP API route not found"
    exit 1
fi

# Check if MCP editor exists
if [ -f "src/components/mcp-editor.tsx" ]; then
    print_success "MCP editor component exists"
else
    print_error "MCP editor component not found"
    exit 1
fi

# Step 5: Build test (optional)
echo ""
read -p "Do you want to test the build? [y/N] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    print_info "Running build test..."
    if npm run build; then
        print_success "Build completed successfully"
    else
        print_error "Build failed. Check the errors above."
        exit 1
    fi
fi

# Step 6: Final instructions
echo ""
echo "═══════════════════════════════════════════════════════════"
print_success "Fix completed successfully!"
echo "═══════════════════════════════════════════════════════════"
echo ""
print_info "Next steps:"
echo "  1. Start the development server:"
echo "     ${GREEN}npm run dev${NC}"
echo ""
echo "  2. Open your browser and test MCP configuration:"
echo "     - Go to http://localhost:3000/mcp"
echo "     - Click 'Add Custom Extension'"
echo "     - Try saving a test configuration"
echo ""
echo "  3. If the issue persists:"
echo "     - Clear your browser cache (Ctrl+Shift+R or Cmd+Shift+R)"
echo "     - Check browser console for errors (F12)"
echo "     - Review ${YELLOW}MCP_SAVE_ISSUE_ANALYSIS.md${NC} for detailed troubleshooting"
echo ""
print_warning "If you're running in production, use 'npm start' instead of 'npm run dev'"
echo ""
