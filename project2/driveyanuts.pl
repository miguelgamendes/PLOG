:- use_module(library(clpfd)).

:- include('logic.pl').

:- 	write('****************************\n'),
	write('* start. - Starts the game *\n'),
	write('*                          *\n'),
	write('*         WARNING:         *\n'),
	write('*     May contain nuts     *\n'),
	write('****************************\n').

start :-
	write('ATTEMPTING TO DRIVE YA NUTS'), /* isto permite comecar um jogo sem chamar clausula */
	/* game will be called here */
	write('NUTS HAVE BEEN DRIVEN').

/*
driveyanuts() :-
	.*/