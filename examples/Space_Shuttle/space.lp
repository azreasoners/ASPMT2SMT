axis(x;y;z).

step(0..st).
astep(0..st-1).

force(0..4*k).
time(0..n).

1{duration(AS,D) : time(D)}1 :- astep(AS).
1{jet1fire(AX,AS,X) : force(X) }1 :- axis(AX), astep(AS).
1{jet2fire(AX,AS,X) : force(X) }1 :- axis(AX), astep(AS).

:- jet1fire(AX1,AS,X1), jet1fire(AX2,AS,X2), X1 != 0, X2 != 0, AX1 != AX2.
:- jet2fire(AX1,AS,X1), jet2fire(AX2,AS,X2), X1 != 0, X2 != 0, AX1 != AX2.

pos(AX,AS+1,X+D*(S0+S1)/2) :- duration(AS,D), speed(AX,AS,S0), speed(AX,AS+1,S1), pos(AX,AS,X).
speed(AX,AS+1,Y+D*(X1+X2)/m) :- jet1fire(AX,AS,X1), jet2fire(AX,AS,X2), duration(AS,D), speed(AX,AS,Y).

speed(x,0,0).
speed(y,0,1).
speed(z,0,1).

pos(x,0,0).
pos(y,0,0).
pos(z,0,0).

:- pos(x,st,X), X != 0.
:- pos(y,st,Y), Y != 3*k.
:- pos(z,st,Z), Z != 2*k.

#hide.
#show pos/3.
#show jet1fire/3.
#show jet2fire/3.
#show speed/3.
#show duration/2.
