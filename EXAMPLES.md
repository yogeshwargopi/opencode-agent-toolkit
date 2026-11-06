# Real-World Examples

Practical scenarios and commands for using the OpenCode Agent Toolkit.

---

## 📚 Table of Contents

1. [Code Exploration](#-code-exploration)
2. [Research & Learning](#-research--learning)
3. [Code Review](#-code-review)
4. [Refactoring](#-refactoring)
5. [Feature Development](#-feature-development)
6. [Debugging](#-debugging)
7. [Documentation](#-documentation)
8. [Security Analysis](#-security-analysis)
9. [Performance Optimization](#-performance-optimization)
10. [Team Collaboration](#-team-collaboration)

---

## 🔍 Code Exploration

### Understanding a New Codebase
```
ask the ask agent to explain the overall architecture of this project
```

```
ask the ask agent to identify the main entry points and core modules
```

```
ask the ask agent to explain how data flows through the application
```

### Learning Specific Components
```
ask the ask agent to explain the authentication middleware implementation
```

```
ask the ask agent to describe the database schema and relationships
```

```
ask the ask agent to explain the API routing structure
```

---

## 📖 Research & Learning

### Parallel Research
```
# While you implement features, research in parallel:
use the side subagent to research best practices for implementing OAuth 2.0
```

```
# Research multiple topics simultaneously:
use the side subagent to analyze GraphQL vs REST API performance characteristics
```

### Learning New Technologies
```
ask the ask agent to explain how this project implements caching
```

```
ask the ask agent to compare the current testing strategy with industry best practices
```

---

## 👀 Code Review

### Safe Code Analysis
```
ask the ask agent to review the pull request changes for potential issues
```

```
ask the ask agent to identify code smells in the payment processing module
```

### Comprehensive Review
```
switch to multi
Perform a comprehensive code review of the user service module:
- Security vulnerabilities
- Performance issues
- Code quality
- Test coverage
- Documentation gaps
```

---

## 🔧 Refactoring

### Planning Refactoring
```
ask the ask agent to analyze the legacy code and suggest refactoring strategies
```

### Complex Refactoring
```
switch to multi
Refactor the authentication system to:
- Remove deprecated dependencies
- Improve error handling
- Add comprehensive logging
- Update to modern patterns
- Maintain backward compatibility
```

### Parallel Refactoring Research
```
use the side subagent to research migration strategies from Express to Fastify
```

---

## 🚀 Feature Development

### Feature Planning
```
ask the ask agent to recommend the best architecture for implementing real-time notifications
```

### Multi-Component Feature
```
switch to multi
Implement a complete user profile feature with:
- Profile picture upload
- Bio and settings
- Privacy controls
- Activity feed
- Social sharing
```

### Research While Building
```
# Main work: implement frontend
# Side work: research backend patterns
use the side subagent to research WebSocket implementation patterns for live updates
```

---

## 🐛 Debugging

### Understanding Issues
```
ask the ask agent to explain why this error is occurring and suggest fixes
```

```
ask the ask agent to trace the execution flow that leads to this bug
```

### Comprehensive Debugging
```
switch to multi
Investigate and fix the memory leak:
- Analyze memory usage patterns
- Identify potential leak sources
- Review garbage collection
- Suggest optimizations
- Implement fixes
```

---

## 📝 Documentation

### Understanding Existing Code
```
ask the ask agent to explain this function so I can document it
```

### Documentation Audit
```
switch to multi
Audit the documentation for:
- Missing API endpoints
- Outdated examples
- Unclear explanations
- Missing setup instructions
```

### Writing Documentation
```
ask the ask agent to help me write documentation for the authentication module
```

---

## 🔒 Security Analysis

### Security Review
```
ask the ask agent to identify security vulnerabilities in the user input handling
```

### Comprehensive Security Audit
```
switch to multi
Perform a comprehensive security audit:
- SQL injection vulnerabilities
- XSS vulnerabilities
- Authentication weaknesses
- Authorization gaps
- Data exposure risks
- Dependency vulnerabilities
```

### Researching Security Patterns
```
use the side subagent to research OWASP top 10 mitigation strategies
```

---

## ⚡ Performance Optimization

### Performance Analysis
```
ask the ask agent to identify performance bottlenecks in the API
```

### Optimization Strategy
```
switch to multi
Optimize the application performance:
- Analyze slow queries
- Review caching strategy
- Identify N+1 query problems
- Optimize asset loading
- Reduce bundle size
```

### Researching Optimizations
```
use the side subagent to research database indexing strategies for large datasets
```

---

## 👥 Team Collaboration

### Onboarding New Team Members
```
ask the ask agent to explain the project structure and development workflow
```

### Knowledge Transfer
```
ask the ask agent to document the architecture decisions and their rationale
```

### Code Standards
```
ask the ask agent to review code against team standards and conventions
```

### Parallel Team Work
```
# Developer 1: Frontend work
# Developer 2: Backend work
# Research in parallel:
use the side subagent to research integration testing strategies for microservices
```

---

## 🎯 Scenario: Starting a New Feature

### Step 1: Understand Current State
```
ask the ask agent to explain the current user management implementation
```

### Step 2: Research Best Practices
```
use the side subagent to research user role-based access control patterns
```

### Step 3: Plan Implementation
```
switch to multi
Plan the implementation of role-based access control:
- Analyze current auth system
- Design role hierarchy
- Plan permission checks
- Design admin interface
- Consider audit logging
```

### Step 4: Implement
```
# Multi agent coordinates the work across multiple components
```

---

## 🎯 Scenario: Migrating to a New Framework

### Step 1: Assessment
```
ask the ask agent to analyze the current architecture and identify migration challenges
```

### Step 2: Research
```
use the side subagent to research migration paths from REST to GraphQL
```

### Step 3: Planning
```
switch to multi
Plan the GraphQL migration:
- Inventory all REST endpoints
- Design GraphQL schema
- Plan data loading strategy
- Identify breaking changes
- Create migration timeline
```

---

## 🎯 Scenario: Bug Investigation

### Step 1: Understand the Bug
```
ask the ask agent to explain the error message and suggest potential causes
```

### Step 2: Trace the Issue
```
ask the ask agent to trace the code execution flow that leads to this error
```

### Step 3: Deep Investigation
```
switch to multi
Investigate the intermittent test failures:
- Analyze test logs
- Review recent changes
- Check timing issues
- Review test data setup
- Identify race conditions
```

---

## 🎯 Scenario: Performance Issues

### Step 1: Identify Problems
```
ask the ask agent to analyze the slow API endpoints and suggest optimizations
```

### Step 2: Research Solutions
```
use the side subagent to research database query optimization techniques
```

### Step 3: Comprehensive Optimization
```
switch to multi
Optimize application performance:
- Profile slow endpoints
- Optimize database queries
- Implement caching
- Reduce API response sizes
- Optimize asset delivery
```

---

## 💡 Pro Tips

### Combine Agents Strategically
```
# Start with Ask for understanding
ask the ask agent to explain the current architecture

# Research in parallel
use the side subagent to research modern alternatives

# Use Multi for implementation
switch to multi
Implement the modernized architecture based on research findings
```

### Iterate Based on Results
```
# Get initial analysis
ask the ask agent to identify code quality issues

# Deep dive on specific areas
ask the ask agent to explain the dependency injection pattern used here

# Research improvements
use the side subagent to research inversion of control containers

# Implement improvements
switch to multi
Refactor to use a proper IoC container
```

---

## 📊 Decision Matrix

| Task | Ask | Side | Multi |
|------|-----|------|-------|
| Understand code | ✅ | ⚠️ | ❌ |
| Safe exploration | ✅ | ⚠️ | ❌ |
| Parallel research | ❌ | ✅ | ❌ |
| Simple analysis | ✅ | ✅ | ❌ |
| Complex orchestration | ❌ | ❌ | ✅ |
| Multi-component work | ❌ | ❌ | ✅ |
| Code changes | ❌ | ✅ | ✅ |

---

**Use these examples as templates for your own workflows! 🚀**