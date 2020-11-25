:- dynamic(inventory/4).      /* inventory(NamaItems) */
:- dynamic(boss/8).           /* boss */

maxInventory(10).

cekPanjang(Length) :-
    findall(Nama, inventory(_,Nama,_,_), List),
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

addItems(Nama) :-
    items(ID, Nama, TempQuantity,Status),
    Quantity is TempQuantity+1,
    asserta(inventory(ID, Nama, Quantity,Status)),!.

addItem(ID) :-
    items(ID, Nama, TempQuantity,Status),
    Quantity is TempQuantity+1,
    asserta(inventory(ID, Nama, Quantity,Status)),!.

delItems(Nama) :-
    \+inventory(_,Nama,_,_),
    write('Tidak ada items tersebut di inventory anda'),
    !,fail.

delItems(Nama) :-
    inventory(ID, Nama, TempQuantity,_),
    TempQuantity > 1,
    Quantity is TempQuantity-1,
    retract(inventory(ID, Nama, TempQuantity,_)),
    asserta(inventory(ID, Nama, Quantity,_)),!.

delItems(Nama) :-
    inventory(_, Nama, TempQuantity,_),
    TempQuantity =:= 1,
    retract(inventory(_, Nama, TempQuantity,_)),!.

initBoss(ID) :-
    job(ID, Name, Level, MaxHealth, Attack, Defense, Special, Exp),
    Health is MaxHealth,
    asserta(boss(ID, Name, Level, MaxHealth, Health, Attack, Defense,Special, Exp)),!.

makeListItems(ListNama, ListQuantity) :-
    findall(Nama, inventory(_,Nama,_,_), ListNama),
    findall(Quantity, inventory(_,_,Quantity,_), ListQuantity).

makeListBoss(ListNama,ListHealth) :-
    findall(Name, boss(_,Name,_,_,_,_,_,_), ListNama),
    findall(Health, boss(_,_,_,_,Health,_,_,_), ListHealth).

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