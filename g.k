/
 generate c
\
\d p
\l p.k
\d .
Q:{$[x;x;`+1]} /assert x
fs:();fi:0
str:{x:$[`C~@x;x;$x];$[1=#x;1_;]`k@x}
par:{"(",x,")"}
ccl:{x,par@$[~^`C`c?@y;y;","/y]}
prj:{[e;i]ccl["prj";g[e;*i],",(A[]){",(","/g[e]'1_i),"},",$#1_i]}
cal:{[e;i]$[|/(t i)~\:p.GAP;prj[e]i;$[~^2 3?#i;ccl["_",($-1+#i),"$";(,$p@*:/i),g[e]'i];]]}
chs:{$[`c~@a:. x;ccl["ac";$0+a];ccl["aCz";x]]}
cmp:{[e;i]ccl["com$";g[e]'i]}
var:{(1=#x)&`S~@t x}
vars:{,//$["{"~t@*x;();var x;x;x~*x;();o'x]}
locals:{?,//$["{"~t@*x;();((:)~t@*x)&3=#x;x[1],o x 2;x~*x;();o'x]}
args:{(1+|/xyz??`x,t vars 1_x)#xyz:`x`y`z}
increfs:{,//{ccl["_R";x],";"}''(#').(.:;$!:)@\:(1>)_-1+#'=t vars x}
bda:{[a;l;x](,/{"A ",$[x],"=0;"}'l),"\n ",increfs[x],g[a;x]}
lam:{a:?args x;n:"$$",($fi+:1);fs,:,"Z A ",ccl[n;("A ",$:)'a],ccl["_";bda[a;t locals 1_x;x 1]];(n;a)}  /lambda
ti:{"({L t=now();F(",$[x],",",ccl["mr";g[0#`]@sg@p.itps@y],");al((t=now()-t+500)/1000);})"}
sys:{$["\\t"~2#x;[x:2_x;$[":"~*x;[x:1_x;Q[i:x?" "];n:`I$i#x;x:i_x];n:1];ti[n;x]]
       "\\m"~2#x;"bsm(0)"
       Q[0]]}
switch:{[e;i]
             x:t@i
     $[  `w=@x;"aw+",$. x
 (`w=@*x)&2=#x;ccl["ar";(g[e]i 1;$.*x)] /derive the verb
        (:)~*x;ccl["gls";(str@*x 1;g[e]i 2)]
        (')~*x;cmp[e]1_i /composition
         `u=@x;par"au+",$[. x]
         `v=@x;par"av+",$[. x]
         `i=@x;ccl["ai";$x]
         `f=@x;ccl["af";$x]
         `I=@x;"{",(","/$x),"}"
         `s=@x;ccl["sym";str@$x]
         `S=@x;$[1=#x;$[~^e?*x;$*x;ccl["glg";str@*x]];,/"`",/:$x]
         `C=@x;chs x
        "{"~*x;[x:lam i;ccl["ax";(x 0;$#x 1)]]
        `c=@*x;"[("
        `C=@*x;sys@*x
          1<#x;cal[e;i]
       ]}
g:{[e;i]Q[switch[e;i]]}
sg:{(i;t;p;s)::x;i}
h:{[x]sg x;"/*",s,"*/$s=",`k[s],";\n ",ccl["mre";$[|/^(:;::)?t@*i;ccl["oue"];]@g[0#`;i]]}
in:1:$[x;*x;0]
ss:h'p.itpsf in
`0:"#include<a.h>
#define $2(f,p,x,y)   ({A $y=(y);A $x=$y?(x):0;A _;$x?_=f($x,$y),mr($x),_:$y?mr($y),0:0;})
#define $3(f,p,x,y,z) ({A $z=(z);A $y=$z?(y):0;A $x=$y?(x):0; A _;\\
                                              $x?(_=f($x,$y,$z),mr($x),(_?:errp(p))):\\
                                                $y?mr($y),mr($z),0:$z?mr($z),0:0;})
#define _1$(p,x,y)    $2(_1,p,x,y)
#define _2$(p,x,y,z)  $3(_2,p,x,y,z)
#define com$(x,y)   $2(com,p,x,y)
Z A gls(S s,A x)_(A*p=gp(sym(s));I(p&&*p,mr(*p));*p=xR) //global set
Z A glg(S s)_(gg(sym(s)))                               //global get
Z A1(oue,x?out(x):0)
#define mre(x) ({A $x=(x);if(!$x)return 0;mr($x);})
Z S $s;Z I errp(I i)_((K2(\"{(2)1:x,0x0a,(y#0x20),0x5e0a}\",aCz($s),ai(i)));0)"
`0:fs;`0:"A1(m,";`0:{" ",x,";"}'ss;`0:,"au)"
