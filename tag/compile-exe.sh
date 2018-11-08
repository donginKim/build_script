#!/bin/bash

# taging

ls

cd project

ls

git remote -v

git remote remove origin
git remote add origin http://sudouser:sudouser@$uri/$repo.git

git tag $tag

git push -u origin $tag

