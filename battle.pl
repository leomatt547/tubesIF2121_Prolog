:- dynamic(enemyTokemon/8).
:- dynamic(isEnemyAlive/1).

enemyTriggered :-  
    random(4, 6, ID),
    job(ID, Name, _, MaxHealth, Attack, Defense, Special),
    cekPanjang(Level),
    asserta(enemyTokemon(ID, Name, Level, MaxHealth,_, Attack, Defense, Special)),
    loop(Level,ID),
    retract(enemyTokemon(ID, Name2, Level2, MaxHealth2,_, Attack2, Defense2, Special2)),
    Health is MaxHealth2,
    asserta(enemyTokemon(ID, Name2, Level2, MaxHealth2, Health, Attack2, Defense2, Special2)),
    write('Kamu ketemu '), write(Name), write(' liar dengan level '), write(Level), write('!'), nl,
    write('Apa yang akan kamu lakukan?'), nl,
    write('- fight'), nl,
    write('- run'), nl,
    write('Ketik pilihan diakhiri titik, contoh: fight.'), nl,
    random(1, 10, P),
    asserta(peluang(P)),
    asserta(isEnemyAlive(1)).