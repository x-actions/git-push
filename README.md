# Github Action for Hugo

A Github Action to build [`hugo`](https://gohugo.io/) static sites.

## Environment Variables

- GITHUB_EMAIL: git use email
- GITHUB_USERNAME: git use username
- HUGO_THEME_URL: hugo theme url[not use]

## How to Use

```
    - name: Push to Github
      uses: x-actions/gh-pages@master
      env:
        GITHUB_EMAIL: "me@xiexianbin.cn"
        GITHUB_USERNAME: "xiexianbin"
        PUBLISH_REPO: git@github.com:owner/repo.git
        PUBLISH_BRANCH: gh-pages
        PUBLISH_DIR: ./public
        DEPLOY_PRIVATE_KEY: ${{ secrets.DEPLOY_PRIVATE_KEY }}
```
