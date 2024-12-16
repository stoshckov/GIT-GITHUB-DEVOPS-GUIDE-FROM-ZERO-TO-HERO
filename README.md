# GIT-GITHUB-DEVOPS-GUIDE-FROM-ZERO-TO-HERO
...mastering Git and GitHub, you can significantly improve your development workflow, 
collaborate effectively with teams, and streamline your DevOps processes. This guide provides a 
solid foundation and practical tips to help you become a Git and GitHub expert....

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


