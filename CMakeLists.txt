cmake_minimum_required(VERSION 3.10.0)
project(actions-practice VERSION 0.1.0 LANGUAGES C CXX)
set(CMAKE_CXX_STANDARD 17)

include(FetchContent)
FetchContent_Declare(
    googletest
    URL https://github.com/google/googletest/archive/refs/tags/v1.15.2.zip
    DOWNLOAD_EXTRACT_TIMESTAMP 1
)
FetchContent_MakeAvailable(googletest)

enable_testing()
add_executable(test_calc tests/test_calc.cpp)
target_include_directories(test_calc PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/src)
target_link_libraries(test_calc gtest_main)

include(GoogleTest)
gtest_discover_tests(test_calc)

add_executable(main src/main.cpp)