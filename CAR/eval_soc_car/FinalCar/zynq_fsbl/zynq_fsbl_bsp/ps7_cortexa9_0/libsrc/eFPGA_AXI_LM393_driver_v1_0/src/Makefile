COMPILER=
ARCHIVER=
CP=cp
COMPILER_FLAGS=
EXTRA_COMPILER_FLAGS=
LIB=libxil.a

RELEASEDIR=../../../lib
INCLUDEDIR=../../../include
INCLUDES=-I./. -I$(INCLUDEDIR)

INCLUDEFILES := $(wildcard *.h)
LIBSOURCES := $(wildcard *.c)
OUTS := $(LIBSOURCES:.c=.o)

libs:
	@echo "Compiling eFPGA_AXI_LM393_driver..."
	$(COMPILER) $(COMPILER_FLAGS) $(EXTRA_COMPILER_FLAGS) $(INCLUDES) -c $(LIBSOURCES)
	$(ARCHIVER) -r $(RELEASEDIR)/$(LIB) $(OUTS)
	$(MAKE) clean

include:
	$(CP) $(INCLUDEFILES) $(INCLUDEDIR)

clean:
	rm -f $(OUTS)
