#!/bin/bash -ux

source common

mkdir -p "${BUILD_HOST_DIR}" || exit 1
cd "${BUILD_HOST_DIR}"

cmake -DCMAKE_BUILD_TYPE=Release "../${SRC_DIR}" || exit 1
make -j${JOBS} llvm-tblgen || exit 1
