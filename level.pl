levelUp(ID) :-
    myjob(ID, Name, Level, MaxHealth, _, Attack, _, Special,_),
    TempLevel is (Level+1),
    TempMaxHealth is (MaxHealth + 100),
    TempHealth is TempMaxHealth,
    TempAttack is (Attack + 15),
    TempSpecial is (Special + 15),
    retract(myjob(ID,_,Level,_,_,_,_,_,_)),
    asserta(myjob(ID, Name, TempLevel, TempMaxHealth, TempHealth, TempAttack,_, TempSpecial,_)).
    
levelUpEnemy(ID) :-
    enemy(ID, Name, Level, MaxHealth, _, Attack, _, Special),
    TempLevel is (Level+1),
    TempMaxHealth is (MaxHealth*1.1),
    TempHealth is TempMaxHealth,
    TempAttack is (Attack*1.1),
    TempSpecial is (Special*1.1),
    retract(enemy(ID,_,Level,_,_,_,_)),
    asserta(enemy(ID, Name, TempLevel, TempMaxHealth, TempHealth, TempAttack, _ , TempSpecial)).

markLevelUp(ID,Level,Exp) :-
    Level =< 1,
    Exp >= 100,
    write('Levelmu naik !!'),nl,
    levelUp(ID),!.

markLevelUp(ID,Level,Exp) :-
    Level =< 2,
    Exp >= 300,
    write('Levelmu naik !!'),nl,
    levelUp(ID),!.

markLevelUp(ID,Level,Exp) :-
    Level =< 3,
    Exp >= 500,
    write('Levelmu naik !!'),nl,
    levelUp(ID),!.

markLevelUp(ID,Level,Exp) :-
    Level =< 4,
    Exp >= 700,
    write('Levelmu naik !!'),nl,
    levelUp(ID),!.

markLevelUp(ID,Level,Exp) :-
    Level =< 5,
    Exp >= 1000,
    write('Levelmu naik !!'),nl,
    levelUp(ID),!.

markLevelUp(ID,Level,Exp) :-
    Level =< 6,
    Exp >= 1300,
    write('Levelmu naik !!'),nl,
    levelUp(ID),!.

markLevelUp(ID,Level,Exp) :-
    Level =< 7,
    Exp >= 1600,
    write('Levelmu naik !!'),nl,
    levelUp(ID),!.

markLevelUp(ID,Level,Exp) :-
    Level =< 8,
    Exp >= 1900,
    write('Levelmu naik !!'),nl,
    levelUp(ID),!.

markLevelUp(ID,Level,Exp) :-
    Level =< 9,
    Exp >= 2200,
    write('Levelmu naik !!'),nl,
    levelUp(ID),!.

markLevelUp(ID,Level,Exp) :-
    Level =< 10,
    Exp >= 2500,
    write('Levelmu naik !!'),nl,
    levelUp(ID),!.

markLevelUp(ID,Level,Exp) :-
    Level =< 11,
    Exp >= 2800,
    write('Levelmu naik !!'),nl,
    levelUp(ID),!.

markLevelUp(_,_,Exp) :-
    Exp < 2801.