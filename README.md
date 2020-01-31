# Git push Action

A Github Action to push code to git, like [`gitpage`](https://pages.github.com/).

## Environment Variables

- GITHUB_EMAIL: git user email
- GITHUB_USERNAME: git user username
- PUBLISH_REPO: hugo theme url[not use]
- PUBLISH_BRANCH: git branch
- PUBLISH_DIR: dir to publish

## Secrets

# - DEPLOY_PRIVATE_KEY: Required your deploy key which has Write access

## How to Use

```
    - name: Push to Github
      uses: x-actions/gh-pages@release/v1
      env:
        GITHUB_EMAIL: "me@xiexianbin.cn"
        GITHUB_USERNAME: "xiexianbin"
        PUBLISH_REPO: https://${{ secrets.GitHub_PAT }}@github.com/owner/repo.git
        PUBLISH_BRANCH: gh-pages
        PUBLISH_DIR: ./public
        # DEPLOY_PRIVATE_KEY: ${{ secrets.DEPLOY_PRIVATE_KEY }}
```
