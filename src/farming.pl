:- dynamic(plants1/3).
/* Berlaku untuk pemain dengan level farming < 16 */
/* plants1(seedsName,plantName,growTime) */
:- dynamic(plants2/3).
/* Berlaku untuk pemain dengan level farming >= 16 */
/* plants2(seedsName,plantName,growTime) */

/* *** FACTS *** */
/* PLANTS 1 */
plants1(wheat_seeds,wheat,6).
plants1(corn_seeds,corn,8).
plants1(eggplant_seeds,eggplant,8).
plants1(tomato_seeds,tomato,12).
plants1(potato_seeds,potato,12).
plants1(cauliflower_seeds,cauliflower,24).
/* PLANTS 2 */
plants2(wheat_seeds,wheat,4).
plants2(corn_seeds,corn,6).
plants2(eggplant_seeds,eggplant,6).
plants2(tomato_seeds,tomato,8).
plants2(potato_seeds,potato,8).
plants2(cauliflower_seeds,cauliflower,16).

/* *** REDUCE PLANTED PLANTS GROW TIME *** */
/* Untuk mengurangi lama waktu growTime untuk setiap plants yang sudah ditanam */
reducePlantedGrowTime(_) :-
    \+plantedPlants(_,_,_,_),!
.

reducePlantedGrowTime(Time) :-
    plantedPlants(_,_,_,_),
    makeListPlantedPlants(ListofName,ListofGrowTime),
    reduceListPlantedGrowTime(ListofName,ListofGrowTime, Time),!
.

/* Rule tambahan untuk mengurangi waktu growTime dari list Planted Plants */
reduceListPlantedGrowTime([], [], _).
reduceListPlantedGrowTime([A|X], [B|Y], Time) :-
    B > 1,
    B2 is B - Time,
    retract(plantedPlants(A,B,PosX,PosY)),
    asserta(plantedPlants(A,B2,PosX,PosY)),
    reduceListPlantedGrowTime(X,Y,Time),!.
reduceListPlantedGrowTime([A|X], [B|Y], Time) :-
    B =< 1,
    write('sini'),
    retract(plantedPlants(A,B,PosX,PosY)),
    generateHarvestTile(A,PosX,PosY),
    reduceListPlantedGrowTime(X,Y,Time),!
.

/* Rule tambahan untuk membuat list Planted Plants */
makeListPlantedPlants(ListofName,ListofGrowTime) :-
    findall(Name, plantedPlants(Name,_,_,_), ListofName),
    findall(GrowTime, plantedPlants(_,GrowTime,_,_), ListofGrowTime),!
.

/* *** DIG *** */
/* Kasus tidak memiliki shovel */
dig :-
    \+inventory(_,shovel_1,_,_,_,_,_,_,_), 
    \+inventory(_,shovel_2,_,_,_,_,_,_,_),
    write('beli shovel dulu ih >:('),!
.

/* Punya Shovel Level 1 */
dig :-
    inventory(_,shovel_1,_,_,_,_,_,_,_), 
    generateDigTile,!
.

/* Punya Shovel Level 2 */
dig :-
    inventory(_,shovel_2,_,_,_,_,_,_,_),
    /* Membuat dig tile di tempat berdiri, satu blok di kirinya, dan kanannya */
    generateDigTileLv2,!
.

/* *** PLANT *** */
/* Kondisi normal (tanah sudah digali dan memiliki seeds) */
plant :-
    positionX(X),
    positionY(Y),
    isDig(X,Y),
    makeListItems2(ListofID,ListofQty,ListofName),
    countSeeds(ListofID,ListofQty,ListofName,Sum),
    Sum > 0,
    write('Seeds dalam inventory:'),nl,nl,
    displaySeeds(ListofID,ListofQty,ListofName),
    nl,write('Mau nanem yang mana? (Contoh penulisan: corn_seeds, wheat_seeds)'),nl,
    read(SeedsName),
    plantChosen(SeedsName),!
.

/* Kondisi tidak memiliki seeds */
plant :-
    positionX(X),
    positionY(Y),
    isDig(X,Y),
    makeListItems2(ListofID,ListofQty,ListofName),
    countSeeds(ListofID,ListofQty,ListofName,Sum),
    Sum =:= 0,
    write('Seeds dalam inventory:'),nl,nl,
    write('Gaada...'),!
.

/* Kondisi tanah belum digali */
plant :-
    positionX(X),
    positionY(Y),
    \+isDig(X,Y),
    write('Mau nanem di batu boss?'),!
.

/* *** FUNGSI TAMBAHAN PENDUKUNG PLANT *** */
/* Kondisi tidak ada seed */
plantChosen(SeedsName) :-
    amountItem(SeedsName,Amount),
    Amount =:= 0,
    write('Emang ada ya seed itu?'),!
.

/* Menanam tanaman dengan seed: SeedsName */
plantChosen(SeedsName) :-
    amountItem(SeedsName,Amount),
    Amount > 0,
    removeItems(SeedsName,1),
    myFarmingLevel(Level),
    Level < 16,
    plants1(SeedsName,PlantName,GrowTime),
    generatePlantTile(PlantName,GrowTime),!
.

plantChosen(SeedsName) :-
    inventory(_,SeedsName,_,_,_,_,_,_,_),
    removeItems(SeedsName,1),
    myFarmingLevel(Level),
    Level >= 16,
    plants2(SeedsName,PlantName,GrowTime),
    generatePlantTile(PlantName,GrowTime),!
.

countSeeds([],[],[],0).
countSeeds([A|X],[B|Y],[_|Z],Sum) :-
    A >= 27,
    A =< 32,
    B > 0,
    countSeeds(X,Y,Z,Sum1),
    Sum is B + Sum1,!
.
countSeeds([A|X],[B|Y],[_|Z],Sum) :-
    A >= 27,
    A =< 32,
    B =< 0,
    countSeeds(X,Y,Z,Sum),!
.
countSeeds([A|X],[_|Y],[_|Z],Sum) :-
    A < 27,
    countSeeds(X,Y,Z,Sum),!
.
countSeeds([A|X],[_|Y],[_|Z],Sum) :-
    A > 33,
    countSeeds(X,Y,Z,Sum),!
.

/* *** DISPLAY SEEDS *** */
displaySeeds([],[],[]).
displaySeeds([A|X],[B|Y],[C|Z]) :-
    A >= 27,
    A =< 32,
    B > 0,
    write(B), write(' '), printItemName(C), nl,
    displaySeeds(X,Y,Z),!
.
displaySeeds([A|X],[B|Y],[_|Z]) :-
    A >= 27,
    A =< 32,
    B =< 0,
    displaySeeds(X,Y,Z),!
.
displaySeeds([A|X],[_|Y],[_|Z]) :-
    A < 27,
    displaySeeds(X,Y,Z),!
.
displaySeeds([A|X],[_|Y],[_|Z]) :-
    A > 33,
    displaySeeds(X,Y,Z),!
.

/* FUNGSI TAMBAHAN */
makeListItems2(ListofID,ListofQty,ListofName) :-
    findall(ID, inventory(ID,_,_,_,_,_,_,_,_), ListofID),
    findall(Qty, inventory(_,_,Qty,_,_,_,_,_,_), ListofQty),
    findall(Name, inventory(_,Name,_,_,_,_,_,_,_), ListofName),!
.

/* *** FARM STATUS *** */
farmstatus :-
    \+plantedPlants(_,_,_,_),
    write('Belum ada tanaman yang ditanam'),!
.

farmstatus :-
    harvest(_,_,_),
    plantedPlants(_,_,_,_),
    findall(NameHarvest, harvest(NameHarvest,_,_), ListofNameHarvest),
    findall(X1, harvest(_,_,X1,_), ListofX1),
    findall(Y1, harvest(_,_,_,Y1), ListofY1),
    findall(Name, plantedPlants(Name,_,_,_), ListofName),
    findall(GT, plantedPlants(_,GT,_,_), ListofGT),
    findall(X2, plantedPlants(_,_,X2,_), ListofX2),
    findall(Y2, plantedPlants(_,_,_,Y2), ListofY2),
    write('Farm status:'),nl,nl,
    displayFarm(ListofNameHarvest,ListofX1,ListofY1,ListofName,ListofGT,ListofX2,ListofY2),!
.

farmstatus :-
    \+harvest(_,_,_),
    plantedPlants(_,_,_,_),
    findall(Name, plantedPlants(Name,_,_,_), ListofName),
    findall(GT, plantedPlants(_,GT,_,_), ListofGT),
    findall(X2, plantedPlants(_,_,X2,_), ListofX2),
    findall(Y2, plantedPlants(_,_,_,Y2), ListofY2),
    write('Farm status:'),nl,nl,
    displayFarm([],[],[],ListofName,ListofGT,ListofX2,ListofY2),!
.

displayFarm([],[],[],[],[],[],[]).
displayFarm([A|M],[B|N],[C|O],D,E,F,G) :-
    printItemName(A), write(' di ('), write(B),write(','), write(C), write(') sudah siap panen ya'),nl,
    displayFarm(M,N,O,D,E,F,G),!
.
displayFarm([],[],[],[D|P],[E|Q],[F|R],[G|S]) :-
    printItemName(D), write(' di ('), write(F), write(','), write(G), write('): sisa '), write(E), write(' jam lagi'),nl,
    displayFarm([],[],[],P,Q,R,S),!
.