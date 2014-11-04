emptyBoard([[' ',' ',' ',' ',' ','#','#','#','#'],
			[' ',' ',' ',' ',' ',' ','#','#','#'],
			[' ',' ',' ',' ',' ',' ',' ','#','#'],
			[' ',' ',' ',' ',' ',' ',' ',' ','#'],
			[' ',' ',' ',' ',' ',' ',' ',' ',' '],
			['#',' ',' ',' ',' ',' ',' ',' ',' '],
			['#','#',' ',' ',' ',' ',' ',' ',' '],
			['#','#','#',' ',' ',' ',' ',' ',' '],
			['#','#','#','#',' ',' ',' ',' ',' ']
			]).

generateEmptyBoard() :-

printBoard([]).
printBoard([X1, X2, X3, X4, X5, X6, X7, X8, X9]) :- 
	printLine1(X1),
	printLine2(X2),
	printLine3(X3),
	printLine4(X4),
	printLine5(X5).

printLine1([X|Xs]) :- write('    |'), write(X), printLine1aux(Xs).
printLine1aux([]).
printLine1aux([X|Xs]) :- X =\= '#', write(X), write('|'), printLine1aux(Xs).

printLine2([X|Xs]) :- write('   |'), write(X), printLine2aux(Xs).
printLine2aux([]).
printLine2aux([X|Xs]) :- X =\= '#', write(X), write('|'), printLine2aux(Xs).

printLine3([X|Xs]) :- write('  |'), write(X), printLine3aux(Xs).
printLine3aux([]).
printLine3aux([X|Xs]) :- X =\= '#', write(X), write('|'), printLine3aux(Xs).

printLine4([X|Xs]) :- write(' |'), write(X), printLine4aux(Xs).
printLine4aux([]).
printLine4aux([X|Xs]) :- X =\= '#', write(X), write('|'), printLine4aux(Xs).

printLine5([X|Xs]) :- write('|'), write(X), printLine5aux(Xs).
printLine5aux([]).
printLine5aux([X|Xs]) :- X =\= '#', write(X), write('|'), printLine5aux(Xs).

playGame() :-
	#output
	#input turno 1
	#input turno 2
	#playGame.