FROM fedora:23

ENV LB_VERSION 3.10.14

ENV LLVM_HOME /opt/llvm
ENV LLVM_VERSION 3.8.0
ENV LLVM_ARCHIVE clang+llvm-${LLVM_VERSION}-x86_64-fedora23.tar.xz
RUN dnf -y update && dnf clean all

RUN dnf -y install which git make \
    gcc-c++ findutils \
    ncurses ncurses-devel \
    boost-devel boost-python \
    protobuf-devel \
    python-pip python-devel \
    java-1.8.0-openjdk java-1.8.0-openjdk-devel \
    emacs-nox \
    xz \
    && dnf clean all

RUN pip install --upgrade pip
RUN pip install virtualenv

RUN groupadd -r cclyzer && useradd -r -g cclyzer cclyzer
USER cclyzer
WORKDIR /home/cclyzer

COPY .bashrc .bashrc
COPY .bash_profile .bash_profile
COPY .emacs .emacs
COPY cclyzer cclyzer

USER root
RUN chown -R cclyzer:cclyzer /home/cclyzer/* /home/cclyzer/.*


WORKDIR /tmp

ADD logicblox-${LB_VERSION}.tgz /opt/

RUN mkdir $LLVM_HOME
ADD http://llvm.org/releases/${LLVM_VERSION}/${LLVM_ARCHIVE} .
RUN tar xf $LLVM_ARCHIVE -C $LLVM_HOME --strip-components=1
RUN rm $LLVM_ARCHIVE

USER cclyzer
WORKDIR /home/cclyzer
