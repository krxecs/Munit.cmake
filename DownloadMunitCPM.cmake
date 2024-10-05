# SPDX-License-Identifier: 0BSD

if ("${MUNIT_GIT_TAG}" STREQUAL "")
  set(MUNIT_GIT_TAG master)
endif ()

CPMAddPackage(
  NAME munit
  GITHUB_REPOSITORY nemequ/munit
  GIT_TAG "${MUNIT_GIT_TAG}"
  DOWNLOAD_ONLY YES
)

if (munit_ADDED)
  add_library(munit ${munit_SOURCE_DIR}/munit.c)
  target_include_directories(munit SYSTEM PUBLIC ${munit_SOURCE_DIR})
  set(FOUND_MUNIT YES PARENT_SCOPE)
endif ()
