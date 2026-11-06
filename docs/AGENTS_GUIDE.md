# Complete Agents Guide

Comprehensive documentation for the OpenCode Agent Toolkit.

---

## Table of Contents

1. [Agent Overview](#agent-overview)
2. [Ask Agent](#ask-agent)
3. [Multi Agent](#multi-agent)
4. [Side Agent](#side-agent)
5. [Agent Modes](#agent-modes)
6. [Permission System](#permission-system)
7. [Advanced Usage](#advanced-usage)
8. [Best Practices](#best-practices)
9. [Troubleshooting](#troubleshooting)

---

## Agent Overview

The OpenCode Agent Toolkit provides three specialized agents, each designed for specific workflows:

| Agent | Mode | Primary Use | Safety Level |
|-------|------|-------------|--------------|
| **Ask** 💡 | All | Q&A, exploration, guidance | Safe (read-only) |
| **Multi** 🎯 | Primary | Orchestration, complex tasks | Full access |
| **Side** 🔄 | Subagent | Parallel work, research | Full access |

### Built-in Agents (Available by Default)

OpenCode includes these built-in agents:
- **build** - Default coding agent (primary mode)
- **plan** - Planning and exploration (primary mode)
- **explore** - Fast codebase exploration (subagent mode)
- **general** - Multi-step research (subagent mode)

---

## Ask Agent

### Purpose
The Ask agent provides safe, read-only Q&A and guidance without modifying your codebase.

### Mode
- **All** - Can be used as a primary agent or launched as a subagent

### Permissions
- ✅ Read files
- ✅ Search the web
- ✅ Explore codebase
- ❌ Edit files (blocked)
- ❌ Write files (blocked)
- ⚠️ Shell commands (requires approval)

### When to Use

**Perfect for:**
- Understanding how code works
- Architecture questions
- Code reviews without changes
- Learning new codebases
- Getting recommendations
- Exploring safely

**Avoid for:**
- Making code changes
- Running commands
- File modifications

### Examples

**Understanding Code:**
```
ask the ask agent to explain the authentication flow
```

**Architecture Questions:**
```
ask the ask agent to describe the overall system architecture
```

**Recommendations:**
```
ask the ask agent to recommend best practices for error handling
```

**Code Review:**
```
ask the ask agent to review this pull request for potential issues
```

### Advantages

1. **Safety** - Cannot accidentally modify code
2. **Clarity** - Focused on explanation, not implementation
3. **Versatility** - Works as primary agent or subagent
4. **Learning** - Perfect for exploring unfamiliar code

---

## Multi Agent

### Purpose
The Multi agent orchestrates multiple subagents to handle complex, multi-faceted tasks.

### Mode
- **Primary** - Used as a main session agent

### Permissions
- ✅ Full file system access
- ✅ Full command execution
- ✅ Launch subagents
- ✅ Web access

### Subagents Available
- `explore` - Fast codebase exploration
- `general` - Multi-step research
- `side` - Independent parallel work
- `ask` - Q&A and guidance

### When to Use

**Perfect for:**
- Large refactoring projects
- Comprehensive code analysis
- Multi-component features
- Complex research tasks
- Tasks needing different specialists
- Parallel execution opportunities

**Avoid for:**
- Simple, single-focus tasks
- Quick questions
- Minor code changes

### Examples

**Comprehensive Analysis:**
```
switch to multi
Analyze the entire codebase for:
- Security vulnerabilities
- Performance bottlenecks
- Code quality issues
- Documentation gaps
```

**Multi-Component Feature:**
```
switch to multi
Implement a complete user authentication system with:
- Login and logout
- Password reset
- Session management
- Rate limiting
- Audit logging
```

**Complex Research:**
```
switch to multi
Research and recommend a migration path from monolith to microservices
```

### Workflow

1. **Analysis** - Breaks down the task into subtasks
2. **Planning** - Identifies which subagents to use
3. **Execution** - Launches subagents (in parallel when possible)
4. **Aggregation** - Collects and synthesizes results
5. **Presentation** - Provides unified response

### Advantages

1. **Intelligence** - Strategic task decomposition
2. **Efficiency** - Parallel execution where possible
3. **Comprehensiveness** - Multiple perspectives
4. **Scalability** - Handles large, complex tasks

---

## Side Agent

### Purpose
The Side agent handles independent, parallel work alongside your main tasks.

### Mode
- **Subagent** - Can only be launched by other agents

### Permissions
- ✅ Full file system access
- ✅ Full command execution
- ❌ Cannot launch other subagents
- ✅ Web access

### When to Use

**Perfect for:**
- Background research
- Independent analysis
- Parallel exploration
- Tasks that don't need immediate integration
- Work that can run autonomously

**Avoid for:**
- Tasks requiring coordination
- Work dependent on main thread
- Interactive workflows

### Examples

**Parallel Research:**
```
use the side subagent to research authentication best practices while I implement the UI
```

**Independent Analysis:**
```
use the side subagent to analyze the database query patterns
```

**Background Exploration:**
```
use the side subagent to find all uses of deprecated functions
```

### Advantages

1. **Independence** - Works autonomously
2. **Parallelism** - Doesn't block main work
3. **Flexibility** - Handles various task types
4. **Efficiency** - Utilizes parallel execution

---

## Agent Modes

### Primary Mode
- Used as main session agent
- Full control of the session
- Can launch subagents
- Examples: `build`, `plan`, `multi`

### Subagent Mode
- Launched by primary agents
- Fresh context for each session
- Focused, specific tasks
- Examples: `explore`, `side`

### All Mode
- Can be primary or subagent
- Flexible usage
- Examples: `ask`, `general`

---

## Permission System

### Permission Actions

| Action | Description |
|--------|-------------|
| `edit` | Edit, write, patch files |
| `write` | Write new files |
| `read` | Read files |
| `shell` | Execute shell commands |
| `subagent` | Launch child agents |
| `webfetch` | Fetch web content |
| `websearch` | Search the web |
| `skill` | Load skills |
| `*` | All actions |

### Permission Effects

| Effect | Meaning |
|--------|---------|
| `allow` | Always permitted |
| `deny` | Always blocked |
| `ask` | Requires user approval |

### Permission Matching

Permissions use glob patterns:
- `*` matches everything
- `src/**` matches all files in src
- `npm *` matches all npm commands

### Permission Order

Last matching rule wins:
```yaml
permissions:
  - action: shell
    resource: "*"
    effect: ask      # Ask for all commands
  - action: shell
    resource: "npm test"
    effect: allow    # But allow npm test
```

---

## Advanced Usage

### Combining Agents

**Strategic Workflow:**
```
# 1. Understand with Ask
ask the ask agent to explain the current architecture

# 2. Research with Side
use the side subagent to research modern alternatives

# 3. Implement with Multi
switch to multi
Implement the modernized architecture
```

### Parallel Execution

**Research in Parallel:**
```
switch to multi
Research three different approaches to caching:
1. Use ask to analyze current caching
2. Use side to research Redis patterns
3. Use explore to find all cache usage
Then synthesize findings
```

### Agent Specialization

**Customize for Your Needs:**
```yaml
# In .opencode/agents/custom.md
---
description: Your specialized agent
mode: subagent
permissions:
  - action: edit
    resource: "src/components/**"
    effect: allow
  - action: edit
    resource: "*"
    effect: deny
---
```

---

## Best Practices

### 1. Choose the Right Agent

| Goal | Recommended Agent |
|------|-------------------|
| Understand code | Ask |
| Safe exploration | Ask |
| Parallel research | Side |
| Complex orchestration | Multi |
| Multi-component work | Multi |

### 2. Be Specific in Instructions

❌ **Too Vague:**
```
ask the ask agent to review the code
```

✅ **Specific:**
```
ask the ask agent to review the authentication middleware for security vulnerabilities, focusing on SQL injection and XSS risks
```

### 3. Leverage Parallelism

Use Side agent for tasks that can run independently:
```
use the side subagent to research GraphQL subscriptions while I implement the REST API
```

### 4. Use Multi for Complexity

Let Multi break down complex tasks:
```
switch to multi
Implement a complete notification system with real-time updates, email alerts, and SMS notifications
```

### 5. Iterate and Refine

Start with understanding, then move to action:
```
# Understand
ask the ask agent to explain the current implementation

# Research
use the side subagent to research improvements

# Act
switch to multi
Implement the improvements
```

---

## Troubleshooting

### Agent Not Appearing

**Problem:** Custom agent doesn't show up

**Solutions:**
1. Reload OpenCode: `/reload`
2. Check file location: `.opencode/agents/[name].md`
3. Verify frontmatter starts with `---`
4. Check for syntax errors in YAML frontmatter

### Agent Can't Launch Subagents

**Problem:** Multi agent can't launch subagents

**Solution:** Add permission:
```yaml
permissions:
  - action: subagent
    resource: "*"
    effect: allow
```

### Agent Making Unwanted Changes

**Problem:** Agent modifies files unexpectedly

**Solution:** Add deny rules:
```yaml
permissions:
  - action: edit
    resource: "*"
    effect: deny
  - action: write
    resource: "*"
    effect: deny
```

### Wrong Model Being Used

**Problem:** Agent uses wrong model

**Solution:** Specify explicitly:
```yaml
model: anthropic/claude-sonnet-5-5
```

### Subagent Depth Issues

**Problem:** Subagent can't launch its own subagents

**Explanation:** Default subagent depth is 1

**Solution:** Configure in `opencode.jsonc`:
```jsonc
{
  "experimental": {
    "subagent_depth": 2
  }
}
```

---

## Additional Resources

- [PERMISSIONS.md](PERMISSIONS.md) - Detailed permission guide
- [CUSTOMIZATION.md](CUSTOMIZATION.md) - Customization guide
- [QUICK_START.md](../QUICK_START.md) - Quick reference
- [EXAMPLES.md](../EXAMPLES.md) - Real-world examples
- [OpenCode Docs](https://opencode.ai/v2/docs/) - Official documentation

---

**Master these agents to supercharge your productivity! 🚀**