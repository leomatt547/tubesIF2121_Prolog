:- dynamic(lebar/1).
:- dynamic(panjang/1).
:- dynamic(positionX/1).
:- dynamic(positionY/1).
:- dynamic(tembok/16).
:- dynamic(adaTembok/1).
:- dynamic(boss1/2).
:- dynamic(boss2/2).
:- dynamic(boss3/2).
:- dynamic(myjob/9).

initBossMap :-
    lebar(L),
    panjang(P),
    NewP is P-5,
    NewL is L-5,
    random(NewP,P,X1),
    random(NewL,L,Y1),
    random(NewP,P,X2),
    random(NewL,L,Y2),
    random(NewP,P,X3),
    random(NewL,L,Y3),
    asserta(boss1(X1,Y1)),
    asserta(boss2(X2,Y2)),
    asserta(boss3(X3,Y3)).

isPlayer(X,Y) :-
    positionX(A),
    positionY(B),
    X =:= A,
    Y =:= B.

isQuest(X,Y) :-
    X =:= 2,
    Y =:= 2.

isShop(X,Y) :-
    X =:= 4,
    Y =:= 4.

isBoss1(X,Y) :-
    boss1(A,B),
    X =:= A,
    Y =:= B.

isBoss2(X,Y) :-
    boss2(A,B),
    X =:= A,
    Y =:= B.

isBoss3(X,Y) :-
    boss3(A,B),
    X =:= A,
    Y =:= B.

/*Fungsi untuk membuat Tembok Random*/
generateTembok :-
    asserta(adaTembok(1)),
    lebar(L),
    panjang(J),
    NewJ is J-6,
    NewL is L-6,
    random(5,NewJ,TX1),
    random(5,NewJ,TX2),
    random(5,NewJ,TX3),
    random(5,NewJ,TX4),
    random(5,NewJ,TX5),
    random(5,NewJ,TX6),
    random(5,NewJ,TX7),
    random(5,NewJ,TX8),
    random(5,NewL,TY1),
    random(5,NewL,TY2),
    random(5,NewL,TY3),
    random(5,NewL,TY4),
    random(5,NewL,TY5),
    random(5,NewL,TY6),
    random(5,NewL,TY7),
    random(5,NewL,TY8),
    asserta(tembok(TX1,TY1,TX2,TY2,TX3,TY3,TX4,TY4,TX5,TY5,TX6,TY6,TX7,TY7,TX8,TY8)).

isTembok(X1,Y1,X2,Y2,X3,Y3,X4,Y4,X5,Y5,X6,Y6,X7,Y7,X8,Y8) :-
    tembok(TX1,TY1,TX2,TY2,TX3,TY3,TX4,TY4,TX5,TY5,TX6,TY6,TX7,TY7,TX8,TY8),
    (
        (
        X1 == TX1,
        Y1 == TY1
        );
        (
            X2 == TX2,
            Y2 == TY2
        );
        (
            X3 == TX3,
            Y3 == TY3
        );
        (
            X4 == TX4,
            Y4 == TY4
        ); 
        (   
            X5 == TX5,
            Y5 == TY5
        );
        (
            X6 == TX6,
            Y6 == TY6
        );
        (   
            X7 == TX7,
            Y7 == TY7
        );
        (   
            X8 == TX8,
            Y8 == TY8
        )
    ).

isAtas(_,Y) :-
    Y =:= 0.

isBawah(_,Y) :-
    lebar(L),
    Max is L+1,
    Y =:= Max.

isKiri(X,_) :-
    X =:= 0.

isKanan(X,_) :-
    panjang(P),
    Max is P+1,
    X =:= Max.

printX(X,Y) :-
    isBawah(X,Y),
    isKanan(X,Y),
    write('X').

printX(X,Y) :-
    stage(1),
    isTembok(X,Y,X,Y,X,Y,X,Y,X,Y,X,Y,X,Y,X,Y),
    write('X'),
    NextX is (X+1),
    printX(NextX,Y).

printX(X,Y) :-
    stage(2),
    isTembok(X,Y,X,Y,X,Y,X,Y,X,Y,X,Y,X,Y,X,Y),
    write('@'),
    NextX is (X+1),
    printX(NextX,Y).

printX(X,Y) :-
    stage(3),
    isTembok(X,Y,X,Y,X,Y,X,Y,X,Y,X,Y,X,Y,X,Y),
    write('#'),
    NextX is (X+1),
    printX(NextX,Y).

printX(X,Y) :-
    isPlayer(X,Y),
    write('P'),
    NextX is (X+1),
    printX(NextX,Y).

printX(X,Y) :-
    isQuest(X,Y),
    write('Q'),
    NextX is (X+1),
    printX(NextX,Y).

printX(X,Y) :-
    isShop(X,Y),
    write('S'),
    NextX is (X+1),
    printX(NextX,Y).

printX(X,Y) :-
    stage(1),
    isBawah(X,Y),
    write('X'),
    NextX is (X+1),
    printX(NextX,Y).

printX(X,Y) :-
    stage(2),
    isBawah(X,Y),
    write('@'),
    NextX is (X+1),
    printX(NextX,Y).

printX(X,Y) :-
    stage(3),
    isBawah(X,Y),
    write('#'),
    NextX is (X+1),
    printX(NextX,Y).

printX(X,Y) :-
    stage(1),
    isKiri(X,Y),
    write('X'),
    NextX is (X+1),
    printX(NextX,Y).

printX(X,Y) :-
    stage(2),
    isKiri(X,Y),
    write('@'),
    NextX is (X+1),
    printX(NextX,Y).

printX(X,Y) :-
    stage(3),
    isKiri(X,Y),
    write('#'),
    NextX is (X+1),
    printX(NextX,Y).

printX(X,Y) :-
    stage(1),
    isKanan(X,Y),
    write('X'),nl,
    NextX is 0,
    NextY is (Y+1),
    printX(NextX,NextY).

printX(X,Y) :-
    stage(2),
    isKanan(X,Y),
    write('@'),nl,
    NextX is 0,
    NextY is (Y+1),
    printX(NextX,NextY).

printX(X,Y) :-
    stage(3),
    isKanan(X,Y),
    write('#'),nl,
    NextX is 0,
    NextY is (Y+1),
    printX(NextX,NextY).

printX(X,Y) :-
    stage(1),
    isAtas(X,Y),
    write('X'),
    NextX is (X+1),
    printX(NextX,Y).

printX(X,Y) :-
    stage(2),
    isAtas(X,Y),
    write('@'),
    NextX is (X+1),
    printX(NextX,Y).

printX(X,Y) :-
    stage(3),
    isAtas(X,Y),
    write('#'),
    NextX is (X+1),
    printX(NextX,Y).

printX(X,Y) :-
    stage(1),
    isBoss1(X,Y),
    write('K'),
    NextX is (X+1),
    printX(NextX,Y).

printX(X,Y) :-
    stage(2),
    isBoss2(X,Y),
    write('R'),
    NextX is (X+1),
    printX(NextX,Y).

printX(X,Y) :-
    stage(3),
    isBoss3(X,Y),
    write('D'),
    NextX is (X+1),
    printX(NextX,Y).

printX(X,Y) :-
    \+isKiri(X,Y),
    \+isKanan(X,Y),
    \+isBawah(X,Y),
    \+isAtas(X,Y),
    write('-'),
    NextX is (X+1),
    printX(NextX,Y).

initMap(X, Y) :-
    asserta(lebar(X)),
    asserta(panjang(Y)).

initPlayer :-
    asserta(positionX(1)),
    asserta(positionY(1)),
    karakter(A),
    B is A,
    job(B, Name2, Level2, MaxHealth2, Attack2, Defense2, Special2, Exp),
    Health2 is MaxHealth2,
    asserta(myjob(B, Name2, Level2, MaxHealth2,Health2, Attack2, Defense2, Special2, Exp)).

map :- 
    init(_),
    stage(N),
    write('Stage'), write(N), nl,
    adaTembok(_),
    printX(0,0),nl,
    legenda,!.

legenda :- 
    stage(N),
    (
        N =:= 1 ->
        write('X = tembok'),nl
        ;
        (
            N =:= 2 ->
            write('@ = tembok'),nl
            ;
            (
                N =:= 3 ->
                write('# = tembok'),nl
            )
        )
    ),
    write('- = rumput'),nl,
    write('Q = quest'),nl,
    write('S = shop'),nl,!.