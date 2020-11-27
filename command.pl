:- dynamic(claim/3).
:- dynamic(gold/1).
:- dynamic(isclaim/1).

help :-
    init(_),
    write('=================================================================='),nl,
    write('||                                                              ||'),nl,
    write('||                     8   8       8                            ||'),nl,
    write('||                     8www8 .d88b 8 88b.                       ||'),nl,
    write('||                     8   8 8.dP` 8 8  8                       ||'),nl,
    write('||                     8   8 `Y88P 8 88P`                       ||'),nl,
    write('||                                   8                          ||'),nl,
    write('||                                                              ||'),nl,
    write('||          1. start     : untuk memulai petualanganmu          ||'),nl,
    write('||          2. map       : menampilkan peta                     ||'),nl,
    write('||          3. status    : menampilkan inventory                ||'),nl,
    write('||          4. w         : gerak ke utara 1 langkah             ||'),nl,
    write('||          5. s         : gerak ke selatan 1 langkah           ||'),nl,
    write('||          6. d         : gerak ke ke timur 1 langkah          ||'),nl,
    write('||          7. a         : gerak ke barat 1 langkah             ||'),nl,
    write('||          8. mystatus  : menampilkan status pemain            ||'),nl,
    write('||                                                              ||'),nl,
    write('=================================================================='),nl.
            
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
    write(' ====================================='),nl,
    write(' ||                                 ||'),nl,
    write(' ||   .d88b.                   w    ||'),nl,
    write(' ||   8P  Y8 8   8 .d88b d88b w8ww  ||'),nl,
    write(' ||   8b wd8 8b d8 8.dP` `Yb.  8    ||'),nl,
    write(' ||   `Y88Pw `Y8P8 `Y88P Y88P  Y8P  ||'),nl,
    write(' ||                                 ||'),nl,
    write(' ||   Ketik <tukar.> untuk reward.  ||'),nl,
    write(' ||                                 ||'),nl,
    write(' ====================================='),nl,nl,
    retract(positionY(_)),
    asserta(positionY(Next)),!.

w :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TX),
    positionY(T),
    Next is (T-1),
    isShop(TX,Next),
    write(' =========================================================================='),nl,
    write(' ||                                                                      ||'),nl,
    write(' ||    8               8                       8b   d8            w      ||'),nl,
    write(' ||    8    .d8b. .d88 8.dP .d8b. 8d8b.d8b.    8YbmdP8 .d88 8d8b w8ww    ||'),nl,
    write(' ||    8    8` .8 8  8 88b  8` .8 8P Y8P Y8    8  "  8 8  8 8P    8      ||'),nl,
    write(' ||    8888 `Y8P` `Y88 8 Yb `Y8P` 8   8   8    8     8 `Y88 8     Y8P    ||'),nl,
    write(' ||               wwdP                                                   ||'),nl,
    write(' ||                                                                      ||'),nl,
    write(' ||     Welcome to Logkom Mart! Selamat berbelanja!                      ||'),nl,
    write(' ||        ketik <gacha.> untuk membeli gacha.   100G                    ||'),nl,
    write(' ||        ketik <shop.>  untuk membeli potion.  100G                    ||'),nl,
    write(' ||                                                                      ||'),nl,
    write(' =========================================================================='),nl,
    retract(positionY(_)),
    asserta(positionY(Next)),!.

w :-
    init(_),
    stage(1),
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
    stage(2),
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
    stage(3),
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
    write(' ====================================='),nl,
    write(' ||                                 ||'),nl,
    write(' ||   .d88b.                   w    ||'),nl,
    write(' ||   8P  Y8 8   8 .d88b d88b w8ww  ||'),nl,
    write(' ||   8b wd8 8b d8 8.dP` `Yb.  8    ||'),nl,
    write(' ||   `Y88Pw `Y8P8 `Y88P Y88P  Y8P  ||'),nl,
    write(' ||                                 ||'),nl,
    write(' ||   Ketik <tukar.> untuk reward.  ||'),nl,
    write(' ||                                 ||'),nl,
    write(' ====================================='),nl,nl,
    retract(positionX(_)),
    asserta(positionX(Next)),!.

a :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TX),
    positionY(T),
    Next is (TX-1),
    isShop(Next,T),
    write(' =========================================================================='),nl,
    write(' ||                                                                      ||'),nl,
    write(' ||    8               8                       8b   d8            w      ||'),nl,
    write(' ||    8    .d8b. .d88 8.dP .d8b. 8d8b.d8b.    8YbmdP8 .d88 8d8b w8ww    ||'),nl,
    write(' ||    8    8` .8 8  8 88b  8` .8 8P Y8P Y8    8  "  8 8  8 8P    8      ||'),nl,
    write(' ||    8888 `Y8P` `Y88 8 Yb `Y8P` 8   8   8    8     8 `Y88 8     Y8P    ||'),nl,
    write(' ||               wwdP                                                   ||'),nl,
    write(' ||                                                                      ||'),nl,
    write(' ||     Welcome to Logkom Mart! Selamat berbelanja!                      ||'),nl,
    write(' ||        ketik <gacha.> untuk membeli gacha.   100G                    ||'),nl,
    write(' ||        ketik <shop.>  untuk membeli potion.  100G                    ||'),nl,
    write(' ||                                                                      ||'),nl,
    write(' =========================================================================='),nl,
    retract(positionX(_)),
    asserta(positionX(Next)),!.

a :-
    init(_),
    stage(1),
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
    stage(2),
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
    stage(3),
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
    write(' ====================================='),nl,
    write(' ||                                 ||'),nl,
    write(' ||   .d88b.                   w    ||'),nl,
    write(' ||   8P  Y8 8   8 .d88b d88b w8ww  ||'),nl,
    write(' ||   8b wd8 8b d8 8.dP` `Yb.  8    ||'),nl,
    write(' ||   `Y88Pw `Y8P8 `Y88P Y88P  Y8P  ||'),nl,
    write(' ||                                 ||'),nl,
    write(' ||   Ketik <tukar.> untuk reward.  ||'),nl,
    write(' ||                                 ||'),nl,
    write(' ====================================='),nl,nl,
    retract(positionY(_)),
    asserta(positionY(Next)),!.

s :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TX),
    positionY(T),
    Next is (T+1),
    isShop(TX,Next),
    write(' =========================================================================='),nl,
    write(' ||                                                                      ||'),nl,
    write(' ||    8               8                       8b   d8            w      ||'),nl,
    write(' ||    8    .d8b. .d88 8.dP .d8b. 8d8b.d8b.    8YbmdP8 .d88 8d8b w8ww    ||'),nl,
    write(' ||    8    8` .8 8  8 88b  8` .8 8P Y8P Y8    8  "  8 8  8 8P    8      ||'),nl,
    write(' ||    8888 `Y8P` `Y88 8 Yb `Y8P` 8   8   8    8     8 `Y88 8     Y8P    ||'),nl,
    write(' ||               wwdP                                                   ||'),nl,
    write(' ||                                                                      ||'),nl,
    write(' ||     Welcome to Logkom Mart! Selamat berbelanja!                      ||'),nl,
    write(' ||        ketik <gacha.> untuk membeli gacha.   100G                    ||'),nl,
    write(' ||        ketik <shop.>  untuk membeli potion.  100G                    ||'),nl,
    write(' ||                                                                      ||'),nl,
    write(' =========================================================================='),nl,
    retract(positionY(_)),
    asserta(positionY(Next)),!.

s :-
    init(_),
    stage(1),
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
    stage(2),
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
    stage(3),
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
    write(' ====================================='),nl,
    write(' ||                                 ||'),nl,
    write(' ||   .d88b.                   w    ||'),nl,
    write(' ||   8P  Y8 8   8 .d88b d88b w8ww  ||'),nl,
    write(' ||   8b wd8 8b d8 8.dP` `Yb.  8    ||'),nl,
    write(' ||   `Y88Pw `Y8P8 `Y88P Y88P  Y8P  ||'),nl,
    write(' ||                                 ||'),nl,
    write(' ||   Ketik <tukar.> untuk reward.  ||'),nl,
    write(' ||                                 ||'),nl,
    write(' ====================================='),nl,nl,
    retract(positionX(_)),
    asserta(positionX(Next)),!.

d :-
    init(_),
    \+ isEnemyAlive(_),
    positionX(TX),
    positionY(T),
    Next is (TX+1),
    isShop(Next,T),
    write(' =========================================================================='),nl,
    write(' ||                                                                      ||'),nl,
    write(' ||    8               8                       8b   d8            w      ||'),nl,
    write(' ||    8    .d8b. .d88 8.dP .d8b. 8d8b.d8b.    8YbmdP8 .d88 8d8b w8ww    ||'),nl,
    write(' ||    8    8` .8 8  8 88b  8` .8 8P Y8P Y8    8  "  8 8  8 8P    8      ||'),nl,
    write(' ||    8888 `Y8P` `Y88 8 Yb `Y8P` 8   8   8    8     8 `Y88 8     Y8P    ||'),nl,
    write(' ||               wwdP                                                   ||'),nl,
    write(' ||                                                                      ||'),nl,
    write(' ||     Welcome to Logkom Mart! Selamat berbelanja!                      ||'),nl,
    write(' ||        ketik <gacha.> untuk membeli gacha.   100G                    ||'),nl,
    write(' ||        ketik <shop.>  untuk membeli potion.  100G                    ||'),nl,
    write(' ||                                                                      ||'),nl,
    write(' =========================================================================='),nl,
    retract(positionX(_)),
    asserta(positionX(Next)),!.

d :-
    init(_),
    stage(1),
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
    stage(2),
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
    stage(3),
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
    claim(A,B,C),
    (
        A \== 0, B \== 0, C \== 0 ->
        asserta(isclaim(1))
    ),
    tukar2.

tukar2 :-
    init(_),
    isclaim(_),
    positionX(X),
    positionY(Y),
    isQuest(X,Y),
    gold(Uang),
    TempUang is Uang+500,
    retract(gold(Uang)),
    asserta(gold(TempUang)),
    myjob(ID, Name, Level, MaxHealth, Health, Attack, Defense, Special, Exp),
    TempExp is Exp+50,
    retract(myjob(ID, Name, Level, MaxHealth, Health, Attack, Defense, Special, Exp)),
    asserta(myjob(ID, Name, Level, MaxHealth, Health, Attack, Defense, Special, TempExp)),
    write('Anda mendapatkan Gold dan Exp'),
    claim(A,B,C),
    D is A-1,
    E is B-1,
    F is C-1,
    retract(claim(A,B,C)),
    asserta(claim(D,E,F)),
    retract(isclaim(_)),
    !.

tukar2 :-
    init(_),
    \+isclaim(_),
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