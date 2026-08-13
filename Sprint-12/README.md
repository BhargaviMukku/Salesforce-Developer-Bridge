# Sprint 12 – Git, Salesforce CLI, Metadata, Sandboxes and Deployment

## Overview

Sprint 12 focused on understanding the complete Salesforce development lifecycle, including version control, source-driven development, metadata management, Salesforce CLI, deployment strategies, Sandboxes, Scratch Orgs, and Git collaboration workflows. The sprint emphasized how Salesforce applications are developed, managed, tested, and deployed in professional environments.

---

## Objectives

* Understand the importance of Git in Salesforce development.
* Learn Git repositories, branches, commits, pushes, pulls, and Pull Requests.
* Understand Salesforce metadata and source-driven development.
* Work with Salesforce CLI (sf commands).
* Retrieve and deploy metadata.
* Understand Sandboxes and Scratch Orgs.
* Learn deployment workflows and environment management.
* Practice code review and conflict resolution.
* Build a deployment-ready Salesforce project structure.

---

## Topics Covered

### Git Fundamentals

* Version Control System (VCS)
* Git Repository Structure
* Clone, Commit, Push, and Pull Operations
* Branching Strategy
* Pull Requests and Code Reviews
* Merge Conflict Resolution

### Salesforce Metadata

* Custom Objects
* Custom Fields
* Apex Classes
* Apex Triggers
* Lightning Web Components (LWC)
* Flows
* Permissions and Configuration Metadata

### Salesforce CLI

* Installation and Configuration
* Org Authentication
* Org Aliases
* Metadata Retrieval
* Metadata Deployment
* Source-Driven Development

### Deployment Concepts

* Metadata Deployment Process
* Environment Management
* Dependency Management
* Deployment Validation
* Testing Before Deployment

### Salesforce Environments

* Developer Org
* Sandbox
* Scratch Org
* QA Environment
* UAT Environment
* Production Environment

---

## Git Commands Practiced

### Clone Repository

```bash
git clone <repository-url>
```

### Check Status

```bash
git status
```

### Add Files

```bash
git add .
```

### Commit Changes

```bash
git commit -m "Add placement application workflow"
```

### Push Changes

```bash
git push
```

### Pull Changes

```bash
git pull
```

### Create Branch

```bash
git checkout -b feature/new-feature
```

### Switch Branch

```bash
git checkout main
```

### Merge Branch

```bash
git merge feature/new-feature
```

---

## Salesforce CLI Commands

### Verify CLI Installation

```bash
sf --version
```

### Authenticate Org

```bash
sf org login web
```

### View Connected Orgs

```bash
sf org list
```

### Retrieve Metadata

```bash
sf project retrieve start
```

### Deploy Metadata

```bash
sf project deploy start
```

### Run Apex Tests

```bash
sf apex run test
```

---

## Repository Structure

```text
placement-management-system/
│
├── README.md
├── force-app/
│   └── main/
│       └── default/
│
├── docs/
│   ├── architecture/
│   ├── api/
│   └── deployment/
│
├── scripts/
│
└── .gitignore
```

---

## Deployment Workflow

```text
Developer
    ↓
Git Branch
    ↓
Commit
    ↓
Push
    ↓
Pull Request
    ↓
Code Review
    ↓
Testing
    ↓
QA
    ↓
UAT
    ↓
Production
```

---

## Key Learnings

* Salesforce Org should not be the only location where application code exists.
* Git serves as the source of truth for project development.
* Metadata should be version-controlled and stored in repositories.
* Salesforce CLI enables source-driven development.
* Sandboxes provide safe testing environments.
* Scratch Orgs support temporary and reproducible development.
* Pull Requests improve code quality through reviews.
* Deployment requires considering all dependencies, not just code files.
* Testing is mandatory before deployment to higher environments.
* Professional Salesforce development follows a structured deployment pipeline.

---

## Sprint Outcome

Successfully understood and practiced Salesforce development lifecycle concepts including Git version control, Salesforce CLI operations, metadata management, deployment processes, environment management, branching strategies, Pull Requests, code reviews, Sandboxes, Scratch Orgs, and deployment best practices required for enterprise Salesforce development.

