# CMake generated Testfile for 
# Source directory: /mnt/School/1_Temple/summer25/bitcoin/src/secp256k1/src
# Build directory: /mnt/School/1_Temple/summer25/build/src/secp256k1/src
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(secp256k1_noverify_tests "/mnt/School/1_Temple/summer25/build/src/secp256k1/bin/noverify_tests")
set_tests_properties(secp256k1_noverify_tests PROPERTIES  _BACKTRACE_TRIPLES "/mnt/School/1_Temple/summer25/bitcoin/src/secp256k1/src/CMakeLists.txt;90;add_test;/mnt/School/1_Temple/summer25/bitcoin/src/secp256k1/src/CMakeLists.txt;0;")
add_test(secp256k1_tests "/mnt/School/1_Temple/summer25/build/src/secp256k1/bin/tests")
set_tests_properties(secp256k1_tests PROPERTIES  _BACKTRACE_TRIPLES "/mnt/School/1_Temple/summer25/bitcoin/src/secp256k1/src/CMakeLists.txt;95;add_test;/mnt/School/1_Temple/summer25/bitcoin/src/secp256k1/src/CMakeLists.txt;0;")
add_test(secp256k1_exhaustive_tests "/mnt/School/1_Temple/summer25/build/src/secp256k1/bin/exhaustive_tests")
set_tests_properties(secp256k1_exhaustive_tests PROPERTIES  _BACKTRACE_TRIPLES "/mnt/School/1_Temple/summer25/bitcoin/src/secp256k1/src/CMakeLists.txt;104;add_test;/mnt/School/1_Temple/summer25/bitcoin/src/secp256k1/src/CMakeLists.txt;0;")
