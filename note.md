# Memo
## so の未定義シンボルを許す
LLVM は未定義シンボルを残したままの so を作るので
ANDROID_ALLOW_UNDEFINED_SYMBOLS
cmake variable を有効にして ld --no-undefined をつけさせないようにする。

参照
* ndk 内の android.toolchain.cmake
* man ld の --no-undefined
* make (-jX) VERBOSE=1

## \<cstdio\> や \<fstream\> でエラー
https://github.com/android-ndk/ndk/issues/480
* NDK r16b PLATFORM=android-14 でエラー
  * android-24 ではビルド成功
* NDK r15c PLATFORM=android-14 でもエラー内容は違うが死 (issues は同じ)
  * API Level 24 (Android 7.0) 以上限定はまだきつい
* NDK r14b では CMake 3.6 でないと 3.7+ での非互換変更のせいでコンパイラチェックで失敗
  * gcc を clang のオプションで動かそうとしてしまう
  * CMake を 3.6 にするか r15 での修正をバックポートする
  * 一応これで android-14 でもビルド成功
