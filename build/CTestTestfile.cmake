# CMake generated Testfile for 
# Source directory: /mnt/School/1_Temple/summer25/bitcoin
# Build directory: /mnt/School/1_Temple/summer25/build
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test([=[util_test_runner]=] "/usr/bin/cmake" "-E" "env" "BITCOINUTIL=/mnt/School/1_Temple/summer25/build/bin/bitcoin-util" "BITCOINTX=/mnt/School/1_Temple/summer25/build/bin/bitcoin-tx" "/usr/bin/python3" "/mnt/School/1_Temple/summer25/build/test/util/test_runner.py")
set_tests_properties([=[util_test_runner]=] PROPERTIES  _BACKTRACE_TRIPLES "/mnt/School/1_Temple/summer25/bitcoin/cmake/tests.cmake;6;add_test;/mnt/School/1_Temple/summer25/bitcoin/cmake/tests.cmake;0;;/mnt/School/1_Temple/summer25/bitcoin/CMakeLists.txt;621;include;/mnt/School/1_Temple/summer25/bitcoin/CMakeLists.txt;0;")
add_test([=[util_rpcauth_test]=] "/usr/bin/python3" "/mnt/School/1_Temple/summer25/build/test/util/rpcauth-test.py")
set_tests_properties([=[util_rpcauth_test]=] PROPERTIES  _BACKTRACE_TRIPLES "/mnt/School/1_Temple/summer25/bitcoin/cmake/tests.cmake;12;add_test;/mnt/School/1_Temple/summer25/bitcoin/cmake/tests.cmake;0;;/mnt/School/1_Temple/summer25/bitcoin/CMakeLists.txt;621;include;/mnt/School/1_Temple/summer25/bitcoin/CMakeLists.txt;0;")
subdirs("test")
subdirs("doc")
subdirs("src")
