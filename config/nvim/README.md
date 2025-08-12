# 🚀 AstroNvim Development Configuration

A clean, stable Neovim configuration built on AstroNvim using only official community packs.

## 🎨 Features

### Language Support (via AstroCommunity Packs)
- **TypeScript/JavaScript/React** - `typescript-all-in-one` pack
- **Python** - `python-ruff` pack with Ruff integration
- **Go** - `go` pack with gopls
- **C/C++** - `cpp` pack with clangd
- **C#/.NET** - `cs-omnisharp` pack (includes Blazor/Razor support)
- **Web Development** - HTML/CSS and Tailwind CSS packs
- **Configuration** - JSON, YAML, and Lua packs

### Theme & UI
- **Tokyo Night Dark** theme
- **JetBrains Mono Nerd Font** for beautiful icons
- **Noice.nvim** for enhanced UI

### Productivity
- **Harpoon** for quick file navigation
- **Auto-save** for convenience
- **TODO comments** highlighting
- **Git diff view** integration

## 🔑 Key Bindings

| Binding | Action |
|---------|--------|
| `<Space>ff` | Find files |
| `<Space>fg` | Live grep |
| `<Space>fb` | Browse buffers |
| `<Space>ha` | Add to Harpoon |
| `<Space>hh` | Harpoon menu |
| `<Space>h1-4` | Navigate to Harpoon files |
| `<Space>e` | File explorer |
| `<Space>gg` | Lazygit |

## 🔧 Installation

This configuration is automatically installed via the dotfiles installer. Language servers are installed automatically by Mason when you first open relevant files.

## 📝 Blazor/Razor Support

The configuration includes enhanced support for Blazor/Razor files:
- Proper filetype detection for `.razor` and `.cshtml` files
- HTML-like indentation
- Full C# language server integration via OmniSharp

## 🎯 Design Philosophy

This configuration prioritizes:
- **Stability** - Uses only official AstroCommunity packs
- **Simplicity** - Minimal custom configuration
- **Completeness** - Full language support out of the box
- **Maintainability** - Easy to update and extend
