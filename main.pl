:- dynamic(init/1).
:- dynamic(player/1).

:- include('command.pl').
:- include('job.pl').
:- include('map.pl').

title :-
    write('   ____  U _____ u _   _    ____     _   _               _   _ '),nl,
    write('U /"___|u | ___"|/| \ |"|  / __"| u | | | |     ___     | \ |"|   '),nl,
    write('\| |  _ / |  _|" <|  \| |><\___ \/ /| |_| |\   |_"_|   <|  \| |>'),nl,
    write(' | |_| |  | |___ U| |\  |u u___) | U|  _  |u    | |    U| |\  |u'),nl,
    write('  \____|  |_____| |_| \_|  |____/>> |_| |_|   U/| |\u   |_| \_|'),nl,
    write('  _)(|_   <<   >> ||   \,-.)(  (__)//   \.-,_|___|_,-.||   \,-.'),nl,
    write(' (__)__) (__) (__)(_")  (_/(__)    (_") ("_)\_)-' '-(_/ (_")  (_/'),nl,
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
            write ('You choose Hero, let’s explore the world')
            ;
            (
                ID =:= 2 ->
                write ('You choose Paladin, let’s explore the world')
                ;
                (
                    ID =:= 3 ->
                    write ('You choose Wizard, let’s explore the world')
                    ;
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

quit :-
    \+init(_),
    write('Dasar labil!'),!.

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