TRIBITS_COPY_FILES_TO_BINARY_DIR(Matlab_Apply_Tests_cp
  SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}
  SOURCE_FILES ApplyUnitTest.m  laplacianfun.m  mueluParams.xml
  DEST_DIR ${CMAKE_CURRENT_BINARY_DIR}
  )

TRIBITS_ADD_ADVANCED_TEST(
  Matlab_ApplyMueLu
  TEST_0 CMND ${MATLAB_ROOT}/bin/matlab ARGS -nodesktop -nosplash -r ApplyUnitTest
  PASS_REGULAR_EXPRESSION "passed"
  CATEGORIES BASIC NIGHTLY
  COMM serial
  )

