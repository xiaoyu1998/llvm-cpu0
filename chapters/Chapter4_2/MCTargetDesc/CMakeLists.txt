# MCTargetDesc/CMakeLists.txt
add_llvm_component_library(LLVMCpu0Desc
  Cpu0ABIInfo.cpp
  Cpu0MCAsmInfo.cpp
  Cpu0MCTargetDesc.cpp

  LINK_COMPONENTS
  MC
  Cpu0Info
  Cpu0AsmPrinter
  Support

  ADD_TO_COMPONENT
  Cpu0
  )

