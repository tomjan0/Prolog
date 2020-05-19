% gramatyka 1
gram1 --> ``.
gram1 --> `a`, gram1, `b`.

% gramatyka 2
gram2 --> a(N), b(N), c(N).

a(0) --> ``.
a(N) --> `a`, a(Next), {N is Next + 1}.

b(0) --> ``.
b(N) --> `b`, b(Next), {N is Next + 1}.

c(0) --> ``.
c(N) --> `c`, c(Next), {N is Next + 1}.

% gramatyka 3
fib(0, 1) :- !.
fib(1, 1) :- !.
fib(N, Wynik) :- 
	N1 is N - 1,
	N2 is N - 2,
	fib(N1, Res1),
	fib(N2, Res2),
	Wynik is Res1 + Res2.

gram3 --> a(N), {fib(N, FibN)}, b(FibN).


