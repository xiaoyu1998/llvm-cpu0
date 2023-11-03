// ~/llvm/debug/build/bin/clang -target mips-unknown-linux-gnu -c loop-unroll.c -emit-llvm -S -o loop-unroll.ll
// ~/llvm/debug/build/bin/llc -march=mips -relocation-model=pic -filetype=asm loop-unroll.ll -o -

void loop_unroll(int *a, int *b, int *c) {
  for(int i=0; i< 5; i++) {
    c[i] = a[i] + b[i];
  }
}
