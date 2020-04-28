board(L) :-
    length(L, Len),
    get_row_positions(L, Len, Row_Positions),
    Parity is Len mod 2,
    draw(Row_Positions, 0, Len, Parity).

get_row_positions(Col_positions, Len, Row_positions) :-
    length(Acc, Len),
    get_row_positions(Col_positions, 1, Len, Acc, Row_positions).
get_row_positions([], _, _, Res, Res).
get_row_positions([Val|Vals], Id, Len, Acc, Result) :-
    Reversed is Len-Val,
    nth0(Reversed, Acc, Id),
    New_id is Id+1,
    get_row_positions(Vals, New_id, Len, Acc, Result).

draw(_, Len, Len, _) :-
    draw_line(Len).
draw(Positions, Row_number, Len, 1) :-
    draw_line(Len),
    draw_row(Positions, Row_number, Len, 1),
    Next_row is Row_number+1,
    draw(Positions, Next_row, Len, 0).
draw(Positions, Row_number, Len, 0) :-
    draw_line(Len),
    draw_row(Positions, Row_number, Len, 0),
    Next_row is Row_number+1,
    draw(Positions, Next_row, Len, 1).

draw_line(Len) :-
    write('\n+'),
    draw_line(0, Len).

draw_line(Len, Len).
draw_line(Counter, Len) :-
    write(-----+),
    Next is Counter+1,
    draw_line(Next, Len).

draw_row(Positions, Row_number, Len, Parity) :-
    write('\n|'),
    draw_fields(Positions, Row_number, 0, Len, Parity),
    write('\n|'),
    draw_fields(Positions, Row_number, 0, Len, Parity).

draw_fields(_, _, Len, Len, _).
draw_fields(Positions, Row_number, Counter, Len, 1) :-
    nth0(Row_number, Positions, Val),
    Val-1=:=Counter,
    write(':###:|'),
    Next is Counter+1,
    draw_fields(Positions, Row_number, Next, Len, 0).
draw_fields(Positions, Row_number, Counter, Len, 1) :-
    nth0(Row_number, Positions, Val),
    Val-1=\=Counter,
    write(':::::|'),
    Next is Counter+1,
    draw_fields(Positions, Row_number, Next, Len, 0).
draw_fields(Positions, Row_number, Counter, Len, 0) :-
    nth0(Row_number, Positions, Val),
    Val-1=:=Counter,
    write(' ### |'),
    Next is Counter+1,
    draw_fields(Positions, Row_number, Next, Len, 1).
draw_fields(Positions, Row_number, Counter, Len, 0) :-
    nth0(Row_number, Positions, Val),
    Val-1=\=Counter,
    write('     |'),
    Next is Counter+1,
    draw_fields(Positions, Row_number, Next, Len, 1).