#!/bin/bash

BRANCHES=$(git branch --list | grep -v -e 'master\|feature\/csg-migration\|development\|alpha\|alpha-hotfixes\|production-hotfixes\|sprint-hotfixes\|gamma-hotfix\|gamma\|production\|alpha-hotfixes\|qa\|uat\|\*')

echo LOCAL Branches ready to be DELETED:
echo $BRANCHES

read -p "Delete these LOCAL branches (y/n)? " answer

if [ "$answer" = "n" ]; then echo aborting && exit; fi

echo $BRANCHES | xargs -n 1 git branch -D

BRANCHES=$(git branch -r | awk -F/ '/\/branch/{print $2}')

echo REMOTE Branches Ready to be DELETED:
echo $BRANCHES

read -p "DELETE these REMOTE branches (y/n)? " answer

if [ "$answer" = "n" ]; then echo aborting && exit; fi

echo $BRANCHES | xargs -n 1 git push origin -d