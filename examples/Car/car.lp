step(0..st).
astep(0..st-1).

time(0..t).
distance(0..l).

#domain step(S).
#domain astep(AS).


{accel(AS)}.
{decel(AS)}.
1{duration(X,T) : time(T)}1 :- astep(X).

:- accel(AS), decel(AS).

totaltime(AS+1,X) :- totaltime(AS,Y), duration(AS,Z), X = Y+Z.

{speed(AS+1,X)} :- speed(AS,X).
speed(AS+1,X) :- speed(AS,Y), duration(AS,T), accel(AS), X = Y+ar*T.
speed(AS+1,X) :- speed(AS,Y), duration(AS,T), decel(AS), X = Y-ar*T.
:- speed(S,X), X < 0.
:- speed(S,X), X > ms.
:- speed(S,X), speed(S,Y), Y != X.

location(AS+1,X) :- location(AS,Y), speed(AS,S1), speed(AS+1,S2), duration(AS,T), X = T*(S1+S2)/2 + Y.



totaltime(0,0).
speed(0,0).
location(0,0).

:- not location(st,l).
:- not speed(st,0).
:- totaltime(st,X), X != t.

#hide step/1.
#hide astep/1.
#hide time/1.
#hide distance/1.
