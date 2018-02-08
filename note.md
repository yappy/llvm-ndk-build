#Example
```
cmake -DCMAKE_TOOLCHAIN_FILE=/opt/ndk-bundle/build/cmake/android.toolchain.cmake -DCMAKE_BUILD_TYPE=Release -DLLVM_INCLUDE_TESTS=Off -DLLVM_INCLUDE_EXAMPLES=Off -DLLVM_TABLEGEN=`readlink -f ../build/bin/llvm-tblgen` -DANDROID_STL=c++_shared -DANDROID_ALLOW_UNDEFINED_SYMBOLS=On ../llvm
```

LLVM は未定義シンボルを残したままの so を作るので
ANDROID_ALLOW_UNDEFINED_SYMBOLS
cmake variable を有効にして ld --no-undefined をつけさせないようにする。

参照
* ndk 内の android.toolchain.cmake
* man ld の --no-undefined
* make (-jX) VERBOSE=1
