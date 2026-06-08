SHELL=bash

B=/home/jack/codeberg/k
K=$B/k

test:
	$K tp.k
	$K u.k>o.k;diff o.k <($K o.k)
	$K g.k t.k>g.c
	diff <(./kc t.k) <($K t.k)
	diff <(echo '`+0'|./kc 2>&1|head -1) <(echo "'type")
	t=/tmp/a.k;echo '\t:10 {x+y}/!_1e6'>$$t; echo '{d:x-y;`exit@~0.2<d%x}.' $$($K $$t) $$(./kc $$t) |$K
