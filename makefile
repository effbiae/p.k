SHELL=bash

#the name of growler/k executable
K=k

test:
	$K u.k>t.k;diff t.k <($K t.k)
