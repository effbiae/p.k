SHELL=bash

B=/home/jack/codeberg/k
K=$B/k

test:
	$K tp.k
	$K u.k>o.k;diff o.k <($K o.k)
	$K g.k t.k>g.c&&$(MAKE) libg.so&&diff <($K tg.k) <($K t.k)
libg.so:g.c
	$(CC) -I$B -L$B -shared -fPIC $^ -o $@
