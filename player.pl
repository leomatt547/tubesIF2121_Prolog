:- dynamic(inventory/10).  

maxInventory(100).

cekPanjang(Length) :-
    findall(Name, inventory(_,Name,_,_,_,_,_,_,_,_), List),
    length(List,Length).    

isFull :-
    cekPanjang(Length),
    Length == 100.

addItems(_) :-
    cekPanjang(Length),
    maxInventory(Max),
    Length >= Max,
    write('Maaf, Inventory Sudah Penuh'),
    !,fail.

addItems(ID) :-
    items(ID, Name, Type, MaxHP, Level, Element, Attack, Special),
    HP is MaxHP,
    Exp is 0,
    asserta(inventory(ID, Name, Type, MaxHP, Level, HP, Element, Attack, Special, Exp)),!.

delItems(ID) :-
    \+inventory(ID,_,_,_,_,_,_,_,_,_),
    write('Tidak ada item tersebut di inventory anda'),
    !,fail.

delItems(ID) :-
    retract(inventory(ID,_,_,_,_,_,_,_,_,_)),
    !.

initEnemy(ID) :-
    job(ID, Name, Level, MaxHealth, Attack, Defense, Special),
    Health is MaxHealth,
    asserta(enemy(ID, Name, Level, MaxHealth, Health, Attack, Defense, Special)),!.

makeListItems(ListNama,ListHealth,ListElement) :-
    findall(Name, inventory(_,Name,_,_,_,_,_,_,_,_), ListNama),
    findall(Health, inventory(_,_,_,_,_,Health,_,_,_,_), ListHealth),
    findall(Element, inventory(_,_,_,_,_,_,Element,_,_,_), ListElement).

makeListEnemy(ListNama,ListHealth,ListElement) :-
    findall(Name, enemy(_,Name,_,_,_,_,_,_,_), ListNama),
    findall(Health, enemy(_,_,_,_,_,Health,_,_,_), ListHealth),
    findall(Element, enemy(_,_,_,_,_,_,Element,_,_), ListElement).

tempstatus([],[],[]).
tempstatus([A|X],[B|Y],[C|Z]) :-
    write(A),nl,
    write('Health: '),
    write(B),nl,
    write('Element: '),
    write(C),nl,nl,
    tempstatus(X,Y,Z).

status :-
    init(_),
    player(Username),
    write('Username anda adalah '), write(Username), nl, nl,
    makeListItems(ListNama,ListHealth),
    write('Your Items'),nl,nl,
    tempstatus(ListNama,ListHealth),
    makeListEnemy(NamaLegend,HealthLegend,ElementLegend),
    write('Your Final Enemy'),nl,nl,
    tempstatus(NamaLegend,HealthLegend,ElementLegend).

statusInventory :-
    init(_),
    makeListItems(ListNama,ListHealth),
    write('Your Items:'),nl,nl,
    tempstatus(ListNama,ListHealth).