# Customization Guide

Learn how to customize and extend the OpenCode Agent Toolkit.

---

## Table of Contents

1. [Agent File Format](#agent-file-format)
2. [Customizing Existing Agents](#customizing-existing-agents)
3. [Creating New Agents](#creating-new-agents)
4. [Model Configuration](#model-configuration)
5. [System Prompts](#system-prompts)
6. [Advanced Customization](#advanced-customization)
7. [Agent Templates](#agent-templates)
8. [Team Customization](#team-customization)

---

## Agent File Format

Agents are defined in Markdown files with YAML frontmatter:

```markdown
---
description: What this agent does
mode: primary | subagent | all
model: provider/model-name
permissions:
  - action: <action>
    resource: <pattern>
    effect: allow | deny | ask
steps: 10
color: "#ff6b6b"
hidden: false
---

Your system prompt goes here.
This defines the agent's behavior and instructions.
```

### Frontmatter Fields

| Field | Type | Description |
|-------|------|-------------|
| `description` | string | What the agent does |
| `mode` | string | primary, subagent, or all |
| `model` | string | Provider/model format |
| `permissions` | list | Permission rules |
| `steps` | number | Max reasoning steps |
| `color` | string | UI color (hex) |
| `hidden` | boolean | Hide from listings |

---

## Customizing Existing Agents

### Change the Model

Edit any agent file and update the `model` field:

```yaml
---
model: openai/gpt-4-turbo
---
```

Or use expanded form in JSONC:
```jsonc
{
  "agents": {
    "ask": {
      "model": {
        "providerID": "openai",
        "model": "gpt-4-turbo",
        "variant": "high"
      }
    }
  }
}
```

### Adjust Permissions

Add or modify permission rules:

```yaml
---
permissions:
  # Allow specific shell commands
  - action: shell
    resource: "npm test"
    effect: allow
  - action: shell
    resource: "npm run lint"
    effect: allow
  # Deny dangerous commands
  - action: shell
    resource: "rm -rf *"
    effect: deny
---
```

### Modify System Prompt

Edit the markdown content below the frontmatter:

```markdown
---
description: Custom ask agent
mode: all
---

You are a specialized assistant for our team. Your role:

1. Always reference our coding standards
2. Suggest TypeScript first
3. Prefer functional programming patterns
4. Include security considerations
5. Reference our internal documentation
```

### Change Agent Mode

Switch between primary, subagent, or all:

```yaml
# Make side agent available as primary
mode: all

# Make ask agent subagent only
mode: subagent
```

### Set Step Limits

Limit reasoning steps:

```yaml
steps: 8
```

On the final step, tools are removed and the agent summarizes in text.

### Customize UI Color

Set a custom color:

```yaml
color: "#ff6b6b"
```

---

## Creating New Agents

### Step 1: Create the File

```bash
# Project-level
touch .opencode/agents/myagent.md

# Global
touch ~/.config/opencode/agents/myagent.md
```

### Step 2: Add Configuration

```markdown
---
description: Specialized agent for database work
mode: subagent
model: anthropic/claude-sonnet-5-5
permissions:
  - action: edit
    resource: "src/database/**"
    effect: allow
  - action: edit
    resource: "*"
    effect: deny
---

You are a database specialist agent. Your role:

1. Analyze database schemas and queries
2. Suggest optimizations
3. Review migrations
4. Identify potential issues
5. Recommend best practices

Focus on:
- PostgreSQL and MySQL patterns
- Query optimization
- Index strategies
- Data integrity
```

### Step 3: Reload OpenCode

```
/reload
```

### Step 4: Test Your Agent

```
use the myagent subagent to review the database schema
```

---

## Model Configuration

### Provider/Model Format

```yaml
model: anthropic/claude-sonnet-5-5
model: openai/gpt-4-turbo
model: google/gemini-2.5-pro
```

### Model Variants

Some models support variants:

```yaml
# Using shorthand
model: anthropic/claude-sonnet-5-5#high

# Using expanded form in JSONC
model:
  providerID: anthropic
  model: claude-sonnet-5-5
  variant: high
```

### Model Inheritance

- **Subagents** use their configured model, or inherit parent's model if none configured
- **Primary agents** use their configured model
- **Sessions** store their selected model separately

### Choosing the Right Model

| Use Case | Recommended Model |
|----------|-------------------|
| Complex reasoning | anthropic/claude-sonnet-5-5 |
| Fast responses | anthropic/claude-haiku |
| General tasks | openai/gpt-4-turbo |
| Cost-sensitive | anthropic/claude-haiku |

---

## System Prompts

### Best Practices

1. **Be Specific**: Clearly define the agent's role
2. **Set Boundaries**: What it can and cannot do
3. **Define Workflow**: How it should approach tasks
4. **Include Context**: Domain-specific knowledge
5. **Set Tone**: Professional, casual, technical

### Example: Security Reviewer

```markdown
You are a security-focused code reviewer. Your responsibilities:

1. **Identify Vulnerabilities**:
   - SQL injection
   - XSS attacks
   - Authentication bypasses
   - Authorization issues

2. **Review Patterns**:
   - Input validation
   - Output encoding
   - Session management
   - Cryptographic practices

3. **Report Format**:
   - Severity: Critical/High/Medium/Low
   - Location: File and line numbers
   - Description: Clear explanation
   - Recommendation: Fix suggestion

Always prioritize findings by severity.
```

### Example: Performance Optimizer

```markdown
You are a performance optimization specialist. Focus on:

1. **Database**: Query optimization, indexing, N+1 issues
2. **Caching**: Strategy, invalidation, layers
3. **Frontend**: Bundle size, lazy loading, rendering
4. **Backend**: Algorithm efficiency, memory usage, I/O
5. **Infrastructure**: CDN, load balancing, scaling

Provide specific, measurable recommendations.
```

---

## Advanced Customization

### Request Overlays

Per-agent header and body overlays:

```jsonc
{
  "agents": {
    "reviewer": {
      "request": {
        "headers": { "x-agent": "reviewer" },
        "body": { "temperature": 0.1 }
      }
    }
  }
}
```

**Note:** Configure active request settings on the provider or model instead.

### Nested Agent Paths

Create nested directories for organization:

```
.opencode/agents/
├── team/
│   ├── frontend.md      → team/frontend
│   └── backend.md       → team/backend
└── review/
    ├── security.md      → review/security
    └── performance.md   → review/performance
```

### Override Built-in Agents

Use the same ID to override:

```jsonc
{
  "agents": {
    "build": {
      "permissions": [
        { "action": "shell", "resource": "git push *", "effect": "ask" }
      ]
    }
  }
}
```

### Disable Built-in Agents

```jsonc
{
  "agents": {
    "plan": { "disabled": true }
  }
}
```

### Hide Custom Agents

```yaml
hidden: true
```

Hidden agents are removed from listings but can still be used directly.

---

## Agent Templates

### Template 1: Code Reviewer

```markdown
---
description: Reviews code for quality and best practices
mode: subagent
model: anthropic/claude-sonnet-5-5
permissions:
  - action: edit
    resource: "*"
    effect: deny
  - action: write
    resource: "*"
    effect: deny
---

You are a code review specialist. Review code for:

1. **Quality**: Clean code, readability, maintainability
2. **Correctness**: Logic errors, edge cases, error handling
3. **Performance**: Efficiency, optimization opportunities
4. **Security**: Vulnerabilities, safe practices
5. **Testing**: Coverage, test quality

Report findings with:
- File and line references
- Severity levels
- Specific recommendations
```

### Template 2: Documentation Writer

```markdown
---
description: Creates and updates documentation
mode: subagent
model: anthropic/claude-sonnet-5-5
permissions:
  - action: edit
    resource: "**/*.md"
    effect: allow
  - action: edit
    resource: "*"
    effect: deny
---

You are a documentation specialist. Create clear, comprehensive documentation:

1. **API Docs**: Endpoints, parameters, examples
2. **Code Comments**: Explain complex logic
3. **READMEs**: Setup, usage, configuration
4. **Guides**: Step-by-step tutorials
5. **Architecture**: System design documentation

Always:
- Use clear, simple language
- Include practical examples
- Keep documentation up to date
- Follow documentation best practices
```

### Template 3: Test Generator

```markdown
---
description: Generates comprehensive test suites
mode: subagent
model: anthropic/claude-sonnet-5-5
permissions:
  - action: edit
    resource: "**/*.test.*"
    effect: allow
  - action: edit
    resource: "**/*.spec.*"
    effect: allow
  - action: edit
    resource: "*"
    effect: deny
---

You are a test generation specialist. Create comprehensive tests:

1. **Unit Tests**: Individual function testing
2. **Integration Tests**: Component interaction
3. **Edge Cases**: Boundary conditions
4. **Error Cases**: Failure scenarios
5. **Performance**: Load and stress tests

Use appropriate testing frameworks and follow TDD best practices.
```

### Template 4: Frontend Developer

```markdown
---
description: Frontend development specialist
mode: subagent
model: anthropic/claude-sonnet-5-5
permissions:
  - action: edit
    resource: "src/frontend/**"
    effect: allow
  - action: edit
    resource: "src/components/**"
    effect: allow
  - action: edit
    resource: "*"
    effect: deny
---

You are a frontend development specialist. Focus on:

1. **React/Vue/Svelte**: Component development
2. **CSS/Styling**: Responsive, accessible design
3. **State Management**: Redux, Vuex, Zustand
4. **Performance**: Bundle size, rendering, lazy loading
5. **Testing**: Component tests, integration tests

Always:
- Follow accessibility guidelines (WCAG)
- Ensure responsive design
- Optimize performance
- Write clean, reusable components
```

---

## Team Customization

### Shared Team Agents

Create agents that match your team's workflow:

```markdown
---
description: Team code reviewer following our standards
mode: subagent
permissions:
  - action: edit
    resource: "*"
    effect: deny
---

You are our team's code reviewer. Apply our standards:

1. **TypeScript**: Strict typing, no any types
2. **Testing**: Minimum 80% coverage
3. **Documentation**: JSDoc for public APIs
4. **Error Handling**: Comprehensive try/catch
5. **Security**: Input validation, parameterized queries

Reference our coding standards document.
```

### Project-Specific Agents

Create agents for specific projects:

```
.opencode/agents/
├── api-developer.md      # API-focused
├── ui-designer.md        # UI-focused
├── data-analyst.md       # Data-focused
└── devops-engineer.md    # DevOps-focused
```

### Role-Based Agents

```markdown
---
description: Senior developer perspective
mode: all
---

You are a senior developer with 10+ years experience. Provide:

1. **Architecture Guidance**: Design patterns, scalability
2. **Code Review**: Quality, maintainability, best practices
3. **Mentoring**: Explain decisions, share knowledge
4. **Technical Leadership**: Guide technical decisions
5. **Risk Assessment**: Identify potential issues

Always consider long-term maintainability and team capabilities.
```

---

## Customization Checklist

- [ ] Choose appropriate model for each agent
- [ ] Set correct mode (primary/subagent/all)
- [ ] Configure permissions (least privilege)
- [ ] Write clear system prompt
- [ ] Test agent functionality
- [ ] Document customizations
- [ ] Share with team
- [ ] Version control

---

## Tips for Success

### 1. Start Simple
Begin with default configurations, then customize as needed.

### 2. Test Thoroughly
Test each agent with various tasks to ensure it behaves correctly.

### 3. Document Changes
Keep notes on what you changed and why.

### 4. Share Configurations
Version control your agents for team consistency.

### 5. Iterate
Refine prompts and permissions based on usage.

### 6. Use Descriptions
Always include clear descriptions for subagents.

### 7. Mind the Mode
Choose the right mode for each agent's purpose.

### 8. Permission Wisely
Follow the principle of least privilege.

---

## Resources

- [OpenCode Agents Docs](https://opencode.ai/v2/docs/agents)
- [OpenCode Config Docs](https://opencode.ai/v2/docs/config)
- [AGENTS_GUIDE.md](AGENTS_GUIDE.md) - Full agent documentation
- [PERMISSIONS.md](PERMISSIONS.md) - Permission system guide

---

**Customize these agents to fit your team's unique workflow! 🛠️**