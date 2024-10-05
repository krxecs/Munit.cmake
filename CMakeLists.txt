include(Munit.cmake)

function (munit_cmake_init)
  list(INSERT CMAKE_MODULE_PATH 0 "${_MUNIT_CMAKE_LIST_DIR}")
  set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} PARENT_SCOPE)
endfunction ()

set(_MUNIT_CMAKE_LIST_DIR
  ${CMAKE_CURRENT_LIST_DIR}
  CACHE INTERNAL "Full path to Munit.cmake folder"
)
