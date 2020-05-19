:- [z1].

split(IN, OUT1, OUT2) :-
	freeze(IN,
		(   IN = [H | IN_T]
		->	OUT1 = [H | OUT1_T],
			split(IN_T, OUT2, OUT1_T)
		;	OUT1 = [],
			OUT2 = []
        )
    ).

merge_sort(IN, OUT) :-
	freeze(IN,
		(   IN = [H | T]
		->	freeze(T,
                (   T = []
                ->  OUT = [H]
                ;   split(IN, LEFT, RIGHT),
                    merge_sort(LEFT, SORTED_LEFT),
                    merge_sort(RIGHT, SORTED_RIGHT),
                    merge(SORTED_LEFT, SORTED_RIGHT, OUT)
                )
            )
        ;   OUT = []
        )
    ).