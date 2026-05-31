SHELL=bash

B=/home/jack/codeberg/k
K=$B/k

test:
	$K tp.k
	$K u.k>o.k;diff o.k <($K o.k)
	$K g.k t.k>g.c
	$K g.k t.k|$(CC) -I$B -shared -fPIC -xc - -olibg.so&&diff <($K tg.k) <($K t.k)
