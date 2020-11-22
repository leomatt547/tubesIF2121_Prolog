:- dynamic(inventory/10).      /* inventory(NamaTokemon) */
:- dynamic(boss/7).            /* boss */

maxInventory(10).

cekPanjang(Length) :-
    findall(Name, inventory(_,Name,_,_,_,_,_,_,_,_), List),
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
    Exp is 0,
    asserta(inventory(ID, Name, Type, MaxHealth, Level, Health, Attack, Special, Exp)),!.

delItems(ID) :-
    \+inventory(ID,_,_,_,_,_,_,_,_,_),
    write('Tidak ada pokemon tersebut di inventory anda'),
    !,fail.

delItems(ID) :-
    retract(inventory(ID,_,_,_,_,_,_,_,_,_)),
    !.

initBoss(ID) :-
    job(ID, Name, Level, MaxHealth, Attack, Defense, Special),
    Health is MaxHealth,
    asserta(boss(ID, Name, Type, MaxHealth, Level, Health, Attack, Special)),!.

makeListItems(ListNama,ListHealth,ListElement) :-
    findall(Name, inventory(_,Name,_,_,_,_,_,_,_,_), ListNama),
    findall(Health, inventory(_,_,_,_,_,Health,_,_,_,_), ListHealth).

makeListBoss(ListNama,ListHealth,ListElement) :-
    findall(Name, boss(_,Name,_,_,_,_,_,_,_), ListNama),
    findall(Health, boss(_,_,_,_,_,Health,_,_,_), ListHealth).

stt([],[],[]).
stt([A|X],[B|Y],[C|Z]) :-
    write(A),nl,
    write('Health: '),
    write(B),nl,
    write('Element: '),
    write(C),nl,nl,
    stt(X,Y,Z).

status :-
    init(_),
    player(Username),
    write('Your username is '), write(Username), nl, nl,
    makeListItems(ListNama,ListHealth,ListElement),
    write('Your Items'),nl,nl,
    stt(ListNama,ListHealth,ListElement),
    makeListBoss(NamaBoss,HealthBoss,ElementBoss),
    write('Your Final Enemy'),nl,nl,
    stt(NamaBoss,HealthBoss,ElementBoss).

statusInventory :-
    init(_),
    makeListItems(ListNama,ListHealth,ListElement),
    write('Your Items:'),nl,nl,
    stt(ListNama,ListHealth,ListElement).