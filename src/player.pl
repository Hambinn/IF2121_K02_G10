:- dynamic(infoStats/10).
/* infoStats(role, generalLevel, farmingLevel, farmingExp, fishingLevel, farmingExp, ranchingLevel, ranchingExp, generalExp, money) */

/* status */
/* Mencetak:
    - Role
    - General level
    - Farming level
    - Farming Exp
    - Fishing Level
    - Fishing Exp
    - Ranching Level
    - Ranching Exp
    - General Exp
    - Money */
status :-
    binjay(_),
    infoStats(Role, GeneralLevel, FarmingLevel, FarmingExp, FishingLevel, FishingExp, RanchingLevel, RanchingExp, GeneralExp, Money),
    write('Your status: '),nl,
    write('Role: '), write(Role), nl,
    write('Level: '), write(GeneralLevel), nl,
    write('Level Farming: '), write(FarmingLevel), nl,
    write('Exp Farming: '), write(FarmingExp), nl,
    write('Level Fishing: '), write(FishingLevel), nl,
    write('Exp Fishing: '), write(FishingExp), nl,
    write('Level Ranching: '), write(RanchingLevel), nl,
    write('Exp Ranching: '), write(RanchingExp), nl,
    write('Exp: '), write(GeneralExp), write('/300'), nl,
    write('Gold: '), write(Money), nl, 
    showWaktu,!
.

status :-
    \+binjay(_),
    write('game belum mulai oi').

setStatus(Role, GeneralLevel, FarmingLevel, FarmingExp, FishingLevel, FishingExp, RanchingLevel, RanchingExp, GeneralExp, Money) :-
    asserta(infoStats(Role, GeneralLevel, FarmingLevel, FarmingExp, FishingLevel, FishingExp, RanchingLevel, RanchingExp, GeneralExp, Money)),!
.

/* ****** GENERAL LEVEL & EXP ****** *.
/* MY GENERAL LEVEL */
myGeneralLevel(GeneralLevel) :-
    infoStats(_, _, _, _, _, _, _, _, GeneralLevel, _),!
.

/* ADD GENERAL EXP */
/* Kondisi jika exp general ditambahkan tidak akan menambah level general */
addGeneralExp(Amount) :-
    infoStats(_, _, _, _, _, _, _, _, GeneralExp, _),
    GeneralExp2 is GeneralExp + Amount,
    GeneralExp2 =< 300,
    write('Exp anda bertambah sebanyak '), write(Amount), nl,
    retract(infoStats(Role, GeneralLevel, FarmingLevel, FarmingExp, FishingLevel, FishingExp, RanchingLevel, RanchingExp, GeneralExp, Money)),
    asserta(infoStats(Role, GeneralLevel, FarmingLevel, FarmingExp, FishingLevel, FishingExp, RanchingLevel, RanchingExp, GeneralExp2, Money)),!
.

/* Kondisi jika exp general ditambahkan akan menambah level general */
addGeneralExp(Amount) :-
    infoStats(_, GeneralLevel, _, _, _, _, _, _, GeneralExp, _),
    GeneralExpTemp is GeneralExp + Amount,
    GeneralExpTemp > 300,
    write('Exp anda bertambah sebanyak '), write(Amount), nl,
    GeneralLevelTemp is GeneralExpTemp // 300,
    GeneralLevel2 is GeneralLevel + GeneralLevelTemp,
    GeneralExp2 is GeneralExpTemp mod 300,
    write('General level anda bertambah '), write(GeneralLevelTemp), write(' menjadi '), write(GeneralLevel2), nl,
    retract(infoStats(Role, GeneralLevel, FarmingLevel, FarmingExp, FishingLevel, FishingExp, RanchingLevel, RanchingExp, GeneralExp, Money)),
    asserta(infoStats(Role, GeneralLevel2, FarmingLevel, FarmingExp, FishingLevel, FishingExp, RanchingLevel, RanchingExp, GeneralExp2, Money)),!
.

/* ****** FARMING LEVEL & EXP ****** *.
/* MY FARMING LEVEL */
myFarmingLevel(FarmingLevel) :-
    infoStats(_, _, FarmingLevel, _, _, _, _, _, _, _),!
.

/* MY FARMING EXP */
myFarmingExp(FarmingExp) :-
    infoStats(_, _, _, FarmingExp, _, _, _, _, _, _),!
.

/* ADD FARMING EXP */
/* Kondisi jika exp farming ditambahkan tidak akan menambah level farming */
addFarmingExp(Amount) :-
    infoStats(_, _, _, FarmingExp, _, _, _, _, _, _),
    FarmingExp2 is FarmingExp + Amount,
    FarmingExp2 =< 300,
    write('Exp farming anda bertambah sebanyak '), write(Amount), nl,
    retract(infoStats(Role, GeneralLevel, FarmingLevel, FarmingExp, FishingLevel, FishingExp, RanchingLevel, RanchingExp, GeneralExp, Money)),
    asserta(infoStats(Role, GeneralLevel, FarmingLevel, FarmingExp2, FishingLevel, FishingExp, RanchingLevel, RanchingExp, GeneralExp, Money)),
    addGeneralExp(Amount),!
.

/* Kondisi jika exp farming ditambahkan akan menambah level farming */
addFarmingExp(Amount) :-
    infoStats(_, _, FarmingLevel, FarmingExp, _, _, _, _, _, _),
    FarmingExpTemp is FarmingExp + Amount,
    FarmingExpTemp > 300,
    write('Exp farming anda bertambah sebanyak '), write(Amount), nl,
    FarmingLevelTemp is FarmingExpTemp // 300,
    FarmingLevel2 is FarmingLevel + FarmingLevelTemp,
    FarmingExp2 is FarmingExpTemp mod 300,
    write('Farming level anda bertambah '), write(FarmingLevelTemp), write(' menjadi '), write(FarmingLevel2), nl,
    retract(infoStats(Role, GeneralLevel, FarmingLevel, FarmingExp, FishingLevel, FishingExp, RanchingLevel, RanchingExp, GeneralExp, Money)),
    asserta(infoStats(Role, GeneralLevel, FarmingLevel2, FarmingExp2, FishingLevel, FishingExp, RanchingLevel, RanchingExp, GeneralExp, Money)),
    addGeneralExp(Amount),!
.

/* ****** FISHING LEVEL & EXP ****** *.
/* MY FISHING LEVEL */
myFishingLevel(FishingLevel) :-
    infoStats(_, _, _, _, FishingLevel, _, _, _, _, _),!
.

/* MY FISHING EXP */
myFishingExp(FishingExp) :-
    infoStats(_, _, _, _, _, FishingExp, _, _, _, _),!
.

/* ADD Fishing EXP */
/* Kondisi jika exp Fishing ditambahkan tidak akan menambah level Fishing */
addFishingExp(Amount) :-
    infoStats(_, _, _, _, _, FishingExp, _, _, _, _),
    FishingExp2 is FishingExp + Amount,
    FishingExp2 =< 300,
    write('Exp fishing anda bertambah sebanyak '), write(Amount), nl,
    retract(infoStats(Role, GeneralLevel, FarmingLevel, FarmingExp, FishingLevel, FishingExp, RanchingLevel, RanchingExp, GeneralExp, Money)),
    asserta(infoStats(Role, GeneralLevel, FarmingLevel, FarmingExp, FishingLevel, FishingExp2, RanchingLevel, RanchingExp, GeneralExp, Money)),
    addGeneralExp(Amount),!
.

/* Kondisi jika exp Fishing ditambahkan akan menambah level Fishing */
addFishingExp(Amount) :-
    infoStats(_, _, _, _, FishingLevel, FishingExp, _, _, _, _),
    FishingExpTemp is FishingExp + Amount,
    FishingExpTemp > 300,
    write('Exp fishing anda bertambah sebanyak '), write(Amount), nl,
    FishingLevelTemp is FishingExpTemp // 300,
    FishingLevel2 is FishingLevel + FishingLevelTemp,
    FishingExp2 is FishingExpTemp mod 300,
    write('Fishing level anda bertambah '), write(FishingLevelTemp), write(' menjadi '), write(FishingLevel2), nl,
    retract(infoStats(Role, GeneralLevel, FarmingLevel, FarmingExp, FishingLevel, FishingExp, RanchingLevel, RanchingExp, GeneralExp, Money)),
    asserta(infoStats(Role, GeneralLevel, FarmingLevel, FarmingExp, FishingLevel2, FishingExp2, RanchingLevel, RanchingExp, GeneralExp, Money)),
    addGeneralExp(Amount),!
.

/* ****** RANCHING LEVEL & EXP ****** *.
/* MY RANCHING LEVEL */
myRanchingLevel(RanchingLevel) :-
    infoStats(_, _, _, _, _, _, RanchingLevel, _, _, _),!
.

/* MY RANCHING EXP */
myRanchingExp(RanchingExp) :-
    infoStats(_, _, _, _, _, _, _, RanchingExp, _, _),!
.

/* ADD RANCHING EXP */
/* Kondisi jika exp Ranching ditambahkan tidak akan menambah level Ranching */
addRanchingExp(Amount) :-
    infoStats(_, _, _, _, _, _, _, RanchingExp, _, _),
    RanchingExp2 is RanchingExp + Amount,
    RanchingExp2 =< 300,
    write('Exp ranching anda bertambah sebanyak '), write(Amount), nl,
    retract(infoStats(Role, GeneralLevel, FarmingLevel, FarmingExp, FishingLevel, FishingExp, RanchingLevel, RanchingExp, GeneralExp, Money)),
    asserta(infoStats(Role, GeneralLevel, FarmingLevel, FarmingExp, FishingLevel, FishingExp, RanchingLevel, RanchingExp2, GeneralExp, Money)),
    addGeneralExp(Amount),!
.

/* Kondisi jika exp Ranching ditambahkan akan menambah level Ranching */
addRanchingExp(Amount) :-
    infoStats(_, _, _, _, _, _, RanchingLevel, RanchingExp, _, _),
    RanchingExpTemp is RanchingExp + Amount,
    RanchingExpTemp > 300,
    write('Exp ranching anda bertambah sebanyak '), write(Amount), nl,
    RanchingLevelTemp is RanchingExpTemp // 300,
    RanchingLevel2 is RanchingLevel + RanchingLevelTemp,
    RanchingExp2 is RanchingExpTemp mod 300,
    write('Ranching level anda bertambah '), write(RanchingLevelTemp), write(' menjadi '), write(RanchingLevel2), nl,
    retract(infoStats(Role, GeneralLevel, FarmingLevel, FarmingExp, FishingLevel, FishingExp, RanchingLevel, RanchingExp, GeneralExp, Money)),
    asserta(infoStats(Role, GeneralLevel, FarmingLevel, FarmingExp, FishingLevel, FishingExp, RanchingLevel2, RanchingExp2, GeneralExp, Money)),
    addGeneralExp(Amount),!
.

/* ****** MONEY ****** *.
/* MY MONEY */
myMoney(Money) :-
    infoStats(_, _, _, _, _, _, _, _, _, Money),!
.

/* ADD MONEY */
addMoney(Amount) :-
    infoStats(_, _, _, _, _, _, _, _, _, Money),
    Money2 is Money + Amount,
    retract(infoStats(Role, GeneralLevel, FarmingLevel, FarmingExp, FishingLevel, FishingExp, RanchingLevel, RanchingExp, GeneralExp, Money)),
    asserta(infoStats(Role, GeneralLevel, FarmingLevel, FarmingExp, FishingLevel, FishingExp, RanchingLevel, RanchingExp, GeneralExp, Money2)),nl,
    (
        Money2 >= 20000,
        endState, sleep(2);
        (
            write('')
        )
    ),
    !
.

/* REDUCE MONEY */
reduceMoney(Amount) :-
    infoStats(_, _, _, _, _, _, _, _, _, Money),
    Money2 is Money - Amount,
    retract(infoStats(Role, GeneralLevel, FarmingLevel, FarmingExp, FishingLevel, FishingExp, RanchingLevel, RanchingExp, GeneralExp, Money)),
    asserta(infoStats(Role, GeneralLevel, FarmingLevel, FarmingExp, FishingLevel, FishingExp, RanchingLevel, RanchingExp, GeneralExp, Money2)),!
.

/* ***** WAKTU ***** */
addWaktu(Jumlah) :-
    waktu(Jam, Hari),
    reducePlantedGrowTime(Jumlah),
    NewJam is Jam + Jumlah,
    (
        NewJam >= 24,
        NewHari is Hari + 1,
        NewHari > 25,
        endState;
        (
            NewJam >= 24,
            UpdateJam is NewJam - 24,
            NewHari is Hari + 1,
            retract(waktu(Jam, Hari)),
            asserta(waktu(UpdateJam, NewHari));
            (
                retract(waktu(Jam, Hari)),
                asserta(waktu(NewJam, Hari))
            )
        )
    ), 
    updateTimeRanch(Jumlah),!.

addWaktu(Jumlah) :-
    waktu(Jam, Hari),
    reducePlantedGrowTime(Jumlah),
    NewJam is Jam + Jumlah,
    (
        NewJam >= 24,
        NewHari is Hari + 1,
        NewHari > 25,
        endState;
        (
            NewJam >= 24,
            UpdateJam is NewJam - 24,
            NewHari is Hari + 1,
            retract(waktu(Jam, Hari)),
            asserta(waktu(UpdateJam, NewHari));
            (
                retract(waktu(Jam, Hari)),
                asserta(waktu(NewJam, Hari))
            )
        )
    ), 
    updateTimeRanch(Jumlah), !.

addHari(Jumlah) :-
    waktu(Jam,_),
    NextDayJam is 24 - Jam,
    TotalJam is NextDayJam + (Jumlah-1)*24,
    addWaktu(TotalJam),!
.

showWaktu :-
    waktu(Jam, Hari),
    write('Hari : '), write(Hari),nl,
    write('Jam  : '), write(Jam), nl
.

showHari(Day) :-
    waktu(_, Hari),
    Day is Hari, !
.