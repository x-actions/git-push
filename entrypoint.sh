#!/bin/bash
set -e

GITHUB_EMAIL=${GITHUB_EMAIL:-"me@xiexianbin.cn"}
GITHUB_USERNAME=${GITHUB_USERNAME:-"xiexianbin"}
PUBLISH_REPO=${PUBLISH_REPO:-}
PUBLISH_BRANCH=${PUBLISH_BRANCH:-}
PUBLISH_DIR="${PUBLISH_DIR:-}"
DEPLOY_PRIVATE_KEY=${DEPLOY_PRIVATE_KEY:-}
CNAME=${CNAME:-}

echo "## Check Package Version ##################"
bash --version
git version
git lfs version

echo "## Init Git Config ##################"
if ! git config --get user.name; then
    git config --global user.name "${GITHUB_USERNAME}"
fi

if ! git config --get user.email; then
    git config --global user.email "${GITHUB_EMAIL}"
fi

echo "## Setup Deploy keys ##################"
mkdir /root/.ssh && \
ssh-keyscan -t rsa github.com > /root/.ssh/known_hosts

if [ X"$DEPLOY_PRIVATE_KEY" = X"" ]; then
  echo "## Skip ssh key deploy ##################"
else
  echo ${DEPLOY_PRIVATE_KEY} > /root/.ssh/id_rsa
  chmod 400 /root/.ssh/id_rsa && \
  ls -lhart /root/.ssh/id_rsa && \
  cat /root/.ssh/id_rsa
fi

echo "## Push to Github ##################"
rm -rf .git
cd ${PUBLISH_DIR}

if [[ -n "${CNAME}" ]]; then
  echo 'Creating CNAME file'
  echo "${CNAME}" > CNAME
fi

if [ ! -d ".git" ];then
  git init
else
  git remote -v
  git remote rm origin || true
fi
git remote add origin "${PUBLISH_REPO}"
git remote -v
git branch | grep ${PUBLISH_BRANCH} || git checkout ${PUBLISH_BRANCH} || git branch ${PUBLISH_BRANCH} && git checkout ${PUBLISH_BRANCH}
git add . && \
git commit -m "update at $(date "+%Y-%m-%d %T") - by github actions" && \
git push --set-upstream origin ${PUBLISH_BRANCH} --force

echo "## Done. ##################"
