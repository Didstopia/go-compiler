ARG GO_IMAGE_VERSION=latest
ARG GO_BRANCH=master
ARG GOARCH=arm64
ARG GOOS=darwin
FROM golang:${GO_IMAGE_VERSION}
ARG GO_IMAGE_VERSION
ARG GO_BRANCH
ARG GOARCH
ARG GOOS
ENV GO_IMAGE_VERSION=${GO_IMAGE_VERSION}
ENV GO_BRANCH=${GO_BRANCH}
ENV GOARCH=${GOARCH}
ENV GOOS=${GOOS}
RUN apt-get update && apt-get install -y git bash build-essential
ADD entrypoint.sh /entrypoint.sh
VOLUME [ "/data" ]
ENTRYPOINT [ "/entrypoint.sh" ]
