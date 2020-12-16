FROM ubuntu:20.04

ARG ANSIBLE_VERSION=2.10.4

ENV ANSIBLE_SSH_CONTROL_PATH=/dev/shm/cp%%h-%%p-%%r
ENV JSONNET_PATH=/app/config

ENV TZ=Etc/UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ARG APT='bash curl dnsutils git jq jsonnet make python-is-python3 python3-pip sshpass vim wget zip'
ARG PIP="ansible-base==${ANSIBLE_VERSION} awscli boto3 cryptography dopy netaddr pyhcl pymysql yq"

RUN set -x && \
  apt-get update && \
  apt-get --yes install ${APT} && \
  pip3 install ${PIP} && \
  rm -rf ~/.cache

COPY ./scripts/docker/install-asdf /tmp/install-asdf
RUN set -x && bash -c "/tmp/install-asdf" && rm "/tmp/install-asdf"

COPY ./ansible/ /etc/ansible/
COPY ./scripts/bin/ /bin/

WORKDIR /app
