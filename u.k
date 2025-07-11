/ translate `argv[2] from growler/k to ktye/k
\d p
."\\l ",`env[][`ROOT],"/p.k"
\d .
bra:{x,(";"/v'y),("[({"!"])}")x} /bracket with [({
par:{"(",x,")"}
mbp:{$[~^`I`i`S`s`C?@x;;par]v x}
V1:`p'par'":+-*%&|<=>"
cal:{$[(~^`u`v?@*x)&4>#x;$[1=#x;`+1;2=#x;($*x),v x 1;3=#x;mbp[x 1],($*x),v x 2;`+1];(v@*x),bra["[";1_x]]}
ep:"eachprior:{$[#y;(x').(y;0N,-1_y);y]}";ddy:{[v;t]"(,",v[*t],"),",v t 1}
ecp:{[a;b;t]$[1<#t;"1_";""],"eachprior[",(v b),";",$[1=#t;v@*t;2=#t;ddy[v;t];`+1],"]"}
adv:{a:**x;b:(*x)1;t:1_x
 $[(~^(/;\)?a);$[1=#t;(mbp[b],$a),bra["[";t];2=#t;$[(\)~a;"1_";""],mbp[b],($a),ddy[v;t];`+"multi/\\"]
   (':)~a;ecp[a;b;t]
   (mbp[b],$((';/;\;':;/:;\:)!(';/;\;';/;\))@a),bra["[";t]]}
vrb:{$[($)~*x;$[`I~x 1;"(`i$",v[x 2],")";cal x]
       (0:)~*x;$[2=#x;("-1_\"\\n\"\\<[`$",(x 1),"]");`+"dyadic 0:"]
       ((:)~*x)&`S~@x 1;(v x 1),":",v x 2
       cal x]}
vad:{$[(`w=@*x);"{",(mbp@x 1),($*x),"x}"
       (`w=@**x);adv x
       ~^`u`v?@x;$x
       ~^`u`v?@*x;vrb x
      ]}
oth:{$[~#x;""
     `i=@x;$x
     `I=@x;" "/$x
     `s=@x;"`",$x
     `S=@x;$[1=#x;$*x;,/"`",/:$x]
     `c=@*x;$["\""~*x;x;bra[*x;1_x]]
     1<#x;cal x
     ]}
v:{$[a:vad@x;:a;];$[a:oth@x;:a;[ \"no"; \x;`a+1]]}
u:{$[(:)~*x;v x;" \\",v x]} /ktye/k needs explicit print
`0:(,ep),u'p.pf@1:`argv[2]
