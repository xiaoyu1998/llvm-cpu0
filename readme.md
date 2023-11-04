## LLVM_Cpu0: llvm backend tutorial
This repo was fork from https://github.com/Jonathan2251/lbd

llvm build steps:
```
$ cd $home
$ mkdir tutorial
$ cd tutoral
$ git clone git@github.com:xiaoyu1998/LLVM_Cpu0.git
$ cd LLVM_Cpu0
$ bash build-llvm.sh
```
Please remember to add "~/tutorial/llvm-project/build/bin" to variable "${PATH}" to your environment for clang++, clang.

Cpu0 build steps(first time):
```
$ cd $home/tutorial/LLVM_Cpu0
$ bash build-cpu0.sh
```

The most compile error was caused by forget to checkout llvm version 12.x as below
```
$ cd llvm-project
$ git checkout -b 12.x origin/release/12.x
$ git checkout e8a397203c67adbeae04763ce25c6a5ae76af52c
```
