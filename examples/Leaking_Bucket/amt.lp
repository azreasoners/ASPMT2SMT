% WARNING: F2LP arrow '<-' found. Treating '-' as classical negation. Please use the option -d if you would like '-' to be treated as default negation.
num(1..c).
step(0..c+2).
astep(0..c+1).

%:- not 1{amt(X1,X) : num(X)}1, step(X1).
:- not 1{amt(X1,X)}1, step(X1).

{amt(T+1,X)} :- amt(T,X+1),num(X).
amt(T+1,c) :- fillUp(T),astep(T).
{fillUp(T)} :- astep(T).
amt(0,5) :- true.
:- not amt(c,10).
true.
:- false.
#hide true.
#hide.
#show amt/2.
#show fillUp/1.
