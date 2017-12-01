$STARTDIR="X:\gitdir"


git init zoo

echo "cat" >> animals.txt
echo "dog" >> animals.txt
echo "octopus" >> animals.txt
echo "octocat" >> animals.txt

git add animals.txt
git commit -m "Initial commit"
git branch octodog
git checkout octodog
$path="$STARTDIR\zoo\animals.txt"
(Get-Content $path) -replace "octopus","octodog" | out-file $path
git add animals.txt
git commit -m "Replace octopus to octodog"
git checkout master
(Get-Content $path) -replace "octopus","octoman" | out-file $path

git add animals.txt
git commit -m "Replace octopus to octoman"
