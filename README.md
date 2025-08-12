# 🛠️ Schalk's Dotfiles

A comprehensive macOS development environment setup with multi-profile GitHub support, multiple programming languages, and productivity enhancements.

## 🚀 Quick Install

```bash
curl -sSL https://raw.githubusercontent.com/schalkuz/dotfiles/main/install.sh | bash
```

## ✨ What's Included

### 🔧 Development Tools
- **Homebrew** - Package manager for macOS
- **GitHub CLI** - Command line interface for GitHub
- **Python** via UV - Modern Python package and project manager
- **Node.js** via NVM - Node Version Manager for multiple Node.js versions
- **Go** via GVM - Go Version Manager for multiple Go versions
- **C/C++** - Xcode Command Line Tools with CMake and pkg-config
- **.NET** - Multiple SDK versions (8, 9, 10 preview)

### 📁 Project Organization
- `~/Code/work/` - Work repositories with automatic work profile
- `~/Code/personal/` - Personal repositories with automatic personal profile

### 🔀 Multi-Profile Git Setup
- **Work Profile**: `schalk-conradie` + `schalk.conradie@ec.co.za`
- **Personal Profile**: `schalkuz` + `schalkuz.sc@gmail.com`
- Automatic profile switching per repository

### 🛠️ Custom Scripts
- `dev` - Development environment cheat sheet
- `devenv` - Development environment manager
- `git-profile` - Git profile switcher
- `git-clone` - Enhanced git clone with automatic profile setup
- `mkproject` - Quick project setup function
- `status` - Quick development environment status

## 📚 Available Commands

### 🎯 Most Used Commands
```bash
dev                    # Development cheat sheet (your best friend!)
devenv                 # Development environment manager
git-profile personal   # Switch to personal GitHub profile
git-profile work       # Switch to work GitHub profile
cdpersonal            # Go to personal projects directory
cdwork                # Go to work projects directory
```

### 📦 Project Management
```bash
git-clone <repo-url> personal    # Clone to personal folder + setup profile
git-clone <repo-url> work        # Clone to work folder + setup profile
git-clone <repo-url>             # Auto-detect profile from URL

mkproject myapp python          # Create new Python project
mkproject webapp node           # Create new Node.js project
mkproject service go             # Create new Go project
mkproject api dotnet            # Create new .NET console project
mkproject webapi webapi         # Create new .NET Web API project
```

### 🔧 Development Environment
```bash
devenv status                    # Show all tool versions
devenv python install 3.11      # Install Python 3.11
devenv node install 20          # Install Node.js v20
devenv go install 1.21.0        # Install Go 1.21.0
devenv dotnet                   # Show .NET information and commands
```

### ⚡ Quick Shortcuts
```bash
py script.py                    # Run Python script (uv run python)
pyi package                     # Add Python package (uv add)
pyin                            # Initialize Python project (uv init)
node-list                       # List Node.js versions (nvm list)
node-use 18                     # Switch to Node.js v18 (nvm use 18)
go-list                         # List Go versions (gvm list)
go-use 1.21.0                   # Switch to Go version (gvm use)
dotnet-sdks                     # List .NET SDKs (dotnet --list-sdks)
dotnet-info                     # Show .NET info (dotnet --info)
```

## 🎯 Example Workflows

### 📝 Start New Personal Python Project
```bash
cdpersonal
mkproject my-awesome-app python
# or
git-clone https://github.com/schalkuz/my-app personal
```

### 💼 Start New Work Node.js Project
```bash
cdwork
mkproject company-dashboard node
# or
git-clone https://github.com/company/dashboard work
```

### 🔷 Start New .NET Project
```bash
cdpersonal
mkproject my-api webapi         # Web API project
# or
mkproject console-app dotnet    # Console application
```

### 🔄 Switch Between Language Versions
```bash
devenv python install 3.11 && uv python pin 3.11
devenv node use 18
devenv go use 1.21.0
dotnet --list-sdks              # Check available .NET versions
```

## 📂 Directory Structure

```
~/.dotfiles/                 # This repository
├── install.sh              # Main installer script
├── bin/                    # Custom scripts
│   ├── dev                 # Development cheat sheet
│   ├── devenv             # Environment manager
│   ├── git-profile        # Git profile switcher
│   └── git-clone          # Enhanced git clone
├── config/                # Configuration files
│   └── zprofile          # Zsh configuration
└── README.md              # This file

~/Code/                    # Your development workspace
├── work/                 # Work repositories
└── personal/             # Personal repositories
```

## 🔄 Manual Installation

If you prefer to install manually:

1. **Clone the repository**
   ```bash
   git clone https://github.com/schalkuz/dotfiles.git ~/.dotfiles
   cd ~/.dotfiles
   ```

2. **Run the installer**
   ```bash
   ./install.sh
   ```

3. **Restart your terminal or source the profile**
   ```bash
   source ~/.zprofile
   ```

## 🔧 Customization

### Adding Your Own Scripts
1. Add scripts to `bin/` directory
2. Make them executable: `chmod +x bin/yourscript`
3. Commit and push changes

### Modifying Aliases
Edit `config/zprofile` to add or modify aliases and functions.

### Environment Specific Settings
The installer will prompt for your Git name and setup profiles for:
- Work: `schalk.conradie@ec.co.za` with GitHub user `schalk-conradie`
- Personal: `schalkuz.sc@gmail.com` with GitHub user `schalkuz`

## 🆕 Updates

To update your dotfiles:

```bash
cd ~/.dotfiles
git pull
./install.sh  # Re-run installer to update scripts and config
```

## ❓ Troubleshooting

### Command not found
If custom commands aren't working:
```bash
source ~/.zprofile
# or restart your terminal
```

### Version managers not loading
```bash
# Check if they're installed
which nvm
which gvm
ls ~/.local/bin/uv

# Reload shell configuration
source ~/.zprofile
```

### Git profile issues
```bash
git-profile status        # Check current profile
git config --list | grep user  # Check git config
```

## 🤝 Contributing

Feel free to fork and customize for your own use! If you have improvements that would benefit others, pull requests are welcome.

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

---

**Happy Coding!** 🚀

Run `dev` anytime you need a reminder of available commands!
