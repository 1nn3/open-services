#!/usr/bin/env python3

import sys
import libxml2

for i in range(1, len(sys.argv)):
	doc = libxml2.parseFile(sys.argv[i])
	for node in doc.xpathEval('//script[@id="smtp-open-relay" and contains(@output, "Server is an open relay (16/16 tests)")]'):
		address  = node.xpathEval('../../../address/@addr')[0].content;
		port     = node.xpathEval('../@portid')[0].content;
		hostname = node.xpathEval('../../../hostnames/hostname/@name')[0].content;
		print(address, "\t", port, "\t", hostname)
	doc.freeDoc()

