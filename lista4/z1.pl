wyrażenie(LISTA, WARTOŚĆ, WYRAŻENIE) :-
    wyrażenie(LISTA, WYRAŻENIE),
    WARTOŚĆ is WYRAŻENIE.

wyrażenie([X],X).

wyrażenie(L, W) :-
    append(L1, L2, L),
    L1 \= L,
    L2 \= L,
    wyrażenie(L1, X),
    wyrażenie(L2, Y),
    (   W = X+Y
    ;   W = X-Y
    ;   W = X*Y
    ;   (   Y =\= 0,
            W = X/Y
        )
    ).
