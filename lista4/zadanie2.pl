rybki(Kto) :-
    einstein(Domy),
    member([_, Kto, rybki, _, _], Domy).

einstein(Domy) :-
    Domy=[[_, norweg, _, _, _], [_, _, _, _, _], [_, _, _, mleko, _], [_, _, _, _, _], [_, _, _, _, _]],
    member([czerwony, anglik, _, _, _], Domy),
    po_lewej([zielony, _, _, _, _],
             [biały, _, _, _, _],
             Domy),
    member([_, duńczyk, _, herbata, _], Domy),
    sąsiad([_, _, _, _, lighty],
           [_, _, koty, _, _],
           Domy),
    member([żółty, _, _, _, cygara], Domy),
    member([_, niemiec, _, _, fajka], Domy),
    sąsiad([_, _, _, _, lighty],
           [_, _, _, woda, _],
           Domy),
    member([_, _, ptaki, _, bezfiltrowe], Domy),
    member([_, szwed, psy, _, _], Domy),
    sąsiad([_, norweg, _, _, _],
           [niebieski, _, _, _, _],
           Domy),
    sąsiad([_, _, konie, _, _],
           [żółty, _, _, _, _],
           Domy),
    member([_, _, _, piwo, mentolowe], Domy),
    member([zielony, _, _, kawa, _], Domy).

po_lewej(D1, D2, Domy) :-
    append(_, [D1, D2|_], Domy).

po_prawej(D1, D2, Domy) :-
    append(_, [D2, D1|_], Domy).

sąsiad(D1, D2, Domy) :-
    (   po_lewej(D1, D2, Domy)
    ; po_prawej(D1, D2, Domy)
    ).
