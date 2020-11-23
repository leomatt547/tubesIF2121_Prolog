:- dynamic(claim/1).

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
    positionX(TX),
    positionY(T),
    Next is (T-1),
    \+isAtas(TX,Next),
    \+isBawah(TX,Next),
    \+isKanan(TX,Next),
    \+isKiri(TX,Next),
    \+isQuest(TX,Next),
    \+isTembok(TX,Next,TX,Next,TX,Next,TX,Next,TX,Next,TX,Next,TX,Next,TX,Next),
    \+isBoss1(TX,Next),
    \+isBoss2(TX,Next),
    triggered,
    retract(positionY(_)),
    asserta(positionY(Next)),!.

w :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TX),
    positionY(T),
    Next is (T-1),
    (
        isAtas(TX,Next);
        isBawah(TX,Next);
        isKanan(TX,Next);
        isKiri(TX,Next);
        isTembok(TX,Next,TX,Next,TX,Next,TX,Next,TX,Next,TX,Next,TX,Next,TX,Next)
    ),
    write('Ada Tembok'),!.

w :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TX),
    positionY(T),
    Next is (T-1),
    isQuest(TX,Next),
    write('Silahkan claim bonus anda.'),
    retract(positionY(_)),
    asserta(positionY(Next)),!.

w :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TX),
    positionY(T),
    Next is (T-1),
    isBoss1(TX,Next),
    retract(positionY(_)),
    asserta(positionY(Next)),!.

w :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TX),
    positionY(T),
    Next is (T-1),
    isBoss2(TX,Next),
    retract(positionY(_)),
    asserta(positionY(Next)),!.

w :-
    \+init(_),
    write('Game belum dimulai').

a :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TX),
    positionY(T),
    Next is (TX-1),
    \+isAtas(Next,T),
    \+isBawah(Next,T),
    \+isKanan(Next,T),
    \+isKiri(Next,T),
    \+isQuest(Next,T),
    \+isBoss1(Next,T),
    \+isBoss2(Next,T),
    \+isTembok(Next,T,Next,T,Next,T,Next,T,Next,T,Next,T,Next,T,Next,T),
    triggered,
    retract(positionX(_)),
    asserta(positionX(Next)),!.

a :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TX),
    positionY(T),
    Next is (TX-1),
    (
        isAtas(Next,T);
        isBawah(Next,T);
        isKanan(Next,T);
        isKiri(Next,T);
        isTembok(Next,T,Next,T,Next,T,Next,T,Next,T,Next,T,Next,T,Next,T)
    ),
    write('Ada Tembok'),!.

a :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TX),
    positionY(T),
    Next is (TX-1),
    isQuest(Next,T),
    write('Silahkan claim bonus anda.'),
    retract(positionX(_)),
    asserta(positionX(Next)),!.

a :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TX),
    positionY(T),
    Next is (TX-1),
    isBoss1(Next,T),
    retract(positionX(_)),
    asserta(positionX(Next)),!.

a :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TX),
    positionY(T),
    Next is (TX-1),
    isBoss2(Next,T),
    retract(positionX(_)),
    asserta(positionX(Next)),!.

a :- 
    \+init(_),
    write('Game belum dimulai').

s :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TX),
    positionY(T),
    Next is (T+1),
    \+isAtas(TX,Next),
    \+isBawah(TX,Next),
    \+isKanan(TX,Next),
    \+isKiri(TX,Next),
    \+isQuest(TX,Next),
    \+isBoss1(TX,Next),
    \+isBoss2(TX,Next),
    \+isTembok(TX,Next,TX,Next,TX,Next,TX,Next,TX,Next,TX,Next,TX,Next,TX,Next),
    triggered,
    retract(positionY(_)),
    asserta(positionY(Next)),!.
    
s :- 
    init(_),
    \+ isEnemyAlive(_),
    positionX(TX),
    positionY(T),
    Next is (T+1),
    (
        isAtas(TX,Next);
        isBawah(TX,Next);
        isKanan(TX,Next);
        isKiri(TX,Next);
        isTembok(TX,Next,TX,Next,TX,Next,TX,Next,TX,Next,TX,Next,TX,Next,TX,Next)
    ),
    write('Ada Tembok'),!.

s :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TX),
    positionY(T),
    Next is (T+1),
    isQuest(TX,Next),
    write('Silahkan claim bonus anda.'),
    retract(positionY(_)),
    asserta(positionY(Next)),!.

s :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TX),
    positionY(T),
    Next is (T+1),
    isBoss1(TX,Next),
    retract(positionY(_)),
    asserta(positionY(Next)),!.

s :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TX),
    positionY(T),
    Next is (T+1),
    isBoss2(TX,Next),
    retract(positionY(_)),
    asserta(positionY(Next)),!.

s :-
    \+init(_),
    write('Game belum dimulai').


d :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TX),
    positionY(T),
    Next is (TX+1),
    \+isAtas(Next,T),
    \+isBawah(Next,T),
    \+isKanan(Next,T),
    \+isKiri(Next,T),
    \+isQuest(Next,T),
    \+isBoss1(Next,T),
    \+isBoss2(Next,T),
    \+isTembok(Next,T,Next,T,Next,T,Next,T,Next,T,Next,T,Next,T,Next,T),
    triggered,
    retract(positionX(_)),
    asserta(positionX(Next)),!.

d :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TX),
    positionY(T),
    Next is (TX+1),
    (
        isAtas(Next,T);
        isBawah(Next,T);
        isKanan(Next,T);
        isKiri(Next,T);
        isTembok(Next,T,Next,T,Next,T,Next,T,Next,T,Next,T,Next,T,Next,T)
    ),
    write('Ada Tembok'),!.

d :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TX),
    positionY(T),
    Next is (TX+1),
    isQuest(Next,T),
    write('Silahkan claim bonus anda.'),
    retract(positionX(_)),
    asserta(positionX(Next)),!.

d :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TX),
    positionY(T),
    Next is (TX+1),
    isBoss1(Next,T),
    retract(positionX(_)),
    asserta(positionX(Next)),!.

d :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TX),
    positionY(T),
    Next is (TX+1),
    isBoss2(Next,T),
    retract(positionX(_)),
    asserta(positionX(Next)),!.

d :-
    \+init(_),
    write('Game belum dimulai').


claim :-
    init(_),
    positionX(X),
    positionY(Y),
    isQuest(X,Y),
    write('Anda mendapatkan Gold dan Exp'),
    retract(claim(_)),!.

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
    levelUpEnemy(ID),
    M is X-1,
    loop(M,ID).