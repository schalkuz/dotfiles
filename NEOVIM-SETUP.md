# 🚀 AstroNvim Installation Guide

This guide helps you install AstroNvim properly to avoid common installation issues.

## 🎯 Step-by-Step Installation

### 1. Install Basic AstroNvim (Clean Setup)

```bash
cd ~/Code/personal/dotfiles
./scripts/fix-nvim.sh
```

This script:
- Cleans any existing Neovim configurations
- Installs fresh AstroNvim template
- Creates minimal working configuration

### 2. Test Basic Installation

```bash
nvim
```

**What should happen:**
- AstroNvim starts installing plugins
- You see the plugin installation progress
- No errors about "missing plugins" or "too many rounds"
- AstroNvim loads successfully with Tokyo Night theme

**Once you see AstroNvim working:**
- Press `:q` to quit
- Move to step 3

### 3. Add Language Packs (After Basic Works)

```bash
./scripts/add-language-packs.sh
```

This script adds support for:
- TypeScript/JavaScript/React
- Python with Ruff
- Go with gopls  
- C/C++ with clangd
- C#/.NET with OmniSharp (includes Blazor/Razor)
- HTML/CSS and Tailwind CSS
- JSON, YAML, Lua

### 4. Final Installation

```bash
nvim
```

- Let AstroNvim install all the language pack plugins
- Language servers will be installed automatically via Mason
- Everything should work perfectly!

## 🔧 If You Have Issues

### "Too many rounds of missing plugins" Error

This usually means too many community packs were loaded at once. Solution:

1. Run the fix script: `./scripts/fix-nvim.sh`
2. Test with minimal config first
3. Only add language packs after basic installation works

### Plugin Installation Fails

1. Check internet connection
2. Try again - sometimes GitHub rate limits cause issues
3. Clear everything and start fresh: `./scripts/fix-nvim.sh`

### Language Server Not Working

1. Open a file of that language type (e.g., `.ts`, `.py`, `.go`, `.cs`)
2. Mason will automatically prompt to install the language server
3. Or manually run `:Mason` and install servers

## ✅ Success Indicators

You'll know everything is working when:

- ✅ Neovim starts without errors
- ✅ Tokyo Night Dark theme loads
- ✅ File explorer opens with `<Space>e`
- ✅ Telescope find files works with `<Space>ff`
- ✅ Harpoon works with `<Space>ha` and `<Space>hh`
- ✅ Language servers activate when opening code files
- ✅ Auto-completion works in your programming languages

## 🎨 Terminal Setup

For the best experience:

1. **Font**: Set terminal font to "JetBrains Mono Nerd Font"
2. **Size**: 14-16pt recommended
3. **Theme**: Tokyo Night Dark (optional, matches Neovim)

## 🔑 Essential Keybindings

| Key | Action |
|-----|--------|
| `<Space>ff` | Find files |
| `<Space>fg` | Live grep |
| `<Space>fb` | Browse buffers |
| `<Space>ha` | Add to Harpoon |
| `<Space>hh` | Harpoon menu |
| `<Space>h1-4` | Jump to Harpoon files |
| `<Space>e` | File explorer |
| `<Space>gg` | Lazygit |

Happy coding! 🎉
