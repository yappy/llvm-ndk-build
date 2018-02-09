#!/bin/bash -ux

if [ $# -lt 1 ]; then
	echo "Usage: <ndk-path>"
	exit 1
fi
NDK_DIR=$1

source common

mkdir -p "${BUILD_ANDROID_DIR}" || exit 1
cd "${BUILD_ANDROID_DIR}"

# LLVM_TARGETS_TO_BUILD:STRING
# Semicolon-separated list of targets to build, or all for building all targets. Case-sensitive.
# Defaults to all. Example: -DLLVM_TARGETS_TO_BUILD="X86;PowerPC".

# LLVM_TARGET_ARCH
# LLVM target to use for native code generation. This is required for JIT generation.
# It defaults to "host", meaning that it shall pick the architecture of the machine
# where LLVM is being built.
# If you are cross-compiling, set it to the target architecture name.

# TODO
# -DCMAKE_INSTALL_PREFIX=<install-dir>
# -DCLANG_TABLEGEN=<path-to-host-bin>/clang-tblgen
# -DLLVM_DEFAULT_TARGET_TRIPLE=arm-linux-gnueabihf
cmake \
  -DCMAKE_POLICY_DEFAULT_CMP0066=OLD \
  -DCMAKE_TOOLCHAIN_FILE=${NDK_DIR}/build/cmake/android.toolchain.cmake \
  -DCMAKE_BUILD_TYPE=Release \
  -DLLVM_TABLEGEN=`realpath ../${BUILD_HOST_DIR}/bin/llvm-tblgen` \
  -DLLVM_TARGETS_TO_BUILD=ARM \
  -DLLVM_TARGET_ARCH=ARM \
  -DLLVM_INCLUDE_TESTS=Off \
  -DANDROID_ABI=armeabi-v7a \
  -DANDROID_PLATFORM=android-14 \
  -DANDROID_STL=c++_shared \
  -DANDROID_ALLOW_UNDEFINED_SYMBOLS=On \
  "../${SRC_DIR}" || exit 1

make -j${JOBS} VERBOSE=1 || exit 1
