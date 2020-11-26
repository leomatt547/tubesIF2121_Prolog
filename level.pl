levelUp(Nama) :-
    myjob(_,Nama,MyLevel,MyMaxHealth, MyHealth,MyAttack,MyDefense,MySpecial,MyExp),
    TempLevel is (MyLevel+1),
    TempMaxHealth is (MyMaxHealth + 100),
    TempHealth is TempMaxHealth,
    TempAttack is (MyAttack + 15),
    TempSpecial is (MySpecial + 15),
    MaxHealth2 is MyMaxHealth,
    Defense2 is MyDefense,
    Exp2 is MyExp,
    retract(myjob(_,Nama,MyLevel,MyMaxHealth, MyHealth,MyAttack,MyDefense,MySpecial,MyExp)),
    asserta(myjob(_, Nama, TempLevel, TempMaxHealth, TempHealth, TempAttack,Defense2, TempSpecial,Exp2)).

markLevelUp(Level,Exp) :-
    myjob(_,Nama,Level,_,_,_,_,_,Exp),
    Level =< 1,
    Exp >= 100,
    write('Levelmu naik !!'),nl,
    levelUp(Nama),!.

markLevelUp(Level,Exp) :-
    myjob(_,Nama,Level,_,_,_,_,_,Exp),
    Level =< 2,
    Exp >= 300,
    write('Levelmu naik !!'),nl,
    levelUp(Nama),!.

markLevelUp(Level,Exp) :-
    myjob(_,Nama,Level,_,_,_,_,_,Exp),
    Level =< 3,
    Exp >= 500,
    write('Levelmu naik !!'),nl,
    levelUp(Nama),!.

markLevelUp(Level,Exp) :-
    myjob(_,Nama,Level,_,_,_,_,_,Exp),
    Level =< 4,
    Exp >= 700,
    write('Levelmu naik !!'),nl,
    levelUp(Nama),!.

markLevelUp(Level,Exp) :-
    myjob(_,Nama,Level,_,_,_,_,_,Exp),
    Level =< 5,
    Exp >= 1000,
    write('Levelmu naik !!'),nl,
    levelUp(Nama),!.

markLevelUp(Level,Exp) :-
    myjob(_,Nama,Level,_,_,_,_,_,Exp),
    Level =< 6,
    Exp >= 1300,
    write('Levelmu naik !!'),nl,
    levelUp(Nama),!.

markLevelUp(Level,Exp) :-
    myjob(_,Nama,Level,_,_,_,_,_,Exp),
    Level =< 7,
    Exp >= 1600,
    write('Levelmu naik !!'),nl,
    levelUp(Nama),!.

markLevelUp(Level,Exp) :-
    myjob(_,Nama,Level,_,_,_,_,_,Exp),
    Level =< 8,
    Exp >= 1900,
    write('Levelmu naik !!'),nl,
    levelUp(Nama),!.

markLevelUp(Level,Exp) :-
    myjob(_,Nama,Level,_,_,_,_,_,Exp),
    Level =< 9,
    Exp >= 2200,
    write('Levelmu naik !!'),nl,
    levelUp(Nama),!.

markLevelUp(Level,Exp) :-
    myjob(_,Nama,Level,_,_,_,_,_,Exp),
    Level =< 10,
    Exp >= 2500,
    write('Levelmu naik !!'),nl,
    levelUp(Nama),!.

markLevelUp(Level,Exp) :-
    myjob(_,Nama,Level,_,_,_,_,_,Exp),
    Level =< 11,
    Exp >= 2800,
    write('Levelmu naik !!'),nl,
    levelUp(Nama),!.

markLevelUp(_,_,Exp) :-
    Exp < 2801.