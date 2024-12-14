# Git and GitHub Self-Study Guide
=================================

A. Create a New Repository

Learn how to create a new Git repository from scratch, add files, and make your initial commit.

1. Create a new directory, navigate into it, and initialize Git:
   mkdir my-new-project && cd my-new-project && git init

   # Step 1: Create the new directory with nested subdirectories
   mkdir -p src/utils
   # Step 2: Navigate into the new directory
   cd src/utils
   # Step 3: Create a new utility file
   touch helpers.py

   mkdir /Users/stoshckov/Desktop/LAST/TEST-GH
   cd /Users/stoshckov/Desktop/LAST/TEST-GH

   # Create a README File (or any other file):
   # echo "# My New Repository" > README.md
   # Stage and Commit the File:
   git add README.md
   git commit -m "Initial commit"
   # Create and Push to GitHub:
   gh repo create GH-REPO --public --source=. --push

   # EXAMPLE: (see gh-cli.txt file)
   stoshckovs-MacBook-Air:TEST-GH stoshckov$ echo "# My New Repository" > README.md
   stoshckovs-MacBook-Air:TEST-GH stoshckov$ git add README.md
   stoshckovs-MacBook-Air:TEST-GH stoshckov$ git commit -m "Initial commit"
   [master (root-commit) 108cea1] Initial commit
   1 file changed, 1 insertion(+)
   create mode 100644 README.md
   stoshckovs-MacBook-Air:TEST-GH stoshckov$ gh repo create GH-REPO --public --source=. --push
   ✓ Created repository stoshckov/GH-REPO on GitHub
   https://github.com/stoshckov/GH-REPO
   ✓ Added remote git@github.com:stoshckov/GH-REPO.git
   Enumerating objects: 3, done.
   Counting objects: 100% (3/3), done.
   Writing objects: 100% (3/3), 242 bytes | 242.00 KiB/s, done.
   Total 3 (delta 0), reused 0 (delta 0), pack-reused 0
   To github.com:stoshckov/GH-REPO.git
   * [new branch]      HEAD -> master
   Branch 'master' set up to track remote branch 'master' from 'origin'.
   ✓ Pushed commits to git@github.com:stoshckov/GH-REPO.git
   stoshckovs-MacBook-Air:TEST-GH stoshckov$
2. Add files to your repository:

   # Add a single file
   git add README.md
   # Add multiple specific files
   git add index.html styles.css app.js
   # Add all changes
   git add .
   # or
   git add -A
   # Add files by pattern
   git add *.txt
   git add src/*.js
   # Interactive adding
   git add -p
   # Add all tracked files (modified and deleted)
   git add -u
   # Dry run to preview staged files
   git add --dry-run .
   # Verbose add to see detailed output
   git add -v .
   # Force Adding Ignored Files
   git add -f secret.txt
   # Change File Permissions While Adding
   git add --chmod=+x script.sh
   # Intent to Add (Mark a File as Added Without Content)
   git add -N newfile.txt
   # Interactive Adding with More Options
   git add -i
   # Add All Tracked Files (Modified and Deleted)
   git add --update
   # Refresh the Index Without Adding New Files
   git add --refresh
   # Ignore Missing Files
   git add --ignore-missing file1.txt file2.txt
   # Add Using a Pathspec from a File
   git add --pathspec-from-file=pathspec.txt
   # Null-terminated Pathspec
   git add --pathspec-file-nul=pathspec.txt

3. Make your first commit:
   git commit -m "Initial commit"

4. Other ways to create a new repository/alternatives:
   a. Create a local copy of an existing remote repository:
      git clone <repository-url>        # Copies all files, branches, and commit history to your local machine
      cd <repository-name>

   b. Using GitHub (or other platforms) to initialize the repository:
      # Create a new repository directly on GitHub (or another platform) via the web interface
      git clone git@github.com:username/repository-name.git # Once created, clone it locally using
      cd repository-name                # Navigate into it and verify


B. Link the Local Repository to a Remote Repository

Understand how to connect your local Git repository to a remote repository on platforms like GitHub.

1. Create a new repository on GitHub without initializing it with any files.

2. Add the remote URL to your local repository:
   git remote add origin <REMOTE_URL>

3. Verify the remote repository URL:
   git remote -v

4. If needed, update the remote repository URL:
   git remote set-url origin https://github.com/username/repository.git


C. Push the Initial Commit to the Remote Repository

Learn how to push your initial commit from the local repository to the remote repository.

1. Push your local commits to the remote repository:
   git push -u origin main

   If your default branch is 'master' instead of 'main', use:
   git push -u origin master


D. Branching

Master the art of branching in Git to manage different lines of development effectively.

1. Create a new branch:
   git checkout -b <branch-name>

2. View all branches:
   git branch
   git branch -r

   - `git branch -r`: Lists all remote-tracking branches.

3. Switch to an existing branch:
   git checkout <branch-name>

4. Work on the new branch (make changes, stage, and commit):
   git add .
   git commit -m 'Your message'

5. Push the new branch to remote:
   git push -u origin <branch-name>

   - Example:
     git push -u origin simple-branch

6. Merge the branch back to main:
   git checkout main
   git pull origin main
   git merge <branch-name>
   git push origin main

7. Delete the merged branch locally:
   git branch -d <branch-name>

   - Or force delete unmerged branches:
     git branch -D <branch-name>

8. Delete the branch from the remote repository:
   git push origin --delete <branch-name>

   - Example:
     git push origin --delete simple-branch
9. Rename branches :
	1. To rename the master branch to main, follow these steps:
	git branch -m master main	#This will rename the master branch to main locally.
	2. Push the Renamed Branch to GitHub
	git push origin main	#This will push the main branch to your remote repository.
	3. Update the Remote's Default Branch
	Now, you'll need to set the new main branch as the default on GitHub. You can do this through the GitHub web interface:
	Go to your repository on GitHub.
	Click on the Settings tab.
	Under the Branches section, find the "Default branch" dropdown.
	Select main as the default branch.
	4. Delete the Old master Branch from GitHub
	git push origin --delete master	#After changing the default branch, you can delete the old master branch from GitHub
	5. Update Local Repository References
	git fetch origin		#Lastly, make sure your local repository is using the new default branch name when you pull
	git branch -u origin/main main
	=========================
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
	After this, your repository will use main as the default branch both locally and remotely.

	The steps are essentially the same for any branch renaming:

	Rename locally (git branch -m),
	Push the renamed branch to GitHub (git push origin new-branch-name),
	Change the default branch on GitHub (if necessary),
	Delete the old branch from GitHub (git push origin --delete old-branch-name),
	Update local references to track the new branch name (git branch -u origin/new-branch-name).


E. Clone the Repository

Discover how to clone an existing repository and manage multiple branches effectively.

1. Clone the repository:
   git clone <REPO_URL>

2. Fetch all branches:
   git fetch --all

3. List all branches:
   git branch -a

4. Check out all remote branches:
   for branch in $(git branch -r | grep -v '\->'); do
       git branch --track "${branch#origin/}" "$branch"
   done

5. Pull updates for all branches:
   git pull --all


F. Update a Branch After Cloning

Learn how to keep your branches up-to-date with remote changes and handle potential conflicts.

1. Ensure you’re on the desired branch:
   git checkout <branch-name>

2. Pull updates from the remote:
   git pull origin <branch-name>

   - Example:
     git pull origin simple-branch

3. Fetch without automatically merging:
   git fetch
   git fetch origin
   git pull origin <branch-name>

   - Example:
     git pull origin simple-branch

4. Handle potential conflicts:
   Resolve conflicts manually in your editor, then:
   git add <file>
   git commit

5. Push local changes back to remote:
   git push origin <branch-name>

   - Example:
     git push origin simple-branch

6. Stay updated:
   git fetch --all

7. To delete/remove a file both locally and remotely from a branch:

   # Step 1: Remove the file locally
       git rm unwanted-file.txt

   # Step 2: Commit the changes
       git commit -m "Remove unwanted-file.txt"

   # Step 3: Push the changes to the remote repository
       git push origin main

   # If you accidentally remove a file, you can restore it before committing by running:
       git checkout HEAD -- <file-name>


