lista(N, X) :-
    numlist(1, N, Liczby),
    lista(X, Liczby, Liczby, nieparzysta).

lista([], [], [], nieparzysta) :-
    !.

lista(X, Nieparzyste, Parzyste, nieparzysta) :-
    select(Curr, Nieparzyste, NTemp),
    X=[Curr|XTemp],
    \+ ( member(Curr, Parzyste),
         Val is Curr-1,
         member(Val, Parzyste),
         member(Val, NTemp)
       ),
    lista(XTemp, NTemp, Parzyste, parzysta).

lista(X, Nieparzyste, Parzyste, parzysta) :-
    select(Curr, Parzyste, PTemp),
    X=[Curr|XTemp],
    \+ ( member(Curr, Nieparzyste),
         Val is Curr-1,
         member(Val, Nieparzyste),
         member(Val, PTemp)
       ),
    lista(XTemp, Nieparzyste, PTemp, nieparzysta).

