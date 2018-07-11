FROM alpine:latest as downloader
RUN apk add --no-cache curl
# Depends on: Github API v3, release file named 'build.tar.gz', extracting to '/build'
RUN curl -s https://api.github.com/repos/ProjectMirador/mirador/releases/latest \
    | grep "browser_download_url.*/build\.tar\.gz" \
    | cut -d '"' -f 4 \
    | xargs curl -sLO
RUN tar xfz build.tar.gz
RUN curl -OJL https://github.com/ProjectMirador/mirador/raw/develop/index.html

FROM nginx:latest as server
COPY --from=downloader /build /usr/share/nginx/html/build
COPY --from=downloader /index.html /usr/share/nginx/html/index.html
EXPOSE 80
