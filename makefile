SHELL=bash

#the name of growler/k executable
G=k

test:
	$G u.k>t.k;diff t.k <($G t.k)
