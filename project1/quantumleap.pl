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

/*generateEmptyBoard() :-*/

printBoard([]).
printBoard([X1, X2, X3, X4, X5, X6, X7, X8, X9]) :- 
	printLine1(X1),
	printLine2(X2),
	printLine3(X3),
	printLine4(X4),
	printLine5(X5),
	printLine6(X6),
	printLine7(X7),
	printLine8(X8),
	printLine9(X9).

printLiteralLine([X|Xs]) :- write(X), printLiteralLine(Xs).

printLine1([X|Xs]) :- write('    |'), write(X), printLine1aux(Xs).
printLine1aux([]) :- write('|').
printLine1aux([X|Xs]) :- X \== '#', write('|'), write(X), printLine1aux(Xs).
printLine1aux([X|Xs]) :- X == '#', printLine1aux(Xs).

printLine2([X|Xs]) :- write('   |'), write(X), printLine2aux(Xs).
printLine2aux([]) :- write('|').
printLine2aux([X|Xs]) :- X \== '#', write('|'), write(X), printLine2aux(Xs).
printLine2aux([X|Xs]) :- X == '#', printLine2aux(Xs).

printLine3([X|Xs]) :- write('  |'), write(X), printLine3aux(Xs).
printLine3aux([]) :- write('|').
printLine3aux([X|Xs]) :- X \== '#', write('|'), write(X), printLine3aux(Xs).
printLine3aux([X|Xs]) :- X == '#', printLine3aux(Xs).

printLine4([X|Xs]) :- write(' |'), write(X), printLine4aux(Xs).
printLine4aux([]) :- write('|').
printLine4aux([X|Xs]) :- X \== '#', write('|'), write(X), printLine4aux(Xs).
printLine4aux([X|Xs]) :- X == '#', printLine4aux(Xs).

printLine5([X|Xs]) :- write('|'), write(X), printLine5aux(Xs).
printLine5aux([]) :- write('|').
printLine5aux([X|Xs]) :- X \== '#', write('|'), write(X), printLine5aux(Xs).
printLine5aux([X|Xs]) :- X == '#', printLine5aux(Xs).

/*playGame() :-
	output
	input turno 1
	input turno 2
	playGame.*/