# https://git-scm.com/book/en/v2/Git-Internals-Git-Objects
cd ~/code
git init atest
cd atest
echo 'test content' | git hash-object -w --stdin
git cat-file -p d670460b4b4aece5915caf5c68d12f560a9fe3e4
echo 'version 1' > test.txt
git hash-object -w test.txt
echo 'version 2' > test.txt
git hash-object -w test.txt



git cat-file -p 83baae61804e65cc73a7201a7252750c76066a30 >| test.txt
cat test.txt




git cat-file -p 1f7a7a472abf3dd9643fd615f6da379c4acb3e3a >| test.txt
cat test.txt

git cat-file -t 1f7a7a472abf3dd9643fd615f6da379c4acb3e3a

git update-index --add --cacheinfo 100644 \
      83baae61804e65cc73a7201a7252750c76066a30 test.txt

echo "Write-tree - TREE 1"
git write-tree

git cat-file -p d8329fc1cc938780ffdd9f94e0d364e0ea74f579

git cat-file -t d8329fc1cc938780ffdd9f94e0d364e0ea74f579

echo 'new file' > new.txt
git update-index --add --cacheinfo 100644 \
      1f7a7a472abf3dd9643fd615f6da379c4acb3e3a test.txt
git update-index --add new.txt

echo "Write-tree add new file - TREE 2"
git write-tree
git cat-file -p 0155eb4229851634a0f03eb265b69f5a2d56f341

git read-tree --prefix=bak d8329fc1cc938780ffdd9f94e0d364e0ea74f579
echo "Write-tree with new bak - TREE 3"
git write-tree
git cat-file -p 3c4e9cd789d88d8d89c1073707c3585e41b0e614

# The first commit
echo "This is the first commit"
echo 'first commit' | git commit-tree d8329f

echo "This is the second commit NOT NOT"
echo 'echo 'second commit' | git commit-tree  0155eb -p <firstcommit>'


echo "This is the third commit NOT NOT"
echo 'echo 'third commit' | git commit-tree  3c4e9c -p <secondcommit>'


echo 'git log --stat <lastcommitSHA-1>'

echo 'find .git/objects -type f'
echo 'Should show 10 objects'
