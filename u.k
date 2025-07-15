/
 unparse. runs on itself to test p.k
\
\d p
\l p.k
\d .
bra:{x,(";"/u'y),("[({"!"])}")x} /bracket with [({
par:{"(",x,")"}
mbp:{$[~^`I`i`S`s`C`u`v?@x;;par]u x}
cal:{$[(~^`u`v?@*x)&4>#x;$[1=#x;`+1;2=#x;par($*x),u x 1;3=#x;par@mbp[x 1],($*x),u x 2;`+1];(u@*x),bra["[";1_x]]}
adv:{(a;b):*x;t:1_x;mbp[b],($a),bra["[";t]}
case:{$[`w=@*x;mbp[x 1],($*x)
       `w=@**x;adv x
        ~^`u`v`i?@x;$x
       `I=@x;" "/$x
       `s=@x;"`",$x
       `S=@x;$[1=#x;$*x;,/"`",/:$x]
       `c=@*x;$["\""~*x;x;bra[*x;1_x]]
       `C=@*x;*x
       1<#x;cal x
       ]}
u:{$[a:case@x;a;[ \x;`+1]]}
`0:u'p.pf@1:"u.k"
