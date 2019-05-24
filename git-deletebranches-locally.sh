#!/bin/bash
#BRANCHES=$(git branch --list | grep -v -e 'master\|feature\/csg-migration\|development\|alpha\|alpha-hotfixes\|production-hotfixes\|sprint-hotfixes\|gamma-hotfix\|gamma\|production\|alpha-hotfixes\|qa\|uat\|\*')

BRANCHES=$(git branch --list | grep 'TASK#DP\|releases\|hotfix\|8004')

echo Local Branches ready to be DELETED:
echo $BRANCHES

read -p "DELETE these LOCAL branches (y/n)? " answer

if [ "$answer" = "n" ]; then echo aborting && exit; fi

echo $BRANCHES | xargs -n 1 git branch -D