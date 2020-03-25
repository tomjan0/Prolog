środkowy(L, X) :-
    append(L1, [X|L2], L),
    length(L1, N),
    length(L2, N).
