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
/*
rotatePiece([Piece|PieceS], Rotation, RotatedPiece) :-
	Rotation2 i
	*/

generateStandardPieces(Board, FinalBoard) :-
	append(Board, [3, 1, 6, 2, 4, 5], Board1),
	append([Board1], [[2, 3, 5, 1, 4, 6]], Board2),
	append(Board2, [[3, 2, 4, 1, 6, 5]], Board3),
	append(Board3, [[1, 4, 3, 6, 5, 2]], Board4),
	append(Board4, [[4, 5, 6, 1, 2, 3]], Board5),
	append(Board5, [[2, 5, 3, 1, 6, 4]], Board6),
	append(Board6, [[5, 4, 3, 2, 1, 6]], FinalBoard).

generateTestPieces(Board, FinalBoard) :-
	append(Board, [3, 1, 6, 2, 4, 5, 3, 1, 6, 2, 4, 5], Board1),
	append([Board1], [[2, 3, 5, 1, 4, 6, 2, 3, 5, 1, 4, 6]], Board2),
	append(Board2, [[3, 2, 4, 1, 6, 5, 3, 2, 4, 1, 6, 5]], Board3),
	append(Board3, [[1, 4, 3, 6, 5, 2, 1, 4, 3, 6, 5, 2]], Board4),
	append(Board4, [[4, 5, 6, 1, 2, 3, 4, 5, 6, 1, 2, 3]], Board5),
	append(Board5, [[2, 5, 3, 1, 6, 4, 2, 5, 3, 1, 6, 4]], Board6),
	append(Board6, [[5, 4, 3, 2, 1, 6, 5, 4, 3, 2, 1, 6]], FinalBoard).

generateBoard('standard', Board, FinalBoard) :-
	generateTestPieces(Board, FinalBoard).

generateBoard('dynamic', Board).

getStandardBoardPiece([B|Bs], 0, Piece) :-
	Piece = B.

getStandardBoardPiece([Board|BoardS], Position, Piece) :-
	Position > 0,
	Position2 is Position - 1,
	Board2 = BoardS,
	getStandardBoardPiece(Board2, Position2, Piece).

getPieceElement(ElementNumber, Piece, Element) :-
	ElementNumber #>= 1,
	ElementNumber #=< 6,
	element(ElementNumber, Piece, Element).

getPieceElement(ElementNumber, Piece, Element) :-
	ElementNumber #< 1,
	CorrectedElementNumber #= ElementNumber + 6,
	element(CorrectedElementNumber, Piece, Element).

getPieceElement(ElementNumber, Piece, Element) :-
	ElementNumber #> 6,
	CorrectedElementNumber #= ElementNumber - 6,
	element(CorrectedElementNumber, Piece, Element).

solveNuts(Board, 'standard') :-
	Rotations = [R0, R1, R2, R3, R4, R5, R6],
	domain(Rotations, 0, 5),
	checkStandardPieceValidity(Board, 0, R0),
	checkStandardPieceValidity(Board, 1, R1),
	checkStandardPieceValidity(Board, 2, R2),
	checkStandardPieceValidity(Board, 3, R3),
	checkStandardPieceValidity(Board, 4, R4),
	checkStandardPieceValidity(Board, 5, R5),
	checkStandardPieceValidity(Board, 6, R6),
	labeling([], Rotations),
	write('Middle Rotation: '), write(R0), write('\n'),
	write('Top Piece Rotation: '), write(R1), write('\n'),
	write('Top Right Piece Rotation: '), write(R2), write('\n'),
	write('Bottom Right Piece Rotation: '), write(R3), write('\n'),
	write('Bottom Piece Rotation: '), write(R4), write('\n'),
	write('Bottom Left Piece Rotation: '), write(R5), write('\n'),
	write('Top Left Piece Rotation: '), write(R6), write('\n').

solveNuts2(Board, 'standard') :-
	Rotations = [R0, R1, R2, R3, R4, R5, R6],
	domain(Rotations, 0, 5),
	/* get all pieces */
	getStandardBoardPiece(Board, 0, MiddlePiece),
	getStandardBoardPiece(Board, 1, TopPiece),
	getStandardBoardPiece(Board, 2, TopRightPiece),
	getStandardBoardPiece(Board, 3, BottomRightPiece),
	getStandardBoardPiece(Board, 4, BottomPiece),
	getStandardBoardPiece(Board, 5, BottomLeftPiece),
	getStandardBoardPiece(Board, 6, TopLeftPiece),
	/* get all necessary elements */
	RotatedMiddle1 #= 1 + R0,
	RotatedMiddle2 #= 2 + R0,
	RotatedMiddle3 #= 3 + R0,
	RotatedMiddle4 #= 4 + R0,
	RotatedMiddle5 #= 5 + R0,
	RotatedMiddle6 #= 6 + R0,
	RotatedTop1 #= 1 + R1,
	RotatedTop2 #= 2 + R1,
	RotatedTop3 #= 3 + R1,
	RotatedTop4 #= 4 + R1,
	RotatedTop5 #= 5 + R1,
	RotatedTop6 #= 6 + R1,
	RotatedTopRight1 #= 1 + R2,
	RotatedTopRight2 #= 2 + R2,
	RotatedTopRight3 #= 3 + R2,
	RotatedTopRight4 #= 4 + R2,
	RotatedTopRight5 #= 5 + R2,
	RotatedTopRight6 #= 6 + R2,
	RotatedBottomRight1 #= 1 + R3,
	RotatedBottomRight2 #= 2 + R3,
	RotatedBottomRight3 #= 3 + R3,
	RotatedBottomRight4 #= 4 + R3,
	RotatedBottomRight5 #= 5 + R3,
	RotatedBottomRight6 #= 6 + R3,
	RotatedBottom1 #= 1 + R4,
	RotatedBottom2 #= 2 + R4,
	RotatedBottom3 #= 3 + R4,
	RotatedBottom4 #= 4 + R4,
	RotatedBottom5 #= 5 + R4,
	RotatedBottom6 #= 6 + R4,
	RotatedBottomLeft1 #= 1 + R5,
	RotatedBottomLeft2 #= 2 + R5,
	RotatedBottomLeft3 #= 3 + R5,
	RotatedBottomLeft4 #= 4 + R5,
	RotatedBottomLeft5 #= 5 + R5,
	RotatedBottomLeft6 #= 6 + R5,
	RotatedTopLeft1 #= 1 + R6,
	RotatedTopLeft2 #= 2 + R6,
	RotatedTopLeft3 #= 3 + R6,
	RotatedTopLeft4 #= 4 + R6,
	RotatedTopLeft5 #= 5 + R6,
	RotatedTopLeft6 #= 6 + R6,
	getPieceElement(RotatedMiddle1, MiddlePiece, MiddleElement1),
	getPieceElement(RotatedMiddle2, MiddlePiece, MiddleElement2),
	getPieceElement(RotatedMiddle3, MiddlePiece, MiddleElement3),
	getPieceElement(RotatedMiddle4, MiddlePiece, MiddleElement4),
	getPieceElement(RotatedMiddle5, MiddlePiece, MiddleElement5),
	getPieceElement(RotatedMiddle6, MiddlePiece, MiddleElement6),
	getPieceElement(RotatedTop1, TopPiece, TopElement1),
	getPieceElement(RotatedTop2, TopPiece, TopElement2),
	getPieceElement(RotatedTop3, TopPiece, TopElement3),
	getPieceElement(RotatedTop4, TopPiece, TopElement4),
	getPieceElement(RotatedTop5, TopPiece, TopElement5),
	getPieceElement(RotatedTop6, TopPiece, TopElement6),
	getPieceElement(RotatedTopRight1, TopRightPiece, TopRightElement1),
	getPieceElement(RotatedTopRight2, TopRightPiece, TopRightElement2),
	getPieceElement(RotatedTopRight3, TopRightPiece, TopRightElement3),
	getPieceElement(RotatedTopRight4, TopRightPiece, TopRightElement4),
	getPieceElement(RotatedTopRight5, TopRightPiece, TopRightElement5),
	getPieceElement(RotatedTopRight6, TopRightPiece, TopRightElement6),
	getPieceElement(RotatedBottomRight1, BottomRightPiece, BottomRightElement1),
	getPieceElement(RotatedBottomRight2, BottomRightPiece, BottomRightElement2),
	getPieceElement(RotatedBottomRight3, BottomRightPiece, BottomRightElement3),
	getPieceElement(RotatedBottomRight4, BottomRightPiece, BottomRightElement4),
	getPieceElement(RotatedBottomRight5, BottomRightPiece, BottomRightElement5),
	getPieceElement(RotatedBottomRight6, BottomRightPiece, BottomRightElement6),
	getPieceElement(RotatedBottom1, BottomPiece, BottomElement1),
	getPieceElement(RotatedBottom2, BottomPiece, BottomElement2),
	getPieceElement(RotatedBottom3, BottomPiece, BottomElement3),
	getPieceElement(RotatedBottom4, BottomPiece, BottomElement4),
	getPieceElement(RotatedBottom5, BottomPiece, BottomElement5),
	getPieceElement(RotatedBottom6, BottomPiece, BottomElement6),
	getPieceElement(RotatedBottomLeft1, BottomLeftPiece, BottomLeftElement1),
	getPieceElement(RotatedBottomLeft2, BottomLeftPiece, BottomLeftElement2),
	getPieceElement(RotatedBottomLeft3, BottomLeftPiece, BottomLeftElement3),
	getPieceElement(RotatedBottomLeft4, BottomLeftPiece, BottomLeftElement4),
	getPieceElement(RotatedBottomLeft5, BottomLeftPiece, BottomLeftElement5),
	getPieceElement(RotatedBottomLeft6, BottomLeftPiece, BottomLeftElement6),
	getPieceElement(RotateTopLeft1, TopLeftPiece, TopLeftElement1),
	getPieceElement(RotateTopLeft2, TopLeftPiece, TopLeftElement2),
	getPieceElement(RotateTopLeft3, TopLeftPiece, TopLeftElement3),
	getPieceElement(RotateTopLeft4, TopLeftPiece, TopLeftElement4),
	getPieceElement(RotateTopLeft5, TopLeftPiece, TopLeftElement5),
	getPieceElement(RotateTopLeft6, TopLeftPiece, TopLeftElement6),
	/* constrain */
	MiddleElement1 #= TopElement4,
	MiddleElement2 #= TopRightElement5,
	MiddleElement3 #= BottomRightElement6,
	MiddleElement4 #= BottomElement1,
	MiddleElement5 #= BottomLeftElement2,
	MiddleElement6 #= TopLeftElement3,
	TopElement3 #= TopRightElement6,
	TopRightElement4 #= BottomRightElement1,
	BottomRightElement5 #= BottomElement2,
	BottomElement6 #= BottomLeftElement3,
	BottomLeftElement1 #= TopLeftElement4,
	TopLeftElement2 #= TopElement5,
	/* search solutions */
	labeling([], Rotations),
	write('Middle Rotation: '), write(R0), write('\n'),
	write('Top Piece Rotation: '), write(R1), write('\n'),
	write('Top Right Piece Rotation: '), write(R2), write('\n'),
	write('Bottom Right Piece Rotation: '), write(R3), write('\n'),
	write('Bottom Piece Rotation: '), write(R4), write('\n'),
	write('Bottom Left Piece Rotation: '), write(R5), write('\n'),
	write('Top Left Piece Rotation: '), write(R6), write('\n').

solveTestNuts(Board, 'standard') :-
	Positions = [P0, P1, P2, P3, P4, P5, P6],
	Rotations = [R0, R1, R2, R3, R4, R5, R6],
	domain(Positions, 0, 6),
	domain(Rotations, 0, 5),
	all_different(Positions),
	/* get pieces */
	getStandardBoardPiece(Board, 0, MiddlePiece),
	getStandardBoardPiece(Board, 1, TopPiece),
	getStandardBoardPiece(Board, 2, TopRightPiece),
	getStandardBoardPiece(Board, 3, BottomRightPiece),
	getStandardBoardPiece(Board, 4, BottomPiece),
	getStandardBoardPiece(Board, 5, BottomLeftPiece),
	getStandardBoardPiece(Board, 6, TopLeftPiece),
	/* apply rotation conditions */
	RotatedMiddle1 #= 1 + R0,
	RotatedMiddle2 #= 2 + R0,
	RotatedMiddle3 #= 3 + R0,
	RotatedMiddle4 #= 4 + R0,
	RotatedMiddle5 #= 5 + R0,
	RotatedMiddle6 #= 6 + R0,
	RotatedTop1 #= 1 + R1,
	RotatedTop2 #= 2 + R1,
	RotatedTop3 #= 3 + R1,
	RotatedTop4 #= 4 + R1,
	RotatedTop5 #= 5 + R1,
	RotatedTop6 #= 6 + R1,
	RotatedTopRight1 #= 1 + R2,
	RotatedTopRight2 #= 2 + R2,
	RotatedTopRight3 #= 3 + R2,
	RotatedTopRight4 #= 4 + R2,
	RotatedTopRight5 #= 5 + R2,
	RotatedTopRight6 #= 6 + R2,
	RotatedBottomRight1 #= 1 + R3,
	RotatedBottomRight2 #= 2 + R3,
	RotatedBottomRight3 #= 3 + R3,
	RotatedBottomRight4 #= 4 + R3,
	RotatedBottomRight5 #= 5 + R3,
	RotatedBottomRight6 #= 6 + R3,
	RotatedBottom1 #= 1 + R4,
	RotatedBottom2 #= 2 + R4,
	RotatedBottom3 #= 3 + R4,
	RotatedBottom4 #= 4 + R4,
	RotatedBottom5 #= 5 + R4,
	RotatedBottom6 #= 6 + R4,
	RotatedBottomLeft1 #= 1 + R5,
	RotatedBottomLeft2 #= 2 + R5,
	RotatedBottomLeft3 #= 3 + R5,
	RotatedBottomLeft4 #= 4 + R5,
	RotatedBottomLeft5 #= 5 + R5,
	RotatedBottomLeft6 #= 6 + R5,
	RotateTopLeft1 #= 1 + R6,
	RotateTopLeft2 #= 2 + R6,
	RotateTopLeft3 #= 3 + R6,
	RotateTopLeft4 #= 4 + R6,
	RotateTopLeft5 #= 5 + R6,
	RotateTopLeft6 #= 6 + R6,
	/* get elements, with rotations */
	element(RotatedMiddle1, MiddlePiece, MiddleElement1),
	element(RotatedMiddle2, MiddlePiece, MiddleElement2),
	element(RotatedMiddle3, MiddlePiece, MiddleElement3),
	element(RotatedMiddle4, MiddlePiece, MiddleElement4),
	element(RotatedMiddle5, MiddlePiece, MiddleElement5),
	element(RotatedMiddle6, MiddlePiece, MiddleElement6),
	element(RotatedTop1, TopPiece, TopElement1),
	element(RotatedTop2, TopPiece, TopElement2),
	element(RotatedTop3, TopPiece, TopElement3),
	element(RotatedTop4, TopPiece, TopElement4),
	element(RotatedTop5, TopPiece, TopElement5),
	element(RotatedTop6, TopPiece, TopElement6),
	element(RotatedTopRight1, TopRightPiece, TopRightElement1),
	element(RotatedTopRight2, TopRightPiece, TopRightElement2),
	element(RotatedTopRight3, TopRightPiece, TopRightElement3),
	element(RotatedTopRight4, TopRightPiece, TopRightElement4),
	element(RotatedTopRight5, TopRightPiece, TopRightElement5),
	element(RotatedTopRight6, TopRightPiece, TopRightElement6),
	element(RotatedBottomRight1, BottomRightPiece, BottomRightElement1),
	element(RotatedBottomRight2, BottomRightPiece, BottomRightElement2),
	element(RotatedBottomRight3, BottomRightPiece, BottomRightElement3),
	element(RotatedBottomRight4, BottomRightPiece, BottomRightElement4),
	element(RotatedBottomRight5, BottomRightPiece, BottomRightElement5),
	element(RotatedBottomRight6, BottomRightPiece, BottomRightElement6),
	element(RotatedBottom1, BottomPiece, BottomElement1),
	element(RotatedBottom2, BottomPiece, BottomElement2),
	element(RotatedBottom3, BottomPiece, BottomElement3),
	element(RotatedBottom4, BottomPiece, BottomElement4),
	element(RotatedBottom5, BottomPiece, BottomElement5),
	element(RotatedBottom6, BottomPiece, BottomElement6),
	element(RotatedBottomLeft1, BottomLeftPiece, BottomLeftElement1),
	element(RotatedBottomLeft2, BottomLeftPiece, BottomLeftElement2),
	element(RotatedBottomLeft3, BottomLeftPiece, BottomLeftElement3),
	element(RotatedBottomLeft4, BottomLeftPiece, BottomLeftElement4),
	element(RotatedBottomLeft5, BottomLeftPiece, BottomLeftElement5),
	element(RotatedBottomLeft6, BottomLeftPiece, BottomLeftElement6),
	element(RotatedTopLeft1, TopLeftPiece, TopLeftElement1),
	element(RotatedTopLeft2, TopLeftPiece, TopLeftElement2),
	element(RotatedTopLeft3, TopLeftPiece, TopLeftElement3),
	element(RotatedTopLeft4, TopLeftPiece, TopLeftElement4),
	element(RotatedTopLeft5, TopLeftPiece, TopLeftElement5),
	element(RotatedTopLeft6, TopLeftPiece, TopLeftElement6),
	/* be a nice dude, and constrain stuff */
	MiddleElement1 #= TopElement4,
	MiddleElement2 #= TopRightElement5,
	MiddleElement3 #= BottomRightElement6,
	MiddleElement4 #= BottomElement1,
	MiddleElement5 #= BottomLeftElement2,
	MiddleElement6 #= TopLeftElement3,
	TopElement3 #= TopRightElement6,
	TopRightElement4 #= BottomRightElement1,
	BottomRightElement5 #= BottomElement2,
	BottomElement6 #= BottomLeftElement3,
	BottomLeftElement1 #= TopLeftElement4,
	TopLeftElement2 #= TopElement5,
	write('Processing solutions...\n'),
	/* process possible solutions */
	labeling([], Rotations),
	write('Middle Rotation: '), write(R0), write('\n'),
	write('Top Piece Rotation: '), write(R1), write('\n'),
	write('Top Right Piece Rotation: '), write(R2), write('\n'),
	write('Bottom Right Piece Rotation: '), write(R3), write('\n'),
	write('Bottom Piece Rotation: '), write(R4), write('\n'),
	write('Bottom Left Piece Rotation: '), write(R5), write('\n'),
	write('Top Left Piece Rotation: '), write(R6), write('\n').

solveNuts(Board, 'dynamic').

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
	write('Middle Piece: VALID\n').

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

checkStandardPieceValidity(Board, 1, Rotation) :-
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
	element(1, BottomRightPiece, BottomRightElement1),
	TopRightElement6 #= TopElement3,
	TopRightElement5 #= MiddleElement2,
	TopRightElement4 #= BottomeRightElement1,
	write('Top Right Piece: VALID\n').

checkStandardPieceValidity(Board, 2, Rotation) :-
	write('Top Right Piece: FAILED\n').

checkStandardPieceValidity(Board, 3, Rotation) :-
	getStandardBoardPiece(Board, 3, BottomRightPiece),
	getStandardBoardPiece(Board, 2, TopRightPiece),
	getStandardBoardPiece(Board, 0, MiddlePiece),
	getStandardBoardPiece(Board, 4, BottomPiece),
	element(1, BottomRightPiece, BottomRightElement1),
	element(6, BottomRightPiece, BottomRightElement6),
	element(5, BottomRightPiece, BottomRightElement5),
	element(4, TopRightPiece, TopRightElement4),
	element(3, MiddlePiece, MiddleElement3),
	element(2, BottomPiece, BottomElement2),
	BottomRightElement1 #= TopRightElement4,
	BottomRightElement6 #= MiddleElement3,
	BottomRightElement5 #= BottomElement2,
	write('Bottom Right Piece: VALID\n').

checkStandardPieceValidity(Board, 3, Rotation) :-
	write('Bottom Right Piece: FAILED\n').

checkStandardPieceValidity(Board, 4, Rotation) :-
	getStandardBoardPiece(Board, 4, BottomPiece),
	getStandardBoardPiece(Board, 3, BottomRightPiece),
	getStandardBoardPiece(Board, 0, MiddlePiece),
	getStandardBoardPiece(Board, 5, BottomLeftPiece),
	element(2, BottomPiece, BottomElement2),
	element(1, BottomPiece, BottomElement1),
	element(6, BottomPiece, BottomElement6),
	element(5, BottomRightPiece, BottomRightElement5),
	element(4, MiddlePiece, MiddleElement4),
	element(3, BottomRightPiece, BottomRightElement3),
	BottomElement2 #= BottomRightElement5,
	BottomElement1 #= MiddleElement4,
	BottomElement6 #= BottomLeftElement3,
	write('Bottom Piece: VALID\n').

checkStandardPieceValidity(Board, 4, Rotation) :-
	write('Bottom Piece: FAILED\n').

checkStandardPieceValidity(Board, 5, Rotation) :-
	getStandardBoardPiece(Board, 5, BottomRightPiece),
	getStandardBoardPiece(Board, 4, BottomPiece),
	getStandardBoardPiece(Board, 0, MiddlePiece),
	getStandardBoardPiece(Board, 6, TopLeftPiece),
	element(3, BottomRightPiece, BottomLeftElement3),
	element(2, BottomRightPiece, BottomLeftElement2),
	element(1, BottomRightPiece, BottomLeftElement1),
	element(6, BottomPiece, BottomElement6),
	element(5, MiddlePiece, MiddleElement5),
	element(4, TopLeftPiece, TopLeftElement4),
	BottomLeftElement3 #= BottomElement6,
	BottomLeftElement2 #= MiddleElement5,
	BottomLeftElement1 #= TopLeftElement4,
	write('Bottom Left Piece: VALID\n').

checkStandardPieceValidity(Board, 5, Rotation) :-
	write('Bottom Left Piece: FAILED\n').

checkStandardPieceValidity(Board, 6, Rotation) :-
	getStandardBoardPiece(Board, 6, TopLeftPiece),
	getStandardBoardPiece(Board, 5, BottomLeftPiece),
	getStandardBoardPiece(Board, 0, MiddlePiece),
	getStandardBoardPiece(Board, 1, TopPiece),
	element(4, TopLeftPiece, TopLeftElement4),
	element(3, TopLeftPiece, TopLeftElement3),
	element(2, TopLeftPiece, TopLeftElement2),
	element(1, BottomLeftPiece, BottomLeftElement1),
	element(6, MiddlePiece, MiddleElement6),
	element(5, TopPiece, TopElement5),
	TopLeftElement4 #= BottomLeftElement1,
	TopLeftElement3 #= MiddleElement6,
	TopLeftElement2 #= TopElement5,
	write('Top Left Piece: VALID\n').

checkStandardPieceValidity(Board, 6, Rotation) :-
	write('Top Left Piece: FAILED\n').