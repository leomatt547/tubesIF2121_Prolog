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
    equipment(ID, Name, Type, MaxHP, Level, Element, Attack, Special),
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