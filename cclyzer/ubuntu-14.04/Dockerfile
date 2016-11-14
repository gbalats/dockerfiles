FROM ubuntu:14.04

ENV LB_VERSION 3.10.14
ENV LLVM_VERSION 3.7
ENV EDITOR emacs
ENV LLVM_HOME /opt/llvm
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
ENV LOGICBLOX_HOME /opt/logicblox
ENV LB_CONNECTBLOX_ENABLE_ADMIN 1
ENV LB_PAGER_FORCE_START true
ENV LB_MEM_NOWARN true
ENV PATH $LOGICBLOX_HOME/bin:$LLVM_HOME/bin:$PATH
ENV LD_LIBRARY_PATH $LOGICBLOX_HOME/bin

ADD logicblox-${LB_VERSION}.tgz /opt/
ADD llvm-${LLVM_VERSION}.tgz /opt/

RUN apt-get update && apt-get install -y \
    build-essential \
    coreutils \
    curl \
    emacs24-nox \
    g++ \
    git \
    python-pip \
    python-dev \
    findutils \
    libboost-dev \
    libboost-filesystem-dev \
    libboost-program-options-dev \
    libboost-python-dev \
    libprotobuf-dev \
    libprotoc-dev \
    protobuf-compiler \
    openjdk-7-jdk \
    ssh-client \
    bash-completion \
 && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip
RUN pip install virtualenv

RUN groupadd -r cclyzer && useradd -ms /bin/bash -g cclyzer cclyzer
USER cclyzer
WORKDIR /home/cclyzer

COPY .emacs .emacs

USER root
RUN chown -R cclyzer:cclyzer /home/cclyzer/.*

USER cclyzer

RUN git clone https://github.com/plast-lab/cclyzer.git && \
    cd cclyzer && \
    git checkout v1.1.2

ENV TERM xterm-256color
