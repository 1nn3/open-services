#!/usr/bin/env python3
# get-open-relays.py
import sys
import libxml2
for arg in sys.argv[1:]:
	try:
		doc = libxml2.parseFile(arg)
		for node in doc.xpathEval('//script[@id="smtp-open-relay"][contains(@output, "Server is an open relay (16/16 tests)")]'):
			address = node.xpathEval('../../../address/@addr')[0].content
			port = node.xpathEval('../@portid')[0].content
			hostname = node.xpathEval('../../../hostnames/hostname[1]/@name')[0].content
			print(address, "\t", port, "\t", hostname)
		doc.freeDoc()
	except:
		pass
