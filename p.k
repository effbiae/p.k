/ create C, the character classes and T from ts, the finite state machine
/ S,L,R,V correspond to the first 4 character classes
/ _ ( ) +  (space, left, right and verb)

S:" \t"
L:"({[;"
R:")}]"
V:"+-*%&|<>=^!~,#_$?@.'/\\"

C:(S;L;R;V;".",a:_,/"aA"+\:!26;d:"0123456789"),"\"`-:e/\n\\"
C:@[;;:;]/[-1+&256;0+C;!#C]@0+

/ the remaining classes are alpha, digit and " ` - : / \n \
/  (you can see these classes in the first row of the long string ts.)
/ ts's rows are the states of the finite state machine and the columns
/ correspond to character classes.  the first column labels the states.
/ C then becomes a map from a character to an index into the columns of ts
/.
/ to read how ts lexes the string "10*2":
/  . start in the first state, n (the first row starting with "n")
/  . the first char is a digit (C["1"]~5) so column 5 in n labelled by 0
/    chooses state 0 (note a char class and a state share the name "0")
/  . go to state 0 (the row starting with 0)
/  . the next char is 0 (also character class 0) so look at column 5 of state
/    0 and it is 1. so go to state 1
/  . the next char is * (character class +) so goto state +
/  . the final char is 2 (class 0) so goto state 0
/.
/ this process is mapped out by the expression 0{T[x;y]}\C"10*2" (see lambda "run")
/ this evaluates to 9 17 6 9 (the states the machine goes through). the machine
/ is designed so that the states cut the input string where the states are <14, so
/ run cuts "10*2" like this:
/  (&14>0{T[x;y]}\C s)_s:"10*2"
/ ("10";,"*";,"2")

t:2_"\n"\ts:"
 _()+a0q`-:e/n\\
n_()+a0q`-+a/ny
yccccccccccccnc
__()+a0q`-+a/nt
;_()+a0q`-+a'n'
(_()+a0q`-+a'n'
)_()+a0q`++a'n'
+_()+a0q`-:a'n'
'_()+a0q`-:a'n'
a_()+bbq`++b'n'
0_()+11q`+:e'n'
qrrrrrrtrrrrrrs
`_()+b0q`++b'n'
-_()+a1q`-:a'n'
/ccccccccccccCc
cccccccccccccnc
:_()+a0q`-+a'n'
b_()+bbq`++b'n'
1_()+11q`++e'n'
e_()+11q`1+1'n'
rrrrrrrtrrrrrrs
srrrrrrrrrrrrrr
t_()+a0q`++a'n'
CCCCCCCCCCCCCmC
mCCCCCCCCCCCCCd
dCCCCCCCCCCCCnC"

T:t[;0]?/:1_'t
run:{p:-1_0,+\#'t:(&14>0{T[x;y]}\C x)_s::x;(t;p)}                    /run the machine -> tokens and source positions
sem:{w:&{(y~,"\n")&x~," "}':*x;(@[*x;w-1;:;(#w)#,,";"];x 1)}                                          /"\n " -> "; "
str:{x@\:&{~((2<#x)&"/"~*x)||/" \t"=\:*x}'*x}                                              /strip space and comments

fns:+(("`"~*:;`s$1_)                                       /`.. to symbol
      ("\""~*:;::)                       /don't process chars and strings
      ({("\\"~*x)&2<#x};,:)                        /\.. to system command
      (|/~^a?;,`s$)                                  /letters to variable
      ({(|/~^V?x)|~^x?":"};{`p@"(",x,")"}) /to verb/adverb (also gets 1.)
      (|/~^d?;`I$)                                            /to integer
      (1=#:;*:))                                      /singletons to char
val:(+{[t;p]$[|/m:fns[0]@\:t;(fns[1;*&m]t;p);(t;p)]}').                                           /value from string
upcast:{$[~|/^(@'x)?`f;`f$;]x}
jnl:{m:{~|/^x?@y}[z]
 (x;y):(&~=':m'x)_/:(x;y);w:&m'*'x;,/'{@[x;z;:;y@x z]}[;;w]'[(x;y);({upcast@$[1<#x;,x;x]}';*:')]}     /join literals
ajl:{x{jnl . x,,y}/(`f`i;,`s)}

w:{$[x;ajl val str sem run@x;(();!0)]}                                                               /w is the lexer

/E:E;e|e e:nve|te| t:n|v v:tA|V n:t[E]|(E)|{E}|N
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
pf:{                                                                              /parse file:  `C -> list of parses
 nls:{+1_'/:(&("\n"~)'t)_/:(t;p):("\n";0N),'x}                                                    /split on newlines
 hsh:{$[(#)~***x;1_;]x}                                                                                          /#!
 {$[`C~@*x;x;p x]}'((""~*:)')_hsh nls w x}                                            /system command as ,"\\\l p.k"

/ p'" "\"x;y (x;y) f[x;y] x+y x+*y 1+3*x (+x)%y (+/x)%#x x+m[*i]/y 1+3+-: 9(+\\|:)\\2#1")
