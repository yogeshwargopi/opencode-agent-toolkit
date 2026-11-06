<div align="center">

# OpenCode Agent Toolkit

![OpenCode](https://img.shields.io/badge/OpenCode-Compatible-blue?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)
![Agents](https://img.shields.io/badge/Agents-3-purple?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Production%20Ready-brightgreen?style=for-the-badge)

**Enterprise-grade multi-agent toolkit for OpenCode**

[Features](#-features) • [Quick Start](#-quick-start) • [Documentation](#-documentation) • [Examples](#examples)

</div>

---

## Overview

A curated collection of production-ready OpenCode agents designed for team productivity and workflow automation. Features three specialized agents: **Ask** (safe Q&A), **Multi** (intelligent orchestration), and **Side** (parallel execution). Zero-config setup, fully customizable, and team-ready.

## 🎯 Agents Included

### 💡 Ask Agent
**Safe Q&A without code changes**

- **Mode**: All (primary or subagent)
- **Purpose**: Answer questions, explain concepts, provide guidance
- **Safety**: Cannot edit/write files, shell commands require approval
- **Best for**: Code exploration, architecture questions, learning

```bash
ask the ask agent to explain the authentication flow
```

### 🎯 Multi Agent
**Intelligent orchestration for complex tasks**

- **Mode**: Primary
- **Purpose**: Break down complex tasks, launch multiple subagents in parallel
- **Powers**: Full subagent orchestration capabilities
- **Best for**: Large refactoring, comprehensive analysis, multi-component features

```bash
switch to multi
Analyze the entire API for security, performance, and documentation
```

### 🔄 Side Agent
**Parallel independent work**

- **Mode**: Subagent
- **Purpose**: Handle tasks alongside main work
- **Strength**: Autonomous research and exploration
- **Best for**: Background research, independent analysis, parallel tasks

```bash
use the side subagent to research authentication patterns
```

---

## ✨ Features

- ✅ **Zero-Config Setup**: Copy and use immediately
- ✅ **Team-Ready**: Version-control friendly for shared projects
- ✅ **Global Option**: Install once, use everywhere
- ✅ **Fully Customizable**: Adjust models, permissions, prompts
- ✅ **Production-Ready**: Battle-tested agent configurations
- ✅ **Comprehensive Docs**: Guides, examples, and best practices

---

## 📦 Installation

### Option 1: Project-Level (Recommended for Teams)

Add to your project for version control and team consistency:

```bash
# Copy agents to your project
cp -r .opencode /path/to/your/project/

# That's it! Agents are automatically loaded
```

**Result**: Agents work in this project only, tracked in git.

---

### Option 2: Global Installation (Personal Use)

Install once, available in all your OpenCode projects:

```bash
# Run the installation script
chmod +x scripts/install-global.sh
./scripts/install-global.sh

# Reload OpenCode
/reload
```

**Result**: Agents available in all OpenCode projects (not version-controlled).

---

### Option 3: Hybrid Setup

Best of both worlds - global for you, project-level for team:

```bash
# Install globally for yourself
./scripts/install-global.sh

# And commit to project for your team
cp -r .opencode /path/to/your/project/
git add .opencode/
git commit -m "Add OpenCode agent toolkit"
```

---

## 🚀 Quick Start

### 1. Reload OpenCode
```
/reload
```

### 2. Test Your Agents

**Ask Agent (Safe Q&A)**:
```
ask the ask agent what programming language this project uses
```

**Side Agent (Parallel Work)**:
```
use the side subagent to research REST API best practices
```

**Multi Agent (Orchestration)**:
```
switch to multi
Review the codebase for security vulnerabilities and performance issues
```

---

## 📖 Documentation

- **[QUICK_START.md](QUICK_START.md)** - Quick reference and common commands
- **[EXAMPLES.md](EXAMPLES.md)** - Real-world usage scenarios
- **[docs/AGENTS_GUIDE.md](docs/AGENTS_GUIDE.md)** - Comprehensive agent documentation
- **[docs/PERMISSIONS.md](docs/PERMISSIONS.md)** - Permission system explained
- **[docs/CUSTOMIZATION.md](docs/CUSTOMIZATION.md)** - How to customize agents

---

## 🎓 Use Cases

### Code Exploration & Learning
```
ask the ask agent to explain how the database migrations work
```

### Parallel Research
```
use the side subagent to research GraphQL vs REST while I implement the frontend
```

### Comprehensive Analysis
```
switch to multi
Analyze the entire codebase for:
- Security vulnerabilities
- Performance bottlenecks
- Code quality issues
- Missing documentation
```

### Multi-Component Features
```
switch to multi
Implement a user authentication system with:
- Login/logout functionality
- Password reset
- Session management
- Rate limiting
```

---

## 📁 Project Structure

```
opencode-multiagent/
├── README.md                    # This file
├── QUICK_START.md              # Quick reference guide
├── EXAMPLES.md                 # Real-world examples
├── .opencode/
│   ├── agents/                 # Project-level agents
│   │   ├── ask.md              # Q&A agent
│   │   ├── multi.md            # Orchestrator agent
│   │   └── side.md             # Parallel task agent
│   └── opencode.jsonc          # Example configuration
├── global-setup/
│   └── agents/                 # Global installation files
│       ├── ask.md
│       ├── multi.md
│       └── side.md
├── scripts/
│   ├── install-global.sh       # Global installation
│   └── uninstall-global.sh     # Global uninstall
└── docs/
    ├── AGENTS_GUIDE.md         # Full documentation
    ├── PERMISSIONS.md          # Permission guide
    └── CUSTOMIZATION.md        # Customization guide
```

---

## ⚙️ Configuration

### Set Multi as Default Agent

Edit `.opencode/opencode.jsonc`:
```jsonc
{
  "$schema": "https://opencode.ai/config.json",
  "default_agent": "multi"
}
```

### Change Model

Edit any agent's `.md` file:
```yaml
---
model: openai/gpt-4-turbo
---
```

### Adjust Permissions

Add permission rules:
```yaml
---
permissions:
  - action: shell
    resource: "npm test"
    effect: allow
---
```

---

## 🤝 Sharing with Your Team

### 1. Add to Repository
```bash
cd your-project
git add .opencode/
git commit -m "Add OpenCode agent toolkit for team productivity"
git push
```

### 2. Team Members Install
```bash
git pull
# Agents are automatically available!
/reload
```

### 3. Verify
```
use the ask agent to list the available agents
```

---

## 🔧 Troubleshooting

### Agents Not Appearing

1. Reload OpenCode: `/reload`
2. Verify file location: `.opencode/agents/*.md`
3. Check frontmatter format (must start with `---`)

### Agent Can't Launch Subagents

Add to agent configuration:
```yaml
permissions:
  - action: subagent
    resource: "*"
    effect: allow
```

### Agent Making Unwanted Changes

Add deny permissions:
```yaml
permissions:
  - action: edit
    resource: "*"
    effect: deny
```

---

## 💡 Pro Tips

1. **Use Ask for Safe Exploration** - It can't modify your code
2. **Let Multi Orchestrate** - Describe goals, not implementation details
3. **Side for Parallelism** - "While I do X, you research Y"
4. **Customize for Your Team** - Adapt models and prompts
5. **Version Control Project Agents** - Ensures team consistency

---

## 📚 Resources

- [OpenCode Documentation](https://opencode.ai/v2/docs/)
- [Agents Guide](https://opencode.ai/v2/docs/agents)
- [Permissions Guide](https://opencode.ai/v2/docs/permissions)
- [Configuration Guide](https://opencode.ai/v2/docs/config)

---

## 📝 License

MIT License - Free for personal and commercial use.

---

## 🤝 Contributing

Contributions welcome! Feel free to:
- Add new specialized agents
- Improve existing agent prompts
- Share customizations and best practices
- Submit issues and suggestions

---

## ❓ Questions?

- Check [docs/AGENTS_GUIDE.md](docs/AGENTS_GUIDE.md) for comprehensive documentation
- Review [EXAMPLES.md](EXAMPLES.md) for real-world scenarios
- Visit [OpenCode Docs](https://opencode.ai/v2/docs/) for official documentation

---

<div align="center">

**Boost your productivity with intelligent multi-agent workflows! 🚀**

Made with ❤️ for the OpenCode community

</div>