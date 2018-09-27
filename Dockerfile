FROM python:2-stretch
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

RUN apt update &&\
    apt install -y build-essential \
                   libffi-dev \
                   libssl-dev \
                   python-jmespath \
                   python-pip &&\
    pip install --upgrade pip &&\
    pip install ansible && \
    apt-get remove -y --auto-remove --purge build-essential &&\
    apt-get clean &&\
    rm -rf /var/lib/apt/lists/* /tmp/* &&\
    rm -rf ~/.cache/pip

RUN mkdir -p /etc/ansible
RUN echo 'localhost ansible_connection=local' > /etc/ansible/hosts

CMD ["ansible", "--version"]
