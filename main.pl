:- dynamic(init/1).
:- dynamic(player/1).
:- dynamic(stage/1).

:- include('command.pl').
:- include('job.pl').
:- include('map.pl').
:- include('player.pl').
:- include('level.pl').
:- include('inventory.pl').
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
    write('1. hero'), nl,
    write('2. paladin'), nl,
    write('3. wizard'),nl,
    write('Insert job: '),
    read(Jobstart), nl,
    job(ID,Jobstart,_,_,_,_,_),
    (
        ID =:= 1 ->
            addItems(longsword),
            addItems(excalibur),
            addItems(iron_armor),
            addItems(hero_suit),
            write('You choose Hero, lets explore the world'),nl
            ;
            (
                ID =:= 2 ->
                addItems(spiked_shield),
                addItems(paladin_shield),
                addItems(silver_breastplate),
                addItems(golden_suit),
                write('You choose Paladin, lets explore the world'),nl
                ;
                (
                    ID =:= 3 ->
                    addItems(crooked_wand),
                    addItems(excelsior),
                    addItems(red_robe),
                    addItems(grand_robe),
                    write('You choose Wizard, lets explore the world'),nl, nl
                )
            )
    ),
    do(ID), nl,
    end_condition(ID).

end_condition(end).
end_condition(X) :- 
    have(X), !,
    N is 1,
    asserta(stage(N)),
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
    X =< 3 ,!.

start :- 
    init(_),
    write('Game sudah dimulai'),!.

start :-
    \+init(_),
    title,
    asserta(init(1)),
    initBoss(100),
    initBoss(101),
    initFirst,
    initPlayer,
    generateTembok,
    initBossMap,
    !.

quit :-
    \+init(_),
    write('Dasar labil!'),!.

quit :-
    write('Bye!!'), nl,
    retract(positionX(_)),
    retract(positionY(_)),
    retract(lebar(_)),
    retract(panjang(_)),
    retract(tembok(_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_)),
    retract(claim(_)),
    forall(inventory(_, _, _), (
        retract(inventory(_, _, _))
	)),
    forall(boss(_,_,_,_,_,_,_), (
        retract(boss(_,_,_,_,_,_,_))
    )),
    (
        (boss1(_,_),boss2(_,_))
        -> retract(boss1(_,_)),
        retract(boss2(_,_)),
        retract(player(_)),
        retract(init(_)),
        fail
        ; 
        (boss1(_,_),\+boss2(_,_))
        -> retract(boss1(_,_)), fail
        ;
        (\+boss1(_,_),boss2(_,_))
        -> retract(boss2(_,_)),
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
    tembok(TX1,TY1,TX2,TY2,TX3,TY3,TX4,TY4,TX5,TY5,TX6,TY6,TX7,TY7,TX8,TY8),
    write('tembok('), write(TX1), write(','), write(TY1), write(','), write(TX2), write(','), write(TY2), write(','),
    write(TX3), write(','), write(TY3), write(','), write(TX4), write(','), write(TY4), write(','),
    write(TX5), write(','), write(TY5), write(','), write(TX6), write(','), write(TY6), write(','),
    write(TX7), write(','), write(TY7), write(','), write(TX8), write(','), write(TY8), write(').'), nl, !.

writePosisiPlayer :-
    positionX(A),
    positionY(B),
    write('positionX('), write(A), write(').'), nl,
    write('positionY('), write(B), write(').'), nl, !.

writeInventory:-
	\+inventory(_, _, _),
	!.

writeInventory:-
	forall(inventory(ID, Nama, Quantity),(
		write('inventory('), write(ID), write(', '), write(Nama), write(', '),
        write(Quantity), write(').'), nl
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