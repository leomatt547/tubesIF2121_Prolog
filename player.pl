:- dynamic(inventory/10).            /* inventory(NamaTokemon) */
:- dynamic(legendary/9).            /* legendary */

maxInventory(6).

cekPanjang(Length) :-
    findall(Name, inventory(_,Name,_,_,_,_,_,_,_,_), List),
    length(List,Length).    

isFull :-
    cekPanjang(Length),
    Length == 6.

addMusuh(_) :-
    cekPanjang(Length),
    maxInventory(Max),
    Length >= Max,
    write('Maaf, sudah penuh'),
    !,fail.