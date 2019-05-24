#!/bin/bash

BRANCHES=$(git branch -r | awk -F/ '/\/TASK#DG-100|TASK#DG-101|TASK#DG-104|TASK#DG-105/{print $2}')
#BRANCHES=$(git branch -r | awk -F/ '!/\/TASK#DG-10|release|alpha|alpha-hotfixes|development|feature|fms-hotfixes|gamma|gamma-hotfix|master|production|production-hotfixes|qa|sprint-hotfixes|staging|uat|TASK#DG-110/{print $2}')

echo REMOTE Branches Ready to be deleted:
echo $BRANCHES

read -p "Delete these REMOTE branches (y/n)? " answer

if [ "$answer" = "n" ]; then echo aborting && exit; fi

echo $BRANCHES | xargs -n 1 git push origin -d