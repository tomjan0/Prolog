arc(a, b).
arc(b, a).
arc(b, c).
arc(c, d).

osiągalny(X, Y):- osiągalny(X, Y, []).

osiągalny(X, X, _).

osiągalny(X, Z, VISITED):-
    arc(X, Y),
	\+ member(Y, VISITED),
	osiągalny(Y, Z, [X|VISITED]).
