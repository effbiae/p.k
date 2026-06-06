/
 generate c
\
\d p
\l p.k
\d .
Q:{$[x;x;`+1]} /assert x
fs:();fi:0
str:{$[1=#x;1_;]`k@x}
par:{"(",x,")"}
ccl:{x,par@$[~^`C`c?@y;y;","/y]}
cal:{[e;x]$[~^2 3?#x;ccl["_",($-1+#x),"$";g[e]'x];]}
chs:{$[`c~@. x;"ac('",("\\'"/"'"\(-1_1_x)),"')";ccl["aCz";str@. x]]}
cmp:{[e;x;y]ccl["com$";g[e]'(x;y)]} /reverse order of arg eval
vars:{,//$["{"~*x;();(1=#x)&`S~@x;x;x~*x;();o'x]}
locals:{?`x,vars 1_x}
args:{(1+|/xyz?locals@x)#xyz:`x`y`z}
increfs:{,/{ccl["_R";x],";"}'(#').(.:;$!:)@\:(1>)_-1+#'=vars x}
bda:{[a;x]increfs[x],g[a;x]}
lam:{a:args x;n:"$$",($fi+:1);fs,:,"Z A ",ccl[n;("A ",$:)'a],ccl["_";bda[a;x 1]];(n;a)}  /lambda
t:{"({L t=now();F(",$[x],",",ccl["mr";"_1$(",(g[0#`]@*s"{",y,"}"),",ai(0)))"],";al((t=now()-t+500)/1000);})"}
sys:{$["\\t"~2#x;[x:2_x;$[":"~*x;[x:1_x;Q[i:x?" "];n:`I$i#x;x:i_x];n:1];t[n;x]]
       "\\m"~2#x;"bsm(0)"
       Q[0]]}
switch:{[e;x]
      $[ `w=@x;"aw+",$. x
 (`w=@*x)&2=#x;ccl["ar";(g[e]x 1;$.*x)] /derive the verb
        (:)~*x;ccl["gls";(str@$*x 1;g[e]x 2)]
        (')~*x;cmp[e] . 1_x /composition
         `u=@x;par"au+",$[. x]
         `v=@x;par"av+",$[. x]
         `i=@x;ccl["ai";$x]
         `f=@x;ccl["af";$x]
         `I=@x;"{",(","/$x),"}"
         `s=@x;ccl["sym";str@$x]
         `S=@x;$[1=#x;$[~^e?*x;$*x;ccl["glg";str@$*x]];,/"`",/:$x]
         `C=@x;chs x
        "{"~*x;[x:lam x;ccl["ax";(x 0;$#x 1)]]
        `c=@*x;"[("
        `C=@*x;sys@*x
          1<#x;cal[e;x]
       ]}
g:{[e;x]Q[switch[e;x]]}
h:{"//",`k[x],"\n ",ccl["mr";$[|/^(:;::)?*x;ccl["out"];]@g[0#`;x]]}
vtou:{$[(2=#x)&`v~@*x;(.$[*x],":";o x 1);x~*x;x;o'x]}
s:vtou'p.pf@
in:1:$[x;*x;0]
ss:h's in
`0:"#include<a.h>
#define $1(f_,x_)       ({f_(x_);})
#define $2(f_,x_,y_)    ({A y=(y_);A x=(x_);f_(x,y);})
#define $3(f_,x_,y_,z_) ({A z=(z_);A y=(y_);A x=(x_);f_(x,y,z);})
#define t(x)         ({A _=(x);mr(t);_;})
#define _1$(f,x)      ({A t=(f);t($2(_1,t,x));})
#define _2$(f,x,y)    ({A t=(f);t($3(_2,t,x,y));})
#define com$(x_,y)    ({A t=(x_);t(com(t,y));})
Z A gls(S s,A x)_(A*p=gp(sym(s));I(p&&*p,mr(*p));*p=xR) //global set
Z A glg(S s)_(gg(sym(s)))                               //global get"
`0:fs;`0:"A1(m,";`0:{" ",x,";"}'ss;`0:,"au)"
