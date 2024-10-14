#!/usr/bin/env bash

# Build a two branches  of commits

set -euo pipefail

echo "Running script"

REPONAME="twobranches"
GITDIR=~/temp

cd "$GITDIR" || {
  echo "No $GITDIR"
  exit 1
}

cd "$GITDIR/$REPONAME" && {
  echo "Repo exists!!"
  echo "delete the repo first"
  exit 1
}

mkdir "$REPONAME"
cd "$REPONAME"
git init

mkfiles() {
  random="$(((RANDOM % 10) + 1))"
  for FORINDEX in $(seq 1 ${random}); do
    echo "Create a file"
    echo "This is file $FORINDEX" >>"file$FORINDEX"
    echo "${RANDOM}" >>"file$FORINDEX"
    echo "Add it to index"
    git add "file$FORINDEX"
    echo "Commit the file$FORINDEX"
    git commit -m "Commiting file$FORINDEX"
  done
}

echo "Createing README.md"
echo "This is a test repo $REPONAME" >>README.md
echo "to experiment with git commands" >>README.md
echo "Creates a 2 branch repo" >>README.md
echo "adding README.md to repo"
git add README.md
echo first commit
git commit -m "First commit"

# Randomly creates some files
mkfiles

# CHECKOUT BRAN1
git checkout -b bran1
mkfiles
# CHECKOUT BRAN2
git checkout -b bran2
mkfiles
# make some files
# git checkout master
# git branch -f testing HEAD~7
# git checkout testing
# echo "On the testing branch tfile1" >>tfile1
# git add tfile1
# git commit -m "make a new file tfile1"
# echo "On the testing branch tfile2" >>tfile2
# git add tfile2
# git commit -m "make a new file tfile2"
# echo "On the testing branch tfile3" >>tfile3
# git add tfile3
# git commit -m "make a new file tfile3"
# git log --oneline --all --graph
