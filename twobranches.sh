#!/bin/bash

# Build a two branches  of commits



set -e

echo "Running script"

REPONAME="twobranches"

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

git checkout master
git branch -f testing HEAD~7
git checkout testing
echo "On the testing branch tfile1" >> tfile1
git add tfile1 
git commit -m "make a new file tfile1"
echo "On the testing branch tfile2" >> tfile2
git add tfile2 
git commit -m "make a new file tfile2"
echo "On the testing branch tfile3" >> tfile3
git add tfile3 
git commit -m "make a new file tfile3"
git log --oneline --all --graph

