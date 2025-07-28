#!/usr/bin/env sh
echo $$ >loop-pid.txt
while shuf ./targets.txt | nice xargs -I{} -P8 ./scan {}; do
	./eval-results && ./rm-random-results
done

