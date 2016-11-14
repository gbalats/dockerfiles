FROM fedora:23
ENV LB_VERSION 3.10.14
ENV LLVM_VERSION 3.7

RUN dnf -y update && dnf clean all

ADD logicblox-${LB_VERSION}.tgz /opt/
ADD llvm-${LLVM_VERSION}.tgz /opt/

RUN dnf -y install which git make \
    gcc-c++ findutils \
    ncurses ncurses-devel \
    boost-devel boost-python \
    protobuf-devel \
    python-pip python-devel \
    java-1.8.0-openjdk java-1.8.0-openjdk-devel \
    emacs-nox \
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

USER cclyzer
