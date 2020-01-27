# create by xiexianbin, Github Action for git push
FROM alpine:latest

# Dockerfile build cache 
ENV REFRESHED_AT 2020-01-24

LABEL "com.github.actions.name"="Github Action for git push"
LABEL "com.github.actions.description"="Github Action for git push."
LABEL "com.github.actions.icon"="home"
LABEL "com.github.actions.color"="green"
LABEL "repository"="http://github.com/xiexianbin/hugo-actions"
LABEL "homepage"="http://github.com/xiexianbin/hugo-actions"
LABEL "maintainer"="xiexianbin<me@xiexianbin.cn>"

LABEL "Name"="Github Action for git push"
LABEL "Version"="1.0.0"

ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN apk update && apk add --no-cache git git-lfs bash wget curl openssh-client tree && rm -rf /var/cache/apk/*

ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

WORKDIR /github/workspace
ENTRYPOINT ["/entrypoint.sh"]

