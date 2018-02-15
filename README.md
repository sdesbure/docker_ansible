# Ansible Docker

ansible - https://www.ansible.com

Latest ansbile release in pip embedded into this docker.

Used to perform ansible playbooks into gitlab ci runner.

## Status

Circle CI: [![CircleCI](https://circleci.com/gh/sdesbure/docker_yamllint/tree/master.svg?style=svg)](https://circleci.com/gh/sdesbure/docker_yamllint/tree/master)

## Docker image

[![](https://images.microbadger.com/badges/image/sdesbure/ansible.svg)](https://microbadger.com/images/sdesbure/ansible "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/sdesbure/ansible.svg)](https://microbadger.com/images/sdesbure/ansible "Get your own version badge on microbadger.com")

## How to use

### Pull image

```
docker pull sdesbure/ansible
```

## Run container

Per default, the docker will give you the version number of ansible.

If you want to launch a playbook, you'll have to run a specific command: 

```
docker run --rm -v <path for playbook folder>:/playbooks sdesbure/ansible ansible-playbook yourplaybook.yaml
```

## In gitlab ci runner

Here's an example of a working configuration (that have a `deploy` stage):

```
ansible:
  stage: deploy
  image: sdesbure/ansible
  script:
    - ansible-playbook -i inventory myplaybook.yaml
```
