le(1,1).
le(1,2).

le(2,2).
le(2,3).
le(3,3).


cześciowy_porządek :-
    forall(le(X,Y), (le(X,X),le(Y,Y))),
    forall(le(A,B), ((\+ (le(A,B),le(B,A))); A=B) ),
    forall((le(C,D),le(D,E)), le(C,E)).
