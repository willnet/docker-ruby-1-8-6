FROM       ubuntu:trusty
MAINTAINER Shinichi Maeshima <netwillnet@gmail.com>

RUN \
  echo 'deb http://old-releases.ubuntu.com/ubuntu lucid-security main' | sudo tee /etc/apt/sources.list.d/lucid-security.list &&\
  apt-get update &&\
  sudo apt-get install -y zlib1g-dev &&\
  sudo apt-get install -y -t lucid-security libssl-dev &&\
  DEBIAN_FRONTEND=noninteractive apt-get install -y \
  wget build-essential libyaml-dev libxml2-dev libxslt1-dev libreadline-dev

RUN \
  cd /tmp &&\
  git clone https://github.com/rbenv/ruby-build.git &&\
  cd ruby-build &&\
  sudo ./install.sh

RUN /usr/local/bin/ruby-build 1.8.6-p420 ~/ruby-1.8.6

ENV PATH /root/ruby-1.8.6/bin:$PATH

COPY ./ruby.sh /etc/profile.d/ruby.sh
