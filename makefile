# this makefile tests p.k
# u.k unparses growler/k to ktye/k
# make test will test p.k on growler/k aoc solutions
SHELL=bash
#the name of growler/k executable
G=g
test:
	g u.k>t.k;diff t.k <(g t.k)
