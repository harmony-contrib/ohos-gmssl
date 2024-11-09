#!/bin/bash

script_dir=$(dirname "$0")

script_dir=$(cd "$script_dir" && pwd)

parent_dir=$(dirname "$script_dir")

cd $parent_dir

rm -rf ./package/prelude/
export COPYFILE_DISABLE=true

mkdir -p ./package/prelude/arm64-v8a/lib
cp -r ./prelude/arm64-v8a/include ./package/prelude/arm64-v8a/
cp ./prelude/arm64-v8a/lib/libgmssl.a ./package/prelude/arm64-v8a/lib/libgmssl.a
cp ./prelude/arm64-v8a/lib/libgmssl.so ./package/prelude/arm64-v8a/lib/libgmssl.so

mkdir -p ./package/prelude/armeabi-v7a/lib
cp -r ./prelude/armeabi-v7a/include ./package/prelude/armeabi-v7a
cp ./prelude/armeabi-v7a/lib/libgmssl.a ./package/prelude/armeabi-v7a/lib/libgmssl.a
cp ./prelude/armeabi-v7a/lib/libgmssl.so ./package/prelude/armeabi-v7a/lib/libgmssl.so

mkdir -p ./package/prelude/x86_64/lib/
cp -r ./prelude/x86_64/include ./package/prelude/x86_64/
cp ./prelude/x86_64/lib/libgmssl.a ./package/prelude/x86_64/lib/libgmssl.a
cp ./prelude/x86_64/lib/libgmssl.so ./package/prelude/x86_64/lib/libgmssl.so

tar -zcvf package.har package/