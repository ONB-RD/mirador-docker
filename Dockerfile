FROM alpine:latest as downloader
RUN apk add --no-cache curl jq
# Depends on: Github API v3, release file named 'build.tar.gz', extracting to '/build'
#Mirador Version 2.7.0
RUN curl -s https://api.github.com/repos/ProjectMirador/mirador/releases/14911692 \
    | jq '.assets[] | select(.name == "build.tar.gz") | .browser_download_url' \
    | xargs curl -sLO
RUN tar xfz build.tar.gz
RUN curl -OJL https://github.com/ProjectMirador/mirador/raw/develop/index.html

FROM nginx:alpine as server
COPY --from=downloader /build /usr/share/nginx/html/build
COPY --from=downloader /index.html /usr/share/nginx/html/index.html
EXPOSE 80
