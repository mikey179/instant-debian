FROM debian:jessie

MAINTAINER Frank Kleine <frank.kleine@1und1.de>

WORKDIR /root

RUN apt-get clean \
    && apt-get -y update \
    && apt-get install -y \
      less \
      vim \
      git \
      curl \
      zsh

COPY bashrc /root/.bashrc

RUN curl --silent --show-error https://raw.githubusercontent.com/mikey179/dotfiles/master/bootstrap.sh | bash

RUN chsh -s $(grep /zsh$ /etc/shells | head -1)

RUN echo "PROMPT=\"%m \$PROMPT\"" >> /root/.zshrc

