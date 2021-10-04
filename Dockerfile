FROM hashicorp/terraform:1.0.7

RUN apk add --update \
    python3 \
    python3-dev \
    curl \
    bash \
    py3-pip && pip3 install --upgrade pip && pip3 install awscli \
  && rm -rf /var/cache/apk/*

WORKDIR /hello-world

ENTRYPOINT []

