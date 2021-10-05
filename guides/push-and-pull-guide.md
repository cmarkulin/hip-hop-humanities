# Git workflow guide

1. Navigate to the repo using `cd`
1. Always check to make sure you're up to date before working in the repo. Write `git status` on the command line. The message should read "already up to date with `origin/master`." If it doesn't, pull your teammates' changes using `git pull`
1. *If your work isn't committed, it doesn't count.* When you're at a good point to push, first write `git add -A` or `git add [file or directory name]`. This stages your work. 
1. Commit using `git commit -m "[A message breifly but properly explaining the new changes]"`
1. `git push` sends your changes to everyone's local repo.