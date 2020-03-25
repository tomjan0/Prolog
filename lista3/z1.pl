wariancja(L, D) :-
    length(L, Len),
    list_avg(L, Len, Avg),
    sum_diffs(L, Avg, Sum),
    D is Sum/Len.


sum_diffs(List, Avg, Sum) :-
    sum_diffs(List, Avg, 0, Sum).

sum_diffs([], _, Res, Res).

sum_diffs([H|T], Avg, Sum, Res) :-
    Diff is H-Avg,
    Diff_sq is Diff*Diff,
    Sum_next is Sum+Diff_sq,
    sum_diffs(T, Avg, Sum_next, Res).

list_avg(List, Len, Avg) :-
    list_sum(List, Sum),
    Avg is Sum/Len.

list_sum(List, Sum) :-
    list_sum(List, 0, Sum).

list_sum([], Res, Res).

list_sum([H|T], Sum, Res) :-
    Sum_next is Sum+H,
    list_sum(T, Sum_next, Res).

