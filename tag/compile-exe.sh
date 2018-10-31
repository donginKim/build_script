#!/bin/bash

# taging

ls

cd project

ls

git remote -v

git remote remove origin
git remote add origin http://sudouser:sudouser@52.231.161.92:3000/sudouser/buildpack.git

git tag v0.0.1

git push -u origin v0.0.1

