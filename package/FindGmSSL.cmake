if(NOT GMSSL_ROOT_PATH)
    message(FATAL_ERROR "-- [GMSSL_ROOT_PATH]: GMSSL_ROOT_PATH must be set up first.")
endif()

if(NOT OHOS_ARCH)
    message(FATAL_ERROR "-- [OHOS_ARCH]: OHOS_ARCH must be set up first.")
endif()

set(GMSSL_SEARCH_PATH ${GMSSL_ROOT_PATH}/prelude/${OHOS_ARCH})

file(GLOB_RECURSE GMSSL_HEADER_LIST 
    "${GMSSL_SEARCH_PATH}/include/gmssl/*.h"
)

# collect all GMSSL header files
if(NOT GMSSL_HEADER_LIST)
    message(FATAL_ERROR "No GmSSL headers found in ${GMSSL_SEARCH_PATH}/include/gmssl/")
endif()

set(GMSSL_HEADER_NAMES)
foreach(header ${GMSSL_HEADER_LIST})
    get_filename_component(header_name ${header} NAME)
    list(APPEND GMSSL_HEADER_NAMES "gmssl/${header_name}")
endforeach()

find_path(GMSSL_INCLUDE_DIR
    NAMES ${GMSSL_HEADER_NAMES}
    PATHS
        ${GMSSL_SEARCH_PATH}/include
    CMAKE_FIND_ROOT_PATH_BOTH
)

find_library(GMSSL_SSL_LIBRARY
    NAMES gmssl
    PATHS ${GMSSL_SEARCH_PATH}/lib
    CMAKE_FIND_ROOT_PATH_BOTH
)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(GmSSL DEFAULT_MSG 
    GMSSL_INCLUDE_DIR 
    GMSSL_SSL_LIBRARY 
)

if(GMSSL_FOUND)
    set(GMSSL_INCLUDE_DIRS ${GMSSL_INCLUDE_DIR})
    set(GMSSL_LIBRARIES ${GMSSL_SSL_LIBRARY})
    if(NOT TARGET GmSSL::SSL)
        add_library(GmSSL::SSL UNKNOWN IMPORTED)
        set_target_properties(GmSSL::SSL PROPERTIES
            IMPORTED_LOCATION "${GMSSL_SSL_LIBRARY}"
            INTERFACE_INCLUDE_DIRECTORIES "${GMSSL_INCLUDE_DIRS}"
        )
    endif()
endif()

mark_as_advanced(GMSSL_INCLUDE_DIR GMSSL_SSL_LIBRARY)
