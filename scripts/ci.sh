export TIMEOUT_SCALE_FACTOR=10
export TEST_PACKAGES_EXCLUDE="less"
export SELF_TEST_EXCLUDE="^can't publish package with colons|^old cli tests|^logs - logged out|^mongo - logged out|^minifiers can't register non-js|^minifiers: apps can't use"

# run different jobs based on CicleCI parallel container index
case $CIRCLE_NODE_INDEX in
0)
  echo "Running test-packages"
  ./packages/test-in-console/run.sh
  ;;
1)
  echo "Running self-test (1): A-Com"
  ./meteor self-test --file "^[a-b]|^c[a-n]|^co[a-m]" --exclude "$SELF_TEST_EXCLUDE"
  ;;
2)
  echo "Running self-test (2): Con-Li"
  ./meteor self-test --file "^co[n-z]|^c[p-z]|^[d-k]|^l[a-i]" --exclude "$SELF_TEST_EXCLUDE"
  ;;
3)
  echo "Running self-test (3): Lj-O"
  ./meteor self-test --file "^l[j-z]|^[m-o]" --exclude "$SELF_TEST_EXCLUDE"
  ;;
4)
  echo "Running self-test (4): P"
  ./meteor self-test --file "^p" --exclude "$SELF_TEST_EXCLUDE"
  ;;
5)
  echo "Running self-test (5): Run"
  ./meteor self-test --file "^run" --exclude "$SELF_TEST_EXCLUDE"
  ;;
6)
  echo "Running self-test (6): R-So"
  ./meteor self-test --file "^r(?!un)|^s[a-o]" --exclude "$SELF_TEST_EXCLUDE"
  ;;
7)
  echo "Running self-test (7): Sp-Z"
  ./meteor self-test --file "^s[p-z]|^[t-z]" --exclude "$SELF_TEST_EXCLUDE"
  ;;
esac
