FROM alpine:3.20.1

ENV BASE_URL="https://get.helm.sh"

ENV HELM_3_FILE="helm-v3.15.3-linux-amd64.tar.gz"

RUN apk add --no-cache ca-certificates \
    --repository https://dl-3.alpinelinux.org/alpine/latest/community/ \
    jq curl bash nodejs && \
    # Install helm version 3:
    curl -L ${BASE_URL}/${HELM_3_FILE} | tar xvz && \
    mv linux-amd64/helm /usr/bin/helm && \
    chmod +x /usr/bin/helm && \
    rm -rf linux-amd64

ENV PYTHONPATH "/usr/lib/python3.8/site-packages/"

COPY . /usr/src/
ENTRYPOINT ["node", "/usr/src/index.js"]
