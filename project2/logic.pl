/* all needed operations for soving the problem */

:- use_module(library(clpfd)).

gamePiece([X1, X2, X3, X4, X5, X6]) :-
	all_different([X1, X2, X3, X4, X5, X6]),
	X1 #>= 1, X1 #=< 6,
	X2 #>= 1, X2 #=< 6,
	X3 #>= 1, X3 #=< 6,
	X4 #>= 1, X4 #=< 6,
	X5 #>= 1, X5 #=< 6,
	X6 #>= 1, X6 #=< 6.

addPiece(Total, Piece, Result) :-
	append(Total, Piece, Result).

generateStandardPieces(Board, FinalBoard) :-
	append(Board, [1, 6, 2, 4, 5, 3], Board1),
	append([Board1], [[2, 3, 5, 1, 4, 6]], Board2),
	append(Board2, [[3, 2, 4, 1, 6, 5]], Board3),
	append(Board3, [[1, 4, 3, 6, 5, 2]], Board4),
	append(Board4, [[4, 5, 6, 1, 2, 3]], Board5),
	append(Board5, [[2, 5, 3, 1, 6, 4]], Board6),
	append(Board6, [[5, 4, 3, 2, 1, 6]], FinalBoard).

generateBoard('standard', Board, FinalBoard) :-
	generateStandardPieces(Board, FinalBoard).

generateBoard('dynamic', Board).

getStandardBoardPiece([B|Bs], 0, Piece) :-
	Piece = B.

getStandardBoardPiece([Board|BoardS], Position, Piece) :-
	Position > 0,
	Position2 is Position - 1,
	Board2 = BoardS,
	getStandardBoardPiece(Board2, Position2, Piece).

solveNuts(Board, 'standard') :-
	checkStandardPieceValidity(Board, 0, 0),
	checkStandardPieceValidity(Board, 1, 0).

checkStandardPieceValidity(Board, 0, Rotation) :-
	getStandardBoardPiece(Board, 0, MiddlePiece),
	getStandardBoardPiece(Board, 1, TopPiece),
	getStandardBoardPiece(Board, 2, TopRightPiece),
	getStandardBoardPiece(Board, 3, BottomRightPiece),
	getStandardBoardPiece(Board, 4, BottomPiece),
	getStandardBoardPiece(Board, 5, BottomLeftPiece),
	getStandardBoardPiece(Board, 6, TopLeftPiece),
	element(1, MiddlePiece, MiddleElement1),
	element(2, MiddlePiece, MiddleElement2),
	element(3, MiddlePiece, MiddleElement3),
	element(4, MiddlePiece, MiddleElement4),
	element(5, MiddlePiece, MiddleElement5),
	element(6, MiddlePiece, MiddleElement6),
	element(4, TopPiece, TopElement4),
	element(5, TopRightPiece, TopRightElement5),
	element(6, BottomRightPiece, BottomRightElement6),
	element(1, BottomPiece, BottomElement1),
	element(2, BottomLeftPiece, BottomLeftElement2),
	element(3, TopLeftPiece, TopLeftElement3),
	MiddleElement1 #= TopElement4,
	MiddleElement2 #= TopRightElement5,
	MiddleElement3 #= BottomRightElement6,
	MiddleElement4 #= BottomElement1,
	MiddleElement5 #= BottomLeftElement2,
	MiddleElement6 #= TopLeftElement3,
	write('Middle piece: VALID\n').

checkStandardPieceValidity(Board, 0, Rotation) :-
	write('Middle Piece: FAILED\n').

checkStandardPieceValidity(Board, 1, Rotation) :-
	getStandardBoardPiece(Board, 1, TopPiece),
	getStandardBoardPiece(Board, 6, TopLeftPiece),
	getStandardBoardPiece(Board, 0, MiddlePiece),
	getStandardBoardPiece(Board, 2, TopRightPiece),
	element(5, TopPiece, TopElement5),
	element(4, TopPiece, TopElement4),
	element(3, TopPiece, TopElement3),
	element(2, TopLeftPiece, TopLeftElement2),
	element(1, MiddlePiece, MiddleElement1),
	element(6, TopRightPiece, TopRightElement6),
	TopElement5 #= TopLeftElement2,
	TopElement4 #= MiddleElement1,
	TopElement3 #= TopRightElement6,
	write('Top Piece: VALID\n').

checkStandardPieceValidity(board, 1, Rotation) :-
	write('Top Piece: FAILED\n').

checkStandardPieceValidity(Board, 2, Rotation) :-
	getStandardBoardPiece(Board, 2, TopRightPiece),
	getStandardBoardPiece(Board, 1, TopPiece),
	getStandardBoardPiece(Board, 0, MiddlePiece),
	getStandardBoardPiece(Board, 3, BottomRightPiece),
	element(6, TopRightPiece, TopRightElement6),
	element(5, TopRightPiece, TopRightElement5),
	element(4, TopRightPiece, TopRightElement4),
	element(3, TopPiece, TopElement3),
	element(2, MiddlePiece, MiddleElement2),
	element(1, )