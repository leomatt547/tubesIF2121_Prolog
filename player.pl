:-dynamic(player/2).
:-dynamic(player/3).
:-dynamic(enemy/3).
:-dynamic(enemy/4).
:-dynamic(position/3).

init_player :-
	make_player,
	change_player_pos.

init_enemy(N) :-
	/* Banyak Enemy */
	asserta(nbEnemy(N)),
	NLama is N,
	make_n_enemy(N),
	change_n_enemy_pos(NLama).

make_player :-
	asserta(player(health,100)),
	asserta(player(armor,0)),
	asserta(player(weapon,none)),
	asserta(player(ammo,0)),
	asserta(player(position,0,0)).

change_player_pos:-
	get_random_position(X, Y),
	retract(player(position, 0, 0)),
	asserta(player(position, X, Y)).