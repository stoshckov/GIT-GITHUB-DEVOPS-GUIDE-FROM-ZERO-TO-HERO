# GIT & GITHUB DEVOPS GUIDE - From Zero to Hero

Welcome to the ultimate guide for mastering Git, GitHub, and DevOps processes! This guide is designed to take you through the basics of version control, collaborative workflows, and integration with modern DevOps practices.

# Table of Contents

1. [Introduction](#introduction)
2. [Git Basics](#git-basics)
   - [What is Git?](https://git-scm.com/book/en/v2) - Learn Git from the official Git documentation.
   - [Setting Up Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) - Official guide to installing and setting up Git.
   - [Git Workflow](https://www.atlassian.com/git/tutorials/comparing-workflows) - A guide to different Git workflows.
   - [Common Git Commands](https://www.git-scm.com/docs) - Git command reference.
3. [GitHub Basics](#github-basics)
   - [What is GitHub?](https://docs.github.com/en/github/getting-started-with-github/hello-world) - GitHub's official introduction.
   - [Creating a GitHub Account](https://docs.github.com/en/github/getting-started-with-github/signing-up-for-a-new-github-account) - How to create an account on GitHub.
   - [Repositories and Branches](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request) - GitHub documentation on managing repositories and branches.
   - [Pull Requests and Issues](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests) - Guide to pull requests and issues on GitHub.
4. [Branching Strategies](#branching-strategies)
   - [Git Flow](https://www.atlassian.com/git/tutorials/comparing-workflows) - An article from Atlassian about Git flow.
   - [GitHub Flow](https://guides.github.com/introduction/flow/) - GitHub Flow overview.
   - [Feature Branch Workflow](https://www.atlassian.com/git/tutorials/comparing-workflows) - Learn about feature branch workflows.
5. [Advanced Git Techniques](#advanced-git-techniques)
   - [Rebase vs Merge](https://www.git-scm.com/docs/git-rebase) - Detailed explanation of `git rebase` vs `git merge`.
   - [Stashing Changes](https://www.git-scm.com/docs/git-stash) - Git stash documentation.
   - [Cherry-picking Commits](https://www.git-scm.com/docs/git-cherry-pick) - How to cherry-pick commits with Git.
   - [Submodules](https://www.git-scm.com/book/en/v2/Git-Tools-Submodules) - Learn how to work with submodules in Git.
6. [GitHub Collaboration](#github-collaboration)
   - [Forking Repositories](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/fork-a-repo) - GitHub documentation on forking repositories.
   - [Working with Pull Requests](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests) - How to work with pull requests.
   - [Reviewing and Merging Pull Requests](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/merging-a-pull-request) - How to review and merge pull requests on GitHub.
7. [DevOps Integration](#devops-integration)
   - [CI/CD with GitHub Actions](https://docs.github.com/en/actions) - GitHub's official guide to GitHub Actions for CI/CD.
   - [GitHub and Jenkins](https://www.jenkins.io/doc/book/pipeline/git/) - Jenkins pipeline with GitHub integration.
   - [Version Control with Docker](https://www.docker.com/blog/using-git-and-docker-together/) - How to use Git with Docker.
8. [Best Practices](#best-practices)
   - [Commit Message Guidelines](https://www.conventionalcommits.org/en/v1.0.0/) - Learn the conventional commits specification.
   - [Branch Naming Conventions](https://www.atlassian.com/git/tutorials/comparing-workflows) - Guide on naming branches in Git.
   - [GitHub Repository Management](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/about-repositories) - Managing repositories on GitHub.
9. [Additional Resources](#additional-resources)
   - [Books](https://git-scm.com/book/en/v2) - "Pro Git" book, the most comprehensive guide on Git.
   - [Tutorials](https://www.codecademy.com/learn/learn-git) - Codecademy Git tutorial.
   - [Communities](https://www.reddit.com/r/git/) - Git subreddit for community discussions.
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


