/* main loop */

:- use_module(library(clpfd)).

:- include('logic.pl').

:- 	write('******************************\n'),
	write('******************************\n'),
	write('** start. - Starts the game **\n'),
	write('**                          **\n'),
	write('**         WARNING:         **\n'),
	write('**     May contain nuts     **\n'),
	write('******************************\n'),
	write('******************************\n').

start :-
	write('ATTEMPTING TO DRIVE YA NUTS\n\n'), /* isto permite comecar um jogo sem chamar clausula */
	driveyanuts(X),
	write('NUTS HAVE BEEN DRIVEN').

driveyanuts(X) :-
	write('What kind of game do you wanted solved?\n\n'),
	write('standard - A common game, with normal pieces. Has a single solution.\n'),
	write('dynamic - This does nothing yet :v\n'),
	read(Mode),
	generateBoard(Mode, Board, BoardToSolve),
	solveTestNuts(BoardToSolve, Mode),
	playAgain(X).

playAgain(X) :-
	write('Do you wish to be driven nuts again? (Y/N)\n'),
	read(Choice),
	processChoice(Choice).

processChoice('N').

processChoice('Y') :-
	driveyanuts(X).