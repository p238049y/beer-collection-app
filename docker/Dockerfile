FROM dart:3.4-sdk

WORKDIR /workspace

RUN apt update && apt upgrade -y
RUN apt install -y clang cmake ninja-build pkg-config libgtk-3-dev
RUN dart pub global activate fvm

ARG FLUTTER_VERSION=3.19.5
ARG PATH=/root/.pub-cache/bin:$PATH
RUN fvm doctor
RUN fvm install ${FLUTTER_VERSION} && fvm use --force ${FLUTTER_VERSION}
RUN fvm flutter config --enable-web

RUN fvm global ${FLUTTER_VERSION}
RUN fvm flutter doctor

ENV FVM_ROOT=/root/.pub-cache
ENV PATH="${PATH}:/root/fvm/default/bin:${FVM_ROOT}/bin"
RUN echo 'export PATH="${PATH}:/root/fvm/default/bin:${FVM_ROOT}/bin"' > ~/.bash_profile
