# llvm-ndk-build

## Depends
* git
* subversion
* cmake (>3.6)
* build-essential
** make and gcc
* g++
** LLVM cross build requires LLVM tool's host build
* ndk (from android official site)

## Patches
### NDK r14 or lower + CMake 3.7 or higher
Patch for `<NDKr14>/build/cmake/android.toolchain.cmake`
Changes on CMake 3.6 -> 3.7 causes CheckCCompiler error on cmake configure.
It is fixed at NDK r15 and this is the patch for r14.
