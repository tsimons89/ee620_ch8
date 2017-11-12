############################################################################
## Purpose: Makefile for Chap_6_Randomization/homework_solution
## Author: Chris Spear
##
## REVISION HISTORY:
## $Log: Makefile,v $
## Revision 1.1  2011/05/29 19:10:04  tumbush.tumbush
## Check into cloud repository
##
## Revision 1.2  2011/03/20 20:16:58  Greg
## Fixed path of Makefile
##
## Revision 1.1  2011/03/20 19:09:52  Greg
## Initial check in
##
############################################################################
PACKET_FILES = header.sv payload.sv packet_base.sv packet.sv packet_bad.sv
DRIVER_FILES = driver_cbs.sv driver_cbs_v3.sv driver_cbs_scb.sv driver.sv
ENV_FILES = scoreboard.sv generator.sv environment.sv 
TEST_FILES = test_base.sv test_reg.sv test_good.sv test_bad.sv test_v3.sv  test.sv
VERILOG_FILES = ${PACKET_FILES} ${DRIVER_FILES} ${ENV_FILES} ${TEST_FILES} top.sv	
TOPLEVEL = top

help:
	@echo "Make targets:"
	@echo "> make questa_gui   	# Compile and run with Questa in GUI mode"
	@echo "> make questa_batch 	# Compile and run with Questa in batch mode"
	@echo "> make clean        	# Clean up all intermediate files"
	@echo "> make tar          	# Create a tar file for the current directory"
	@echo "> make help         	# This message"

#############################################################################
# VCS section
VCS_FLAGS = -sverilog -debug  -l comp.log
vcs:	simv
	./simv -l sim.log

simv:   ${VERILOG_FILES} clean
	mkdir work
	vhdlan ${VHDL_FILES}
	vlogan ${VCS_FLAGS} ${VERILOG_FILES}
	vcs ${TOPLEVEL}

#############################################################################
# Questa section
questa_gui: 
	vlib work
	vmap work work
	vlog ${VERILOG_FILES}
	vsim +TESTNAME=${TESTNAME} -novopt -classdebug -t ns -do "view wave;do wave.do;run -all" ${TOPLEVEL}

questa_batch: ${VERILOG_FILES} clean
	vlib work
	vmap work work
	vlog ${VERILOG_FILES} 
	vsim +TESTNAME=${TESTNAME} -c -novopt -t ns -do "run -all" ${TOPLEVEL} 

#############################################################################
# Housekeeping

DIR = $(shell basename `pwd`)

tar:	clean
	cd ..; \
	tar cvf ${DIR}.tar ${DIR}

clean:
	@# VCS Stuff
	@rm -rf simv* csrc* *.log *.key vcdplus.vpd *.log .vcsmx_rebuild vc_hdrs.h .vlogan*
	@# Questa stuff
	@rm -rf work transcript vsim.wlf
	@# Unix stuff
	@rm -rf  *~ core.*
