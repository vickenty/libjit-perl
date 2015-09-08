MODULE = LibJIT  PACKAGE = LibJIT  PREFIX = libjit_misc_

jit_label_t
libjit_misc_jit_label_undefined()
CODE:
	RETVAL = jit_label_undefined;
OUTPUT:
	RETVAL
