:- dynamic(init/1).
:- dynamic(player/1).
:- dynamic(stage/1).
:- dynamic(karakter/1).

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
    write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'),nl,
    write('%                              ~Genshin Asik~                                   %'),nl,
    write('% 1. start   : untuk memulai petualanganmu                                      %'),nl,
    write('% 2. map     : menampilkan peta                                                 %'),nl,
    write('% 3. status  : menampilkan kondisimu terkini                                    %'),nl,
    write('% 4. w       : gerak ke utara 1 langkah                                         %'),nl,
    write('% 5. s       : gerak ke selatan 1 langkah                                       %'),nl,
    write('% 6. d       : gerak ke ke timur 1 langkah                                      %'),nl,
    write('% 7. a       : gerak ke barat 1 langkah                                         %'),nl,
    write('% 8. help    : menampilkan segala bantuan                                       %'),nl,
    write('% 9. mystatus: menampilkan status pemain                                        %'),nl,
    write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'),nl, nl.

initFirst :-
    write('Welcome to Genshin Asik.'), nl,
    write('Masukkan nama dengan awalan huruf kecil:'), nl,
    read(Username),
    asserta(player(Username)), nl,
    write('Hello '), write(Username), nl,
    repeat,
    write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'),nl,
    write('%                                                                               %'),nl,
    write('%                              ~Job Selection~                                  %'),nl,
    write('%                                                                               %'),nl,
    write('%                                                                               %'),nl,
    write('% 1. Hero    : All-rounder, high on health                                      %'),nl,
    write('% 2. Paladin : Proficient in defense                                            %'),nl,
    write('% 3. Wizard  : Glass Cannon, high on attack but low on max health               %'),nl,
    write('%                                                                               %'),nl,
    write('%                                                                               %'),nl,                                       
    write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'),nl, nl,
    read(Jobstart), nl,
    job(ID,Jobstart,_,_,_,_,_,_),
    (
        ID =:= 1 ->
            addItems(longsword),
            addItems(longsword),
            addItems(longsword),
            addItems(longsword),
            addItems(longsword),
            addItems(excalibur),
            addItems(iron_armor),
            addItems(hero_suit),
            write('You choose Hero, lets explore the world'),nl,nl,                                              
            write('    `7MMF`  `7MMF`                               '),nl,
            write('      MM      MM                                 '),nl,
            write('      MM      MM   .gP"Ya  `7Mb,od8  ,pW"Wq.     '),nl,
            write('      MMmmmmmmMM  ,M`   Yb   MM` "` 6W`   `Wb    '),nl,
            write('      MM      MM  8M""""""   MM     8M     M8    '),nl,
            write('      MM      MM  YM.    ,   MM     YA.   ,A9    '),nl,
            write('    .JMML.  .JMML. `Mbmmd` .JMML.    `Ybmd9`     '),nl,
            write('                                                 '),nl,                          
            write('           (>_________________________________   '),nl,
            write('  [########[]_________________________________>  '),nl,
            write('           (>                                    '),nl
            ;
            (
                ID =:= 2 ->
                addItems(spiked_shield),
                addItems(spiked_shield),
                addItems(spiked_shield),
                addItems(spiked_shield),
                addItems(spiked_shield),
                addItems(paladin_shield),
                addItems(silver_breastplate),
                addItems(golden_suit),
                write('You choose Paladin, lets explore the world'),nl,nl,                                                                           
                write('                      ,,                  ,,    ,,              '),nl,
                write('`7MM"""Mq.          `7MM                `7MM    db              '),nl,
                write('  MM   `MM.           MM                  MM                    '),nl,
                write('  MM   ,M9  ,6"Yb.    MM   ,6"Yb.    ,M""bMM  `7MM  `7MMpMMMb.  '),nl,
                write('  MMmmdM9  8)   MM    MM  8)   MM  ,AP    MM    MM    MM    MM  '),nl,
                write('  MM        ,pm9MM    MM   ,pm9MM  8MI    MM    MM    MM    MM  '),nl,
                write('  MM       8M   MM    MM  8M   MM  `Mb    MM    MM    MM    MM  '),nl,
                write('.JMML.     `Moo9^Yo..JMML.`Moo9^Yo. `Wbmd"MML..JMML..JMML  JMML.'),nl,
                write('                                                                '),nl,                                                               
                write('                   []                                           '),nl,
                write('              o<<<<||::===========================-             '),nl,
                write('                   []                                           '),nl
                ;
                (
                    ID =:= 3 ->
                    addItems(crooked_wand),
                    addItems(crooked_wand),
                    addItems(crooked_wand),
                    addItems(crooked_wand),
                    addItems(crooked_wand),
                    addItems(excelsior),
                    addItems(red_robe),
                    addItems(grand_robe),
                    write('You choose Wizard, lets explore the world'),nl,nl,                                                                           
                    write('                        ,,                                   ,,  '),nl,
                    write('`7MMF`     A     `7MF`  db                                 `7MM  '),nl,
                    write('  `MA     ,MA     ,V                                         MM  '),nl,
                    write('   VM:   ,VVM:   ,V   `7MM  M"""MMV  ,6"Yb.  `7Mb,od8   ,M""bMM  '),nl,
                    write('    MM.  M` MM.  M`     MM  `  AMV  8)   MM    MM` "` ,AP    MM  '),nl,
                    write('    `MM A`  `MM A`      MM    AMV    ,pm9MM    MM     8MI    MM  '),nl,
                    write('     :MM;    :MM;       MM   AMV  , 8M   MM    MM     `Mb    MM  '),nl,
                    write('      VF      VF      .JMML.AMMmmmM `Moo9^Yo..JMML.    `Wbmd"MML.'),nl,
                    write('                                                                 '),nl,
                    write('                [O(((((([========================---             '),nl
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
    asserta(claim(0,0,0)),
    asserta(karakter(X)),
    random(15,30,Sizex),
    random(15,30,Sizey),
    initMap(Sizex, Sizey),
    Uang is 500,
    asserta(gold(Uang)),
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
    write('                                                                                                                 '),nl,
    write('      * ***                                                                                                      '),nl,
    write('    *  ****  *                                                           *                                 *     '),nl,
    write('   *  *  ****                                                           **                                **     '),nl,
    write('  *  **   **                                                            **                                **     '),nl,
    write(' *  ***                                                      ****     ********            ***  ****     ******** '),nl,
    write('**   **             ****    *** **** ****       ***         * **** * ********     ****     **** **** * ********  '),nl,
    write('**   **   ***      * ***  *  *** **** ***  *   * ***       **  ****     **       * ***  *   **   ****     **     '),nl,
    write('**   **  ****  *  *   ****    **  **** ****   *   ***     ****          **      *   ****    **            **     '),nl,
    write('**   ** *  ****  **    **     **   **   **   **    ***      ***         **     **    **     **            **     '),nl,
    write('**   ***    **   **    **     **   **   **   ********         ***       **     **    **     **            **     '),nl,
    write(' **  **     *    **    **     **   **   **   *******            ***     **     **    **     **            **     '),nl,
    write('  ** *      *    **    **     **   **   **   **            ****  **     **     **    **     **            **     '),nl,
    write('   ***     *     **    **     **   **   **   ****    *    * **** *      **     **    **     ***           **     '),nl,
    write('    *******       ***** **    ***  ***  ***   *******        ****        **     ***** **     ***           **    '),nl,
    write('      ***          ***   **    ***  ***  ***   *****                             ***   **                        '),nl.
                                                                                                                                      

start :-
    \+init(_),
    title,
    asserta(init(1)),
    initBoss(100),
    initBoss(101),
    initBoss(102),
    initFirst,
    initPlayer,
    generateTembok,
    initBossMap,
    !.

quit :-
    \+init(_),
    write('Dasar labil!'),!.

quit :-
    write('                                                                                               '),nl,
    write('      * ***                                                                           **       '),nl,
    write('    *  ****  *                                                                         **      '),nl,
    write('   *  *  ****                                                                          **      '),nl,
    write('  *  **   **                                                                           **      '),nl,
    write(' *  ***                                                                                **      '),nl,
    write('**   **             ****    *** **** ****       ***          ***    ***  ****      *** **      '),nl,
    write('**   **   ***      * ***  *  *** **** ***  *   * ***        * ***    **** **** *  *********    '),nl,
    write('**   **  ****  *  *   ****    **  **** ****   *   ***      *   ***    **   ****  **   ****     '),nl,
    write('**   ** *  ****  **    **     **   **   **   **    ***    **    ***   **    **   **    **      '),nl,
    write('**   ***    **   **    **     **   **   **   ********     ********    **    **   **    **      '),nl,
    write(' **  **     *    **    **     **   **   **   *******      *******     **    **   **    **      '),nl,
    write('  ** *      *    **    **     **   **   **   **           **          **    **   **    **      '),nl,
    write('   ***     *     **    **     **   **   **   ****    *    ****    *   **    **   **    **      '),nl,
    write('    *******       ***** **    ***  ***  ***   *******      *******    ***   ***   *****        '),nl,
    write('      ***          ***   **    ***  ***  ***   *****        *****      ***   ***   ***         '),nl,
    retract(positionX(_)),
    retract(stage(_)),
    retract(gold(_)),
    retract(positionY(_)),
    retract(lebar(_)),
    retract(panjang(_)),
    retract(tembok(_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_)),
    retract(claim(_,_,_)),
    forall(inventory(_, _, _,_), (
        retract(inventory(_, _, _,_))
	)),
    forall(boss(_,_,_,_,_,_,_,_), (
        retract(boss(_,_,_,_,_,_,_,_))
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
	\+inventory(_, _, _,_),
	!.

writeInventory:-
	forall(inventory(ID, Nama, Quantity, Status),(
		write('inventory('), write(ID), write(', '), write(Nama), write(', '),
        write(Quantity), write(', '),write(Status), write(').'), nl
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