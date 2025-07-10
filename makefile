# this makefile tests p.k
# u.k unparses growler/k to ktye/k
# make test will test p.k on growler/k aoc solutions
SHELL=bash

#where growler/k source is at (make will git clone here if it doesn't exist)
# (only want the test code to test p.k)
GK=.

#the name of growler/k executable
G=g

#the name of ktye/k    executable
K=k

test:$(GK)/k
	export ROOT=`pwd`;cd $(GK)/k/aoc/15/;for x in 01 02; do $(G) $$ROOT/u.k $$x.k>t.k; \
		 $(K) t.k -e>$$x; diff o/$$x $$x; done
$(GK)/k:
	cd $(GK);git clone --depth=1 https://codeberg.org/growler/k.git #just want aoc tests
