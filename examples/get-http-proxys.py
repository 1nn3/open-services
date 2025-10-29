#!/usr/bin/env python3
# get-http-proxys.py
import sys
import libxml2
for i in range(1, len(sys.argv)):
	try:
		doc = libxml2.parseFile(sys.argv[i])
		for node in doc.xpathEval('//script[@id="http-open-proxy"][contains(@output, "Potentially OPEN proxy")]'):
			address = node.xpathEval('../../../address/@addr')[0].content
			port = node.xpathEval('../@portid')[0].content
			hostname = node.xpathEval('../../../hostnames/hostname[1]/@name')[0].content
			print(address, "\t", port, "\t", hostname)
		doc.freeDoc()
	except:
		pass
