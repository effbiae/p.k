/
 generate c. runs on itself to test p.k
\
v1:","\"sam,flp,neg,fir,sqr,til,whr,rev,asc,dsc,grp,not,enl,nul,len,flr,str,unq,typ,val,u0c,u1c,u2c,las,imn,imx,out"
v2:","\"dex,add,sub,mul,dvd,exc,mnm,mxm,ltn,gtn,eql,mtc,cat,crt,hsh,und,dlr,que,_1,dot,v0c,v1c,v2c,dex,dex,dex,dex"

\d p
\l p.k
\d .
Q:{$[x;;`+1]} /assert x
fs:();fi:0
bra:{x,(";"/g'y),("[({"!"])}")x} /bracket with [({
par:{"(",x,")"}
mbp:{$[~^`I`i`S`s`C`u`v?@x;;par]g x}
cal:{$[(~^`u`v?@*x)&4>#x;$[1=#x;`+1;2=#x;("_1(",(g@*x),")"),"(",g[x 1],")"
                                    3=#x;par@mbp[x 1],($*x),g x 2;`+1];(g@*x),bra["[";1_x]]}
chs:{$[1=#. x;"ac('",("\\'"/"'"\x[1+-2_!#x]),"')";"aCz(",x,")"]}
cmp:{(g x),"(",g[y],"(x,y))"}
locs:{?(,`x),,//$["{"~*x;;`S~@x;*x;x~*x;`x;o'x]}
args:{xyz:`x`y`z;|(1+|/xyz?locs@x)#xyz}
lam:{n:"$",($fi+:1);fs,:,"A ",n,"(",(","/("A ",$:)'(a:args x)),")_(",(g@* x),")";(n;a)}  /lambda
case:{$[ `w=@x;"aw+",$. x
 (`w=@*x)&2=#x;"ar(",(","/|g'x),")" /derive the verb
        (')~*x;cmp . 1_x /composition
         `u=@x;"(au+",$[. x],")"
         `v=@x;"(av+",$[. x],")"
         `i=@x;"ai(",($x),")"
         `I=@x;"{",(","/$x),"}"
         `s=@x;"as(\"",($x),"\")"
         `S=@x;$[1=#x;$*x;,/"`",/:$x]
         `C=@x;chs x
        "{"~*x;"2:\"",(*lam 1_x),"\""
        `c=@*x;bra[*x;1_x]
        `C=@*x;*x
          1<#x;cal x
       ]}
gla:{(0~.*x)&(`S~@x 1)&(1=#x 1)&"{"~*x[2]}
g:{$[a:case@x;a;[ \x;`+1]]}
fixverbs:{$[(2=#x)&`v~@*x;(.$[*x],":";o'x 1);x~*x;x;o'x]}
s:g'fixverbs'p.pf@1:0
`0:"#include<a.h>";`0:fs;`0:"A1(_main)_(";`0:{" ",x,";"}'s;`0:,")"
