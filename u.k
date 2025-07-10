\d p
\l p.k
\d .
r:{$[`C=@x;$["\""=x 0;. x;x];$[`A=@x;o'x;x]]}                    /rewrite strings as their value
m:"[({"!"])}"
br:{x,(";"/v'y),m x}
pa:{"(",x,")"}
v:{$[~#x;""
     |/`s`I`i=@x;$x
     `S~@x;$[1=#x;$*x;"`",/:$x]
     `c=@*x;$["\""~*x;x;br[*x;1_x]]
     (0:)~*x;$[2=#x;("-1_\"\\n\"\\<[`$","\"k/aoc/15/\",",(x 1),"]");"boogey"]
     ((:)~*x)&`S~@x 1;(o x 1),":",o x 2
     |/`u`v=@x;$x
     (`w=@*x)&2=#x;pa(o x 1),$*x
     1<#x;(o@*x),br["[";1_x]
     [ \"no"; \x;`a+1]]}
u:{$[(:)~*x;v x;" \\",v x]}
u p.p"{x+y}"
u p.p"{x+y}[0;1]"
u p.p"+/{x+y}[0;1]"
u p.p"{[x;y]x+y;z}[0;1]"
p.w"/c\n/c\n1 /c\n 2\n"
p.pf"1,2"
p.pf"1,2\n3,4\n"
`"f.k"0:u'p.pf@1:`argv[2]
