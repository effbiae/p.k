\d p
\l p.k
\d .
r:{$[`C=@x;$["\""=x 0;. x;x];$[`A=@x;o'x;x]]}                    /rewrite strings as their value
m:"[({"!"])}"
br:{x,(";"/u'y),m x}
pa:{"(",x,")"}
u:{$[~#x;""
     |/`s`I`i=@x;$x
     `S~@x;$[1=#x;$*x;"`",/:$x]
     `c=@*x;br[*x; \1_x]
     |/`u`v=@x;$x
     `w=@*x;pa(o x 1),$*x
     1<#x;(o@*x),br["[";1_x]
     [ \"no"; \x;$x]]}
u \p.p"{x+y}"
u \p.p"{x+y}[0;1]"
u \p.p"+/{x+y}[0;1]"
u \p.p"{[x;y]x+y;z}[0;1]"
$["#"~**s:0:`argv[2];s:1_s;s]
p.p \"\n"/s
/
p.s:s
\d p
C s
0{T[x;y]}\C s
/( \&11>0{T[x;y]}\C s)_s
