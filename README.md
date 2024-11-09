## ohos-openssl-binding

This project's goal is to provide the precompiled binary of `GmSSL` in `OpenHarmony`

## Supported architectures
- arm64-v8a
- armeabi-v7a
- x86_64

## Usage


```shell
git clone https://github.com/ohos-rs/ohos-openssl.git
```

### ohpm

We can use it with ohpm.

#### Install

```shell
ohpm install @ohos-rs/gmssl --save-dev
```

#### Setup

Edit your `CMakeLists.txt` in your project and add those code:

```CMakeLists.txt
set(GMSSL_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR}/../../../oh_modules/@ohos-rs/gmssl)
set(CMAKE_MODULE_PATH ${GMSSL_ROOT_PATH})

find_package(GMSSL REQUIRED)

target_link_libraries(entry PRIVATE GMSSL::SSL)
```

#### Build

You can release package locally. Just run command: 

```shell
bash ./scripts/har.sh
```

It will generate a `.har` package in current path. You can import it with `file` protocol.
