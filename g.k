/
 generate c. runs on itself to test p.k
\
\d p
\l p.k
\d .
Q:{$[x;;`+1]} /assert x
fs:();fi:0
str:{$[1=#x;1_;]`k@x}
par:{"(",x,")"}
ccl:{x,par@$[~^`C`c?@y;y;","/y]}
cal:{[e;x]$[~^2 3?#x;ccl["_",($-1+#x),"$";g[e]'x];]}
chs:{$[`c~@. x;"ac('",("\\'"/"'"\(-1_1_x)),"')";ccl["aCz",str@. x]]}
cmp:{[e;x;y]ccl["com";g[e]'(x;y)]} /reverse order of arg eval
locals:{loc:{?,//$["{"~*x;();`S~@x;x;x~*x;();o'x]};?`x,loc 1_x}
args:{(1+|/xyz?locals@x)#xyz:`x`y`z}
bda:{[a;x]"A r=({",g[a;x],";});",(,/,[;";"]'ccl["mr"]'$a),"r"}
lam:{a:args x;n:"$$",($fi+:1);fs,:,"Z A ",ccl[n;("A ",$:)'a],ccl["_";bda[a;x 1]];(n;a)}  /lambda
t:{"({L t=now();F(",$[x],",_1$(",(g[0#`]@*s"{",y,"}"),",ai(0)));al((t=now()-t+500)/1000);})"}
sys:{$["\\t"~2#x;[x:2_x;$[":"~*x;[x:1_x;Q[~^i:*x?" "];n:`I$i#x;x:i_x];n:1];t[n;x]]
       "\\m"~2#x;"bsm(0)"
       Q[0]]}
case:{[e;x]
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
         `S=@x;$[1=#x;$[~^e?*x;ccl["_R";$*x];ccl["glg";str@$*x]];,/"`",/:$x]
         `C=@x;chs x
        "{"~*x;[x:lam x;ccl["ax";(x 0;$#x 1)]]
        `c=@*x;"[("
        `C=@*x;sys@*x
          1<#x;cal[e;x]
       ]}
gla:{(0~.*x)&(`S~@x 1)&(1=#x 1)&"{"~*x[2]}
g:{[e;x]$[a:case[e;x];a;[ \x;`+1]]}
h:{"//",`k[x],"\n ",ccl[$[|/^(:;::)?*x;"say";"mr"];g[0#`;x]]}
fixverbs:{$[(2=#x)&`v~@*x;(.$[*x],":";o x 1);x~*x;x;o'x]}
s:fixverbs'p.pf@
in:1:$[x;*x;0]
ss:h's in
`0:"#include<a.h>
Z A1(say,out(_R(x)))
#define $1(f_,x_)       ({f_(x_);})
#define $2(f_,x_,y_)    ({A y=y_,x=x_;f_(x,y);})
#define $3(f_,x_,y_,z_) ({A z=z_,y=y_,x=x_;f_(x,y,z);})
#define _1$(f,x)      $2(_1,f,x)
#define _2$(f,x,y)    $3(_2,f,x,y)
Z A gls(S s,A x)_(A*p=gp(sym(s));I(p&&*p,mr(*p));*p=xR) //global set
Z A glg(S s)_(gg(sym(s)))                               //global get"
`0:fs;`0:"A1(m,";`0:{" ",x,";"}'ss;`0:,"au)"
