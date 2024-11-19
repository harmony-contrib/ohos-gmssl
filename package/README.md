# `@ohos-rs/gmssl`

## Install

use`ohpm` to install package.

```shell
ohpm install @ohos-rs/gmssl --save-dev
```

## Usage

```txt
# CMakeLists.txt

set(GMSSL_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR}/../../../oh_modules/@ohos-rs/gmssl)
set(CMAKE_MODULE_PATH ${GMSSL_ROOT_PATH})

find_package(GmSSL REQUIRED)

target_link_libraries(entry PRIVATE GmSSL)
```