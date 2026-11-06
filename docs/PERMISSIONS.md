# Permissions Guide

Complete guide to the OpenCode permission system.

---

## Overview

OpenCode uses a permission system to control what each agent can do. Permissions are defined as ordered rules that allow, deny, or ask for approval before an agent uses a tool on a matching resource.

---

## Permission Structure

Each permission rule has three parts:

```yaml
permissions:
  - action: <tool_or_action>
    resource: <pattern>
    effect: <allow|deny|ask>
```

### Fields

| Field | Description | Examples |
|-------|-------------|---------|
| `action` | Tool or permission action | `edit`, `shell`, `read` |
| `resource` | Path, command, or pattern | `src/**`, `npm test`, `*` |
| `effect` | What to do with the match | `allow`, `deny`, `ask` |

---

## Permission Effects

| Effect | Meaning | Use Case |
|--------|---------|----------|
| `allow` | Always permitted | Safe operations |
| `deny` | Always blocked | Dangerous operations |
| `ask` | Requires user approval | Potentially risky operations |

---

## Available Actions

### File Operations

| Action | Covers |
|--------|--------|
| `edit` | Edit, write, patch tools |
| `write` | Write tool |
| `read` | Read tool |
| `external_directory` | Access outside workspace |

### Search Operations

| Action | Covers |
|--------|--------|
| `glob` | Glob tool |
| `grep` | Grep tool |
| `read` | Read tool |

### Command Execution

| Action | Covers |
|--------|--------|
| `shell` | Shell commands |

### Agent Operations

| Action | Covers |
|--------|--------|
| `subagent` | Launching child agents |

### Web Operations

| Action | Covers |
|--------|--------|
| `webfetch` | Fetch web content |
| `websearch` | Search the web |

### Skill Operations

| Action | Covers |
|--------|--------|
| `skill` | Load skills |

### Wildcard

| Action | Covers |
|--------|--------|
| `*` | All actions |

---

## Resource Patterns

### File Paths

```yaml
# All files
resource: "*"

# All files in src directory
resource: "src/**"

# Specific file
resource: "config/database.yml"

# All JSON files
resource: "**/*.json"

# Home directory (expanded)
resource: "~/notes/**"
```

### Shell Commands

```yaml
# All commands
resource: "*"

# Specific command
resource: "npm test"

# Command prefix
resource: "git *"

# Multiple commands
resource: "npm *"
```

### Agent IDs

```yaml
# All agents
resource: "*"

# Specific agent
resource: "explore"

# Multiple agents
resource: "explore|general"
```

---

## Permission Matching Rules

### Last Matching Rule Wins

```yaml
permissions:
  # First: deny all editing
  - action: edit
    resource: "*"
    effect: deny
  # Then: allow editing in src
  - action: edit
    resource: "src/**"
    effect: allow
  # Finally: deny editing in src/tests
  - action: edit
    resource: "src/tests/**"
    effect: deny
```

**Result:** Can edit files in `src/` except `src/tests/`

### Wildcard Expansion

```yaml
# Matches all actions on all resources
- action: "*"
  resource: "*"
  effect: deny
```

### Path Expansion

For `read`, `edit`, and `external_directory`:
- `~` expands to home directory
- `$HOME` expands to home directory

```yaml
- action: read
  resource: "~/notes/**"
  effect: allow
```

**Note:** Shell resources remain raw command text without expansion.

---

## Permission Order

### Global vs Agent-Specific

1. **Global permissions** apply first
2. **Agent-specific permissions** apply after (can refine global rules)

```jsonc
{
  // Global: applies to all agents
  "permissions": [
    { "action": "shell", "resource": "*", "effect": "ask" }
  ],
  "agents": {
    "build": {
      // Agent-specific: refines global
      "permissions": [
        { "action": "shell", "resource": "git status", "effect": "allow" }
      ]
    }
  }
}
```

### Rule Ordering

Rules are evaluated in order. The **last matching rule wins**:

```yaml
permissions:
  # Broad rule first
  - action: shell
    resource: "*"
    effect: ask
  # Specific exception
  - action: shell
    resource: "npm test"
    effect: allow
  # Another exception
  - action: shell
    resource: "npm run build"
    effect: allow
```

---

## Common Permission Patterns

### Read-Only Agent

```yaml
permissions:
  # Deny all by default
  - action: "*"
    resource: "*"
    effect: deny
  # Allow reading
  - action: read
    resource: "*"
    effect: allow
  # Allow searching
  - action: glob
    resource: "*"
    effect: allow
  - action: grep
    resource: "*"
    effect: allow
  # Allow web access
  - action: webfetch
    resource: "*"
    effect: allow
  - action: websearch
    resource: "*"
    effect: allow
```

### Safe Q&A Agent

```yaml
permissions:
  # Deny file modifications
  - action: edit
    resource: "*"
    effect: deny
  - action: write
    resource: "*"
    effect: deny
  # Ask for shell commands
  - action: shell
    resource: "*"
    effect: ask
```

### Full Access Agent

```yaml
permissions:
  - action: "*"
    resource: "*"
    effect: allow
```

### Restricted Access Agent

```yaml
permissions:
  # Deny everything
  - action: "*"
    resource: "*"
    effect: deny
  # Allow reading specific directories
  - action: read
    resource: "src/**"
    effect: allow
  # Allow specific commands
  - action: shell
    resource: "npm test"
    effect: allow
  - action: shell
    resource: "npm run lint"
    effect: allow
```

### Subagent Permissions

```yaml
# Control which subagents can be launched
permissions:
  # Deny all subagents
  - action: subagent
    resource: "*"
    effect: deny
  # Allow specific subagents
  - action: subagent
    resource: "explore"
    effect: allow
  - action: subagent
    resource: "ask"
    effect: allow
```

---

## Permission Examples by Agent

### Ask Agent Permissions

```yaml
permissions:
  # Deny all file modifications
  - action: edit
    resource: "*"
    effect: deny
  - action: write
    resource: "*"
    effect: deny
  # Ask for shell commands
  - action: shell
    resource: "*"
    effect: ask
```

### Multi Agent Permissions

```yaml
permissions:
  # Allow launching all subagents
  - action: subagent
    resource: "*"
    effect: allow
```

### Side Agent Permissions

No restrictions (full access for independent work):
```yaml
# No explicit permissions needed
# Inherits default permissions
```

---

## Best Practices

### 1. Principle of Least Privilege

Only grant permissions that are necessary:

```yaml
# ❌ Too broad
- action: "*"
  resource: "*"
  effect: allow

# ✅ Specific
- action: read
  resource: "src/**"
  effect: allow
- action: shell
  resource: "npm test"
  effect: allow
```

### 2. Deny by Default

Start with deny, then allow specific exceptions:

```yaml
permissions:
  - action: edit
    resource: "*"
    effect: deny
  - action: edit
    resource: "src/features/**"
    effect: allow
```

### 3. Use Ask for Risky Operations

```yaml
# Ask before running potentially dangerous commands
- action: shell
  resource: "rm *"
  effect: ask
- action: shell
  resource: "git push *"
  effect: ask
```

### 4. Protect Sensitive Files

```yaml
# Protect config files
- action: edit
  resource: ".env*"
  effect: deny
- action: read
  resource: ".env*"
  effect: ask
```

### 5. Test Your Permissions

After setting permissions, test them:

```
# Test if ask agent can't edit
ask the ask agent to edit this file

# Should be denied or ask for permission
```

---

## Debugging Permissions

### Check Agent Permissions

Review the agent's `.md` file:
```bash
cat .opencode/agents/ask.md
```

### Verify Permission Rules

Ensure rules are in correct order (last match wins):
```yaml
# This ALLOWS editing in src (last rule wins)
permissions:
  - action: edit
    resource: "*"
    effect: deny
  - action: edit
    resource: "src/**"
    effect: allow
```

### Common Issues

1. **Permission not working**: Check rule order
2. **Agent blocked unexpectedly**: Check for deny rules
3. **Agent too permissive**: Add deny rules

---

## Global Permissions

Set permissions that apply to all agents:

```jsonc
{
  "permissions": [
    { "action": "shell", "resource": "git push *", "effect": "ask" },
    { "action": "edit", "resource: ".env*", "effect": "deny" }
  ]
}
```

These apply before agent-specific permissions.

---

## Advanced Patterns

### Time-Based Restrictions

Not directly supported, but you can create different agents:
- `reviewer-day` - More permissive
- `reviewer-night` - More restrictive

### Context-Aware Permissions

Use different agents for different contexts:
- `frontend-agent` - Can edit `src/frontend/**`
- `backend-agent` - Can edit `src/backend/**`

### Project-Specific Permissions

Create project-specific agents:
```
.opencode/agents/
├── frontend-dev.md    # Frontend-focused
├── backend-dev.md     # Backend-focused
└── reviewer.md        # Read-only reviewer
```

---

## Resources

- [OpenCode Permissions Docs](https://opencode.ai/v2/docs/permissions)
- [AGENTS_GUIDE.md](AGENTS_GUIDE.md) - Full agent documentation
- [CUSTOMIZATION.md](CUSTOMIZATION.md) - How to customize agents

---

**Master permissions to keep your codebase safe! 🔒**