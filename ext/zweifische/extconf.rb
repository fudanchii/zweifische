require "mkmf"

cpp_include "assert.h"

abort "missing calloc()" unless have_func "calloc"
abort "missing free()" unless have_func "free"
abort "missing memcpy()" unless have_func "memcpy"

have_header "assert.h"

$objs = ["twofish.o", "zweifische.o"]

with_cflags(" -std=c99 -Ofast -pedantic -pedantic-errors -Wall -Werror -Wno-error=attributes ") do
  create_makefile "zweifische/zweifische"
end
