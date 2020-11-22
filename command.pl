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
    positionX(TempX),
    positionY(Temp),
    Next is (Temp-1),
    \+isAtas(TempX,Next),
    \+isBawah(TempX,Next),
    \+isKanan(TempX,Next),
    \+isKiri(TempX,Next),
    \+isQuest(TempX,Next),
    \+isTembok(TempX,Next,TempX,Next,TempX,Next,TempX,Next,TempX,Next,TempX,Next,TempX,Next,TempX,Next),
    \+isBoss1(TempX,Next),
    \+isBoss2(TempX,Next),
    triggered,
    retract(positionY(_)),
    asserta(positionY(Next)),!.

w :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TempX),
    positionY(Temp),
    Next is (Temp-1),
    (
        isAtas(TempX,Next);
        isBawah(TempX,Next);
        isKanan(TempX,Next);
        isKiri(TempX,Next);
        isTembok(TempX,Next,TempX,Next,TempX,Next,TempX,Next,TempX,Next,TempX,Next,TempX,Next,TempX,Next)
    ),
    write('Ada Tembok'),!.

w :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TempX),
    positionY(Temp),
    Next is (Temp-1),
    isQuest(TempX,Next),
    write('Anda sekarang berada di gym'),
    retract(positionY(_)),
    asserta(positionY(Next)),!.

w :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TempX),
    positionY(Temp),
    Next is (Temp-1),
    isBoss1(TempX,Next),
    legendaryTriggered1,
    retract(positionY(_)),
    asserta(positionY(Next)),!.

w :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TempX),
    positionY(Temp),
    Next is (Temp-1),
    isBoss2(TempX,Next),
    legendaryTriggered2,
    retract(positionY(_)),
    asserta(positionY(Next)),!.

w :-
    \+init(_),
    write('Game belum dimulai').

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
    \+isBoss1(Next,Temp),
    \+isBoss2(Next,Temp),
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
    write('Anda sekarang berada di gym'),
    retract(positionX(_)),
    asserta(positionX(Next)),!.

a :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TempX),
    positionY(Temp),
    Next is (TempX-1),
    isBoss1(Next,Temp),
    legendaryTriggered1,
    retract(positionX(_)),
    asserta(positionX(Next)),!.

a :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TempX),
    positionY(Temp),
    Next is (TempX-1),
    isBoss2(Next,Temp),
    legendaryTriggered2,
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
    \+isBoss1(TempX,Next),
    \+isBoss2(TempX,Next),
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
    write('Anda sekarang berada di gym'),
    retract(positionY(_)),
    asserta(positionY(Next)),!.

s :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TempX),
    positionY(Temp),
    Next is (Temp+1),
    isBoss1(TempX,Next),
    legendaryTriggered1,
    retract(positionY(_)),
    asserta(positionY(Next)),!.

s :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TempX),
    positionY(Temp),
    Next is (Temp+1),
    isBoss2(TempX,Next),
    legendaryTriggered2,
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
    \+isBoss1(Next,Temp),
    \+isBoss2(Next,Temp),
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
    write('Anda sekarang berada di gym'),
    retract(positionX(_)),
    asserta(positionX(Next)),!.

d :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TempX),
    positionY(Temp),
    Next is (TempX+1),
    isBoss1(Next,Temp),
    legendaryTriggered1,
    retract(positionX(_)),
    asserta(positionX(Next)),!.

d :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TempX),
    positionY(Temp),
    Next is (TempX+1),
    isBoss2(Next,Temp),
    legendaryTriggered2,
    retract(positionX(_)),
    asserta(positionX(Next)),!.

d :-
    \+init(_),
    write('Game belum dimulai').

listHealAll(ListNama) :-
    findall(Name, inventory(_,Name,_,_,_,_,_,_), ListNama).

healAll([]).
healAll([B|Y]) :-
    retract(inventory(ID, B, MaxHealth, Level,_, Element, Attack, Special)),
    NewHealth is MaxHealth,
    asserta(inventory(ID, B, MaxHealth, Level, NewHealth, Element, Attack, Special)),
    healAll(Y).

heal :-
    init(_),
    positionX(X),
    positionY(Y),
    isQuest(X,Y),
    listHealAll(ListNama),
    healAll(ListNama),
    write('Semua tokemon anda telah sembuh'),
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