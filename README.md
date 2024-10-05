<!--
SPDX-License-Identifier: 0BSD
-->

# Munit.cmake

[![standard-readme compliant](https://img.shields.io/badge/readme%20style-standard-brightgreen.svg?style=flat-square)](https://github.com/RichardLitt/standard-readme)

Project to help use [Munit](https://nemequ.github.io/munit/) with CMake projects easily.

## Table of Contents

- [Install](#install)
  - [Using CPM.cmake](#using-cpmcmake)
  - [Using FetchContent](#using-fetchcontent)
- [Usage](#usage)
- [API](#api)
- [Contributing](#contributing)
- [License](#license)

## Install

### Using [CPM.cmake](https://github.com/cpm-cmake/CPM.cmake)

After [adding CPM.cmake](https://github.com/cpm-cmake/CPM.cmake#adding-cpm), add the following line to the project's `CMakeLists.txt` after calling `project(...)`.

```cmake
include(cmake/CPM.cmake)
CPMAddPackage("gh:krxecs/Munit.cmake#origin/main")
```

### Using FetchContent

You can also include this project using FetchContent:

```cmake
include(FetchContent)
FetchContent_Declare(Munit.cmake
  GIT_REPOSITORY https://github.com/krxecs/Munit.cmake
  GIT_TAG origin/main
  CONFIGURE_COMMAND ""
  BUILD_COMMAND ""
)
FetchContent_Populate(Munit.cmake)
```

## Usage

First, install the project. Then, before calling any module for this project, call `munit_cmake_init`:

```cmake
munit_cmake_init()
```

Then, include [`DownloadMunit.cmake`](DownloadMunit.cmake) (or [`DownloadMunitCPM.cmake`](DownloadMunitCPM.cmake)) to download Munit:

```cmake
include(DownloadMunit)  # or include(DownloadMunitCPM.cmake)
```

Link all your test targets with `munit` target & register their tests with `munit_discover_tests`:

```cmake
add_executable(test_exe test.c)
target_link_libraries(test_exe
  munit
  # Other targets
)
munit_discover_tests(test_exe)
```

## API

There is only one major function you need to use, `munit_discover_tests`. The function call along with all its parameters are:

```cmake
munit_discover_tests(target
                     [NO_FORK]
                     [SHOW_STDERR]
                     [FATAL_FAILURES]
                     [SINGLE]
                     [ITERATIONS n]
                     [WORKING_DIRECTORY dir]
                     [SEED s]
                     [LOG_VISIBLE level]
                     [LOG_FATAL level]
                     [TEST_PREFIX prefix]
                     [TEST_SUFFIX suffix]
                     [EXTRA_ARGS arg1...]
                     [PARAMS arg1...]
)
```

The meaning of these options can be found in the file [`Munit.cmake`](Munit.cmake).

## Contributing

Unless you explicitly state otherwise, any contribution intentionally submitted
for inclusion in the work by you, shall be licensed as below, without any
additional terms or conditions.

## License

Licensed under the BSD Zero Clause License. See [LICENSE file](LICENSE.md) in
the project root, or https://opensource.org/licenses/0BSD for full license
information.

The [SPDX](https://spdx.dev) license identifier for this project is `0BSD`.
