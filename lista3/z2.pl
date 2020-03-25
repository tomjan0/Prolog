max_sum(L, S) :-
    check_sums(L, 0, 0, S).

check_sums([], SAVED, _, SAVED).

check_sums([X|LIST], SAVED, CURRENT, RES) :-
    (   CURRENT+X>0
    ->  NEW_C is CURRENT+X
    ;   NEW_C is 0
    ),
    (   NEW_C>SAVED
    ->  NEW_S is NEW_C
    ;   NEW_S is SAVED
    ),
    check_sums(LIST, NEW_S, NEW_C, RES).
