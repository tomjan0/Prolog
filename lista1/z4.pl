% le(1,1).
% le(1,2).
% le(1,3).
% le(2,2).
% le(2,3).
% le(3,3).

le(1,2).
le(1,3).
le(1,5).
le(1,6).
le(2,3).
le(2,5).
le(2,6).
le(3,5).
le(3,6).
le(5,6).

le(3,4).
le(3,7).
le(4,7).

le(1,2).
le(1,4).
le(2,4).

le(5,6).
le(5,7).
le(6,7).

maksymalny(X) :-
    le(X,X),
    \+ (le(X,Y), Y\=X).

minimalny(X) :-
    le(X,X),
    \+ (le(Y,X), Y\=X).

największy(X) :-
    le(X,X),
    forall(le(_,B), le(B,X)).
    % maksymalny(X),
    % \+ (maksymalny(Y),X\=Y).
    

najmniejszy(X) :-
    le(X,X),
    forall(le(A,_), le(X,A)).
    % minimalny(X),
    % \+ (minimalny(Y),X\=Y).

