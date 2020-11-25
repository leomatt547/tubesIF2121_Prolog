:- dynamic(claim/3).
:- dynamic(gold/1).

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
    \+isShop(TX,Next),
    \+isTembok(TX,Next,TX,Next,TX,Next,TX,Next,TX,Next,TX,Next,TX,Next,TX,Next),
    \+isBoss1(TX,Next),
    \+isBoss2(TX,Next),
    \+isBoss3(TX,Next),
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
    write('Ketik <tukar.> untuk mendapatkan quest Anda!'),nl,
    retract(positionY(_)),
    asserta(positionY(Next)),!.

w :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TX),
    positionY(T),
    Next is (T-1),
    isShop(TX,Next),
    write('Selamat Datang di Logkom Mart! Selamat Berbelanja'),nl,
    write('Ketik <gacha.> untuk berbelanja secara gacha.'),nl,
    write('Ketik <shop.> untuk beli potion'),nl,
    retract(positionY(_)),
    asserta(positionY(Next)),!.

w :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TX),
    positionY(T),
    Next is (T-1),
    isBoss1(TX,Next),
    bossTriggered1,
    retract(positionY(_)),
    asserta(positionY(Next)),!.

w :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TX),
    positionY(T),
    Next is (T-1),
    isBoss2(TX,Next),
    bossTriggered2,
    retract(positionY(_)),
    asserta(positionY(Next)),!.

w :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TX),
    positionY(T),
    Next is (T-1),
    isBoss3(TX,Next),
    bossTriggered3,
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
    \+isShop(Next,T),
    \+isBoss1(Next,T),
    \+isBoss2(Next,T),
    \+isBoss3(Next,T),
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
    write('Ketik <tukar.> untuk mendapatkan quest Anda!'),
    retract(positionX(_)),
    asserta(positionX(Next)),!.

a :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TX),
    positionY(T),
    Next is (TX-1),
    isShop(Next,T),
    write('Selamat Datang di Logkom Mart! Selamat Berbelanja'),nl,
    write('Ketik <gacha.> untuk berbelanja secara gacha.'),nl,
    write('Ketik <shop.> untuk beli potion'),nl,
    retract(positionX(_)),
    asserta(positionX(Next)),!.

a :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TX),
    positionY(T),
    Next is (TX-1),
    isBoss1(Next,T),
    bossTriggered1,
    retract(positionX(_)),
    asserta(positionX(Next)),!.

a :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TX),
    positionY(T),
    Next is (TX-1),
    isBoss2(Next,T),
    bossTriggered2,
    retract(positionX(_)),
    asserta(positionX(Next)),!.

a :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TX),
    positionY(T),
    Next is (TX-1),
    isBoss3(Next,T),
    bossTriggered3,
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
    \+isShop(TX,Next),
    \+isBoss1(TX,Next),
    \+isBoss2(TX,Next),
    \+isBoss3(TX,Next),
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
    write('Ketik <tukar.> untuk mendapatkan quest Anda!'),
    retract(positionY(_)),
    asserta(positionY(Next)),!.

s :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TX),
    positionY(T),
    Next is (T+1),
    isShop(TX,Next),
    write('Selamat Datang di Logkom Mart! Selamat Berbelanja'),nl,
    write('Ketik <gacha.> untuk berbelanja secara gacha.'),nl,
    write('Ketik <shop.> untuk beli potion'),nl,
    retract(positionY(_)),
    asserta(positionY(Next)),!.

s :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TX),
    positionY(T),
    Next is (T+1),
    isBoss1(TX,Next),
    bossTriggered1,
    retract(positionY(_)),
    asserta(positionY(Next)),!.

s :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TX),
    positionY(T),
    Next is (T+1),
    isBoss2(TX,Next),
    bossTriggered2,
    retract(positionY(_)),
    asserta(positionY(Next)),!.

s :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TX),
    positionY(T),
    Next is (T+1),
    isBoss3(TX,Next),
    bossTriggered3,
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
    \+isShop(Next,T),
    \+isBoss1(Next,T),
    \+isBoss2(Next,T),
    \+isBoss3(Next,T),
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
    write('Ketik <tukar.> untuk mendapatkan quest Anda!'),nl,
    retract(positionX(_)),
    asserta(positionX(Next)),!.

d :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TX),
    positionY(T),
    Next is (TX+1),
    isShop(Next,T),
    write('Selamat Datang di Logkom Mart! Selamat Berbelanja'),nl,
    write('Ketik <gacha.> untuk berbelanja secara gacha.'),nl,
    write('Ketik <shop.> untuk beli potion'),nl,
    retract(positionX(_)),
    asserta(positionX(Next)),!.

d :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TX),
    positionY(T),
    Next is (TX+1),
    isBoss1(Next,T),
    bossTriggered1,
    retract(positionX(_)),
    asserta(positionX(Next)),!.

d :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TX),
    positionY(T),
    Next is (TX+1),
    isBoss2(Next,T),
    bossTriggered2,
    retract(positionX(_)),
    asserta(positionX(Next)),!.

d :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TX),
    positionY(T),
    Next is (TX+1),
    isBoss3(Next,T),
    bossTriggered3,
    retract(positionX(_)),
    asserta(positionX(Next)),!.

d :-
    \+init(_),
    write('Game belum dimulai').


tukar :-
    claim(satu,dua,tiga),
    satu >= 1, dua >= 1, tiga >= 1,
    init(_),
    positionX(X),
    positionY(Y),
    isQuest(X,Y),
    gold(Uang),
    TempUang is Uang+100,
    retract(gold(Uang)),
    asserta(gold(TempUang)),
    myjob(_,_,_,_,_,_,_,_,Exp),
    TempExp is TempExp+50,
    retract(myjob(_,_,_,_,_,_,_,_,Exp)),
    asserta(myjob(_,_,_,_,_,_,_,_,TempExp)),
    write('Anda mendapatkan Gold dan Exp'),
    retract(claim(_,_,_)),!.

tukar :-
    init(_),
    \+claim(_,_,_),
    positionX(X),
    positionY(Y),
    isQuest(X,Y),
    write('Anda Belum mendapat Quest! Segera kumpulkan koleksi musuh!'),
    !.

gacha :-
    init(_),
    positionX(X),
    positionY(Y),
    isShop(X,Y),
    gold(Uang),
    Uang >= 100,
    write('Uang Anda berjumlah '), write(Uang),nl,
    write('Apakah Anda Yakin? Masukkan Angka (0/1)'),nl,
    read(Pilihan),
        (
            Pilihan =:= 1 ->
            random(4,8,ID),
            addItem(ID),
            inventory(ID,Nama,_,_),
            retract(gold(Uang)),
            TempUang is (Uang-100), 
            asserta(gold(TempUang)),
            write('Selamat! Anda Mendapatkan Items: '), write(Nama), nl
            ;
            (
                Pilihan =:= 0 ->
                write('Transaksi Anda dibatalkan'),nl
            )
        ),
    !.

gacha :-
    init(_),
    positionX(X),
    positionY(Y),
    isShop(X,Y),
    gold(Uang),
    Uang < 100,
    write('Maaf! Uang Anda kurang dari 100!'),nl,
    !.

shop :-
    init(_),
    positionX(X),
    positionY(Y),
    isShop(X,Y),
    gold(Uang),
    Uang < 100,
    write('Maaf! Uang Anda kurang dari 100!'),nl,
    !.

shop :-
    init(_),
    positionX(X),
    positionY(Y),
    isShop(X,Y),
    gold(Uang),
    Uang >= 100,
    write('Uang Anda berjumlah '), write(Uang),nl,
    write('1. red potion - 100 Gold'),nl,
    write('2. blue potion - 100 Gold'),nl,
    write('3. pink potion - 100 Gold'),nl,
    write('Masukkan angka'),nl,
    read(ID),
    (
        ID =:= 1 ->
        addItem(ID),
        inventory(ID,Nama,_,_),
        retract(gold(Uang)),
        TempUang is (Uang-100), 
        asserta(gold(TempUang)),
        write('Selamat, Anda mendapatkan '),write(Nama),nl
        ;
        (
            ID =:= 2 ->
            addItem(ID),
            inventory(ID,Nama,_,_),
            retract(gold(Uang)),
            TempUang is (Uang-100), 
            asserta(gold(TempUang)),
            write('Selamat, Anda mendapatkan '),write(Nama),nl   
            ;
            (
                ID =:= 3 ->
                addItem(ID),
                inventory(ID,Nama,_,_),
                retract(gold(Uang)),
                TempUang is (Uang-100), 
                asserta(gold(TempUang)),
                write('Selamat, Anda mendapatkan '),write(Nama),nl
            )
        )
    ),!.

triggered :-
    random(81,100,L),
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