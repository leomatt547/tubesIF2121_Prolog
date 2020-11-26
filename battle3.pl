:- dynamic(enemy/8).
:- dynamic(isEnemyAlive/1).
:- dynamic(peluang/1).
:- dynamic(isPick/1).
:- dynamic(isRun/1).
:- dynamic(isFight/1).
/* Ignore Singleton */
:-style_check(-singleton).

enemyTriggered :-  
    random(4, 7, ID),
    job(ID, Name, Level, MaxHealth, Attack, Defense, Special, Exp),
    Health is MaxHealth,
    asserta(enemy(ID, Name, Level, MaxHealth, Health, Attack, Defense, Special, Exp)),
    write('Nah! Musuh '), write(Name), write(' random dengan level '), write(Level), write(' akan menyerang kamu!'), nl,
    write('Buatlah keputusan!'), nl,
    write('- fight.'), nl,
    write('- run.'), nl,
    write('Ketik pilihan diakhiri titik, contoh: fight.'), nl,
    random(1, 10, P),
    asserta(peluang(P)),
    asserta(isEnemyAlive(1)).

bossTriggered1 :-
    ID is 100,
    job(ID, Name, Level, MaxHealth, Attack, Defense, Special, Exp),
    Health is MaxHealth,
    asserta(enemy(ID, Name, Level, MaxHealth, Health, Attack, Defense, Special, Exp)),nl,
    write('Kamu bertemu Boss 1 :'), write(Name), write('!!!'), nl,nl,
    asserta(isEnemyAlive(1)),
    fight, !.

bossTriggered1 :-
    \+claim(_,_,_),
    write('Sok jagoan lawan boss langsung?'),nl,
    !.

bossTriggered2 :-
    ID is 101,
    job(ID, Name, Level, MaxHealth, Attack, Defense, Special, Exp),
    Health is MaxHealth,
    asserta(enemy(ID, Name, Level, MaxHealth, Health, Attack, Defense, Special, Exp)),nl,
    write('Kamu bertemu Boss 2 :'), write(Name), write('!!!'), nl,nl,
    asserta(isEnemyAlive(1)),
    fight, !.

bossTriggered3 :-
    ID is 102,
    job(ID, Name, Level, MaxHealth, Attack, Defense, Special, Exp),
    Health is MaxHealth,
    asserta(enemy(ID, Name, Level, MaxHealth, Health, Attack, Defense, Special, Exp)),nl,
    write('Kamu bertemu Boss 3 :'), write(Name), write('!!!'), nl,nl,
    asserta(isEnemyAlive(1)),
    fight, !.


/*Kasus Lari doang tanpa ketemu musuh */
run :-
    \+ isEnemyAlive(_),
    write('Mau Latman?'),
    !.

/* Lari gagal */
run :-
    \+ isRun(_),
    isEnemyAlive(_),
    peluang(P), 
    P < 5,
    write('Kesialan datang kepadamu! Kamu harus kalahkan Monster itu'), nl,
    retract(peluang(P)),
    fight,
    !.

/* Lari Berhasil*/
run :-
    \+ isRun(_),
    isEnemyAlive(_),
    peluang(P),
    P >= 5,
    write('Beruntung Sekali!'),
    retract(peluang(P)),
    retract(isEnemyAlive(_)),
    retract(enemy(_, _, _, _, _, _, _, _,_)),
    !.

/* Lari Gagal belum pilih Item */ 
run :-
    isRun(_),
    \+ isPick(_),
    write('Jangan lupa pilih item!'), nl,
    fightChance.

/*Lari gagal tapi sudah pilih item*/
run :-
    isRun(_),
    isPick(_),
    write('Ayo hadapi lawanmu!'), nl,
    !.

/*Pick item tapi belum ketemu musuh*/
pick(_) :-
    \+ isEnemyAlive(_),
    write('Kamu belum fight, Nanti saja pakai itemnya ya.'), nl,
    !.

/*Pilih item tapi blom pilih attack*/
pick(_) :-
    \+isFight(_),
    \+isPick(_),
    write('Yakin pakai tangan kosong?'),nl,
    !.

/*Ambil item double*/
pick(_) :-
    isPick(_),
    isFight(_),
    write('Jangan sia-siakan item mu!'),
    !.

/*Asal pick items padahal gaada di daftar*/
pick(X) :-
    isEnemyAlive(_),
    isFight(_),
    \+ isPick(_),
    \+ inventory(ID,X,Quantity,Status),
    write('Kamu ga punya item itu. Perhatikan daftar item di inventori!'),
    fightChance, 
    !.

/*Pick Health Berhasil*/
pick(X) :-
    isEnemyAlive(_),
    isFight(_),
    \+ isPick(_),
    myjob(ID, Nama,Level, MyMaxHealth, MyHealth, MyAttack, MyDefense,Spesial,Exp),
    inventory(ID,X,Quantity,Status),
    (
        /*Pick Health*/
        Status =:= 1 ->
        Health2 is MyMaxHealth,
        Attack2 is MyAttack,
        Defense2 is MyDefense,
        retract(myjob(ID, Nama,Level, MyMaxHealth, MyHealth, MyAttack, MyDefense,Spesial,Exp)),
        asserta(myjob(ID,Nama,Level,MyMaxHealth, Health2,Attack2,Defense2,Spesial,Exp)),
        write('Kamu memilih '), write(X), write(' untuk menyembuhkan dirimu '), nl,
        asserta(isPick(1))
        ;
        (
            /*Pick Armor*/
            Status =:= 2 ->
            Defense2 is MyDefense+10,
            Attack2 is MyAttack,
            Health2 is MyHealth,
            retract(myjob(ID, Nama,Level, MyMaxHealth, MyHealth, MyAttack, MyDefense,Spesial,Exp)),
            asserta(myjob(ID, Nama,Level, MyMaxHealth, Health2, Attack2, Defense2,Spesial,Exp)),
            write('Kamu memilih '), write(X), write(' untuk defense dirimu '), nl,
            asserta(isPick(2))
            ;
            (
                /*Pick Weapon*/
                Status =:= 3 ->
                Attack2 is (MyAttack+10),
                Health2 is MyHealth,
                Defense2 is MyDefense,
                retract(myjob(ID, Nama,Level, MyMaxHealth, MyHealth, MyAttack, MyDefense,Spesial,Exp)),
                asserta(myjob(ID, Nama,Level, MyMaxHealth, Health2, Attack2, Defense2,Spesial,Exp)),
                write('Kamu memilih '), write(X), write(' untuk attack musuh '), nl,
                asserta(isPick(3))
            )
        )
    ),
    delItems(X),
    cont, !.

/*Fight tapi blom ketemu enemy*/
fight :-
    \+ isEnemyAlive(_),
    write('Serang kemana!! Belum ketemu musuh??'),
    !.

/* Musuh masih hidup */
fight :-
    isFight(_),
    isEnemyAlive(_),
    write('Musuhnya masih hidup! Serang terus!!'), nl,
    !.

/*Pilihan Fight Berhasil*/
fight :-
    asserta(isRun(1)),
    asserta(isFight(1)),
    isEnemyAlive(_),
    statusInventory,
    write('kamu hanya bisa attack atau defense saja'),nl,
    write('pilih armor untuk defend dan attack dengan tangan,'),nl,
    write('pilih weapon untuk attack dengan senjata'),nl,
    write('Ketik pick(barangnya). --> Contoh: pick(pedang).'),nl,nl,
    !.

/*Ambil armor lagi*/
fightChance :-
    write('Items:'), nl,
    statusInventory,
    !.

cont :-
    write('Lanjutkan??'), nl,
    write('- attack.'), nl,
    !.

/*Attack padahal gaada musuh*/
attack :-
    \+ isEnemyAlive(_),
    write('Attack kemana wkwk'), nl,
    !.

/*Attack padahal gaada musuh*/
attack :-
    isEnemyAlive(_),
    \+ isPick(_),
    write('Pilih items dulu, jangan pakai tangan kosong!'), nl,
    !.

/*Attack*/
attack :-
    isEnemyAlive(_),
    isFight(_),
    isPick(_),
    myjob(ID, Nama,Level, MyMaxHealth, MyHealth, MyAttack, MyDefense,Spesial,Exp),
    enemy(ID, NamaEnemy, Level, MaxHealth,EnemyHealth, Attack, Defense, Special,Exp),
    NewEnemyHealth is (EnemyHealth-MyAttack),
    retract(enemy(ID, NamaEnemy, Level, MaxHealth,EnemyHealth, Attack, Defense, Special,Exp)),
    asserta(enemy(ID, NamaEnemy, Level, MaxHealth,NewEnemyHealth, Attack, Defense, Special,Exp)),
    write(Nama), write(' sudah attack!'), nl,
    attackComment,
    !.

attackComment :-
    enemy(ID, NamaEnemy, Level, MaxHealth,EnemyHealth, Attack, Defense, Special,Exp),
    myjob(ID, Nama,Level, MyMaxHealth, MyHealth, MyAttack, MyDefense,Spesial,Exp),
    (
        EnemyHealth > 0 ->
        write('Health '), write(EnemyName), write(' tersisa '), write(EnemyHealth), nl,
        write('Sekarang giliran musuh!'), nl,
        write('...'), nl,
        sleep(1),
        enemyAttack
        ;
        (
            EnemyHealth =< 0 ->
            write(EnemyName), write(' mati!'), nl,
            (
                ID =:= 4 ->
                claim(Tambah,_,_),
                Temptambah is Tambah+1,
                retract(claim(Tambah,_,_)),
                asserta(claim(Temptambah,_,_)),
                write('Slime berhasil dimasukkan dalam Quest'),nl
                ;
                (
                    ID =:= 5 ->
                    claim(_,Tambah,_),
                    Temptambah is Tambah+1,
                    retract(claim(_,Tambah,_)),
                    asserta(claim(_,Temptambah,_)),
                    write('Wolf berhasil dimasukkan dalam Quest'),nl
                    ;
                    (
                        ID =:= 6 ->
                        claim(_,_,Tambah),
                        Temptambah is Tambah+1,
                        retract(claim(_,_,Tambah)),
                        asserta(claim(_,_,Temptambah)),
                        write('Goblin berhasil dimasukkan dalam Quest'),nl
                    )
                )
            ),
            retract(enemy(ID, NamaEnemy, Level, MaxHealth,EnemyHealth, Attack, Defense, Special,Exp)),
            retract(isFight(_)),
            (
                A =:= 2 ->
                TAttack is (MyAttack-10),
                retract(myjob(ID, Nama,Level, MyMaxHealth, MyHealth, MyAttack, MyDefense,Spesial,Exp)),
                asserta(myjob(ID, Nama,Level, MyMaxHealth, MyHealth, TAttack, MyDefense,Spesial,Exp))
                ;
                (
                    A =:= 3 ->
                    TDefense is (MyDefense-10),
                    retract(myjob(ID, Nama,Level, MyMaxHealth, MyHealth, MyAttack, MyDefense,Spesial,Exp)),
                    asserta(myjob(ID, Nama,Level, MyMaxHealth, MyHealth, MyAttack, TDefense,Spesial,Exp))
                )
            ),
            retract(isPick(_)),
            retract(isRun(_)),
            retract(isEnemyAlive(_)),
            bisaclaim
            /*TempExp is (Exp+50),
            retract(myjob(_,Nama,Level,_,_,_,_,_,Exp)),
            asserta(myjob(_,Nama,Level,_,_,_,_,_,TempExp)),
            markLevelUp(_,Level,TempExp)*/
        )
    ),
    !.

/*Attack*/
enemyAttack :-
    /*myjob(ID, Name, Level, MaxHealth, Health, Attack, Defense, Special, Exp)*/
    enemy(ID, NamaEnemy,Level,MaxHealth,Health,EnemyAttack,EnemyDefense,Special,Exp),
    myjob(ID, Nama,Level, MyMaxHealth, MyHealth, MyAttack, MyDefense,Spesial,Exp),
    isFight(_),
    isPick(_),
    NewMyHealth is (MyHealth-EnemyAttack),
    retract(myjob(ID, Nama, Level, MaxHealth,_, Attack, Defense, Special,Exp)),
    asserta(myjob(ID, Nama, Level, MaxHealth,NewMyHealth, Attack, Defense, Special,Exp)),
    write(NamaEnemy), write(' sudah attack!'), nl,
    enemyAttackComment,
    !.

/*Enemy attack comment*/
enemyAttackComment :-
    isFight(_),
    isPick(_),
    myjob(ID, Nama, _, _, MyHealth, _, _, _, _),
    (
        MyHealth > 0 ->
        write('Health '), write(Nama), write(' Anda tersisa '), write(MyHealth)
        ;
        (
            MyHealth =< 0 ->
            retract(myjob(_,_,_,_,_,_,_,_,_)),
            retract(enemy(_,_,_,_,_,_,_,_,_)),
            write('Health '), write(Nama),('mu sudah habis!'),nl,
            lose
        ) 
    ),
    !.