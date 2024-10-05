# SPDX-License-Identifier: 0BSD

if ("${MUNIT_GIT_TAG}" STREQUAL "")
  set(MUNIT_GIT_TAG master)
endif ()

include(FetchContent)
FetchContent_Declare(munit
  GIT_REPOSITORY https://github.com/nemequ/munit.git
  GIT_TAG "${MUNIT_GIT_TAG}"
	CONFIGURE_COMMAND ""
	BUILD_COMMAND ""
)
FetchContent_Populate(munit)

add_library(munit ${munit_SOURCE_DIR}/munit.c)
target_include_directories(munit SYSTEM PUBLIC ${munit_SOURCE_DIR})
set(FOUND_MUNIT YES PARENT_SCOPE)
