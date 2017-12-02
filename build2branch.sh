#!/bin/bash

# Build a 2 branch repo to practice on

[[ -d ~/gitdir ]] || echo "No gitdir"; exit 1

cd ~/gitdir

git init gittest

cd gittest || echo "no git repo found"; exit 1

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
git checkout -b b1
echo "Now add a file to it"
echo "This is a first file in b1" >> b1file1
echo "Add it ot b1"
git add b1file1
echo "commit it on b1"
git commit -m "adding b1file1 to b1"
echo "Add a line to file1"
echo "Adding this line from b1" >> file1
echo "Add it"
git add file1
echo "Commit file1 with appended line on b1"
git commit -m "Commiting appeneded file1 on b1"
echo "Swtich to master"
git checkout master
echo "Append a line to file1 from master"
echo "Adding a line from master branch" >> file1
echo "Add it"
git add file1
echo "Commit file1 on master with apended line"
git commit -m "Commit file1 with appended line on master branch"
echo "Done"



