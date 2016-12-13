FROM ubuntu:16.04

ENV LB_VERSION 3.10.14

ENV LLVM_HOME /opt/llvm
ENV LLVM_VERSION 3.9.0
ENV LLVM_ARCHIVE clang+llvm-${LLVM_VERSION}-x86_64-linux-gnu-ubuntu-16.04.tar.xz

ENV EDITOR emacs
ENV TERM xterm-256color
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

ENV LOGICBLOX_HOME /opt/logicblox
ENV LB_CONNECTBLOX_ENABLE_ADMIN 1
ENV LB_PAGER_FORCE_START true
ENV LB_MEM_NOWARN true
ENV PATH $LOGICBLOX_HOME/bin:$LLVM_HOME/bin:$PATH
ENV LD_LIBRARY_PATH $LOGICBLOX_HOME/bin

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
    libtool \
    openjdk-8-jdk \
    ssh-client \
    xz-utils \
    bash-completion \
 && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip
RUN pip install virtualenv

RUN groupadd -r cclyzer && useradd -ms /bin/bash -g cclyzer cclyzer
USER cclyzer
WORKDIR /home/cclyzer

COPY .emacs .emacs
COPY cclyzer cclyzer

USER root
RUN chown -R cclyzer:cclyzer .* *


WORKDIR /tmp

ADD logicblox-${LB_VERSION}.tgz /opt/

RUN mkdir $LLVM_HOME
ADD http://llvm.org/releases/${LLVM_VERSION}/${LLVM_ARCHIVE} .
RUN tar xf $LLVM_ARCHIVE -C $LLVM_HOME --strip-components=1
RUN rm $LLVM_ARCHIVE

WORKDIR /lib/x86_64-linux-gnu
RUN ln -s libtinfo.so.5 libtinfo.so

USER cclyzer
WORKDIR /home/cclyzer
