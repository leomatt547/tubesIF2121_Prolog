:- dynamic(enemyMonster/9).  
:- dynamic(myTokemon/10). 
:- dynamic(peluang/1).
:- dynamic(isEnemySkill/1).
:- dynamic(isEnemyAlive/1).
:- dynamic(ableCaptured/1).
:- dynamic(isPick/1).
:- dynamic(isRun/1).
:- dynamic(isattack/1).
:- dynamic(isSkill/1).
:- dynamic(temp/1).

enemyTriggered :-  
    random(7, 30, ID),
    job(ID, Name, Type, MaxHealth, _, Element, Attack, Special),
    cekPanjang(Level),
    asserta(enemyMonster(ID, Name, Type, MaxHealth, Level, _, Element, Attack, Special)),
    loop(Level,ID),
    retract(enemyMonster(ID,Name2,Type,MaxHealth2,Level2,_,Element,Attack2,Special2)),
    Health is MaxHealth2,
    asserta(enemyMonster(ID,Name2,Type,MaxHealth2,Level2,Health,Element,Attack2,Special2)),
    write('Kamu ketemu '), write(Name), write(' liar dengan level '), write(Level), write('!'), nl,
    write('Apa yang akan kamu lakukan?'), nl,
    write('- attack'), nl,
    write('- run'), nl,
    write('Ketik pilihan diakhiri titik, contoh: attack.'), nl,
    random(1, 10, P),
    asserta(peluang(P)),
    asserta(isEnemyAlive(1)).

legendaryTriggered1 :-
    ID is 100,
    job(ID, Name, Type, MaxHealth, Level, Element, Attack, Special),
    Health is MaxHealth,
    asserta(enemyMonster(ID,Name,Type,MaxHealth,Level,Health,Element,Attack,Special)),nl,
    write('Kamu bertemu Legendary Pokemon '), write(Name), write('!!!'), nl,nl,
    asserta(isEnemyAlive(1)),
    attack, !.

legendaryTriggered2 :-
    ID is 101,
    job(ID, Name, Type, MaxHealth, Level, Element, Attack, Special),
    Health is MaxHealth,    
    asserta(enemyMonster(ID,Name,Type,MaxHealth,Level,Health,Element,Attack,Special)),nl,
    write('Kamu bertemu Legendary Pokemon '), write(Name), write('!!!'), nl,nl,
    asserta(isEnemyAlive(1)), 
    attack, !.

run :-
    \+ isEnemyAlive(_),
    write('Lari terus! Kumpulkan Kartu Latman??'),
    !.

run :-
    \+isRun(_),
    isEnemyAlive(_),
    peluang(P), 
    P < 5,
    write('Kamu Kurang beruntung! Silahkan attack lawan sesegera mungkin'), nl,
    retract(peluang(P)),
    attack,
    !.

run :-
    \+ isRun(_),
    isEnemyAlive(_),
    peluang(P),
    P >= 5,
    write('Kamu Beruntung! Selamat'),
    retract(peluang(P)),
    retract(isEnemyAlive(_)),
    retract(enemyMonster(_, _, _, _, _, _, _, _, _)),
    (
        isEnemySkill(_) ->
        retract(isEnemySkill(_))
        ;
        lebar(X)
    )
    , !.