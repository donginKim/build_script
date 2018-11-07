#!/bin/bash

# taging

ls

cd compile-out

ls

cd ../

ls

cd project

ls

git remote -v

git remote remove origin
git remote add origin http://sudouser:sudouser@52.231.161.92:3000/$repo.git

git tag $tag

git push -u origin $tag

