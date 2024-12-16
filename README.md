# GIT & GITHUB DEVOPS GUIDE - From Zero to Hero

Welcome to the ultimate guide for mastering Git, GitHub, and DevOps processes! This guide is designed to take you through the basics of version control, collaborative workflows, and integration with modern DevOps practices.

## Table of Contents

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

## Example- How to rename a branch:
	
### Summary of Steps:
- Rename the local branch:
  ```
  git branch -m master main
Push the main branch to GitHub:


git push origin main
Set main as the default branch on GitHub.
Delete the old master branch on GitHub:


git push origin --delete master
Update your local branch references:


git fetch origin
git branch -u origin/main main
After this, your repository will use main as the default branch both locally and remotely.

Detailed Examples for DevOps
1. CI/CD with GitHub Actions
GitHub Actions allows you to automate workflows for your repositories. Here’s an example of a basic CI/CD pipeline that runs tests and deploys your code whenever a commit is made to the main branch.

Example: Basic CI/CD Pipeline with GitHub Actions


name: CI/CD Pipeline

on:
  push:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v2

    - name: Set up Python
      uses: actions/setup-python@v2
      with:
        python-version: '3.x'

    - name: Install dependencies
      run: |
        pip install -r requirements.txt

    - name: Run tests
      run: |
        pytest

    - name: Deploy
      if: success()
      run: |
        echo "Deploying application to production..."
        # Deploy commands go here
Explanation:

on: push: The pipeline triggers when a push is made to the main branch.
Checkout code: Retrieves the latest code from the repository.
Set up Python: Configures the environment with Python.
Install dependencies: Installs the project dependencies.
Run tests: Runs tests with pytest.
Deploy: Deploys the code if tests pass.
2. GitHub and Jenkins
Jenkins is a widely used CI tool that integrates seamlessly with GitHub. This example shows how to configure Jenkins to pull code from a GitHub repository and run a build process.

Example: Simple Jenkins Pipeline for GitHub Integration
groovy

pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/your-username/your-repo.git'
            }
        }
        stage('Build') {
            steps {
                sh 'echo "Building project..."'
                // Add your build commands here, e.g., npm run build or mvn install
            }
        }
        stage('Test') {
            steps {
                sh 'echo "Running tests..."'
                // Add your test commands here, e.g., pytest or npm test
            }
        }
        stage('Deploy') {
            steps {
                sh 'echo "Deploying..."'
                // Add your deployment commands here, e.g., kubectl apply or scp commands
            }
        }
    }
}
Explanation:

git: Jenkins will clone your GitHub repository.
Build: The pipeline runs build commands (replace echo with your build command).
Test: Runs your tests.
Deploy: Deploys the code to production.
3. Version Control with Docker
Using Git with Docker allows you to version control your Docker configurations (like Dockerfiles) and automate Docker container builds.

Example: Docker and Git Integration for Continuous Deployment
Dockerfile: Create a Dockerfile in the root directory:

dockerfile

FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

CMD ["python", "app.py"]
GitHub Actions for Docker: Create a GitHub Actions workflow to build and push the Docker image to Docker Hub.



name: Docker Build and Push

on:
  push:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v2

    - name: Set up Docker
      uses: docker/setup-buildx-action@v2

    - name: Build Docker image
      run: |
        docker build -t yourusername/your-repo .
 
    - name: Log in to Docker Hub
      uses: docker/login-action@v2
      with:
        username: ${{ secrets.DOCKER_USERNAME }}
        password: ${{ secrets.DOCKER_PASSWORD }}

    - name: Push Docker image
      run: |
        docker push yourusername/your-repo
Explanation:

Dockerfile: Specifies how to build the Docker image.
GitHub Actions: Automates the process of building and pushing the Docker image when code is pushed to the main branch.
docker/setup-buildx-action: Sets up Docker Buildx for building images.
docker/login-action: Logs into Docker Hub with your credentials stored in GitHub Secrets.
4. GitOps with Kubernetes
If you’re deploying to Kubernetes, you can automate the process of updating your cluster with new code by using GitOps principles.

Example: GitOps with GitHub and Kubernetes
Here’s an example of how to use GitHub Actions to deploy code to a Kubernetes cluster.



name: Deploy to Kubernetes

on:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v2

    - name: Set up kubectl
      uses: azure/setup-kubectl@v1

    - name: Deploy to Kubernetes
      run: |
        kubectl apply -f k8s/deployment.
        kubectl rollout status deployment/my-deployment
Explanation:

kubectl apply: Applies the Kubernetes configuration from the deployment. file to your cluster.
kubectl rollout status: Ensures the deployment is successfully rolled out.
