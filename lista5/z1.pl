scanner(Strumien, Tokeny) :-
    set_input(Strumien),
    get_char(Char),
    scan(Char, Tokeny).

blank(Char) :-
    member(Char, [' ', '\n', '\t']).

scan(end_of_file, []).
scan(Char, Tokens) :-
    blank(Char),
    get_char(Next_char),
    scan(Next_char, Tokens).
scan(Char, [Token|Tokens]) :-
    get_type(Char, Type),
    get_word(Char, Next_char, '', Word, Type),
    get_token(Token, Word, Type),
    scan(Next_char, Tokens).

get_word(Char, Char, Word, Word, Type) :-
    \+ get_type(Char, Type).
get_word(Char, Next, ACC, Word, Type) :-
    get_char(New),
    atom_concat(ACC, Char, ACC_New),
    get_word(New, Next, ACC_New, Word, Type).

get_type(Char, Type) :-
    char_type(Char, lower),
    Type=key.
get_type(Char, Type) :-
    char_type(Char, upper),
    Type=id.
get_type(Char, Type) :-
    member(Char, [;, +, -, *, /, '(', ')', <, >, =, :]),
    Type=sep.
get_type(Char, Type) :-
    atom_number(Char, _),
    Type=int.

get_token(Token, Word, id) :-
    Token=id(Word).
get_token(Token, Word, key) :-
    member(Word, [read, write, if, then, else, fi, while, do, od, and, or, mod]),
    Token=key(Word).
get_token(Token, Word, sep) :-
    member(Word, [;, +, -, *, /, '(', ')', <, >, =<, >=, :=, =, /=]),
    Token=sep(Word).
get_token(Token, Word, int) :-
    Token=int(Word).