middle(L, X) :-
    length(L, LEN),
    LEN mod 2 =\= 0,
    N is LEN div 2,
    length(L1, N),
    append(L1, [X], L2),
    length(L3, N),
    append(L2, L3, L).
