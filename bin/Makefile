# $LastChangedDate: 2010-07-14 11:06:31 -0400 (Wed, 14 Jul 2010) $
# $Revision: 398 $

# Demystifying GPU Microarchitecture through Microbenchmarking
# http://www.stuffedcow.net/research/cudabmk



CUFILES=$(SRCDIR)/empty.cu $(SRCDIR)/clock.cu
CCFILES=$(SRCDIR)/main.cpp
CUFILES_sm_10=
CUFILES_sm_11=
CUFILES_sm_12=
CUFILES_sm_13=$(SRCDIR)/regfile.cu $(SRCDIR)/ksync_uint_dep128.cu $(SRCDIR)/pipeline.cu
CU_DEPS=$(SRCDIR)/instructions.h
# Hack: Because of the obj/release/%.cu_sm_13_o rule in morerules.mk, a side effect of 
# listing a .cu file under CUFILES_sm_13 is that it will do a modified compile 
# flow where it leaves all the intermediate files intact, and try to replace
# the compiled filename.cubin with filename.real_cubin and merge the custom
# cubin into the fat binary. If filename.real_cubin doesn't exist, then the only
# side effect is leaving a mess in the compile directory.

EXECUTABLE=main



all: program diverge sync icache1 icache2 icache3 icache4 cmem global shared texture2 texture4 otherstuff

main: program

# List of .ptx files to build from .cu files.
PTX_OUTPUTS= # clock.ptx pipeline.ptx

include ../common.mk

# Build the program
program: $(TARGET)

# Build other stuff, like PTX dumps of .cu files
otherstuff: $(PTX_OUTPUTS)

export CUDA_INSTALL_PATH
 


diverge:
	$(MAKE) -f $(BUILDSCRIPT)/Makefile-diverge

sync:
	$(MAKE) -f $(BUILDSCRIPT)/Makefile-sync

icache1:
	$(MAKE) -f $(BUILDSCRIPT)/Makefile-icache1

icache2:
	$(MAKE) -f $(BUILDSCRIPT)/Makefile-icache2

icache3:
	$(MAKE) -f $(BUILDSCRIPT)/Makefile-icache3
	
icache4:
	$(MAKE) -f $(BUILDSCRIPT)/Makefile-icache4

cmem:
	$(MAKE) -f $(BUILDSCRIPT)/Makefile-cmem

global:
	$(MAKE) -f $(BUILDSCRIPT)/Makefile-global

shared:
	$(MAKE) -f $(BUILDSCRIPT)/Makefile-shared

texture2:
	$(MAKE) -f $(BUILDSCRIPT)/Makefile-texture2

texture4:
	$(MAKE) -f $(BUILDSCRIPT)/Makefile-texture4

clean:
	@ls | grep -v Makefile$ | xargs rm

