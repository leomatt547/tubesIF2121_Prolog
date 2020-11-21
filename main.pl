:- dynamic(init/1).
:- dynamic(player/1).

:- include('command.pl').
:- include('job.pl').
:- include('map.pl').
:- include('player.pl').
:- include('level.pl').
:- include('battle.pl').

title :-
    write('   ____  U _____ u _   _    ____     _   _               _   _ '),nl,
    write('U /"___|u | ___"|/| * |"|  / __"| u | | | |     ___     | | |"| '),nl,
    write('|| |  _ / |  _|" <|  || |><|___ |/ /| |_| ||   |_"_|   <|  || |>'),nl,
    write(' | |_| |  | |___ U| ||  |u u___) | U|  _  |u    | |    U| ||  |u'),nl,
    write('  |____|  |_____| |_| |_|  |____/>> |_| |_|   U/| ||u   |_| |_|'),nl,
    write('  _)(|_   <<   >> ||   |,-.)(  (__)//   |.-,_|___|_,-.||   |,-.'),nl,
    write(' (__)__) (__) (__)(_")  (_/(__)    (_") ("_)|_)-''-(_/ (_")  (_/'),nl,
    write('On the table, in the afternoon sun,'),nl,
    write('sits a small pendant known as a "Vision"'),nl,
    write('From the crest within shines a light more brilliant'),nl,
    write('than the sun outside the window'),nl,
    write('And in that glassy surface, is the reflection of a huge new world'),nl,nl,
    write('Good isekai game!!'),nl,nl,
    write('Lets play and be a programmer'),nl,nl,
    write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'),nl,
    write('%                              ~Genshin Asik~                                  %'),nl,
    write('% 1. start  : untuk memulai petualanganmu                                      %'),nl,
    write('% 2. map    : menampilkan peta                                                 %'),nl,
    write('% 3. status : menampilkan kondisimu terkini                                    %'),nl,
    write('% 4. w      : gerak ke utara 1 langkah                                         %'),nl,
    write('% 5. s      : gerak ke selatan 1 langkah                                       %'),nl,
    write('% 6. d      : gerak ke ke timur 1 langkah                                      %'),nl,
    write('% 7. a      : gerak ke barat 1 langkah                                         %'),nl,
    write('% 8. help   : menampilkan segala bantuan                                       %'),nl,
    write('% 9. Status : menampilkan status pemain                                        %'),nl,
    write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'),nl, nl.

initFirst :-
    write('Welcome to Genshin Asik.'), nl,
    write('Input name here?'), nl,
    read(Username),
    asserta(player(Username)), nl,
    write('Hello '), write(Username), nl,
    repeat,
    write('Choose your job'), nl, nl,
    write('1. Hero'), nl,
    write('2. Paladin'), nl,
    write('3. Wizard'),
    write('Insert job: '),
    read(Jobstart), nl,
    job(ID,Jobstart,_,_,_,_,_),
    (
        ID =:= 1 ->
            write('You choose Hero, let’s explore the world'),nl
            ;
            (
                ID =:= 2 ->
                write('You choose Paladin, let’s explore the world'),nl
                ;
                (
                    ID =:= 3 ->
                    write('You choose Wizard, let’s explore the world'),nl, nl
                )
            )
    ),
    do(ID), nl,
    end_condition(ID),
    status.

end_condition(end).
end_condition(X) :- 
    have(X), !,
    addJob(X),
    random(15,30,Sizex),
    random(15,30,Sizey),
    initMap(Sizex, Sizey),
    player(Username),
    write('Information'), nl,
    write('Name: '), write(Username), nl,nl,
    statusInventory,!.


do(X) :- have(X),!.
do(_) :- write('Hey jangan ngasal ya!').
do(end).

have(X) :-
    X =< 9, !.

start :- 
    init(_),
    write('Game sudah dimulai'),!.

start :-
    \+init(_),
    title,
    asserta(init(1)),
    initEnemy(100),
    initEnemy(101),
    initFirst,
    initPlayer,
    generateTembok,
    initEnemyMap, 
    !.

quit :-
    \+init(_),
    write('Dasar labil!'),!.

quit :-
    write('Good bye!!'), nl,
    retract(positionX(_)),
    retract(positionY(_)),
    retract(lebar(_)),
    retract(panjang(_)),
    retract(tembok(_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_)),
    forall(inventory(_, _, _, _, _, _, _, _, _, _), (
        retract(inventory(_, _, _, _, _, _, _, _, _, _))
	)),
    forall(enemy(_,_,_,_,_,_,_,_,_), (
        retract(enemy(_,_,_,_,_,_,_,_,_))
    )),
    (
        (enemy1(_,_),enemy2(_,_))
        -> retract(enemy1(_,_)),
        retract(enemy2(_,_)),
        retract(player(_)),
        retract(init(_)),
        fail
        ; 
        (enemy1(_,_),\+enemy2(_,_))
        -> retract(enemy1(_,_)), fail
        ;
        (\+enemy1(_,_),enemy2(_,_))
        -> retract(enemy2(_,_)),
        retract(player(_)),
        retract(init(_)),
        fail
        ;
        retract(player(_)),
        retract(init(_))
    ).

save(_) :-
	\+init(_),
	write('Command ini hanya bisa dipakai setelah game dimulai.'), nl,
	write('Gunakan command "start." untuk memulai game.'), nl, !.

save(FileName) :-
    player(Username),
        tell(FileName),
            write('player('), write(Username),write(').'),nl,
            writeInventory,
            writeLebarPanjang,
            writePosisiPlayer,
            writeTembok,
            writeEnemy1,
            writeEnemy2,
        told, !.

writeLebarPanjang :-
    lebar(L),
    panjang(J),
    write('lebar('), write(L), write(').'), nl,
    write('panjang('), write(J), write(').'), nl, !.

writeEnemy1 :-
    enemy1(X,Y),
    write('enemy1('), write(X), write(','), write(Y), write(').'), nl.

writeEnemy1 :-
    \+ enemy1(_,_), !.

writeEnemy2 :-
    enemy2(X,Y),
    write('enemy2('), write(X), write(','), write(Y), write(').'), nl.

writeEnemy2 :-
    \+ enemy2(_,_), !.

writeTembok :-
    tembok(TempX1,TempY1,TempX2,TempY2,TempX3,TempY3,TempX4,TempY4,TempX5,TempY5,TempX6,TempY6,TempX7,TempY7,TempX8,TempY8),
    write('tembok('), write(TempX1), write(','), write(TempY1), write(','), write(TempX2), write(','), write(TempY2), write(','),
    write(TempX3), write(','), write(TempY3), write(','), write(TempX4), write(','), write(TempY4), write(','),
    write(TempX5), write(','), write(TempY5), write(','), write(TempX6), write(','), write(TempY6), write(','),
    write(TempX7), write(','), write(TempY7), write(','), write(TempX8), write(','), write(TempY8), write(').'), nl, !.

writePosisiPlayer :-
    positionX(A),
    positionY(B),
    write('positionX('), write(A), write(').'), nl,
    write('positionY('), write(B), write(').'), nl, !.

writeInventory:-
	\+inventory(_, _, _, _, _, _, _, _, _, _),
	!.

writeInventory:-
	forall(inventory(ID, Name, Type, MaxHealth, Level, Health, Element, Attack, Special, EXP),(
		write('inventory('), write(ID), write(', '), write(Name), write(', '), write(Type), write(', '),
        write(MaxHealth), write(', '), write(Level), write(', '), write(Health), write(', '), 
        write(Element), write(', '), write(Attack), write(', '), write(Special), write(', '), write(EXP), write(').'), nl
	)), !.

loadGame(_) :-
	init(_),
	write('Sudah ada game yang mulai. Apabila berubah pikiran, silahkan quit terlebih dahulu.'), nl, !.

loadGame(FileName):-
	\+file_exists(FileName),
	write('File tidak ada'), nl, 
    write('Start Game dari awal saja'), nl, !.

loadGame(FileName):-
	open(FileName, read, Stream),
        readFileLines(Stream,Lines),
    close(Stream),
    assertaLine(Lines), 
    asserta(init(1)), !.

assertaLine([]) :- !.

assertaLine([X|L]):-
	asserta(X),
	assertaLine(L), !.

readFileLines(Stream,[]) :-
    at_end_of_stream(Stream).

readFileLines(Stream,[X|L]) :-
    \+ at_end_of_stream(Stream),
    read(Stream,X),
    readFileLines(Stream,L).
    readFileLines(Stream,L).