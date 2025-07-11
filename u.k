/ translate `argv[2] from growler/k to ktye/k
\d p
. "\\l ",`env[][`ROOT],"/p.k"
\d .
bra:{x,(";"/v'y),("[({"!"])}")x} /bracket with [({
par:{"(",x,")"}
mbp:{$[~|/^`I`i`S`s`C=@x;;par]v x}
V1:`p'par'":+-*%&|<=>"
cal:{(v@*x),bra["[";1_x]}
ecp:{[a;b;t]$[^V1?b;`a+1;[d:(mbp b),"'";$[1=#t;d,bra["[";t];"1_",d,par["(,",v[*t],"),",v[t 1]]]]]}
adv:{a:**x;b:(*x)1;t:1_x
 $[(|/(/;\)~\:a)&1=#t;(mbp[b],$a),bra["[";t]
   (':)~a;ecp[a;b;t]
   (mbp[b],$((';/;\;':;/:;\:)!(';/;\;';/;\))@a),bra["[";t]]}
vrb:{$[($)~*x;$[`I~x 1;"(`i$",v[x 2],")";cal x]
       (0:)~*x;$[2=#x;("-1_\"\\n\"\\<[`$",(x 1),"]");"boogey"]
       ((:)~*x)&`S~@x 1;(v x 1),":",v x 2
       cal x]}
vad:{$[(`w=@*x);$[2=#x;par@(mbp@x 1),$*x;`a+1+"need to handle ,//"]
       (`w=@**x);adv x
       |/`u`v=@x;$x
       |/`u`v=@*x;vrb x
      ]}
oth:{$[~#x;""
     |/`I`i=@x;$x
     `s=@x;"`",$x
     `S=@x;$[1=#x;$*x;,/"`",/:$x]
     `c=@*x;$["\""~*x;x;bra[*x;1_x]]
     1<#x;cal x
     ]}
v:{$[a:vad@x;:a;];$[a:oth@x;:a;[ \"no"; \x;`a+1]]}
u:{$[(:)~*x;v x;" \\",v x]} /ktye/k needs explicit print
/
u p.p"{x+y}"
u p.p"{x+y}[0;1]"
u p.p"+/{x+y}[0;1]"
u p.p"{[x;y]x+y;z}[0;1]"
p.w"/c\n/c\n1 /c\n 2\n"
p.pf"1,2"
p.pf"1,2\n3,4\n"
\
`0:u'p.pf@1:`argv[2]
