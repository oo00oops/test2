#!/bin/bash

# GitHub Pages Local Testing Script
# This script helps you test the site locally before pushing to GitHub

set -e

echo "================================"
echo "EaglercraftX GitHub Pages Setup"
echo "================================"
echo ""

# Check if Java is installed
if ! command -v java &> /dev/null; then
    echo "Error: Java is not installed or not in PATH"
    echo "Please install Java 11 or later (Java 17 recommended)"
    exit 1
fi

echo "Java version:"
java -version
echo ""

# Check which step to run
if [ "$1" = "build" ] || [ "$1" = "" ]; then
    echo "Step 1: Compiling EPK..."
    if [ -f "./CompileEPK.sh" ]; then
        ./CompileEPK.sh
    else
        echo "Error: CompileEPK.sh not found"
        exit 1
    fi
    echo "EPK compilation complete!"
    echo ""
    
    echo "Step 2: Compiling JavaScript..."
    if [ -f "./CompileJS.sh" ]; then
        ./CompileJS.sh
    else
        echo "Error: CompileJS.sh not found"
        exit 1
    fi
    echo "JavaScript compilation complete!"
    echo ""
fi

if [ "$1" = "serve" ] || [ "$1" = "" ]; then
    echo "Step 3: Starting local HTTP server..."
    echo ""
    
    if ! command -v python3 &> /dev/null; then
        echo "Error: Python 3 is not installed"
        echo "Please install Python 3"
        exit 1
    fi
    
    cd javascript/
    echo "Server running at: http://localhost:8000/"
    echo "Press Ctrl+C to stop"
    echo ""
    python3 -m http.server 8000
fi

if [ "$1" = "help" ]; then
    echo "Usage: ./setup-github-pages.sh [command]"
    echo ""
    echo "Commands:"
    echo "  (no command)  - Build and serve locally"
    echo "  build         - Only compile the project"
    echo "  serve         - Only start local server (assumes already built)"
    echo "  help          - Show this help message"
    echo ""
fi
