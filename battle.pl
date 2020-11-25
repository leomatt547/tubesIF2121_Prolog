:- dynamic(enemy/8).
:- dynamic(isEnemyAlive/1).
:- dynamic(peluang/1).
:- dynamic(isEnemyAlive/1).
:- dynamic(isPick/1).
:- dynamic(isRun/1).
:- dynamic(isFight/1).
:- dynamic(isSkill/1).
:- dynamic(myjob/9).

enemyTriggered :-  
    random(4, 6, ID),
    job(ID, Name, Level, MaxHealth, Attack, Defense, Special, _),
    /*cekPanjang(Level),
    asserta(enemy(ID, Name, Level, MaxHealth,_, Attack, Defense, Special)),
    loop(Level,ID),
    retract(enemy(ID, Name2, Level2, MaxHealth2,_, Attack2, Defense2, Special2)),
    Health is MaxHealth2,
    asserta(enemy(ID, Name2, Level2, MaxHealth2, Health, Attack2, Defense2, Special2)),
    write('Nah! Musuh '), write(Name), write(' random dengan level '), write(Level), write('akan menyerang kamu!'), nl,
    write('Buatlah keputusan!'), nl,
    write('- fight.'), nl,
    write('- run.'), nl,
    write('Ketik pilihan diakhiri titik, contoh: fight.'), nl,
    random(1, 10, P),
    asserta(peluang(P)),*/
    asserta(isEnemyAlive(1)).

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
    retract(enemy(_, _, _, _, _, _, _, _)),
    (
        isEnemySkill(_) ->
        retract(isEnemySkill(_))
        ;
        lebar(_)
    )
    , !.

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
    inventory(_,X,_,Status),
    (
        /*Pick Health*/
        Status =:= 1 ->
        job(_, _, _, MaxHealth,_,_,_,_),
        Health is MaxHealth,
        asserta(myjob(_, _, _, MaxHealth, Health,_,_,_,_)),
        write('Kamu memilih '), write(X), write(' untuk menyembuhkan dirimu '), nl
        ;
        (
            /*Pick Armor*/
            Status =:= 2 ->
            job(ID, Nama, _, _,_,Defense,_,_),
            Defense2 is Defense+10,
            asserta(myjob(ID, Nama, _,_,_,_,Defense2,_,_)),
            write('Kamu memilih '), write(X), write(' untuk defense dirimu '), nl
            ;
            (
                /*Pick Weapon*/
                Status =:= 3 ->
                job(ID, Nama, _, _,Attack,_,_,_),
                Attack2 is Attack+10,
                asserta(myjob(ID, Nama, _,_,_,Attack2,_,_,_)),
                write('Kamu memilih '), write(X), write(' untuk attack musuh '), nl, nl
            )
            )
    ),
    asserta(isSkill(1)),
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
    asserta(isEnemySkill(1)),
    write('Skill yang tersedia:'), nl,
    statusInventory,
    !.

/*Ambil armor lagi*/
fightChance :-
    write('Items:'), nl,
    statusInventory,
    !.

cont :-
    write('Lanjutkan??'), nl,
    write('- attack'), nl,
    write('- skill'), nl,
    !.

/*Giliran Musuh*/
attackComment :-
    enemy(_, EnemyName, _, _,EnemyHealth, _, _, _),
    EnemyHealth > 0,
    write('Health '), write(EnemyName), write(' tersisa '), write(EnemyHealth), nl,
    write('Sekarang giliran musuh!'), nl,
    write('...'), nl,
    sleep(1),
    enemyTurn,
    !.

/*Menang Lawan Musuh*/
attackComment :-
    enemyTokemon(_, EnemyName, _, _,EnemyHealth, _, _, _),
    EnemyHealth =< 0,
    write(EnemyName), write(' mati!'), nl.

