#!/bin/sh
# Helper script to build bindings using libjit compiled inside it's source tree.
JIT_ROOT="$1"
PERL_MM_OPT="INC=-I$JIT_ROOT/include LIBS=\"-L$JIT_ROOT/jit/.libs -ljit\"" perl Makefile.PL 
