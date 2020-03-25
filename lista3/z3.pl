even_permutation(Xs, Ys) :-
    even_perm(Xs, Ys).

odd_permutation(Xs, Ys) :-
    odd_perm(Xs, Ys).

even_perm([], []).

even_perm([H|T], Perm_all) :-
    odd_perm(T, T_perm),
    ins_at_even_pos(H, T_perm, Perm_all).
even_perm([H|T], Perm_all) :-
    even_perm(T, T_perm),
    ins_at_odd_pos(H, T_perm, Perm_all).

odd_perm([H|T], Perm_all) :-
    even_perm(T, T_perm),
    ins_at_even_pos(H, T_perm, Perm_all).
odd_perm([H|T], Perm_all) :-
    odd_perm(T, T_perm),
    ins_at_odd_pos(H, T_perm, Perm_all).


ins_at_odd_pos(X, L, [X|L]).
ins_at_odd_pos(X, [El1, El2|L], [El1, El2|L_with_X]) :-
    ins_at_odd_pos(X, L, L_with_X).

ins_at_even_pos(X, [El1|L], [El1, X|L]).
ins_at_even_pos(X, [El1, El2|L], [El1, El2|L_with_X]) :-
    ins_at_even_pos(X, L, L_with_X).