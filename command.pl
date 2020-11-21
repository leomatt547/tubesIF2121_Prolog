:- dynamic(quest/1).

help :-
    init(_),
    write('1. start  : untuk memulai petualanganmu '),nl,
    write('2. map    : menampilkan peta'),nl,
    write('3. status : menampilkan kondisimu terkini'),nl,
    write('4. w      : gerak ke utara 1 langkah'),nl,
    write('5. s      : gerak ke selatan 1 langkah'),nl,
    write('6. d      : gerak ke ke timur 1 langkah'),nl,
    write('7. a      : gerak ke barat 1 langkah'),nl,
    write('8. Status : menampilkan status pemain'),nl.

w :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TempX),
    positionY(Temp),
    Next is (Temp-1),
    \+isAtas(TempX,Next),
    \+isBawah(TempX,Next),
    \+isKanan(TempX,Next),
    \+isKiri(TempX,Next),
    \+isQuest(TempX,Next),
    \+isTembok(TempX,Next,TempX,Next,TempX,Next,TempX,Next,TempX,Next,TempX,Next,TempX,Next,TempX,Next),
    \+isEnemy1(TempX,Next),
    \+isEnemy2(TempX,Next),
    triggered,
    retract(positionY(_)),
    asserta(positionY(Next)),!.

w :- 
    init(_),
    \+ isEnemyAlive(_),
    positionX(TempX),
    positionY(Temp),
    Next is (Temp-1),
    isQuest(TempX,Next),
    write('Silahkan ambil Quest Anda'),
    retract(positionY(_)),
    asserta(positionY(Next)),!.

w :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TempX),
    positionY(Temp),
    Next is (Temp-1),
    isEnemy1(TempX,Next),
    enemyTriggered1,
    retract(positionY(_)),
    asserta(positionY(Next)),!.

w :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TempX),
    positionY(Temp),
    Next is (Temp-1),
    isEnemy2(TempX,Next),
    enemyTriggered2,
    retract(positionY(_)),
    asserta(positionY(Next)),!.

w :- 
    \+init(_),
    write('Sans, Game belum mulai').

w :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TempX),
    positionY(Temp),
    Next is (TempX-1),
    \+isAtas(Next,Temp),
    \+isBawah(Next,Temp),
    \+isKanan(Next,Temp),
    \+isKiri(Next,Temp),
    \+isQuest(Next,Temp),
    \+isEnemy1(Next,Temp),
    \+isEnemy2(Next,Temp),
    \+isTembok(Next,Temp,Next,Temp,Next,Temp,Next,Temp,Next,Temp,Next,Temp,Next,Temp,Next,Temp),
    triggered,
    retract(positionX(_)),
    asserta(positionX(Next)),!.

w :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TempX),
    positionY(Temp),
    Next is (TempX-1),
    (
        isAtas(Next,Temp);
        isBawah(Next,Temp);
        isKanan(Next,Temp);
        isKiri(Next,Temp);
        isTembok(Next,Temp,Next,Temp,Next,Temp,Next,Temp,Next,Temp,Next,Temp,Next,Temp,Next,Temp)
    ),
    write('Ada Tembok'),!.

w :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TempX),
    positionY(Temp),
    Next is (TempX-1),
    isQuest(Next,Temp),
    write('Anda sekarang berada di Quest'),
    retract(positionX(_)),
    asserta(positionX(Next)),!.

w :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TempX),
    positionY(Temp),
    Next is (TempX-1),
    isEnemy1(Next,Temp),
    enemyTriggered1,
    retract(positionX(_)),
    asserta(positionX(Next)),!.

w :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TempX),
    positionY(Temp),
    Next is (TempX-1),
    isEnemy2(Next,Temp),
    enemyTriggered2,
    retract(positionX(_)),
    asserta(positionX(Next)),!.

a :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TempX),
    positionY(Temp),
    Next is (TempX-1),
    \+isAtas(Next,Temp),
    \+isBawah(Next,Temp),
    \+isKanan(Next,Temp),
    \+isKiri(Next,Temp),
    \+isQuest(Next,Temp),
    \+isEnemy1(Next,Temp),
    \+isEnemy2(Next,Temp),
    \+isTembok(Next,Temp,Next,Temp,Next,Temp,Next,Temp,Next,Temp,Next,Temp,Next,Temp,Next,Temp),
    triggered,
    retract(positionX(_)),
    asserta(positionX(Next)),!.

a :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TempX),
    positionY(Temp),
    Next is (TempX-1),
    (
        isAtas(Next,Temp);
        isBawah(Next,Temp);
        isKanan(Next,Temp);
        isKiri(Next,Temp);
        isTembok(Next,Temp,Next,Temp,Next,Temp,Next,Temp,Next,Temp,Next,Temp,Next,Temp,Next,Temp)
    ),
    write('Ada Tembok'),!.

a :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TempX),
    positionY(Temp),
    Next is (TempX-1),
    isQuest(Next,Temp),
    write('Anda sekarang berada di Quest'),
    retract(positionX(_)),
    asserta(positionX(Next)),!.

a :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TempX),
    positionY(Temp),
    Next is (TempX-1),
    isEnemy1(Next,Temp),
    enemyTriggered1,
    retract(positionX(_)),
    asserta(positionX(Next)),!.

a :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TempX),
    positionY(Temp),
    Next is (TempX-1),
    isEnemy2(Next,Temp),
    enemyTriggered2,
    retract(positionX(_)),
    asserta(positionX(Next)),!.

a :- 
    \+init(_),
    write('Game belum dimulai').

s :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TempX),
    positionY(Temp),
    Next is (Temp+1),
    \+isAtas(TempX,Next),
    \+isBawah(TempX,Next),
    \+isKanan(TempX,Next),
    \+isKiri(TempX,Next),
    \+isQuest(TempX,Next),
    \+isEnemy1(TempX,Next),
    \+isEnemy2(TempX,Next),
    \+isTembok(TempX,Next,TempX,Next,TempX,Next,TempX,Next,TempX,Next,TempX,Next,TempX,Next,TempX,Next),
    triggered,
    retract(positionY(_)),
    asserta(positionY(Next)),!.

s :- 
    init(_),
    \+ isEnemyAlive(_),
    positionX(TempX),
    positionY(Temp),
    Next is (Temp+1),
    (
        isAtas(TempX,Next);
        isBawah(TempX,Next);
        isKanan(TempX,Next);
        isKiri(TempX,Next);
        isTembok(TempX,Next,TempX,Next,TempX,Next,TempX,Next,TempX,Next,TempX,Next,TempX,Next,TempX,Next)
    ),
    write('Ada Tembok'),!.

s :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TempX),
    positionY(Temp),
    Next is (Temp+1),
    isQuest(TempX,Next),
    write('Anda sekarang berada di Quest'),
    retract(positionY(_)),
    asserta(positionY(Next)),!.

s :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TempX),
    positionY(Temp),
    Next is (Temp+1),
    isEnemy1(TempX,Next),
    enemyTriggered1,
    retract(positionY(_)),
    asserta(positionY(Next)),!.

s :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TempX),
    positionY(Temp),
    Next is (Temp+1),
    isEnemy2(TempX,Next),
    enemyTriggered2,
    retract(positionY(_)),
    asserta(positionY(Next)),!.

s :-
    \+init(_),
    write('Game belum dimulai').

d :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TempX),
    positionY(Temp),
    Next is (TempX+1),
    \+isAtas(Next,Temp),
    \+isBawah(Next,Temp),
    \+isKanan(Next,Temp),
    \+isKiri(Next,Temp),
    \+isQuest(Next,Temp),
    \+isEnemy1(Next,Temp),
    \+isEnemy2(Next,Temp),
    \+isTembok(Next,Temp,Next,Temp,Next,Temp,Next,Temp,Next,Temp,Next,Temp,Next,Temp,Next,Temp),
    triggered,
    retract(positionX(_)),
    asserta(positionX(Next)),!.

d :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TempX),
    positionY(Temp),
    Next is (TempX+1),
    (
        isAtas(Next,Temp);
        isBawah(Next,Temp);
        isKanan(Next,Temp);
        isKiri(Next,Temp);
        isTembok(Next,Temp,Next,Temp,Next,Temp,Next,Temp,Next,Temp,Next,Temp,Next,Temp,Next,Temp)
    ),
    write('Ada Tembok'),!.

d :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TempX),
    positionY(Temp),
    Next is (TempX+1),
    isQuest(Next,Temp),
    write('Anda sekarang berada di Quest'),
    retract(positionX(_)),
    asserta(positionX(Next)),!.

d :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TempX),
    positionY(Temp),
    Next is (TempX+1),
    isEnemy1(Next,Temp),
    enemyTriggered1,
    retract(positionX(_)),
    asserta(positionX(Next)),!.

d :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TempX),
    positionY(Temp),
    Next is (TempX+1),
    isEnemy2(Next,Temp),
    enemyTriggered2,
    retract(positionX(_)),
    asserta(positionX(Next)),!.

e :-
    \+init(_),
    write('Game belum dimulai').

triggered :-
    random(1,100,L),
    (
        L >= 80
        -> enemyTriggered
        ; !
    ).

loop(1,_).
loop(X,ID) :-
    X > 0,
    naikLevelEnemy(ID),
    M is X-1,
    loop(M,ID).