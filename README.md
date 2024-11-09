## ohos-gmssl-binding

![Platform](https://img.shields.io/badge/platform-arm64/arm/x86_64-blue) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

# !Note: current har package can't use directly, application can't find dynamic library and will crash.

This project's goal is to provide the precompiled binary of `GmSSL` in `OpenHarmony`

## Supported architectures

- arm64-v8a
- armeabi-v7a
- x86_64

## Usage

```shell
git clone https://github.com/harmony-contrib/ohos-gmssl.git
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

find_package(GmSSL REQUIRED)

target_link_libraries(entry PRIVATE GmSSL::SSL)
```

#### Build

You can release package locally. Just run command:

```shell
bash ./scripts/har.sh
```

It will generate a `.har` package in current path. You can import it with `file` protocol.
