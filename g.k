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
str:{$[1=#x;1_;]`k@x}
bra:{x,(";"/g'y),("[({"!"])}")x} /bracket with [({
par:{"(",x,")"}
mbp:{$[~^`I`i`S`s`C`u`v?@x;;par]g x}
cal:{[e;x]$[|/~^2 3?#x;"_",($-1+#x),"$",par@","/g[e]'|x;(g[e]@*x),bra["[";1_x]]}
chs:{$[1=#. x;"ac('",("\\'"/"'"\x[1+-2_!#x]),"')";"aCz",par x]}
cmp:{[e;x;y]"com",par@","/g[e]'(x;y)} /reverse order of arg eval
locs:{?(,`x),,//$["{"~*x;;`S~@x;*x;x~*x;`x;o'x]}
args:{$["{"~*x;[xyz:`x`y`z;|(1+|/xyz?locs@x)#xyz];`u=@x;,`x;`v=@x;`y`x;]}
lam:{a:args x;n:"$",($fi+:1);fs,:,"Z A ",n,par[(","/("A ",$:)'a)],"_(",g[a;x 1],")";(n;a)}  /lambda
glu:{"gg",par"as",par"us",par str@$x} /global lookup
case:{e:x;x:y;
      $[ `w=@x;"aw+",$. x
 (`w=@*x)&2=#x;"ar",par@","/(g[e]x 1;$.*x) /derive the verb
        (:)~*x;"gs",par@","/(g[e]x 2;g[e]@*x 1)
        (')~*x;cmp[e] . 1_x /composition
         `u=@x;"(au+",$[. x],")"
         `v=@x;"(av+",$[. x],")"
         `i=@x;"ai",par@$x
         `I=@x;"{",(","/$x),"}"
         `s=@x;"as",par "us",par str@$x
         `S=@x;$[1=#x;$[|/~^e?*x;$*x;glu@*x];,/"`",/:$x]
         `C=@x;chs x
        "{"~*x;[x:lam x;"ax",par@","/(x 0;$#x 1)]
        `c=@*x;bra[*x;1_x]
        `C=@*x;*x
          1<#x;cal[e;x]
       ]}
gla:{(0~.*x)&(`S~@x 1)&(1=#x 1)&"{"~*x[2]}
g:{[e;x]$[a:case[e;x];a;[ \x;`+1]]}
h:{$[|/^(:;::)?*x;"show",;"mr",]par g[0#`;x]}
fixverbs:{$[(2=#x)&`v~@*x;(.$[*x],":";o'x 1);x~*x;x;o'x]}
s:h'fixverbs'p.pf@1:"t.k"
`0:"#include<a.h>"
`0:"Z A1(show,K1(\"`0:`k@\",x))"
`0:"Z A2(_1$,_1(y,x))Z A3(_2$,_2(z,y,x))"
`0:"Z A2(gs,*gp(y)=xR) //global set"
`0:fs;`0:"A1(_main,";`0:{" ",x,";"}'s;`0:,")"
