domains
 number=integer
 list=string*
 str=string
 
predicates
nondeterm first(number,list)
nondeterm second(number,list)
nondeterm third(number,list)
nondeterm go
nondeterm for_f(number,list)
nondeterm for_s(number, list, str)
nondeterm for_t(number, list, str, str)

clauses
	 first(2,["soup","noodles"]).
	 second(3,["steak", "chicken", "fish"]).
	 third(2,["wine", "tea"]).
	 
	 go :-	 first(FIRST_N,FIRST_L),
		 /*open("dinner_vars.txt",write, N),close(N),*/
		 for_f(FIRST_N,FIRST_L);

		 write("Mission accomplished!"),nl.

	 for_f(I,FL) :- 0 <= I,!,
		 FL=[HEAD|TAIL],
		 second(SECOND_N,SECOND_L),
		 not(for_s(SECOND_N, SECOND_L, HEAD)), /*Negatives the output of function so it will become true*/
		 Z = I - 1,
		 for_f(Z,TAIL).
		 

	 for_s(SN, SL, FRST) :-	0 <= SN,!,
	 	SL = [HEAD|TAIL], /*Splits variable apart on first element and rest*/
		third(THIRD_N,THIRD_L),
	 	not(for_t(THIRD_N, THIRD_L, FRST, HEAD)),
	 	Z = SN - 1,
	 	for_s(Z, TAIL, FRST).

	 for_t(TN, TL, FRST, SCND) :- 0 <= TN,!,
	 	TL = [HEAD|TAIL],
	 	write(FRST),write(" - "),write(SCND),write(" - "),write(HEAD),write("\n"),
	 	/*open("dinner_vars.txt",append,S),*/
        	/*write(S,FRST),write(S," - "),write(S,SCND),write(S," - "),write(S,HEAD), */
        	/*close(S), */
		Z = TN - 1,
	   	for_t(Z, TAIL, FRST, SCND).

 
goal
go.
