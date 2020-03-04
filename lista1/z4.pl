le(1,1).
le(1,2).
le(1,3).
le(2,2).
le(2,3).
le(3,3).



maksymalny(X) :-
    \+ (le(X,Y), Y\=X).

minimalny(X) :-
    \+ (le(Y,X), Y\=X).

największy(X) :-
    forall(le(_,B), le(B,X)).
    

najmniejszy(X) :-
    forall(le(A,_), le(X,A)).

