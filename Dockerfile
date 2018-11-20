FROM maven:3.5.4-jdk-8
MAINTAINER Efim Polevoi <fimkap@gmail.com>

########################################
# System Stuff
########################################

# Better terminal support
# ENV TERM screen-256color
# ENV DEBIAN_FRONTEND noninteractive

# Update and install
RUN apt-get update && apt-get install -y \
      curl \
      wget \
      git \
      software-properties-common \
      python-dev \
      python-pip \
      python3-dev \
      python3-pip \
      ctags \
      silversearcher-ag \
      # For python crypto libraries
      libssl-dev \
      libffi-dev \
      locales \
      # For Neovim
      ninja-build \
      gettext \
      libtool \
      libtool-bin \
      autoconf \
      automake \
      cmake \
      g++ \
      pkg-config \
      unzip

# Install python linting and neovim plugin
RUN pip install neovim
RUN pip3 install neovim

# Install jedi coompletion engine
RUN pip install jedi

# Install Neovim
RUN  git clone -b v0.3.1 https://github.com/neovim/neovim.git && \
  cd neovim && \
  make CMAKE_BUILD_TYPE=Release && \
  make install && \
  cd ../ && rm -rf neovim

COPY init.vim /root/.config/nvim/init.vim
COPY google-java-format-1.6-all-deps.jar /root/

# Install neovim plugins
RUN nvim -i NONE -c PlugInstall -c quitall > /dev/null 2>&1
