## llvm-cpu0: llvm backend tutorial
This repo was fork from https://github.com/Jonathan2251/lbd

Prerequisites:ubuntu/cmake/git/ninja

llvm build steps:
```
$ cd $home
$ mkdir tutorial
$ cd tutoral
$ git clone git@github.com:xiaoyu1998/llvm-cpu0.git
$ cd llvm-cpu0
$ bash build-llvm.sh
```
The most llvm compile errors was caused by there is no enough memory to handle parallel complile and link jobs, just reduce jobs or enlarge swapfile.


Please remember to add "~/tutorial/llvm-project/build/bin" to variable "${PATH}" to your environment for clang++, clang.

Cpu0 build steps(first time):
```
$ cd $home/tutorial/llvm-cpu0
$ bash build-cpu0.sh
```

The most cpu0 compile errors was caused by forget to checkout llvm version 12.x as below
```
$ cd $home/tutorial/llvm-project
$ git checkout -b 12.x origin/release/12.x
$ git checkout e8a397203c67adbeae04763ce25c6a5ae76af52c
```
