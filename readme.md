## LLVM_Cpu0:llvm backend tutorial
This repo was fork from https://github.com/Jonathan2251/lbd

the most compile error was caused by forget to checkout llvm version 12.x as below
```
cd llvm-project
git checkout -b 12.x origin/release/12.x
git checkout e8a397203c67adbeae04763ce25c6a5ae76af52c
```