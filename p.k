/state machine from the original at ktye/i/p.k
S:" \t"                     /space
I:"({[;)}]"                 /singles
V:"+-*%&|<>=^!~,#_$?@.'/\\" /verb

C:(S;I;V;".",a:_,/"aA"+\:!26;d:"0123456789"),"\"`-:e/\n\\"
C:@[;;:;]/[-1+&256;0+C;!#C]@0+

t:2_"\n"\"
 _)+a0q`-:e/n\\
n_)+a0q`-+a/ny
yzzzzzzzzzzznz
__)+a0q`-+a/nt
;_)+a0q`-+a'n'
)_)+a0q`++a'n'
+_)+a0q`-:a'n'
'_)+a0q`-:a'n'
a_)+bbq`++b'n'
0_)+11q`+:e'n'
qrrrrrtrrrrrrs
`_)+b0q`++b'n'
-_)+a1q`-:a'n'
/cccccccccccnc
ccccccccccccnc
zzzzzzzzzzzznz
:_)+a0q`-+a'n'
b_)+bbq`++b'n'
1_)+11q`++e'n'
e_)+11q`1+1'n'
rrrrrrtrrrrrrs
srrrrrrrrrrrrr
t_)+a0q`++a'n'"

T:t[;0]?/:1_'t
run:{p:-1_0,+\#'t:(&13>0{T[x;y]}\C x)_s::x;(t;p)}                    /run the machine -> tokens and source positions
sem:{w:&{(y~,"\n")&|/" \t"~\:*x}':*x;(@[*x;w-1;:;(#w)#,,";"];x 1)}                                    /"\n " -> "; "
str:{x@\:&{~((1<#x)&"/"~*x)||/" \t"=\:*x}'*x}                                              /strip space and comments

err:{`0:s,"\n",(y#" "),"^","\n",x;`err@z}                                             /error -- position caret under source
fns:+(("`"~*:;`s$1_);("\""~*:;::);({(|/~^V?x)|~^x?":"};{`p@"(", \x,")"});(|/~^a?;,`s$);(|/~^d?;`I$);(1=#:;*:))
vst:(+{[t;p]$[|/m:fns[0]@\:t;(fns[1;*&m]t;p);(t;p)]}').                   /value from string
jnl:{(x;y):(&~=':z=@'x)_/:(x;y);w:&z=@'*'x;,/'{@[x;z;:;y@x z]}[;;w]'[(x;y);({$[1<#x;,x;x]}';*:')]}    /join literals
ajl:{x{jnl . x,y}/`i`s}
w:ajl vst str sem run@                                                                               /w is the lexer
/
s:"-1 2 -'a;`a 12 `ab`c \"cd\" {(+/|:)x} /c"
`0:"\"",s,"\" tokenized with list literals and source positions"
w s
\
/E:E;e|e e:nve|te| t:n|v v:tA|V n:t[E]|(E)|{E}|N  from the original by atw (see parserclub)
c:{$[~^`u`v?@x;"v";`w=@x;"a";|/";)]} "~\:x;";";" "]}
n:{-1+i+:1};q:{";"=c s i}
E:{|/";{[("~\:s n`}{e t`}\
l:{$["["~s 1+j:i;[n`;j,,/|(E e t`;,E i)];E x]}                                                        /lambda {[a]a}
t:{$[q`;1+#s;{("["~s i)|"a"=c s i}{$["["~s i;E x;(n`;x)]}/$["{"~s i;l i;~|/"(["~\:s i;n`;3>#x:E i;x 1;x]]}
v:{("v"~c s x)|("a"~c s@*x)|(*x)~#s}                                                                          /verb?
g:{$[v@*|x;(#s;{$[2=#x;x,1+#s;*x]}@-1_x;*|x);x]}                                        /if last is train make train
e:{v:{";"<c s i-1};$[q`;x;v[f:t`]>v`;g(f;x;e t`);g(x;e f)]}
P:{i::0;t s::x 0}
p:{(x[0],(';::))P x:("[",0N),'$[`C=@x;w x;x]}                                                /parse tokens or string
pf:{      /parse file -> list of parses
 nls:{1_'/:(&("\n"~)'t)_/:(t;p):("\n";0N),'x} /split on newlines
 hab:{$[(#)~***x;1_x;x]} /#!
 p'((""~*:)')_hab@+nls@w x}
/
p"{+x}[0]"
p"{x}"
p"{[x;y]x}"
p"{[a;b]a;b;c}"
p"{[x;y]+/x}"
p"{[x;y]+/x;y}"
p"{[x;y]+}"
p"{3+}"
p"{[x]x+y-x}"
p"{[x]+-}"
""
/p""   this segfaults: trace it back to w "" -- prototypes?  known problem "{[x]+-}"

p'("x;y";"(x;y)";"f[x;y]";"x+y";"x+*y";"1+3*x";"(+x)%y";"(+/x)%#x";"x+m[*i]/y";"1+3+-:";"9(+\\|:)\\1 1")
p@,")"
