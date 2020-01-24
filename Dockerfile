# reate by xiexianbin, For Github Hugo Actions 
FROM alpine:latest

# Dockerfile build cache 
ENV REFRESHED_AT 2020-01-24

LABEL "com.github.actions.name"="Hugo Actions"
LABEL "com.github.actions.description"="deploy sites to github."
LABEL "com.github.actions.icon"="home"
LABEL "com.github.actions.color"="green"
LABEL "repository"="http://github.com/xiexianbin/hugo-actions"
LABEL "homepage"="http://github.com/xiexianbin/hugo-actions"
LABEL "maintainer"="xiexianbin<me@xiexianbin.cn>"

LABEL "Name"="Github Push Actions"
LABEL "Version"="0.1.0"

ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN apk update && apk add --no-cache git git-lfs bash wget curl openssh-client tree && rm -rf /var/cache/apk/*

ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

WORKDIR /github/workspace
ENTRYPOINT ["/entrypoint.sh"]

