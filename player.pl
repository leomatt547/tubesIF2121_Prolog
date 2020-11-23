:- dynamic(inventory/3).      /* inventory(NamaItems) */
:- dynamic(boss/7).            /* boss */

maxInventory(10).

cekPanjang(Length) :-
    findall(Nama, inventory(_,Nama,_), List),
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
    items(ID, Nama, Quantity),
    Quantity is Quantity+1,
    asserta(inventory(ID, Nama, Quantity)),!.

delItems(Nama) :-
    \+inventory(_,Nama,_),
    write('Tidak ada items tersebut di inventory anda'),
    !,fail.

delItems(Nama) :-
    inventory(ID, Nama, Quantity),
    Quantity is Quantity-1,
    inventory(ID, Nama, Quantity),!.

initBoss(ID) :-
    job(ID, Name, MaxHealth, Attack, Defense, Special),
    Health is MaxHealth,
    asserta(boss(ID, Name, MaxHealth, Health, Attack, Defense,Special)),!.

makeListItems(ListNama, ListQuantity) :-
    findall(Nama, inventory(_,Nama,_), ListNama),
    findall(Quantity, inventory(_,_,Quantity), ListQuantity).

makeListBoss(ListNama,ListHealth) :-
    findall(Name, boss(_,Name,_,_,_,_,_), ListNama),
    findall(Health, boss(_,_,_,_,Health,_,_), ListHealth).

stt([],[]).
stt([A|X],[B|Y]) :-
    write(A),nl,
    write('Health: '),
    write(B),nl,nl,
    stt(X,Y).

stt2([],[]).
stt2([A|X],[B|Y]) :-
    write(A),nl,
    write('Quantity: '),
    write(B),nl,nl,
    stt2(X,Y).

status :-
    init(_),
    player(Username),
    write('Username Anda adalah '), write(Username), nl, nl,
    makeListItems(ListNama,ListQuantity),
    write('Item Anda'),nl,nl,
    stt2(ListNama,ListQuantity),
    makeListBoss(NamaBoss,HealthBoss),
    write('Musuh Terakhirmu:'),nl,nl,
    stt(NamaBoss,HealthBoss).

statusInventory :-
    init(_),
    makeListItems(ListNama,ListQuantity),
    write('Item Anda'),nl,nl,
    stt2(ListNama,ListQuantity).