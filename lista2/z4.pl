reguła(X, +, Y, Y) :-
    number(X),
    X =:= 0,!.


reguła(X, +, Y, X) :-
    number(Y),
    Y =:= 0,!.


reguła(X, *, _, 0) :-
    number(X),
    X =:= 0,!.


reguła(_, *, Y, 0) :-
    number(Y),
    Y =:= 0,!.

reguła(X, /, Y, 1) :-
    X = Y,!.


reguła(X, *, Y, Y) :-
    number(X),
    X =:= 1,!.


reguła(X, *, Y, X) :-
    number(Y),
    Y =:= 1,!.


reguła(X, -, Y, 0) :-
    X = Y,!.


reguła(X, -, Y, 0) :-
    Y = X,!.





uprość(Wyrażenie, Wynik) :-
    X+Y = Wyrażenie,
    (number(X) ; atom(X)),
    (number(Y) ; atom(Y)),
    reguła(X, +, Y, Wynik),!.


uprość(Wyrażenie, Wynik) :-
    X*Y = Wyrażenie,
    (number(X) ; atom(X)),
    (number(Y) ; atom(Y)),
    reguła(X, *, Y, Wynik),!.


uprość(Wyrażenie, Wynik) :-
    X/Y = Wyrażenie,
    (number(X) ; atom(X)),
    (number(Y) ; atom(Y)),
    reguła(X, /, Y, Wynik),!.


uprość(Wyrażenie, Wynik) :-
    X-Y = Wyrażenie,
    (number(X) ; atom(X)),
    (number(Y) ; atom(Y)),
    reguła(X, -, Y, Wynik),!.


uprość(Wyrażenie, Wynik) :-
    X+Y = Wyrażenie,
    uprość(X, X1),
    uprość(Y, Y1),
    uprość(X1+Y1,Wynik),!.


uprość(Wyrażenie, Wynik) :-
    X*Y = Wyrażenie,
    uprość(X, X1),
    uprość(Y, Y1),
    uprość(X1*Y1,Wynik),!.


uprość(Wyrażenie, Wynik) :-
    X/Y = Wyrażenie,
    uprość(X, X1),
    uprość(Y, Y1),
    uprość(X1/Y1,Wynik),!.


uprość(Wyrażenie, Wynik) :-
    X-Y = Wyrażenie,
    uprość(X, X1),
    uprość(Y, Y1),
    uprość(X1-Y1,Wynik),!.




    
uprość(C, C) :- atom(C) ; number(C),!.

uprość(X+Y, X+Y).
uprość(X-Y, X-Y).
uprość(X*Y, X*Y).
uprość(X/Y, X/Y).

uprość(X+Y, X1+Y1) :- uprość(X, X1), uprość(Y, Y1),!.

uprość(X-Y, X1-Y1) :- uprość(X, X1), uprość(Y, Y1),!.

uprość(X*Y, X1*Y1) :- uprość(X, X1), uprość(Y, Y1),!.

uprość(X/Y, X1/Y1) :- uprość(X, X1), uprość(Y, Y1),!.

