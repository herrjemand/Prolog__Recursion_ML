%editor food.prolog
	 go :- reconsult('data.prolog'),
		/*trace, Uncomment for SBS debug.*/
		 first(FIRST_N,FIRST_L),
		 open('dinner_vars.txt',write, N),close(N),
		 for_f(FIRST_N,FIRST_L);

		 write('Mission accomplished!'),nl.

	 for_f(I,FL) :- (0 =< I) ->
		 FL=[HEAD|TAIL],
		 second(SECOND_N,SECOND_L),
		 not(for_s(SECOND_N, SECOND_L, HEAD)),
		 for_f(I-1,TAIL).

	 for_s(SN, SL, FRST) :-	(0 =< SN) ->
	 	SL = [HEAD|TAIL],
		third(THIRD_N,THIRD_L),
	 	not(for_t(THIRD_N, THIRD_L, FRST, HEAD)),
	 	for_s(SN-1, TAIL, FRST).

	 for_t(TN, TL, FRST, SCND) :-	(0 =< TN) ->
	 	TL = [HEAD|TAIL],
	 
	 	open('dinner_vars.txt',append,S),
        	write(S,FRST),write(S,' - '),write(S,SCND),write(S,' - '),write(S,HEAD),nl(S), 
        	close(S), 

	   	for_t(TN-1, TAIL, FRST, SCND).

	 not(X) :- X, !, fail.
	 not(_).
