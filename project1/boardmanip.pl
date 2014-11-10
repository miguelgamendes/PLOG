/************************************************
* ALL STANDARD FUNCTIONS FOR BOARD MANIPULATION *
************************************************/

?- use_module(library(random)).

/* Empty board generation */
generateEmptyBoard(X) :- 
	generateEmptyBoardAux(L1, 1),
	generateEmptyBoardAux(L2, 2),
	generateEmptyBoardAux(L3, 3),
	generateEmptyBoardAux(L4, 4),
	generateEmptyBoardAux(L5, 5),
	generateEmptyBoardAux(L6, 6),
	generateEmptyBoardAux(L7, 7),
	generateEmptyBoardAux(L8, 8),
	generateEmptyBoardAux(L9, 9),
	append([], [L1], X1),
	append(X1, [L2], X2),
	append(X2, [L3], X3),
	append(X3, [L4], X4),
	append(X4, [L5], X5),
	append(X5, [L6], X6),
	append(X6, [L7], X7),
	append(X7, [L8], X8),
	append(X8, [L9], X),
	printBoard(X).

generateEmptyBoardAux(L, N) :-
	N == 1,
	append([],[' ',' ',' ',' ',' ','#','#','#','#'],L).
generateEmptyBoardAux(L, N) :-
	N == 2,
	append([],[' ',' ',' ',' ',' ',' ','#','#','#'],L).
generateEmptyBoardAux(L, N) :-
	N == 3,
	append([],[' ',' ',' ',' ',' ',' ',' ','#','#'],L).
generateEmptyBoardAux(L, N) :-
	N == 4,
	append([],[' ',' ',' ',' ',' ',' ',' ',' ','#'],L).
generateEmptyBoardAux(L, N) :-
	N == 5,
	append([],[' ',' ',' ',' ',' ',' ',' ',' ',' '],L).
generateEmptyBoardAux(L, N) :-
	N == 6,
	append([],['#',' ',' ',' ',' ',' ',' ',' ',' '],L).
generateEmptyBoardAux(L, N) :-
	N == 7,
	append([],['#','#',' ',' ',' ',' ',' ',' ',' '],L).
generateEmptyBoardAux(L, N) :-
	N == 8,
	append([],['#','#','#',' ',' ',' ',' ',' ',' '],L).
generateEmptyBoardAux(L, N) :-
	N == 9,
	append([],['#','#','#','#',' ',' ',' ',' ',' '],L).

/* Game board generation */
/*generateGameBoard(X) :-*/
	
generateRandomPiece(X) :-
	random(0, 2, N),
	returnPiece(N, X).

returnPiece(N, X) :-
	N == 0,
	X = 'B'.
returnPiece(N, X) :-
	N == 1,
	X = 'W'.