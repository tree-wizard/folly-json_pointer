# Folly Json-pointer Dockerfile

FROM ubuntu:latest
RUN apt-get update --fix-missing
RUN apt-get --yes install git tree apt-utils
RUN apt-get update
RUN apt-get --yes install wget vim git tree gnupg1 zlib1g-dev make

RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key > key 
RUN apt-key add key
RUN apt-get update
RUN apt-get --yes install clang-7 lldb-7 lld-7 libfuzzer-7-dev

ENV CC clang-7
ENV CXX clang++-7

RUN apt-get install --yes g++     cmake     libboost-all-dev     libevent-dev     libdouble-conversion-dev     libgoogle-glog-dev     libgflags-dev     libiberty-dev     liblz4-dev     liblzma-dev     libsnappy-dev     make     zlib1g-dev     binutils-dev     libjemalloc-dev     libssl-dev     pkg-config     libsodium-dev

#download repos
RUN git clone https://github.com/facebook/proxygen /root/proxygen/
RUN git clone https://github.com/facebook/folly /root/proxygen/proxygen/folly

#download and replace files
RUN git clone https://github.com/xxyyx/folly-json_pointer /root/json_pointer
RUN chmod +777 /root/json_pointer/replacements/deps.sh


RUN mv /root/json_pointer/replacements/deps.sh /root/proxygen/proxygen/deps.sh
RUN mv /root/json_pointer/replacements/FollyConfigChecks.cmake /root/proxygen/proxygen/folly/CMake/FollyConfigChecks.cmake
RUN mv /root/json_pointer/replacements/Subprocess.cpp /root/proxygen/proxygen/folly/folly/Subprocess.cpp

RUN mv /root/json_pointer/replacements/json_pointer.cpp /root/proxygen/proxygen/folly/folly/json_pointer.cpp
RUN mv /root/json_pointer/replacements/Bser.h /root/proxygen/proxygen/folly/folly/experimental/bser/Bser.h
RUN mv /root/json_pointer/replacements/Expected.h /root/proxygen/proxygen/folly/folly/Expected.h

#RUN ./deps.sh
# RUN ldconfig
