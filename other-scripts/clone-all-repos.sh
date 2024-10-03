#!/bin/bash
# cd "/d/Personal/DevOps/joindevops/siva-repos/daws76s"
org=$1

if [ ! -d $org ]; then
  mkdir -p $org
fi
cd $org

if [ $? -ne 0 ]; then
  exit 1
fi

current_dir=$(pwd)

repos=$(gh repo list $org --limit 1000 | awk -F'/' '{print $2}' | awk -F' ' '{print $1}')
for r in $repos ; do
  echo $r
  if [ -d $r ]; then
    cd $r
    git pull
  else
    gh repo clone "$org/$r"
  fi
  cd $current_dir
done
