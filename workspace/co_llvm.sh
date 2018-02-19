#!/bin/bash -ux

source common

#TAG="trunk"
#TAG="tags/RELEASE_401/final"
TAG="tags/RELEASE_501/final"
#TAG="tags/RELEASE_600/final"

svn co "https://llvm.org/svn/llvm-project/llvm/${TAG}" ${SRC_DIR}
svn co "http://llvm.org/svn/llvm-project/cfe/${TAG}" "${SRC_DIR}/tools/clang"
