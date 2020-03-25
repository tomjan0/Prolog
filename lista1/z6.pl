is_prime(2).
is_prime(3).

is_prime(P) :-
    P > 3,
    P mod 2 =\= 0,
    \+ has_factor(P,3).  

has_factor(N,L) :-
    N mod L =:= 0.

has_factor(N,L) :-
    L * L < N,
    L2 is L + 2,
    has_factor(N,L2).


prime(LO, HI, N) :-
    between(LO, HI, N),
    is_prime(N).


% prime(LO,HI,N) :-
%     between(LO, HI, N),
%     (N > 1, X is N - 1, \+ (between(2,X,Y), 0 is mod(N,Y))).