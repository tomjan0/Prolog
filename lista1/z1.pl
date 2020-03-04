% ojciec(X, Y) /* X jest ojcem Y */
% matka(X, Y) /* X jest matką Y */
% mężczyzna(X) /* X jest mężczyzną */
% kobieta(X) /* X jest kobietą */
% rodzic(X, Y) /* X jest rodzicem Y */
% diff(X, Y) /* X i Y są różne */

kobieta(ewa).
kobieta(nikola).
kobieta(paulina).
kobieta(anna).
kobieta(dorota).
mężczyzna(mariusz).
mężczyzna(jarosław).
mężczyzna(tomasz).
mężczyzna(bolesław).
rodzic(bolesław, mariusz).
rodzic(dorota,tomasz).
rodzic(dorota,paulina).
rodzic(jarosław,tomasz).
rodzic(jarosław,paulina).
rodzic(anna, ewa).
rodzic(mariusz, ewa).

ojciec(X,Y) :-
    mężczyzna(X),
    rodzic(X,Y).

matka(X,Y) :-
    kobieta(X),
    rodzic(X,Y).


jest_matką(X) :-
    matka(X,_Dziecko).

jest_ojcem(X) :-
    ojciec(X,_Dziecko).

jest_synem(X) :-
    mężczyzna(X),
    rodzic(_Rodzic,X).

siostra(X,Y) :-
    kobieta(X),
    rodzic(Z,X),
    rodzic(Z,Y),
    X\=Y.

dziadek(X, Y) :-
    ojciec(X,Z),
    rodzic(Z,Y).

rodzeństwo(X,Y) :-
    rodzic(Z,X),
    rodzic(Z,Y),
    X\=Y.





