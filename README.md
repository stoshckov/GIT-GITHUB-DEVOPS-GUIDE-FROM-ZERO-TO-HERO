# GIT & GITHUB DEVOPS GUIDE - From Zero to Hero

Welcome to the ultimate guide for mastering Git, GitHub, and DevOps processes! This guide is designed to take you through the basics of version control, collaborative workflows, and integration with modern DevOps practices.

## Table of Contents

1. [Introduction](#introduction)
2. [Git Basics](#git-basics)
   - [What is Git?](#what-is-git)
   - [Setting Up Git](#setting-up-git)
   - [Git Workflow](#git-workflow)
   - [Common Git Commands](#common-git-commands)
3. [GitHub Basics](#github-basics)
   - [What is GitHub?](#what-is-github)
   - [Creating a GitHub Account](#creating-a-github-account)
   - [Repositories and Branches](#repositories-and-branches)
   - [Pull Requests and Issues](#pull-requests-and-issues)
4. [Branching Strategies](#branching-strategies)
   - [Git Flow](#git-flow)
   - [GitHub Flow](#github-flow)
   - [Feature Branch Workflow](#feature-branch-workflow)
5. [Advanced Git Techniques](#advanced-git-techniques)
   - [Rebase vs Merge](#rebase-vs-merge)
   - [Stashing Changes](#stashing-changes)
   - [Cherry-picking Commits](#cherry-picking-commits)
   - [Submodules](#submodules)
6. [GitHub Collaboration](#github-collaboration)
   - [Forking Repositories](#forking-repositories)
   - [Working with Pull Requests](#working-with-pull-requests)
   - [Reviewing and Merging Pull Requests](#reviewing-and-merging-pull-requests)
7. [DevOps Integration](#devops-integration)
   - [CI/CD with GitHub Actions](#cicd-with-github-actions)
   - [GitHub and Jenkins](#github-and-jenkins)
   - [Version Control with Docker](#version-control-with-docker)
8. [Best Practices](#best-practices)
   - [Commit Message Guidelines](#commit-message-guidelines)
   - [Branch Naming Conventions](#branch-naming-conventions)
   - [GitHub Repository Management](#github-repository-management)
9. [Additional Resources](#additional-resources)
   - [Books](#books)
   - [Tutorials](#tutorials)
   - [Communities](#communities)
10. [Contributing](#contributing)
11. [License](#license)

Example- How to rename a branch:
	
	Summary of Steps:
	Rename the local branch:
	git branch -m master main
	Push the main branch to GitHub:
	git push origin main
	Set main as the default branch on GitHub.
	Delete the old master branch on GitHub:
	git push origin --delete master
	Update your local branch references:
	git fetch origin
	git branch -u origin/main main
	
	***After this, your repository will use main as the default branch both locally and remotely.


