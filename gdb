#!/usr/bin/env python3
import os
import sys

RESET = "\033[0m"
BWHITE = "\033[1;37m"
CYAN = "\033[1;36m"
MAGENTA = "\033[1;35m"
YELLOW = "\033[0;33m"
GREEN = "\033[0;32m"
BBLUE = "\033[1;34m"

guide = {
    "getting_started": [
        {
            "keyword": "append_readme",
            "description": "Appends '# test8' to the README.md file (creates the file if it doesn’t exist).",
            "command": "echo \"# test8\" >> README.md",
            "variations": [
                {
                    "desc": "Using tee for redirection (also shows output):",
                    "cmd": "echo \"# test8\" | tee -a README.md"
                },
                {
                    "desc": "Directly create and edit the file:",
                    "cmd": "echo \"# test8\" > README.md && nano README.md"
                },
                {
                    "desc": "Using printf for formatting:",
                    "cmd": "printf \"# test8\\n\" >> README.md"
                }
            ]
        },
        {
            "keyword": "init",
            "description": "Initializes a new Git repository in the current directory.",
            "command": "git init",
            "variations": [
                {
                    "desc": "Initialize a repo in a specific directory:",
                    "cmd": "git init path/to/directory"
                },
                {
                    "desc": "Clone an existing repository instead of starting fresh:",
                    "cmd": "git clone git@github.com:username/existing-repo.git"
                },
                {
                    "desc": "Initialize a bare repository (no working tree):",
                    "cmd": "git init --bare"
                }
            ]
        },
        {
            "keyword": "add",
            "description": "Stages a file for the next commit.",
            "command": "git add README.md",
            "variations": [
                {
                    "desc": "Stage all changes in the current directory:",
                    "cmd": "git add ."
                },
                {
                    "desc": "Stage all files explicitly:",
                    "cmd": "git add --all"
                },
                {
                    "desc": "Interactive staging:",
                    "cmd": "git add -p"
                },
                {
                    "desc": "Stage a specific file:",
                    "cmd": "git add path/to/file.txt"
                }
            ]
        },
        {
            "keyword": "commit",
            "description": "Commits staged changes with a message.",
            "command": "git commit -m \"first commit\"",
            "variations": [
                {
                    "desc": "Open your editor for the message:",
                    "cmd": "git commit"
                },
                {
                    "desc": "Commit all tracked changes without adding first:",
                    "cmd": "git commit -a -m \"your message\""
                },
                {
                    "desc": "Amend the last commit:",
                    "cmd": "git commit --amend -m \"updated message\""
                }
            ]
        },
        {
            "keyword": "branch_rename",
            "description": "Renames the current branch to 'main'.",
            "command": "git branch -M main",
            "variations": [
                {
                    "desc": "Use lowercase `-m` if no conflicts:",
                    "cmd": "git branch -m main"
                },
                {
                    "desc": "Create and switch to a new branch without rename:",
                    "cmd": "git branch main && git checkout main"
                },
                {
                    "desc": "Rename a branch not checked out:",
                    "cmd": "git branch -m old_branch_name new_branch_name"
                }
            ]
        },
        {
            "keyword": "remote_add",
            "description": "Adds a remote repository named 'origin'.",
            "command": "git remote add origin git@github.com:stoshckov/test8.git",
            "variations": [
                {
                    "desc": "Use HTTPS instead of SSH:",
                    "cmd": "git remote add origin https://github.com/stoshckov/test8.git"
                },
                {
                    "desc": "Change an existing remote URL:",
                    "cmd": "git remote set-url origin git@github.com:stoshckov/another-repo.git"
                },
                {
                    "desc": "List all remotes:",
                    "cmd": "git remote -v"
                }
            ]
        },
        {
            "keyword": "push_set_upstream",
            "description": "Pushes main to 'origin' and sets upstream tracking.",
            "command": "git push -u origin main",
            "variations": [
                {
                    "desc": "Explicit `--set-upstream`:",
                    "cmd": "git push --set-upstream origin main"
                },
                {
                    "desc": "Regular push after upstream is set:",
                    "cmd": "git push"
                },
                {
                    "desc": "Force push (use with caution):",
                    "cmd": "git push -f origin main"
                },
                {
                    "desc": "Push another branch and set upstream:",
                    "cmd": "git push -u origin feature-branch"
                }
            ]
        },
        {
            "keyword": "status",
            "description": "Shows the working tree status, staged changes, and untracked files.",
            "command": "git status",
            "variations": [
                {
                    "desc": "Short, compact view:",
                    "cmd": "git status -s"
                },
                {
                    "desc": "Show branch & tracking info:",
                    "cmd": "git status -b"
                }
            ]
        },
        {
            "keyword": "log",
            "description": "View commit history in the current branch.",
            "command": "git log",
            "variations": [
                {
                    "desc": "One-line, graph, decorate:",
                    "cmd": "git log --oneline --graph --decorate"
                },
                {
                    "desc": "Limit the number of commits:",
                    "cmd": "git log -n 5"
                },
                {
                    "desc": "Filter by date:",
                    "cmd": "git log --since=\"2 weeks ago\""
                }
            ]
        },
        {
            "keyword": "diff",
            "description": "Show changes between commits and working tree.",
            "command": "git diff",
            "variations": [
                {
                    "desc": "Compare staged changes:",
                    "cmd": "git diff --staged"
                },
                {
                    "desc": "Compare a specific file:",
                    "cmd": "git diff HEAD path/to/file"
                },
                {
                    "desc": "Compare two branches:",
                    "cmd": "git diff branchA..branchB"
                }
            ]
        },
        {
            "keyword": "restore",
            "description": "Restore files to a previous state.",
            "command": "git restore <file>",
            "variations": [
                {
                    "desc": "Discard local changes:",
                    "cmd": "git restore path/to/file"
                },
                {
                    "desc": "Unstage a file:",
                    "cmd": "git restore --staged path/to/file"
                },
                {
                    "desc": "Restore from a specific commit:",
                    "cmd": "git restore --source <commit_hash> -- path/to/file"
                }
            ]
        },
        {
            "keyword": "mv",
            "description": "Rename or move a file, and stage the change.",
            "command": "git mv old_filename new_filename",
            "variations": [
                {
                    "desc": "Manual move then add:",
                    "cmd": "mv old_filename new_filename && git add old_filename new_filename"
                },
                {
                    "desc": "Rename with history linkage:",
                    "cmd": "git mv path/to/old_file path/to/new_file"
                }
            ]
        }
    ],
    "branching": [
        {
            "keyword": "branch",
            "description": "List, create, or delete branches.",
            "command": "git branch",
            "variations": [
                {
                    "desc": "Create a new branch:",
                    "cmd": "git branch <new_branch_name>"
                },
                {
                    "desc": "Delete a local branch:",
                    "cmd": "git branch -d <branch_name>"
                },
                {
                    "desc": "List all local branches:",
                    "cmd": "git branch"
                }
            ]
        },
        {
            "keyword": "checkout",
            "description": "Switch to a different branch or restore files to a specific state.",
            "command": "git checkout <branch_name>",
            "variations": [
                {
                    "desc": "Create and switch to a new branch:",
                    "cmd": "git checkout -b <new_branch_name>"
                },
                {
                    "desc": "Restore a file to a previous commit state:",
                    "cmd": "git checkout <commit_hash> -- path/to/file"
                }
            ]
        },
        {
            "keyword": "switch",
            "description": "Switch to a branch or create and switch to a new branch (newer command).",
            "command": "git switch <branch_name>",
            "variations": [
                {
                    "desc": "Create and switch to a new branch:",
                    "cmd": "git switch -c <new_branch_name>"
                },
                {
                    "desc": "Switch back to the previous branch:",
                    "cmd": "git switch -"
                }
            ]
        },
        {
            "keyword": "merge",
            "description": "Merge changes from one branch into another.",
            "command": "git merge <branch_to_merge>",
            "variations": [
                {
                    "desc": "Merge without a fast-forward:",
                    "cmd": "git merge --no-ff <branch_to_merge>"
                },
                {
                    "desc": "Abort a problematic merge:",
                    "cmd": "git merge --abort"
                }
            ]
        },
        {
            "keyword": "rebase",
            "description": "Re-apply commits on top of another base commit.",
            "command": "git rebase <base_branch>",
            "variations": [
                {
                    "desc": "Interactively rebase to edit commits:",
                    "cmd": "git rebase -i <base_branch>"
                },
                {
                    "desc": "Abort a rebase in progress:",
                    "cmd": "git rebase --abort"
                },
                {
                    "desc": "Continue rebasing after resolving conflicts:",
                    "cmd": "git rebase --continue"
                }
            ]
        }
    ],
    "collaboration": [
        {
            "keyword": "pull",
            "description": "Fetch changes from a remote and integrate them into your current branch.",
            "command": "git pull",
            "variations": [
                {
                    "desc": "Rebase instead of merge when pulling:",
                    "cmd": "git pull --rebase"
                },
                {
                    "desc": "Pull from a specific remote and branch:",
                    "cmd": "git pull origin main"
                }
            ]
        },
        {
            "keyword": "fetch",
            "description": "Download objects and refs from a remote repository without merging.",
            "command": "git fetch",
            "variations": [
                {
                    "desc": "Fetch from a specific remote:",
                    "cmd": "git fetch origin"
                },
                {
                    "desc": "Prune deleted remote branches:",
                    "cmd": "git fetch --prune"
                }
            ]
        },
        {
            "keyword": "fork",
            "description": "Create a fork of a repository in your GitHub account (via GitHub UI). Then clone and set upstream.",
            "command": "N/A (GitHub web interface)",
            "variations": [
                {
                    "desc": "Clone your fork locally:",
                    "cmd": "git clone git@github.com:your-username/forked-repo.git"
                },
                {
                    "desc": "Add upstream to track original repository:",
                    "cmd": "git remote add upstream git@github.com:original-user/original-repo.git"
                }
            ]
        },
        {
            "keyword": "pull_request",
            "description": "Open a pull request to propose changes (done via GitHub UI).",
            "command": "N/A (GitHub web interface)",
            "variations": [
                {
                    "desc": "Create a feature branch locally:",
                    "cmd": "git checkout -b feature-branch"
                },
                {
                    "desc": "Push your feature branch to your fork:",
                    "cmd": "git push -u origin feature-branch"
                },
                {
                    "desc": "Open a pull request on GitHub from feature-branch to the original repo’s main branch.",
                    "cmd": "N/A (GitHub UI)"
                }
            ]
        },
        {
            "keyword": "upstream",
            "description": "Setting an upstream remote to keep your fork in sync with the original repository.",
            "command": "git remote add upstream git@github.com:original-user/original-repo.git",
            "variations": [
                {
                    "desc": "Fetch and merge upstream changes:",
                    "cmd": "git fetch upstream && git merge upstream/main"
                },
                {
                    "desc": "Rebase your changes on top of upstream:",
                    "cmd": "git pull --rebase upstream main"
                }
            ]
        }
    ],
    "advanced": [
        {
            "keyword": "stash",
            "description": "Temporarily save your uncommitted changes and clean your working directory.",
            "command": "git stash",
            "variations": [
                {
                    "desc": "List all stashes:",
                    "cmd": "git stash list"
                },
                {
                    "desc": "Apply the latest stash:",
                    "cmd": "git stash apply"
                },
                {
                    "desc": "Apply and drop the latest stash:",
                    "cmd": "git stash pop"
                }
            ]
        },
        {
            "keyword": "tag",
            "description": "Create a tag at a particular commit, often used for releases.",
            "command": "git tag v1.0.0",
            "variations": [
                {
                    "desc": "List all tags:",
                    "cmd": "git tag"
                },
                {
                    "desc": "Create an annotated tag with a message:",
                    "cmd": "git tag -a v1.0.0 -m \"Release 1.0.0\""
                },
                {
                    "desc": "Push tags to remote:",
                    "cmd": "git push origin --tags"
                }
            ]
        },
        {
            "keyword": "cherry_pick",
            "description": "Apply the changes of a specific commit onto the current branch.",
            "command": "git cherry-pick <commit_hash>",
            "variations": [
                {
                    "desc": "Cherry-pick multiple commits:",
                    "cmd": "git cherry-pick <commit1_hash> <commit2_hash>"
                },
                {
                    "desc": "Abort a cherry-pick in progress:",
                    "cmd": "git cherry-pick --abort"
                }
            ]
        },
        {
            "keyword": "bisect",
            "description": "Use binary search to find the commit that introduced a bug.",
            "command": "git bisect start",
            "variations": [
                {
                    "desc": "Mark the current commit as good or bad:",
                    "cmd": "git bisect good\ngit bisect bad"
                },
                {
                    "desc": "End the bisect session:",
                    "cmd": "git bisect reset"
                }
            ]
        },
        {
            "keyword": "reset",
            "description": "Move the HEAD to a specified commit and optionally affect the staging area and working tree.",
            "command": "git reset <commit>",
            "variations": [
                {
                    "desc": "Soft reset (keeps changes in working tree):",
                    "cmd": "git reset --soft <commit>"
                },
                {
                    "desc": "Mixed reset (default, unstages changes):",
                    "cmd": "git reset <commit>"
                },
                {
                    "desc": "Hard reset (discards all changes):",
                    "cmd": "git reset --hard <commit>"
                }
            ]
        }
    ],
    "github_workflows": [
        {
            "keyword": "github_actions",
            "description": "Automate your workflows with GitHub Actions (CI/CD).",
            "command": "N/A (Configured via .github/workflows/*.yml)",
            "variations": [
                {
                    "desc": "Set up a simple CI workflow:",
                    "cmd": "Create .github/workflows/ci.yml with a 'build' job"
                },
                {
                    "desc": "View workflow runs:",
                    "cmd": "GitHub UI > Actions tab"
                }
            ]
        },
        {
            "keyword": "protected_branches",
            "description": "Configure rules to protect certain branches (in GitHub settings).",
            "command": "N/A (GitHub repository settings)",
            "variations": [
                {
                    "desc": "Require pull request reviews before merging:",
                    "cmd": "GitHub UI > Settings > Branches > Add branch protection rule"
                },
                {
                    "desc": "Prevent force pushes on main branch:",
                    "cmd": "GitHub UI > Settings > Branches > Branch protection"
                }
            ]
        },
        {
            "keyword": "releases",
            "description": "Create GitHub releases to version your software.",
            "command": "N/A (GitHub UI)",
            "variations": [
                {
                    "desc": "Create a new release with release notes:",
                    "cmd": "GitHub UI > Releases > Draft a new release"
                },
                {
                    "desc": "Upload binaries or release assets:",
                    "cmd": "Part of release creation form"
                }
            ]
        },
        {
            "keyword": "issues",
            "description": "Use GitHub Issues to track bugs, enhancements, and tasks.",
            "command": "N/A (GitHub UI)",
            "variations": [
                {
                    "desc": "Create a new issue:",
                    "cmd": "GitHub UI > Issues > New Issue"
                },
                {
                    "desc": "Use labels, assignees, and milestones:",
                    "cmd": "GitHub UI > Issues > Label/Assign/Milestone"
                }
            ]
        },
        {
            "keyword": "code_review",
            "description": "Use GitHub’s pull request reviews for feedback and quality.",
            "command": "N/A (GitHub UI)",
            "variations": [
                {
                    "desc": "Request a review on a pull request:",
                    "cmd": "GitHub UI > Pull Request > Request reviewers"
                },
                {
                    "desc": "Comment on specific lines of code:",
                    "cmd": "GitHub UI > Pull Request > Files Changed"
                }
            ]
        },
        {
            "keyword": "environments",
            "description": "Set up GitHub environments (staging, production) to control deployments.",
            "command": "N/A (GitHub UI > Settings > Environments)",
            "variations": [
                {
                    "desc": "Create a staging environment:",
                    "cmd": "GitHub UI > Settings > Environments > New environment"
                },
                {
                    "desc": "Require approvals before deploying:",
                    "cmd": "Environment rules in GitHub UI"
                }
            ]
        }
    ],
    "security_and_compliance": [
        {
            "keyword": "commit_signing",
            "description": "Sign your commits to prove their authenticity.",
            "command": "git commit -S -m 'Signed commit'",
            "variations": [
                {
                    "desc": "Configure GPG signing keys:",
                    "cmd": "git config --global user.signingkey <your_key_id>"
                },
                {
                    "desc": "Enable automatic commit signing:",
                    "cmd": "git config --global commit.gpgsign true"
                }
            ]
        },
        {
            "keyword": "dependabot",
            "description": "Automate dependency updates to keep them secure and up-to-date.",
            "command": "N/A (GitHub UI or .github/dependabot.yml)",
            "variations": [
                {
                    "desc": "Enable Dependabot alerts and security updates:",
                    "cmd": "GitHub UI > Settings > Security & analysis"
                },
                {
                    "desc": "Configure Dependabot updates:",
                    "cmd": "Create or edit .github/dependabot.yml"
                }
            ]
        },
        {
            "keyword": "secret_scanning",
            "description": "GitHub scans repositories for known secret formats.",
            "command": "N/A (GitHub repository setting)",
            "variations": [
                {
                    "desc": "Enable secret scanning:",
                    "cmd": "GitHub UI > Settings > Code security and analysis"
                },
                {
                    "desc": "Remediate leaked secrets:",
                    "cmd": "Rotate and invalidate exposed credentials"
                }
            ]
        },
        {
            "keyword": "code_scanning",
            "description": "Use GitHub code scanning to identify vulnerabilities in your code.",
            "command": "N/A (Configured via .github/workflows/*.yml or GitHub UI)",
            "variations": [
                {
                    "desc": "Set up code scanning with CodeQL:",
                    "cmd": "GitHub UI > Security > Code scanning alerts > Set up code scanning"
                },
                {
                    "desc": "View and fix vulnerabilities:",
                    "cmd": "GitHub UI > Security > Code scanning alerts"
                }
            ]
        },
        {
            "keyword": "vulnerability_alerts",
            "description": "Receive alerts for vulnerable dependencies.",
            "command": "N/A (GitHub UI > Insights > Dependency graph)",
            "variations": [
                {
                    "desc": "Enable dependency graph and Dependabot alerts:",
                    "cmd": "GitHub UI > Insights > Dependency graph > Enable alerts"
                },
                {
                    "desc": "Update vulnerable dependencies as recommended:",
                    "cmd": "Follow Dependabot’s suggested upgrades"
                }
            ]
        },
        {
            "keyword": "branch_protection_enforcement",
            "description": "Enforce security and compliance checks before merging.",
            "command": "N/A (GitHub UI > Settings > Branches)",
            "variations": [
                {
                    "desc": "Require passing code scanning checks:",
                    "cmd": "GitHub UI > Branches > Add branch protection rule > Require status checks"
                },
                {
                    "desc": "Require signed commits for merges:",
                    "cmd": "GitHub UI > Branches > Require signed commits"
                }
            ]
        }
    ]
}

def print_title(title):
    print(f"{BWHITE}{title}{RESET}\n")

def print_categories():
    print_title("GIT GUIDE - EXPANDED STEPS")
    print("Categories:\n")
    for category in guide.keys():
        print(f"{CYAN}- {category}{RESET}")
    print()

def print_usage():
    print(f"{BWHITE}Usage:{RESET}")
    print("gdb <category>    # to view all commands in that category")
    print("gdb <keyword>     # to view details of a specific command\n")

def print_category(category):
    if category not in guide:
        print(f"{YELLOW}No such category: {category}{RESET}\n")
        return
    cat_title = category.replace('_', ' ').upper()
    print_title(cat_title)
    for entry in guide[category]:
        print_main_entry(entry)
        print()

def print_main_entry(entry):
    print(f"{MAGENTA}Keyword:{RESET} {entry['keyword']}")
    print(f"{YELLOW}{entry['description']}{RESET}")
    print(f"{GREEN}{entry['command']}{RESET}")
    if "variations" in entry and entry["variations"]:
        print(f"\n{BBLUE}Variations & Alternatives:{RESET}")
        for var in entry["variations"]:
            print(f"{YELLOW}- {var['desc']}{RESET}")
            print(f"{GREEN}  {var['cmd']}{RESET}")

def print_command(keyword):
    found = False
    for category_name, category_commands in guide.items():
        for entry in category_commands:
            if entry["keyword"] == keyword:
                cat_title = category_name.replace('_', ' ').upper()
                print_title(f"COMMAND: {keyword} (Category: {cat_title})")
                print_main_entry(entry)
                found = True
                break
        if found:
            break

    if not found:
        print(f"{YELLOW}No command found for keyword: {keyword}{RESET}")

def main():
    os.system('clear' if os.name == 'posix' else 'cls')

    if len(sys.argv) == 1:
        # No args: Show categories and basic usage
        print_categories()
        print_usage()
    elif len(sys.argv) == 2:
        arg = sys.argv[1]
        if arg in guide:
            print_category(arg)
        else:
            # Check if arg is a command keyword
            print_command(arg)
    else:
        # Too many args
        print(f"{YELLOW}Invalid arguments!{RESET}\n")
        print_usage()

if __name__ == "__main__":
    main()
