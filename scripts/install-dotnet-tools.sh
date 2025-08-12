#!/bin/bash

# Install Essential .NET Global Tools
# This script installs commonly used .NET global tools for development

set -e

CYAN='\033[0;36m'
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${CYAN}🔧 Installing Essential .NET Global Tools...${NC}"
echo ""

# Add tools path to current session
export PATH="$PATH:$HOME/.dotnet/tools"

# Essential tools for .NET development
tools=(
    "dotnet-ef:Entity Framework Core tools"
    "Microsoft.dotnet-httprepl:HTTP REPL for testing APIs"
    "dotnet-watch:File watcher for development"
    "dotnet-dump:Dump collection and analysis utility"
    "dotnet-counters:Performance monitoring counters"
    "dotnet-trace:Performance tracing tool" 
    "Microsoft.Web.LibraryManager.Cli:Library Manager CLI (libman)"
    "powershell:PowerShell Core"
    "dotnet-outdated-tool:Check for outdated NuGet packages"
    "dotnet-reportgenerator-globaltool:Code coverage report generator"
)

echo "Installing .NET tools:"
for tool_info in "${tools[@]}"; do
    tool=$(echo "$tool_info" | cut -d':' -f1)
    description=$(echo "$tool_info" | cut -d':' -f2)
    
    echo "  • $tool - $description"
    if dotnet tool list --global | grep -q "$tool"; then
        echo "    Already installed"
    else
        dotnet tool install --global "$tool" > /dev/null 2>&1
        echo "    ✅ Installed"
    fi
done

echo ""
echo -e "${GREEN}✅ .NET tools installation complete!${NC}"
echo ""
echo "Available commands:"
dotnet tool list --global | tail -n +2 | while read -r line; do
    command=$(echo "$line" | awk '{print $3}')
    echo "  • $command"
done

echo ""
echo "To verify tools are working, restart your terminal or run:"
echo "  source ~/.zprofile"
