FROM ubuntu:15.04

ENV PYTHONUNBUFFERED=1
ENV ANSIBLE_FORCE_COLOR=true

RUN apt-get update -y --fix-missing && \
  apt-get install -y \
  ansible \
  apparmor-profiles \
  curl \
  git \
  sudo

RUN git clone https://github.com/matsuu/ansible-isucon.git /opt/ansible-isucon

WORKDIR /opt/ansible-isucon/isucon5-qualifier
RUN ansible-playbook -i local bench/ansible/playbook.yml
RUN ansible-playbook -i local image/ansible/playbook.yml
