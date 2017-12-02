#!/bin/bash

# Build a 2 branch repo to practice on

set -e

echo "Running script"

REPONAME="gittest"

[[ -d ~/gitdir ]] || { echo "No gitdir"; exit 1; }
[[ -d ~/gitdir/$REPONAME ]] && { echo "$REPONAME already exists"; exit 1; }

cd ~/gitdir

git init $REPONAME

cd ~/gitdir/$REPONAME || { echo "No git repo found"; exit 1; }

echo "Createing README.md"
echo "This is a test repo" >> README.md
echo "adding README.md to repo"
git add README.md
echo first commit
git commit -m "First commit"
echo "create a second commit"
echo "Creating a second file"
echo "This is file1" >> file1
echo "Add file1"
git add file1
echo "commit file1"
git commit -m "Added file1"
echo "Create a branch off of second commit"
git checkout -b branch1
echo "Now add a file to it"
echo "This is a first file in branch1" >> branch1file1
echo "Add it ot branch1"
git add branch1file1
echo "commit it on branch1"
git commit -m "adding branch1file1 to branch1"
echo "Add a line to file1"
echo "Adding this line from branch1" >> file1
echo "Add it"
git add file1
echo "Commit file1 with appended line on branch1"
git commit -m "Commiting appeneded file1 on branch1"
echo "Swtich to master"
git checkout master
echo "Append a line to file1 from master"
echo "Adding a line from master branch" >> file1
echo "Add it"
git add file1
echo "Commit file1 on master with apended line"
git commit -m "Commit file1 with appended line on master branch"
echo "Done"



