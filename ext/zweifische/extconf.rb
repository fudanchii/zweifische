require "mkmf"

cpp_include "assert.h"

abort "missing calloc()" unless have_func "calloc"
abort "missing free()" unless have_func "free"
abort "missing memcpy()" unless have_func "memcpy"

have_header "assert.h"

$objs = ["twofish.o", "zweifische.o"]

create_makefile "zweifische/zweifische"
