# Quick Start Guide

Get up and running with the OpenCode Agent Toolkit in minutes.

---

## 📋 Available Agents

| Agent | Mode | Purpose | Safe? |
|-------|------|---------|-------|
| **Ask** 💡 | All | Q&A without code changes | ✅ Read-only |
| **Multi** 🎯 | Primary | Orchestrate multiple agents | ⚠️ Full access |
| **Side** 🔄 | Subagent | Parallel independent work | ⚠️ Full access |

---

## 🚀 Quick Commands

### Switch to Multi Agent
```
switch to multi
```

### Use Side Agent (Parallel Work)
```
use the side subagent to research authentication patterns
```

### Ask Questions Safely
```
ask the ask agent to explain the database schema
```

---

## 💡 Common Patterns

### Pattern 1: Safe Exploration
```
ask the ask agent to analyze the project structure
```
- ✅ Cannot modify files
- ✅ Great for learning
- ✅ Perfect for code reviews

### Pattern 2: Parallel Research
```
use the side subagent to research best practices for error handling while I work on the UI
```
- Runs independently
- Reports findings when done
- Doesn't block your work

### Pattern 3: Complex Analysis
```
switch to multi
Review the entire authentication system for:
- Security vulnerabilities
- Performance bottlenecks
- Missing documentation
```
- Breaks down into subtasks
- Launches multiple agents
- Aggregates results

---

## 🎯 When to Use Which Agent

### Use Ask Agent When:
- ✅ You want to understand how something works
- ✅ You need architecture recommendations
- ✅ You're exploring a new codebase
- ✅ You want safe, read-only analysis

### Use Multi Agent When:
- ✅ You have a complex, multi-faceted task
- ✅ Work can be broken into independent pieces
- ✅ You need different specialists working together
- ✅ You want comprehensive analysis across multiple areas

### Use Side Agent When:
- ✅ You need research done while you work on something else
- ✅ A task can run independently without immediate integration
- ✅ You want to parallelize work
- ✅ You need background analysis

---

## ⚡ Speed Commands

### Ask Agent Shortcuts
```
ask the ask agent what this function does
ask the ask agent to explain the API structure
ask the ask agent for security recommendations
```

### Side Agent Shortcuts
```
use the side subagent to research GraphQL best practices
use the side subagent to analyze performance patterns
use the side subagent to find similar implementations
```

### Multi Agent Power Commands
```
switch to multi
Analyze the codebase for security, performance, and documentation gaps
```

```
switch to multi
Implement a complete authentication system with login, logout, and password reset
```

---

## 🔄 Workflow Examples

### Workflow 1: Learning a New Codebase
```
ask the ask agent to explain the overall architecture
ask the ask agent to identify the main components
ask the ask agent to explain the database schema
```

### Workflow 2: Parallel Development
```
# Main thread: Work on frontend
use the side subagent to research API integration patterns

# Meanwhile, side agent works independently
```

### Workflow 3: Comprehensive Refactoring
```
switch to multi
Plan and execute a refactoring of the authentication module with:
1. Security improvements
2. Performance optimizations
3. Better error handling
4. Updated documentation
```

---

## 🛠️ Configuration Quickies

### Set Multi as Default
Edit `.opencode/opencode.jsonc`:
```jsonc
{
  "default_agent": "multi"
}
```

### Change Agent Model
Edit agent file (e.g., `.opencode/agents/ask.md`):
```yaml
---
model: openai/gpt-4-turbo
---
```

### Reload After Changes
```
/reload
```

---

## 📊 Permission Levels

| Agent | Edit Files | Run Commands | Launch Agents | Web Access |
|-------|-----------|--------------|---------------|------------|
| Ask | ❌ No | ⚠️ Ask | ❌ No | ✅ Yes |
| Multi | ✅ Yes | ✅ Yes | ✅ Yes | ✅ Yes |
| Side | ✅ Yes | ✅ Yes | ❌ No | ✅ Yes |

---

## 🎓 Best Practices

### 1. Start with Ask
When exploring unfamiliar code, use Ask agent first - it's safe!

### 2. Parallelize with Side
"Use the side subagent to X while I work on Y"

### 3. Orchestrate with Multi
Let Multi break down complex tasks and coordinate subagents

### 4. Be Specific
Give agents clear, focused instructions:
- ❌ "Fix the code"
- ✅ "Identify and fix the SQL injection vulnerabilities in the user authentication module"

### 5. Combine Agents
```
switch to multi
Use the ask agent to analyze the current architecture,
then use the explore agent to find all uses of deprecated functions,
then use the side agent to research migration strategies,
and finally synthesize all findings into an action plan
```

---

## 🐛 Common Issues

### Agent Not Found
```
/reload
```

### Wrong Agent Running
Check your current agent:
```
# You should see which agent is active
```

### Permission Denied
Check agent permissions in `.opencode/agents/[agent].md`

---

## 📚 Next Steps

- Read [EXAMPLES.md](EXAMPLES.md) for real-world scenarios
- Deep dive with [docs/AGENTS_GUIDE.md](docs/AGENTS_GUIDE.md)
- Customize with [docs/CUSTOMIZATION.md](docs/CUSTOMIZATION.md)

---

## 🎯 Quick Test

Test all three agents right now:

```
# Test Ask
ask the ask agent to list all available agents

# Test Side
use the side subagent to find all markdown files in this directory

# Test Multi
switch to multi
Create a brief overview of this toolkit's capabilities
```

---

**That's it! You're ready to boost your productivity! 🚀**