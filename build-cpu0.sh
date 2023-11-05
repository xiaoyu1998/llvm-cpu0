#!/usr/bin/env bash

TUTORIAL_DIR=~/tutorial
LLVM_PROJECT_DIR=${TUTORIAL_DIR}/llvm-project
LLVM_TEST_DIR=${TUTORIAL_DIR}/test

if ! test -d ${LLVM_TEST_DIR}; then
  mkdir ${LLVM_TEST_DIR}
  pushd ${LLVM_TEST_DIR}
# ln clang is must since Cpu0 asm boot.cpp and start.h need building clang on 
# llvm/Cpu0.
  ln -s LLVM_PROJECT_DIR/clang clang
  ln -s LLVM_PROJECT_DIR/llvm llvm
  popd
  cp -rf llvm/modify/llvm/* ${LLVM_TEST_DIR}/llvm/.
  cp -rf Cpu0 ${LLVM_TEST_DIR}/llvm/lib/Target/.
  cp -rf regression-test/Cpu0 ${LLVM_TEST_DIR}/llvm/test/CodeGen/.
  OS=`uname -s`
  echo "OS =" ${OS}
  pushd ${LLVM_TEST_DIR}
  mkdir build
  cd build
# clang has better diagnosis in report error message
  cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_C_COMPILER=clang \
  -DLLVM_TARGETS_TO_BUILD=Cpu0 -DLLVM_ENABLE_PROJECTS="clang" \
  -DLLVM_OPTIMIZED_TABLEGEN=On  \
  -DLLVM_PARALLEL_COMPILE_JOBS=8 -DLLVM_PARALLEL_LINK_JOBS=2 -G "Ninja" ../llvm
  time ninja
#  -G "Unix Makefiles" ../llvm
#  time make -j4
  popd
else
  echo "${LLVM_TEST_DIR} has existed already"
  exit 1
fi

