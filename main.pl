:- dynamic(init/1).
:- include('map2.pl').

title :-
    write(' ____  _____  _  _  ____  __  __  _____  _  _ '),nl,
    write('(_  _)(  _  )( )/ )( ___)(  \\/  )(  _  )( \\( )'),nl,
    write('  )(   )(_)(  )  (  )__)  )    (  )(_)(  )  ( '),nl,
    write(' (__) (_____)(_)\\_)(____)(_/\\/\\_)(_____)(_)\\_)'),nl,nl,
    write('Gotta catch em all!'),nl,
    write('Hello there! Welcome to the world of Tokemon! My name is Aril!'),nl,
    write('People call me the Tokemon Professor! This world is inhabited by'),nl,
    write('creatures called Tokemon! There are hundreds of Tokemon loose in'),nl,
    write('Labtek 5! You can catch them all to get stronger, but what Im'),nl,
    write('really interested in are the 2 legendary Tokemons, Icanmon dan'),nl,
    write('Sangemon. If you can defeat or capture all those Tokemons I will'),nl,
    write('not kill you.'),nl,nl,
    write('Available commands:'),nl,
    write('     start. -- start the game!'),nl,
    write('     help. -- show available commands'),nl,
    write('     quit. -- quit the game'),nl,
    write('     n. s. e. w. -- move'),nl,
    write('     map. -- look at the map'),nl,
    write('     heal -- cure Tokemon in inventory if in gym center'),nl,
    write('     status. -- show your status'),nl,
    write('     save(Filename). -- save your game'),nl, 
    write('     load(Filename). -- load previously saved game'),nl,
    write('     Legends:'),nl,
    write('       - X = Pagar'),nl,
    write('       - G = Gym Center'),nl,
    write('       - P = Player'),nl,
    write('       - L = Legendary'), nl, nl.

start :-
    \+init(_),
    title,
    asserta(init(1)),
    initLegendary(100),
    initLegendary(101),
    initFirst,
    initPlayer,
    generateTembok,
    initLegendaryMap, 
    !.

start :- 
    init(_),
    write('Game sudah dimulai'),!.