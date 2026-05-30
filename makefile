SHELL=bash

B=/home/jack/codeberg/k
K=$B/k

test:
	$K tp.k
	$K u.k>o.k;diff o.k <($K o.k)
	echo 1|$K g.k >g.c&&$(MAKE) libg.so&&$K tg.k
	$K g.k t.k>g.c&&$(MAKE) libg.so&&$K tg.k
libg.so:g.c
	$(CC) -I$B -L$B -shared -fPIC $^ -o $@ -lk
