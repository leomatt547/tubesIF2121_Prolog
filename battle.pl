:- dynamic(enemy/8).
:- dynamic(isEnemyAlive/1).
:- dynamic(peluang/1).
:- dynamic(isPick/1).
:- dynamic(isRun/1).
:- dynamic(isFight/1).

enemyTriggered :-  
    random(4, 7, ID),
    job(ID, Name, Level, MaxHealth, Attack, Defense, Special, Exp),
    Health is MaxHealth,
    asserta(enemy(ID, Name, Level, MaxHealth, Health, Attack, Defense, Special, Exp)),
    write(' '),nl,
    write(' 888b.       w    w   8                w              w   8 '),nl,
    write(' 8wwwP .d88 w8ww w8ww 8 .d88b    d88b w8ww .d88 8d8b w8ww 8 '),nl,
    write(' 8   b 8  8  8    8   8 8.dP`    `Yb.  8   8  8 8P    8   " '),nl,
    write(' 888P` `Y88  Y8P  Y8P 8 `Y88P    Y88P  Y8P `Y88 8     Y8P w '),nl,nl,
                                                           
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
    write('Kamu bertemu King Slime :'), write(Name), write('!!!'), nl,nl,
    write('                 8  dP w               .d88b. 8 w                                   '),nl,
    write('                 8wdP  w 8d8b. .d88    YPwww. 8 w 8d8b.d8b. .d88b                   '),nl,
    write('                 88Yb  8 8P Y8 8  8        d8 8 8 8P Y8P Y8 8.dP`                   '),nl,
    write('                 8  Yb 8 8   8 `Y88    `Y88P` 8 8 8   8   8 `Y88P                   '),nl,
    write('                               wwdP                                                 '),nl,nl,
    write('                                    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓                                '),nl,
    write('                                  ▓▓▓▓░░░░░░░░░░░░▓▓▓▓                              '),nl,
    write('                                ▓▓▓▓▒▒░░░░░░░░░░░░░░░░▓▓                            '),nl,
    write('                              ▓▓▓▓▒▒▒▒░░░░░░░░░░░░░░░░▓▓▓▓                          '),nl,
    write('                            ▓▓▓▓▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░▓▓▓▓                        '),nl,
    write('                          ▓▓▓▓▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░░░▓▓▓▓                      '),nl,
    write('                          ▓▓▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓                    '),nl,
    write('                          ▓▓▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░░░▓▓                    '),nl,
    write('                          ▓▓▒▒▒▒▒▒████████████░░░░████████░░░░▓▓▓▓                  '),nl,
    write('                        ▓▓▓▓▒▒▒▒▒▒██░░░░░░████░░░░██░░░░░░██░░░░▓▓                  '),nl,
    write('                        ▓▓▒▒▒▒▒▒████░░░░░░░░██░░░░████░░░░██░░░░▓▓                  '),nl,
    write('                        ▓▓▒▒▒▒▒▒██████████████░░░░░░████████░░░░▓▓                  '),nl,
    write('                        ▓▓▒▒▒▒▒▒▒▒░░░░░░████░░░░░░░░░░░░░░░░░░░░▓▓                  '),nl,
    write('                        ▓▓▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓                  '),nl,
    write('                      ▓▓▓▓▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓                  '),nl,
    write('                      ▓▓▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░░░▓▓▓▓░░░░░░░░░░▓▓                '),nl,
    write('                      ▓▓▒▒▒▒▒▒▒▒░░▓▓░░▓▓▓▓▓▓▓▓▓▓░░░░▓▓▓▓░░░░░░░░░░▓▓                '),nl,
    write('                    ▓▓▓▓▒▒▒▒▒▒▒▒▓▓▓▓░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░░░░░░░░░▓▓                '),nl,
    write('                    ▓▓▒▒▒▒▒▒▒▒▓▓▓▓▓▓░░░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░░░░░░░░░▓▓                '),nl,
    write('                    ▓▓▒▒▒▒▒▒▒▒▓▓▓▓▓▓░░░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░░░░░░░░░░░▓▓              '),nl,
    write('                    ▓▓▒▒▒▒▒▒▒▒▓▓▓▓▓▓░░░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░░░░░░░░░░░░░▓▓            '),nl,
    write('                    ▓▓▒▒▒▒▒▒░░▓▓▓▓░░░░░░░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░░░░░░░░░░░░░▓▓            '),nl,
    write('                  ▓▓▓▓▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓        '),nl,
    write('        ▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓▓  '),nl,
    write('  ▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓'),nl,
    write('▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓'),nl,
    write('▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓▓'),nl,
    write('        ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓      '),nl,nl,nl,
    write('              888b.       w    w   8                w              w   8 '),nl,
    write('              8wwwP .d88 w8ww w8ww 8 .d88b    d88b w8ww .d88 8d8b w8ww 8 '),nl,
    write('              8   b 8  8  8    8   8 8.dP`    `Yb.  8   8  8 8P    8   " '),nl,
    write('              888P` `Y88  Y8P  Y8P 8 `Y88P    Y88P  Y8P `Y88 8     Y8P w '),nl,nl,
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
    write('Kamu bertemu Royal Tigress :'), write(Name), write('!!!'), nl,nl,
    write('                                888b.                   8    88888 w                           '),nl,
    write('                                8  .8 .d8b. Yb  dP .d88 8      8   w .d88 8d8b .d88b d88b d88b '),nl,
    write('                                8wwK` 8` .8  YbdP  8  8 8      8   8 8  8 8P   8.dP` `Yb. `Yb. '),nl,
    write('                                8  Yb `Y8P`   dP   `Y88 8      8   8 `Y88 8    `Y88P Y88P Y88P '),nl,
    write('                                             dP                      wwdP                      '),nl,nl,
    write('                  ████████████████████████    ████████████░░░░░░░░████░░░░████████████    ████████████████████████                '),nl,
    write('                  ████████████████████████    ████████████░░░░░░░░████░░░░████████████    ████████████████████████                '),nl,
    write('                  ████▓▓▓▓                ████████████░░░░████████████████░░░░████████████                ████████                '),nl,
    write('                  ██████▓▓░░              ████████████▒▒░░████████████████░░▒▒████████████░░  ░░  ░░      ████████                '),nl,
    write('                  ████▓▓▓▓            ████████████    ████░░░░░░░░░░░░░░░░████    ████████████            ████████                '),nl,
    write('                  ██████▓▓            ████████████    ████░░░░░░░░▒▒▒▒░░░░████    ████████████            ████████                '),nl,
    write('                  ████▓▓▓▓        ░░░░░░░░████    ████    ░░░░████████░░░░    ████    ████░░░░░░░░        ████████                '),nl,
    write('                  ██████▓▓░░      ▒▒▒▒░░░░████    ████░░  ░░░░████████▒▒▒▒    ████░░  ████▒▒░░▒▒▒▒        ████████                '),nl,
    write('                  ████▓▓▓▓    ████████░░░░████            ████░░░░░░░░████            ████░░░░████████    ████████                '),nl,
    write('                  ██████▓▓░░  ████████▒▒▒▒████░░      ░░  ████▒▒░░▒▒▒▒████        ░░  ████▒▒░░████████    ████████                '),nl,
    write('                  ████    ████████░░░░████████████████    ░░░░░░░░░░░░░░░░    ████████████████░░▒▒████████    ████                '),nl,
    write('                  ████  ░░████████░░▒▒████████████████    ▒▒░░▒▒░░░░░░▒▒▒▒    ████████████████░░▒▒████████    ████                '),nl,
    write('                      ████████░░░░                    ████░░░░░░░░░░░░░░░░████                    ░░░░████████                    '),nl,
    write('                      ████████░░▒▒  ░░    ░░      ░░  ████░░▒▒▒▒░░▒▒▒▒▒▒▒▒████    ░░      ░░  ░░  ▒▒▒▒████████                    '),nl,
    write('                  ████▓▓██▓▓██░░░░    ████████████████    ░░░░████████░░░░    ████████████████    ░░░░████████████                '),nl,
    write('                  ████████████▒▒▒▒    ████████████████░░  ▒▒▒▒████████▒▒░░    ████████████████░░  ▒▒░░████████████                '),nl,
    write('                  ████▓▓██░░░░    ██▓▓▒▒▒▒▓▓██    ████▓▓██    ░░░░░░░░    ████████    ████▒▒▒▒▓▓██░░░░░░░░▓▓██████                '),nl,
    write('                  ████████▒▒░░░░  ████▓▓▓▓████  ░░████████░░  ▒▒░░▒▒▒▒░░  ████████░░  ████▓▓▓▓████▒▒░░▒▒▒▒████████                '),nl,
    write('                  ████████░░░░        ████▒▒▒▒████▒▒▒▒████░░░░░░░░░░░░░░░░████▒▒▒▒████▒▒▒▒████    ░░░░░░░░████████                '),nl,
    write('                  ████████░░░░        ████▒▒▒▒████▓▓▒▒████▒▒▒▒░░░░▒▒▒▒░░░░████▓▓▒▒████▓▓▒▒████    ░░░░░░▒▒████████                '),nl,
    write('                  ████░░░░████░░░░                ████████░░░░░░░░░░░░░░░░████████            ░░░░    ████░░░░████                '),nl,
    write('                  ████▒▒▒▒████▒▒▒▒  ░░    ░░      ████████░░░░▒▒░░▒▒▒▒▒▒░░████████░░      ░░  ▒▒▒▒░░  ████▒▒░░████                '),nl,
    write('                  ████░░▒▒░░░░████░░░░░░░░████░░░░░░░░████░░░░░░░░░░░░░░░░████░░░░░░░░████░░░░░░▒▒████░░░░░░░░████                '),nl,
    write('                  ████▒▒▒▒▒▒░░████░░▒▒▒▒▒▒████▒▒▒▒▒▒▒▒████▒▒▒▒▒▒░░▒▒▒▒▒▒▒▒████▒▒▒▒▒▒░░████▒▒░░▒▒▒▒████▒▒▒▒▒▒▒▒████                '),nl,
    write('                  ████████░░░░    ████████        ░░░░████░░░░░░░░░░░░░░░░████░░░░        ▓▓██████    ░░░░████████                '),nl,
    write('                  ████████▒▒░░    ████████        ▒▒░░████▒▒░░▒▒░░░░░░▒▒░░████▒▒░░        ████████    ░░▒▒████████                '),nl,
    write('                      ██▓▓░░░░████████        ████████░░░░░░░░░░░░░░░░░░░░░░░░████████        ▓▓██████░░░░████                    '),nl,
    write('                      ████▒▒░░████████        ████████▒▒░░░░▒▒▒▒░░▒▒▒▒▒▒░░▒▒░░████████        ████████▒▒░░████                    '),nl,
    write('                        ░░████████████    ████████░░░░░░░░████████████████░░░░░░░░████████    ████████████                        '),nl,
    write('                        ░░████████████    ████████▒▒░░▒▒░░████████████████▒▒▒▒▒▒▒▒████████░░  ████████████                        '),nl,
    write('                        ░░▓▓██████████    ████░░░░░░░░░░░░    ████████    ░░░░░░░░░░░░████    ████████████                        '),nl,
    write('                        ░░▓▓░░████████    ▓▓▓▓▒▒░░░░▒▒░░░░    ▓▓░░▓▓▓▓    ░░░░░░▒▒░░▒▒▓▓▓▓    ████████▓▓▓▓                        '),nl,
    write('                              ████████        ▒▒▒▒▒▒░░                        ▒▒░░░░░░        ████████                            '),nl,
    write('                                  ████████████    ████        ████████        ████    ████████████                                '),nl,
    write('                                  ████████████    ████░░      ████████░░      ████░░  ████████████                                '),nl,
    write('                                  ████████            ████████        ████████            ████████                                '),nl,
    write('                                  ████████            ████████        ████████            ████████                                '),nl,
    write('                                      ████    ████                                ████    ████                                    '),nl,
    write('                                      ████    ████    ░░      ░░      ░░          ████    ████                                    '),nl,
    write('                                          ████████████████    ████████    ████████████████                                        '),nl,
    write('  ░░░░    ░░░░    ░░    ░░    ░░░░    ░░░░░░░░████████████████████████▓▓██████████████░░░░        ░░░░░░░░░░░░░░        ░░░░  ░░░░'),nl,
    write('                                              ████████████████████████████████████████                                            '),nl,
    write('                                                      ████████████████████████                                                   '),nl,nl,nl,
    write('                                     888b.       w    w   8                w              w   8 '),nl,
    write('                                     8wwwP .d88 w8ww w8ww 8 .d88b    d88b w8ww .d88 8d8b w8ww 8 '),nl,
    write('                                     8   b 8  8  8    8   8 8.dP`    `Yb.  8   8  8 8P    8   " '),nl,
    write('                                     888P` `Y88  Y8P  Y8P 8 `Y88P    Y88P  Y8P `Y88 8     Y8P w '),nl,nl,
    asserta(isEnemyAlive(1)),
    fight, !.

bossTriggered3 :-
    ID is 102,
    job(ID, Name, Level, MaxHealth, Attack, Defense, Special, Exp),
    Health is MaxHealth,
    asserta(enemy(ID, Name, Level, MaxHealth, Health, Attack, Defense, Special, Exp)),nl,
    write('Kamu bertemu Black Dragon :'), write(Name), write('!!!'), nl,nl,
    write('       888b. 8           8       888b.                            '),nl,
    write('       8wwwP 8 .d88 .d8b 8.dP    8   8 8d8b .d88 .d88 .d8b. 8d8b. '),nl,
    write('       8   b 8 8  8 8    88b     8   8 8P   8  8 8  8 8` .8 8P Y8 '),nl,
    write('       888P` 8 `Y88 `Y8P 8 Yb    888P` 8    `Y88 `Y88 `Y8P` 8   8 '),nl,
    write('                                                 wwdP             '),nl,
    write('                                            ..    '),nl,                               
    write('                                     ,o""""o        '),nl,                           
    write('                                  ,o$"     o '),nl,
    write('                               ,o$$$'),nl,
    write('                             ,o$$$'),nl,
    write('                           ,o$"o$'),nl,
    write('                         ,o$$"$"'),nl,
    write('                      ,o$"$o"$"'),nl,
    write('                   ,oo$"$"$"$"$$`                      ,oooo$$$$$$$$oooooo.'),nl,
    write('                ,o$$$"$"$"$"$"$"o$;..             ,$o$"$$"$"            `oo.o'),nl,
    write('             ,oo$$$o"$"$"$"$  $"$$$"$`o        ,o$$"o$$$o$                 `o'),nl,
    write('          ,o$"$"$o$"$"$"$  $"$$o$$o $$o;o   ,$$$$$o$"$$o                    $'),nl,
    write('        ,o"$$"  ;$"$o$" o$o$o"  $$$o$o$oo"$$$o$"$$"$o"                      $'),nl,
    write('     ,o$"          "$ "$$o$$" $"$o$o$$"$o$$o$o$o"$"$""""o                   '),nl,
    write('   ,o$`          `o$ `"$"$o "$o$$o$$$"$$$o"$o$$o"$$$    `$$'),nl,
    write('  ,o            (     `" o$"$o"$o$$$"$o$"$"$o$"$$"$ooo|  ``'),nl,
    write(' $"$             `    (   `"o$$"$o$o$$ "o$o"   $o$o"$"$    '),nl,
    write('(  `                   `    `o$"$$o$" "o$$     "o /|"$o"'),nl,
    write(' `                           `$o$$$$"" o$`      "o$\'|"$o`'),nl,
    write('                              `$o"$"$ $ "       `"$"$o$'),nl,
    write('                               "$$"$$ "oo         ,$""$'),nl,
    write('                               $"$o$$""o"          ,o$"$'),nl,
    write('                               `$$"$$"$ "o`           `,",'),nl,
    write('                     ,oo$oo$$$$$$"$o$$$ ""o  '),nl,
    write('                  ,o$$"o"o$o$$o$$$"$o$$oo"oo'),nl,
    write('                ,$oo$$$$o$$$$"$$$o"o$o"o"$o` o'),nl,
    write('               ,$$$""$$o$,      `$$$$"$$$o""$o $o '),nl,
    write('               $o$o$"$,          `$o$"$o$o"$$o$ $$o  '),nl,
    write('              $$$o"o$$           ,$$$$o$$o"$"$$ $o$$oo      , '),nl,
    write('              "$o$$$ $`.        ,"$$o$"o$""$$$$ `"$o$$oo    `o  '),nl,
    write('              `$o$o$"$o$o`.  ,.$$"$o$$"$$"o$$$$   `$o$$ooo    $$ooooooo  '),nl,
    write('                `$o$"$o"$"$$"$$"$"$$o$$o"$$o"        `"$o$o            `"o  '),nl,
    write('                   `$$"$"$o$$o$"$$"$ $$$  $ "           `$"$o            `o  '),nl,
    write('                      `$$"o$o"$o"$o$ "  o $$$o            `$$"o          ,$  '),nl,
    write('                         (" ""$"""     o"" "o$o             `$$ooo     ,o$$ '),nl,
    write('                              $$"""o   (   "$o$$$"o            `$o$$$o$"$` '),nl,
    write('                               ) ) )           )  ) ) `          ` "   '),nl,
    write('         888b.       w    w   8                w              w   8 '),nl,
    write('         8wwwP .d88 w8ww w8ww 8 .d88b    d88b w8ww .d88 8d8b w8ww 8 '),nl,
    write('         8   b 8  8  8    8   8 8.dP`    `Yb.  8   8  8 8P    8   " '),nl,
    write('         888P` `Y88  Y8P  Y8P 8 `Y88P    Y88P  Y8P `Y88 8     Y8P w '),nl,nl,
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
    \+ inventory(_,X,_,_),
    write('Kamu ga punya item itu. Perhatikan daftar item di inventori!'),
    fightChance, 
    !.

/*Pick Health Berhasil
myjob(ID, Name, Level, MaxHealth, Health, Attack, Defense, Special, Exp)*/
pick(X) :-
    isEnemyAlive(_),
    isFight(_),
    \+ isPick(_),
    myjob(_, Nama,MyLevel, MyMaxHealth, MyHealth, MyAttack, MyDefense, MySpecial,MyExp),
    inventory(_,X,_,Status),
    (
        /*Pick Health*/
        Status =:= 1 ->
        Level2 is MyLevel,
        MaxHealth2 is MyMaxHealth,
        Health2 is (MyHealth+150),
        Attack2 is MyAttack,
        Defense2 is MyDefense,
        Special2 is MySpecial,
        Exp2 is MyExp,
        retract(myjob(_,Nama,MyLevel,MyMaxHealth, MyHealth,MyAttack,MyDefense,MySpecial,MyExp)),
        asserta(myjob(_,Nama,Level2,MaxHealth2,Health2,Attack2,Defense2,Special2,Exp2)),
        write('Kamu memilih '), write(X), write(' untuk menyembuhkan dirimu '), nl,
        asserta(isPick(1))
        ;
        (
            /*Pick Armor*/
            Status =:= 2 ->
            Defense2 is MyDefense+10,
            Level2 is MyLevel,
            MaxHealth2 is MyMaxHealth,
            Health2 is MyHealth,
            Attack2 is MyAttack,
            Special2 is MySpecial,
            Exp2 is MyExp,
            retract(myjob(_,Nama,MyLevel,MyMaxHealth, MyHealth,MyAttack,MyDefense,MySpecial,MyExp)),
            asserta(myjob(_,Nama,Level2,MaxHealth2,Health2,Attack2,Defense2,Special2,Exp2)),
            write('Kamu memilih '), write(X), write(' untuk defense dirimu '), nl,
            asserta(isPick(2))
            ;
            (
                /*Pick Weapon*/
                Status =:= 3 ->
                Attack2 is (MyAttack+10),
                Level2 is MyLevel,
                MaxHealth2 is MyMaxHealth,
                Health2 is MyHealth,
                Defense2 is MyDefense,
                Special2 is MySpecial,
                Exp2 is MyExp,
                retract(myjob(_,Nama,MyLevel,MyMaxHealth, MyHealth,MyAttack,MyDefense,MySpecial,MyExp)),
                asserta(myjob(_,Nama,Level2,MaxHealth2,Health2,Attack2,Defense2,Special2,Exp2)),
                write('Kamu memilih '), write(X), write(' untuk attack musuh '), nl,
                mystatus,
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
    myjob(_, Nama, _,_,_,MyAttack,_,_,_),
    enemy(ID, NamaEnemy, _,_,EnemyHealth,_,_,_,_),
    NewEnemyHealth is (EnemyHealth-MyAttack),
    retract(enemy(ID, NamaEnemy, Level, MaxHealth,EnemyHealth, Attack, Defense, Special,Exp)),
    asserta(enemy(ID, NamaEnemy, Level, MaxHealth,NewEnemyHealth, Attack, Defense, Special,Exp)),
    write(Nama), write(' sudah attack!'), nl,
    attackComment,
    !.

attackComment :-
    enemy(ID, EnemyName,_, _,EnemyHealth, _, _, _,_),
    myjob(_,Nama,MyLevel,MyMaxHealth, MyHealth,MyAttack,MyDefense,MySpecial,MyExp),
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
            write(EnemyName), write(' mati!'), nl,nl,
            write(' 888b.       w    w   8                         8 '),nl,
            write(' 8wwwP .d88 w8ww w8ww 8 .d88b    .d88b 8d8b. .d88 '),nl,
            write(' 8   b 8  8  8    8   8 8.dP`    8.dP` 8P Y8 8  8 '),nl,
            write(' 888P` `Y88  Y8P  Y8P 8 `Y88P    `Y88P 8   8 `Y88 '),nl,nl,
                                                 
            (
                ID =:= 4 ->
                claim(Tambah,Haha,Hahaha),
                Haha is Haha,
                Hahaha is Hahaha,
                Temptambah is Tambah+1,
                retract(claim(Tambah,Haha,Hahaha)),
                asserta(claim(Temptambah,Haha,Hahaha)),
                write('Slime berhasil dimasukkan dalam Quest'),nl
                ;
                (
                    ID =:= 5 ->
                    claim(Haha,Tambah,Hahaha),
                    Haha is Haha,
                    Hahaha is Hahaha,
                    Temptambah is Tambah+1,
                    retract(claim(Haha,Tambah,Hahaha)),
                    asserta(claim(Haha,Temptambah,Hahaha)),
                    write('Wolf berhasil dimasukkan dalam Quest'),nl
                    ;
                    (
                        ID =:= 6 ->
                        claim(Haha,Hahaha,Tambah),
                        Temptambah is Tambah+1,
                        Haha is Haha,
                        Hahaha is Hahaha,
                        retract(claim(Haha,Hahaha,Tambah)),
                        asserta(claim(Haha,Hahaha,Temptambah)),
                        write('Goblin berhasil dimasukkan dalam Quest'),nl
                        ;
                        (
                            ID =:= 100 ->
                            stage(Ubah),
                            gold(Uang),
                            TempUang is Uang+500,
                            retract(gold(_)),
                            retract(stage(_)),
                            asserta(stage(2)),
                            asserta(gold(TempUang)),
                            
                            write('              w              w                     w                      d88b '),nl,
                            write(' .d88b 8d8b. w8ww .d88b 8d8b w 8d8b. .d88    d88b w8ww .d88 .d88 .d88b    " dP '),nl,
                            write(' 8.dP` 8P Y8  8   8.dP` 8P   8 8P Y8 8  8    `Yb.  8   8  8 8  8 8.dP`     dP  '),nl,
                            write(' `Y88P 8   8  Y8P `Y88P 8    8 8   8 `Y88    Y88P  Y8P `Y88 `Y88 `Y88P    d888 '),nl,
                            write('                                     wwdP                   wwdP               '),nl
                            ;
                            (
                                ID =:= 101 ->
                                stage(Ubah),
                                gold(Uang),
                                TempUang is Uang+1000,
                                retract(gold(_)),
                                retract(stage(_)),
                                asserta(stage(3)),
                                asserta(gold(TempUang)),
                                write('              w              w                     w                      d88b '),nl,
                                write(' .d88b 8d8b. w8ww .d88b 8d8b w 8d8b. .d88    d88b w8ww .d88 .d88 .d88b     wwP '),nl,
                                write(' 8.dP` 8P Y8  8   8.dP` 8P   8 8P Y8 8  8    `Yb.  8   8  8 8  8 8.dP`       8 '),nl,
                                write(' `Y88P 8   8  Y8P `Y88P 8    8 8   8 `Y88    Y88P  Y8P `Y88 `Y88 `Y88P    Y88P '),nl,
                                write('                                     wwdP                   wwdP               '),nl
                                ;
                                (
                                    ID =:= 102 ->
                                    stage(Ubah),
                                    win
                                )
                            )
                        )
                    )
                )
            ),
            retract(enemy(_,EnemyName,_,_,_,_,_,_,_)),
            retract(isFight(_)),
            isPick(A),
            (
                A =:= 1 ->
                Level2 is MyLevel,
                MaxHealth2 is MyMaxHealth,
                Health2 is (MyHealth+10),
                Attack2 is MyAttack,
                Defense2 is MyDefense,
                Special2 is MySpecial,
                Exp2 is (MyExp+50),
                retract(myjob(_,Nama,MyLevel,MyMaxHealth, MyHealth,MyAttack,MyDefense,MySpecial,MyExp)),
                asserta(myjob(_,Nama,Level2,MaxHealth2,Health2,Attack2,Defense2,Special2,Exp2)),
                retract(isPick(_)),
                retract(isRun(_)),
                retract(isEnemyAlive(_)),
                markLevelUp(Level,TempExp)
                ;
                (
                    A =:= 2 ->
                    Defense2 is (MyDefense-10),
                    Level2 is MyLevel,
                    MaxHealth2 is MyMaxHealth,
                    Health2 is MyHealth,
                    Attack2 is MyAttack,
                    Special2 is MySpecial,
                    Exp2 is (MyExp+50),
                    retract(myjob(_,Nama,MyLevel,MyMaxHealth, MyHealth,MyAttack,MyDefense,MySpecial,MyExp)),
                    asserta(myjob(_,Nama,Level2,MaxHealth2,Health2,Attack2,Defense2,Special2,Exp2)),
                    retract(isPick(_)),
                    retract(isRun(_)),
                    retract(isEnemyAlive(_)),
                    markLevelUp(Level,TempExp)
                    ;
                    (
                        A =:= 3 ->
                        Attack2 is (MyAttack-10),
                        Level2 is MyLevel,
                        MaxHealth2 is MyMaxHealth,
                        Health2 is MyHealth,
                        Defense2 is MyDefense,
                        Special2 is MySpecial,
                        Exp2 is (MyExp+50),
                        retract(myjob(_,Nama,MyLevel,MyMaxHealth, MyHealth,MyAttack,MyDefense,MySpecial,MyExp)),
                        asserta(myjob(_,Nama,Level2,MaxHealth2,Health2,Attack2,Defense2,Special2,Exp2)),
                        retract(isPick(_)),
                        retract(isRun(_)),
                        retract(isEnemyAlive(_)),
                        markLevelUp(Level,Exp2)
                    )
                )
            )
        )
    ),
    !.

/*Attack*/
enemyAttack :-
    /*myjob(ID, Name, Level, MaxHealth, Health, Attack, Defense, Special, Exp)*/
    enemy(_, NamaEnemy, _,_,_,EnemyAttack,_,_,_),
    myjob(_, Nama, _,_,MyHealth,_,_,_,_),
    isFight(_),
    isPick(_),
    NewMyHealth is (MyHealth-EnemyAttack),
    retract(myjob(_, Nama, Level, MaxHealth,_, Attack, Defense, Special,Exp)),
    asserta(myjob(_, Nama, Level, MaxHealth,NewMyHealth, Attack, Defense, Special,Exp)),
    write(NamaEnemy), write(' sudah attack!'), nl,
    enemyAttackComment,
    !.

/*Enemy attack comment*/
enemyAttackComment :-
    isFight(_),
    isPick(_),
    myjob(_, Nama, _, _, MyHealth, _, _, _, _),
    (
        MyHealth > 0 ->
        write('Health '), write(Nama), write(' Anda tersisa '), write(MyHealth)
        ;
        (
            MyHealth =< 0 ->
            retract(myjob(_,_,_,_,_,_,_,_,_)),
            retract(enemy(_,_,_,_,_,_,_,_,_)),
            write('Health '), write(Nama),write('mu sudah habis!'),nl,
            lose
        ) 
    ),
    !.

win :-
write('                                                                                               '),nl,
write('    .xnnx.  .xx.                                    x=~                                        '),nl,
write('  .f``"888X< `888.         u.      x.    .         88x.   .e.   .e.         u.      u.    u.   '),nl,
write('  8L   8888X  8888   ...ue888b   .@88k  z88u      `8888X.x888:.x888   ...ue888b   x@88k u@88c. '),nl,
write(' X88h. `8888  X888k  888R Y888r ~"8888 ^8888       `8888  888X `888k  888R Y888r ^"8888""8888" '),nl,
write(' `8888 `8888  X8888  888R I888>   8888  888R        X888  888X  888X  888R I888>   8888  888R  '),nl,
write('  `*88>`8888  X8888  888R I888>   8888  888R        X888  888X  888X  888R I888>   8888  888R  '),nl,
write('    `! X888~  X8888  888R I888>   8888  888R        X888  888X  888X  888R I888>   8888  888R  '),nl,
write('   -`  X*"    X8888 u8888cJ888    8888 ,888B .     .X888  888X. 888~ u8888cJ888    8888  888R  '),nl,
write('    xH88hx  . X8888  "*888*P"    "8888Y 8888"      `%88%``"*888Y"     "*888*P"    "*88*" 8888" '),nl,
write('  .*"*88888~  X888X    `Y"        `Y"   `YP          `~     `"          `Y"         ""   `Y"   '),nl,
write('  `    "8%    X888>                                                                            '),nl,
write('     .x..     888f                                                                             '),nl,
write('    88888    :88f                                                                              '),nl,
write('    "88*"  .x8*~                                                                               '),nl,nl,nl,
    retract(isEnemyAlive(_)),
    retract(isRun(_)),
    retract(isFight(_)),
    retract(isPick(_)),
    quit.

lose :-
write('  ▄▀▀▄ ▀▀▄  ▄▀▀▀▀▄   ▄▀▀▄ ▄▀▀▄      ▄▀▀█▄▄   ▄▀▀█▀▄    ▄▀▀█▄▄▄▄  ▄▀▀█▄▄  '),nl,
write(' █   ▀▄ ▄▀ █      █ █   █    █     █ ▄▀   █ █   █  █  ▐  ▄▀   ▐ █ ▄▀   █ '),nl,
write(' ▐     █   █      █ ▐  █    █      ▐ █    █ ▐   █  ▐    █▄▄▄▄▄  ▐ █    █ '),nl,
write('       █   ▀▄    ▄▀   █    █         █    █     █       █    ▌    █    █ '),nl,
write('     ▄▀      ▀▀▀▀      ▀▄▄▄▄▀       ▄▀▄▄▄▄▀  ▄▀▀▀▀▀▄   ▄▀▄▄▄▄    ▄▀▄▄▄▄▀ '),nl,
write('     █                             █     ▐  █       █  █    ▐   █     ▐  '),nl,
write('     ▐                             ▐        ▐       ▐  ▐        ▐        '),nl,
write('                                                                         '),nl,nl,nl,           
    retract(isEnemyAlive(_)),
    retract(isRun(_)),
    retract(isFight(_)),
    retract(isPick(_)),
    quit.
