/ translate `argv[2] from growler/k to ktye/k
\d p
\l p.k
\d .
bra:{x,(";"/u'y),("[({"!"])}")x} /bracket with [({
par:{"(",x,")"}
mbp:{$[~^`I`i`S`s`C?@x;;par]u x}
cal:{$[(~^`u`v?@*x)&4>#x;$[1=#x;`+1;2=#x;($*x),u x 1;3=#x;par@mbp[x 1],($*x),u x 2;`+1];(u@*x),bra["[";1_x]]}
adv:{a:**x;b:(*x)1;t:1_x;mbp[b],($a),bra["[";t]}
vrb:{cal x}
vad:{$[`w=@*x;(mbp@x 1),($*x)
       `w=@**x;adv x
       ~^`u`v?@x;$x
       ~^`u`v?@*x;vrb x
      ]}
oth:{$[~#x;""
     `i=@x;$x
     `I=@x;" "/$x
     `s=@x;"`",$x
     `S=@x;$[1=#x;$*x;,/"`",/:$x]
     `c=@*x;$["\""~*x;x;bra[*x;1_x]]
     `C=@*x;*x
     1<#x;cal x
     ]}
u:{$[a:vad@x;:a;];$[a:oth@x;:a;[ \"no"; \x;`a+1]]}
`0:u'p.pf@1:"u.k"
