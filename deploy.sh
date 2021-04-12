#!/bin/bash

if [ $# != 5 ];then
  echo "发布 jar/aar 包到github"
  echo "eg: sh deploy.sh com.netease.nis captcha 3.0.2 aar file"
  exit 0
fi

function log(){
  echo "\033[32m$(date "+%Y%m%d-%H%M%S"): $1\033[0m"
}

groupId=$1
artifactId=$2
version=$3
packaging=$4
file=$5

deployFunc(){
  
  log ":🔀 拉取最新代码并合并!"

  git fetch origin master
  git merge origin/master

	log "🔨 执行 mvn deploy"
  mvn deploy:deploy-file -DgroupId=$groupId \
    -DartifactId=$artifactId \
    -Dversion=$version \
    -Dpackaging=$packaging \
    -Dfile=$file \
    -Durl=file:$(pwd)

	log "🚀 提交到远程分支: origin/master"
	git add .
  git commit -m ':rocket: Deploy Packages'
  git push origin master

	log "✅ 发布完成"
}

deployFunc