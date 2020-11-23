:- dynamic(inventory/7).      /* inventory(NamaItems) */
:- dynamic(boss/7).            /* boss */

maxInventory(10).

cekPanjang(Length) :-
    findall(Name, inventory(_,Name,_,_,_,_,_), List),
    length(List,Length).    

isFull :-
    cekPanjang(Length),
    Length == 10.

addItems(_) :-
    cekPanjang(Length),
    maxInventory(Max),
    Length >= Max,
    write('Sudah Penuh'),
    !,fail.

addItems(ID) :-
    job(ID, Name, Level, MaxHealth, Attack, Defense, Special),
    Health is MaxHealth,
    asserta(inventory(ID, Name, MaxHealth, Level, Health, Attack, Special)),!.

delItems(ID) :-
    \+inventory(ID,_,_,_,_,_,_),
    write('Tidak ada items tersebut di inventory anda'),
    !,fail.

delItems(ID) :-
    retract(inventory(ID,_,_,_,_,_,_)),
    !.

initBoss(ID) :-
    job(ID, Name, Level, MaxHealth, Attack, Defense, Special),
    Health is MaxHealth,
    asserta(boss(ID, Name, MaxHealth, Level, Health, Attack, Special)),!.

makeListItems(ListNama,ListHealth) :-
    findall(Name, inventory(_,Name,_,_,_,_,_), ListNama),
    findall(Health, inventory(_,_,_,_,Health,_,_), ListHealth).

makeListBoss(ListNama,ListHealth) :-
    findall(Name, boss(_,Name,_,_,_,_,_,_,_), ListNama),
    findall(Health, boss(_,_,_,_,_,Health,_,_,_), ListHealth).

stt([],[]).
stt([A|X],[B|Y]) :-
    write(A),nl,
    write('Health: '),
    write(B),nl,nl,
    stt(X,Y).

status :-
    init(_),
    player(Username),
    write('Username Anda adalah '), write(Username), nl, nl,
    makeListItems(ListNama,ListHealth),
    write('Item Anda'),nl,nl,
    stt(ListNama,ListHealth),
    makeListBoss(NamaBoss,HealthBoss),
    write('Mush Terakhirmu:'),nl,nl,
    stt(NamaBoss,HealthBoss).

statusInventory :-
    init(_),
    makeListItems(ListNama,ListHealth),
    write('Your Items:'),nl,nl,
    stt(ListNama,ListHealth).