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
mkdir /root/.ssh
ssh-keyscan -t rsa github.com > /root/.ssh/known_hosts
echo ${DEPLOY_PRIVATE_KEY} > /root/.ssh/id_rsa
chmod 400 /root/.ssh/id_rsa

echo "## Push to Github ##################"
rm -rf .git
cd ${PUBLISH_DIR}

if [[ -n "${CNAME}" ]]; then
  echo 'Creating CNAME file'
  echo "${CNAME}" > CNAME
fi

git init
git add . && \
git commit -m "update at $(date "+%Y-%m-%d %T")  - by github actions" && \
git push --force "${PUBLISH_REPO}" master:${PUBLISH_BRANCH}

echo "## Done. ##################"
