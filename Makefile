

quiet=quiet_
Q = @
export quiet Q

# MAKEFLAGS += --no-print-directory

HOSTCC       = cc
HOSTCXX      = c++
HOSTCFLAGS   = -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer \
		$(if $(CONFIG_TOOLS_DEBUG),-g)
HOSTCXXFLAGS = -O2

export HOSTCC HOSTCXX HOSTCFLAGS HOSTCXXFLAGS


CC := cc

KBUILD_BUILTIN := 1
KBUILD_CHECKSRC = 0
export KBUILD_CHECKSRC KBUILD_BUILTIN

KBUILD_SRC := scripts
srctree := .


VPATH := $(srctree)
export srctree VPATH

include scripts/Kbuild.include


# That's our default target when none is given on the command line
.PHONY: _all
_all: all

all: hello

scripts_basic:
	$(Q)$(MAKE) $(build)=scripts/basic
	$(Q)rm -f .tmp_quiet_recordmcount

hello: FORCE
	$(Q)$(MAKE) $(build)=hello

.PHONY: FORCE
