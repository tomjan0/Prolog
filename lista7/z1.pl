merge(IN1, IN2, OUT) :-
    freeze(IN1,
        freeze(IN2,
            (   IN1=[IN1_H|IN1_T],
                IN2=[IN2_H|IN2_T]
            ->  (   IN1_H=<IN2_H
                ->  OUT=[IN1_H|OUT1],
                    merge(IN1_T, IN2, OUT1)
                ;   OUT=[IN2_H|OUT2],
                    merge(IN1, IN2_T, OUT2)
                )
            ;   IN1=[]
            ->  OUT=IN2
            ;   OUT=IN1
            )
        )
    ).