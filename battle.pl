:- dynamic(enemy/8).
:- dynamic(isEnemyAlive/1).
:- dynamic(peluang/1).
:- dynamic(isEnemyAlive/1).
:- dynamic(isPick/1).
:- dynamic(isRun/1).
:- dynamic(isFight/1).
:- dynamic(myjob/9).
:- dynamic(nyawa/1).

enemyTriggered :-  
    random(4, 6, ID),
    job(ID, Name, Level, MaxHealth, Attack, Defense, Special, Exp),
    Health is MaxHealth,
    asserta(enemy(ID, Name, Level, MaxHealth, Health, Attack, Defense, Special, Exp)),
    karakter(A),
    B is A,
    job(B, Name2, Level2, MaxHealth2, Attack2, Defense2, Special2, Exp2),
    Health2 is MaxHealth2,
    asserta(myjob(B, Name2, Level2, MaxHealth2,Health2, Attack2, Defense2, Special2, Exp2)),
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
    \+ inventory(_,X,_,_),
    write('Kamu ga punya item itu. Perhatikan daftar item di inventori!'),
    fightChance, 
    !.

/*Pick Health Berhasil*/
pick(X) :-
    isEnemyAlive(_),
    isFight(_),
    \+ isPick(_),
    myjob(_, Nama, _, MaxHealth,_, Attack, Defense,_,_),
    inventory(_,X,_,Status),
    (
        /*Pick Health*/
        Status =:= 1 ->
        Health2 is MaxHealth,
        asserta(myjob(_,Nama,_,MaxHealth, Health2,_,_,_,_)),
        
        write('Kamu memilih '), write(X), write(' untuk menyembuhkan dirimu '), nl
        ;
        (
            /*Pick Armor*/
            Status =:= 2 ->
            Defense2 is Defense+10,
            asserta(myjob(_, Nama, _,_,_,_,Defense2,_,_)),
            write('Kamu memilih '), write(X), write(' untuk defense dirimu '), nl
            ;
            (
                /*Pick Weapon*/
                Status =:= 3 ->
                Attack2 is Attack+10,
                asserta(myjob(_, Nama,_,_,_,Attack2,_,_,_)),
                write('Kamu memilih '), write(X), write(' untuk attack musuh '), nl, nl
            )
        )
    ),
    asserta(isPick(1)),
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
    write('pilih armor untuk defend dan attack dengan tangan, pilih weapon untuk attack dengan senjata'),nl,
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

/*Attack normal*/
attackComment  :-
    enemy(_, EnemyName,_, _,EnemyHealth, _, _, _,_),
    EnemyHealth > 0,
    write('Health '), write(EnemyName), write(' tersisa '), write(EnemyHealth), nl,
    write('Sekarang giliran musuh!'), nl,
    write('...'), nl,
    sleep(1),
    enemyAttack.

/*Attack enemy mati*/
attackComment :-
    enemy(ID, EnemyName,_, _,EnemyHealth, _, _, _,_),
    write(EnemyName), write(' mati!'), nl,
    (
        ID =:= 4 ->
        claim(tambah,_,_),
        temptambah is tambah+1,
        retract(claim(tambah,_,_)),
        asserta(claim(temptambah,_,_)),
        retract(myjob(_,_,_,_,_,_,_,_,Exp)),
        TempExp is Exp+200,
        asserta(myjob(_, Nama,_,_,_,_,_,_,TempExp))
        ;
        (
            ID =:= 5 ->
            claim(_,tambah,_),
            temptambah is tambah+1,
            retract(claim(_,tambah,_)),
            asserta(claim(_,temptambah,_)),
            retract(myjob(_,_,_,_,_,_,_,Exp)),
            TempExp is Exp+200,
            asserta(myjob(_, Nama,_,_,_,_,_,_,TempExp))
            ;
            (
                ID =:= 6 ->
                claim(_,_,tambah),
                temptambah is tambah+1,
                asserta(claim(_,_,temptambah)),
                retract(claim(_,_,tambah)),
                retract(myjob(_,_,_,_,_,_,_,_,Exp)),
                TempExp is Exp+200,
                asserta(myjob(_, Nama,_,_,_,_,_,_,TempExp))
                ;
                (
                    ID =:= 100 ->
                    retract(myjob(_,_,_,_,_,_,_,_,Exp)),
                    TempExp is Exp+500,
                    asserta(myjob(_, Nama,_,_,_,_,_,_,TempExp)),
                    retract(stage(Temp)),
                    TempStage is Temp+1,
                    assert(stage(TempStage)),
                    write('Anda telah mengalahkan bos'),write(EnemyName),nl,nl
                    ;
                    (
                        ID =:= 101 ->
                        retract(myjob(_,_,_,_,_,_,_,_,Exp)),
                        TempExp is Exp+500,
                        asserta(myjob(_, Nama,_,_,_,_,_,_,TempExp)),
                        retract(stage(Temp)),
                        TempStage is Temp+1,
                        assert(stage(TempStage)),
                        write('Anda telah mengalahkan bos'), write(EnemyName),nl,nl
                        ;
                        (
                            ID =:= 102 ->
                            retract(myjob(_,_,_,_,_,_,_,_,Exp)),
                            TempExp is Exp+500,
                            asserta(myjob(_, Nama,_,_,_,_,_,_,TempExp)),
                            retract(stage(Temp)),
                            TempStage is Temp+1,
                            assert(stage(TempStage)),
                            write('Anda telah mengalahkan bos'),write(EnemyName),nl,nl,
                            win
                        )
                    )
                )
            )
        )
    ),
    markLevelUp(_,_,TempExp),
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
    myjob(_, Nama, _,_,Health2,MyAttack,_,_,_),
    write(Health2),nl,
    C is MyAttack,
    enemy(ID, NamaEnemy, _,_,EnemyHealth,_,_,_,_),
    D is EnemyHealth,
    NewEnemyHealth is (D-C),
    retract(enemy(ID, NamaEnemy, Level, MaxHealth,_, Attack, Defense, Special,Exp)),
    asserta(enemy(ID, NamaEnemy, Level, MaxHealth,NewEnemyHealth, Attack, Defense, Special,Exp)),
    write(Nama), write(' sudah attack!'), nl,
    asserta(nyawa(Health2)),
    attackComment,
    !.

/*Attack*/
enemyAttack :-
    /*myjob(ID, Name, Level, MaxHealth, Attack, Defense, Special, Exp)*/
    enemy(ID, NamaEnemy, _,_,_,EnemyAttack,_,_,_),
    C is EnemyAttack,
    write(C),nl,
    nyawa(Capek),
    Health1 is Capek,
    write(Capek),nl,
    write(Health1),nl,
    NewMyHealth is (Health1-C),
    write(NewMyHealth),nl,
    retract(myjob(ID, Nama, Level, MaxHealth,_, Attack, Defense, Special,Exp)),
    asserta(myjob(ID, Nama, Level, MaxHealth,NewMyHealth, Attack, Defense, Special,Exp)),
    write(NamaEnemy), write(' sudah attack!'), nl,
    enemyattackComment,
    !.

/*Enemy attack comment*/
enemyAttackComment :-
    retract(nyawa(_)),
    myjob(_, Nama, _, _, _, MyHealth, _, _, _, _),
    H is MyHealth,
    (
        H > 0 ->
        write('Health '), write(Nama), write(' Anda tersisa '), write(H)
        ;
        (
            H =< 0 ->
            retract(myjob(_,_,_,_,_,_,_,_,_)),
            retract(enemy(_,_,_,_,_,_,_,_,_)),
            write('Health '), write(Nama),('mu sudah habis!'),nl,
            lose
        ) 
    ),
    !.

/*enemyAttackComment :-
    myjob(_, Nama, _, _, _, MyHealth, _, _, _, _),
    H is MyHealth,
    (
        H =< 0 ->
        retract(myjob(_,_,_,_,_,_,_,_,_)),
        retract(enemy(_,_,_,_,_,_,_,_,_)),
        write('Health '), write(Nama),('mu sudah habis!'),nl
    ),
    lose.*/

win :-
    write('You Win'),
    retract(isEnemyAlive(_)),
    retract(isRun(_)),
    retract(isFight(_)),
    retract(isPick(_)),
    quit.

lose :-
    write('You Lose'),
    retract(isEnemyAlive(_)),
    retract(isRun(_)),
    retract(isFight(_)),
    retract(isPick(_)),
    quit.

