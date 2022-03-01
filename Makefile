

KBUILD_BUILTIN := 1

export KBUILD_BUILTIN


# KBUILD_SRC is fixed
KBUILD_SRC := scripts
srctree := .


VPATH := $(srctree)
export srctree

include scripts/Kbuild.include


# That's our default target when none is given on the command line
.PHONY: _all
_all: all

all: hello


hello: FORCE
	$(Q)$(MAKE) $(build)=hello

.PHONY: FORCE
