# Makefile
#
# Makefile for the Arduino VirtualWire project
#
# Author: Mike McCauley (mikem@airspayce.com)
# Copyright (C) 2011 Mike McCauley
# $Id: Makefile,v 1.2 2014/03/26 01:09:36 mikem Exp mikem $

PROJNAME = VirtualWire
# Dont forget to also change the version at the top of RF22.h:
DISTFILE = $(PROJNAME)-1.27.zip

all:	doxygen dist upload

doxygen: 
	doxygen project.cfg

ci:
	(cd ..;ci -l `cat $(PROJNAME)/MANIFEST`)

dist:	
	(cd ..; zip $(PROJNAME)/$(DISTFILE) `cat $(PROJNAME)/MANIFEST`)

upload:
	rsync -avz $(DISTFILE) doc/ www.airspayce.com:public_html/mikem/arduino/$(PROJNAME)
	rsync -avz ../../doc/VirtualWire.pdf www.airspayce.com:public_html/mikem/arduino/