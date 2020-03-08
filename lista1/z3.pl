on(rower, ołówek).
on(aparat, motyl).
on(niebo, rower).

left_of(ryba, motyl).
left_of(motyl, klepsydra).
left_of(klepsydra, ołówek).

below(X,Y) :- above(Y,X).
right_of(X,Y) :- left_of(Y,X).

to_left(X,Y) :- left_of(X,Y).
to_left(X,Z) :- 
    left_of(X,Y),
    to_left(Y,Z).

above(X,Y) :- on(X,Y).
above(X,Z) :-
    on(X,Y),
    above(Y,Z).

to_right(X,Y) :- to_left(Y,X).

higher(X,Y) :-
    above(X,Y);
    (above(X,Z), (to_left(Z,Y);to_left(Y,Z)));
    (above(X, Obj1), above(Y,Obj2), higher(Obj1, Obj2)).
