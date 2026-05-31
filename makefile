SHELL=bash

B=/home/jack/codeberg/k
K=$B/k

test:
	$K tp.k
	$K u.k>o.k;diff o.k <($K o.k)
	$K g.k t.k>g.c
	diff <(./kc t.k) <($K t.k)
