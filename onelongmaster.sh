#!/bin/bash

# Build a long master branch of commits
# Long meaing about 9



set -e

echo "Running script"

REPONAME="longmaster"

[[ -d ~/gitdir ]] || { echo "No gitdir"; exit 1; }
[[ -d ~/gitdir/$REPONAME ]] && { echo "$REPONAME already exists"; exit 1; }

cd ~/gitdir

git init $REPONAME

cd ~/gitdir/$REPONAME || { echo "No git repo found"; exit 1; }

echo "Createing README.md"
echo "This is a test repo $REPONAME" >> README.md
echo "adding README.md to repo"
git add README.md
echo first commit
git commit -m "First commit"

for FORINDEX in 1 2 3 4 5 6 7 8 9
do
    echo "Create a file"
    echo "This is file $FORINDEX" >> "file$FORINDEX"
    echo "Add it to index"
    git add "file$FORINDEX"
    echo "Commit the file$FORINDEX"
    git commit -m "Commiting file$FORINDEX"
done
