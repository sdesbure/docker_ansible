FROM python:3-alpine3.7
MAINTAINER Sylvain Desbureaux <sylvain@desbureaux.fr>

ARG VCS_REF
ARG BUILD_DATE

LABEL org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/ansible/ansible" \
      org.label-schema.url="https://www.ansible.com" \
      org.label-schema.name="ansible" \
      org.label-schema.docker.dockerfile="/Dockerfile" \
      org.label-schema.license="MIT" \
      org.label-schema.build-date=$BUILD_DATE

WORKDIR /playbooks

RUN apk add --no-cache build-base libffi-dev libressl-dev &&\
    pip install ansible && \
    rm -rf ~/.cache/pip &&\
    apk del build-base

CMD ["ansible", "--version"]
