#!/bin/bash
#
# Builds protobuf C++ with aarch64 crosscompiler.

set -ex

./autogen.sh
CXXFLAGS="-fPIC -g -O2" ./configure --host=aarch64
make -j8

# The Java build setup expects the protoc binary to be in the src/ directory.
ln -s $PWD/protoc ./src/protoc
