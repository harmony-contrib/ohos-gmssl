#!/bin/sh

patch_file="${PWD}/patch/gmssl.patch"

pushd "GmSSL"
git apply "${patch_file}"
popd

build_architecture() {
    local arch=$1
    local build_shared_libs=$2

    local output_dir="${PWD}/prelude/${arch}"

    pushd "GmSSL"
    rm -rf build
    mkdir build && pushd build
    cmake .. -DOHOS_ARCH=${arch} \
    -DCMAKE_TOOLCHAIN_FILE=${OHOS_NDK_HOME}/native/build/cmake/ohos.toolchain.cmake \
    -DCMAKE_INSTALL_PREFIX=${output_dir} \
    -DBUILD_SHARED_LIBS=${build_shared_libs} && \
    make && \
    make install && \
    popd && popd
}

build_architecture "arm64-v8a" "ON"
build_architecture "arm64-v8a" "OFF"

build_architecture "armeabi-v7a" "ON"
build_architecture "armeabi-v7a" "OFF"

build_architecture "x86_64" "ON"
build_architecture "x86_64" "OFF"

pushd "GmSSL"
git apply --reverse "${patch_file}"
popd