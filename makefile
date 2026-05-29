SHELL=bash

#the name of growler/k executable
K=k

test:
	$K tp.k
	$K u.k>o.k;diff o.k <($K o.k)
	$K g.k<t.k
