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
plants1(eggplant_seeds,eggplant,12).
plants1(tomato_seeds,tomato,12).
plants1(potato_seeds,potato,16).
plants1(cauliflower_seeds,cauliflower,24).
/* PLANTS 2 */
plants2(wheat_seeds,wheat,4).
plants2(corn_seeds,corn,6).
plants2(eggplant_seeds,eggplant,8).
plants2(tomato_seeds,tomato,8).
plants2(potato_seeds,potato,12).
plants2(cauliflower_seeds,cauliflower,16).

/* *** REDUCE PLANTED PLANTS GROW TIME *** */
/* Untuk mengurangi lama waktu growTime untuk setiap plants yang sudah ditanam */
reducePlantedGrowTime(_) :-
    \+plantedPlants(_,_,_,_),!
.

reducePlantedGrowTime(Time) :-
    plantedPlants(_,_,_,_),
    makeListPlantedPlants(ListofName,ListofGrowTime),
    reverseList(ListofName,ListofName2,[]),
    reverseList(ListofGrowTime,ListofGrowTime2,[]),
    reduceListPlantedGrowTime(ListofName2,ListofGrowTime2, Time),!
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
    retract(plantedPlants(A,B,PosX,PosY)),
    generateHarvestTile(A,PosX,PosY),
    reduceListPlantedGrowTime(X,Y,Time),!
.


/* Rule tambahan untuk membuat list Planted Plants */
makeListPlantedPlants(ListofName,ListofGrowTime) :-
    findall(Name, plantedPlants(Name,_,_,_), ListofName),
    findall(GrowTime, plantedPlants(_,GrowTime,_,_), ListofGrowTime),!
.

/* Rule tambahan untuk me-reverse List */
reverseList([],RevList,RevList).
reverseList([H|T],RevList,T2) :- 
    reverseList(T,RevList,[H|T2]).

/* *** DIG *** */
/* Kasus tidak memiliki shovel */
dig :-
    \+binjay(_),
    write('Anda belum tiba di Binjay!'), !.
    
dig :-
    \+inventory(_,shovel_1,_,_,_,_,_,_,_), 
    \+inventory(_,shovel_2,_,_,_,_,_,_,_),
    write('beli shovel dulu ih >:('),nl,!
.

/* Punya Shovel Level 2 */
dig :-
    positionX(X),
    positionY(Y),
    \+isDig(X,Y),
    \+isHome(X,Y),
    \+isQuest(X,Y),
    \+isMarket(X,Y),
    \+isWaterTile(X,Y,X,Y,X,Y,X,Y,X,Y,X,Y,X,Y,X,Y),
    \+isRanch(X,Y),
    \+isPlant(X,Y),
    inventory(_,shovel_2,_,_,_,_,_,_,_),
    /* Membuat dig tile di tempat berdiri, satu blok di kirinya, dan kanannya */
    write('tanahnya berhasil digali pake shovel level 2...'),nl,
    random(20,50,Exp),
    addFarmingExp(Exp),
    generateDigTileLv2,!
.

/* Punya Shovel Level 1 */
dig :-
    positionX(X),
    positionY(Y),
    \+isDig(X,Y),
    \+isHome(X,Y),
    \+isQuest(X,Y),
    \+isMarket(X,Y),
    \+isWaterTile(X,Y,X,Y,X,Y,X,Y,X,Y,X,Y,X,Y,X,Y),
    \+isRanch(X,Y),
    \+isPlant(X,Y),
    \+inventory(_,shovel_2,_,_,_,_,_,_,_),
    inventory(_,shovel_1,_,_,_,_,_,_,_),
    write('tanahnya berhasil digali pake shovel level 1...'),nl,
    random(20,50,Exp),
    addFarmingExp(Exp),
    generateDigTile,!
.

dig :-
    positionX(X),
    positionY(Y),
    isDig(X,Y),
    write('tanahnya sudah berlubang'),nl,!
.

dig :-
    positionX(X),
    positionY(Y),
    (
        isHome(X, Y),
        write('ada rumah woiii');
        (
            isQuest(X, Y),
            write('nanti gabisa kerja mampus dah');
            (
                isMarket(X,Y),
                write('kasian pemilik supermarketnya :)');
                (
                    isWaterTile(X,Y,X,Y,X,Y,X,Y,X,Y,X,Y,X,Y,X,Y),
                    write('nanti kebanjiran gesss');
                    (
                        isRanch(X,Y),
                        write('kasian ayamnya nanti');
                        (
                            isPlant(X,Y),
                            write('ada tanaman masa mau digali sih')
                        )
                    )
                )
            )
        )
    ), !
.

/* *** PLANT *** */
/* Kondisi normal (tanah sudah digali dan memiliki seeds) */
plant :-
    \+ binjay(_),
    write('Anda belum tiba di Binjay!'), !.
    
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
    write('Gaada...'),nl,!
.

/* Kondisi tanah belum digali */
plant :-
    positionX(X),
    positionY(Y),
    \+isDig(X,Y),
    write('Mau nanem di batu boss?'),nl,!
.

/* *** FUNGSI TAMBAHAN PENDUKUNG PLANT *** */
/* Kondisi tidak ada seed */
plantChosen(SeedsName) :-
    amountItem(SeedsName,Amount),
    Amount =:= 0,
    write('Emang ada ya seed itu?'),nl,!
.

/* Menanam tanaman dengan seed: SeedsName */
plantChosen(SeedsName) :-
    amountItem(SeedsName,Amount),
    Amount > 0,
    removeItems(SeedsName,1),
    myFarmingLevel(Level),
    Level < 16,
    plants1(SeedsName,PlantName,GrowTime),
    generatePlantTile(PlantName,GrowTime),
    random(50,100,Exp),
    addFarmingExp(Exp), nl,
    logoPlant,!
.

plantChosen(SeedsName) :-
    inventory(_,SeedsName,_,_,_,_,_,_,_),
    removeItems(SeedsName,1),
    myFarmingLevel(Level),
    Level >= 16,
    plants2(SeedsName,PlantName,GrowTime),
    generatePlantTile(PlantName,GrowTime),
    random(50,100,Exp),
    addFarmingExp(Exp), nl,
    logoPlant,!
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
displayFarm :-
    \+plantedPlants(_,_,_,_),
    \+harvest(_,_,_),
    write('Belum ada tanaman yang ditanam atau siap panen'),nl,!
.

displayFarm :-
    harvest(_,_,_),
    plantedPlants(_,_,_,_),
    findall(NameHarvest, harvest(NameHarvest,_,_), ListofNameHarvest),
    findall(XHarvest, harvest(_,XHarvest,_), ListofXHarvest),
    findall(YHarvest, harvest(_,_,YHarvest), ListofYHarvest),
    findall(NamePlant, plantedPlants(NamePlant,_,_,_), ListofNamePlant),
    findall(GT, plantedPlants(_,GT,_,_), ListofGT),
    findall(XPlant, plantedPlants(_,_,XPlant,_), ListofXPlant),
    findall(YPlant, plantedPlants(_,_,_,YPlant), ListofYPlant),
    reverseList(ListofNameHarvest,ListofNameHarvest2,[]),
    reverseList(ListofXHarvest,ListofXHarvest2,[]),
    reverseList(ListofYHarvest,ListofYHarvest2,[]),
    reverseList(ListofNamePlant,ListofNamePlant2,[]),
    reverseList(ListofGT,ListofGT2,[]),
    reverseList(ListofXPlant,ListofXPlant2,[]),
    reverseList(ListofYPlant,ListofYPlant2,[]),
    write('Farm status:'),nl,nl,
    displayFarmCrops(ListofNameHarvest2,ListofXHarvest2,ListofYHarvest2,ListofNamePlant2,ListofGT2,ListofXPlant2,ListofYPlant2),!
.

displayFarm :-
    \+harvest(_,_,_),
    plantedPlants(_,_,_,_),
    findall(NamePlant, plantedPlants(NamePlant,_,_,_), ListofNamePlant),
    findall(GT, plantedPlants(_,GT,_,_), ListofGT),
    findall(XPlant, plantedPlants(_,_,XPlant,_), ListofXPlant),
    findall(YPlant, plantedPlants(_,_,_,YPlant), ListofYPlant),
    reverseList(ListofNamePlant,ListofNamePlant2,[]),
    reverseList(ListofGT,ListofGT2,[]),
    reverseList(ListofXPlant,ListofXPlant2,[]),
    reverseList(ListofYPlant,ListofYPlant2,[]),
    write('Farm status:'),nl,nl,
    displayFarmCrops([],[],[],ListofNamePlant2,ListofGT2,ListofXPlant2,ListofYPlant2),!
.

displayFarm :-
    harvest(_,_,_),
    \+plantedPlants(_,_,_,_),
    findall(NameHarvest, harvest(NameHarvest,_,_), ListofNameHarvest),
    findall(XHarvest, harvest(_,XHarvest,_), ListofXHarvest),
    findall(YHarvest, harvest(_,_,YHarvest), ListofYHarvest),
    reverseList(ListofNameHarvest,ListofNameHarvest2,[]),
    reverseList(ListofXHarvest,ListofXHarvest2,[]),
    reverseList(ListofYHarvest,ListofYHarvest2,[]),
    write('Farm status:'),nl,nl,
    displayFarmCrops(ListofNameHarvest2,ListofXHarvest2,ListofYHarvest2,[],[],[],[]),!
.

displayFarmCrops([],[],[],[],[],[],[]).
displayFarmCrops([A|M],[B|N],[C|O],D,E,F,G) :-
    printItemName(A), write(' di ('), write(B),write(','), write(C), write(') sudah siap panen ya'), nl,
    displayFarmCrops(M,N,O,D,E,F,G),!
.
displayFarmCrops([],[],[],[D|P],[E|Q],[F|R],[G|S]) :-
    printItemName(D), write(' di ('), write(F), write(','), write(G), write('): sisa '), write(E), write(' jam lagi'), nl,
    displayFarmCrops([],[],[],P,Q,R,S),!
.

harvest:-
    positionX(X),
    positionY(Y),
    harvest(HarvestProduct,X,Y),
    (
        HarvestProduct == wheat ->
        (
            addItems(HarvestProduct,1),
            random(100,150,Exp),
            addFarmingExp(Exp),
            retract(harvest(HarvestProduct,X,Y))
        );
        HarvestProduct == corn ->
        (
            addItems(HarvestProduct,1),
            random(100,200,Exp),
            addFarmingExp(Exp),
            retract(harvest(HarvestProduct,X,Y))
        );
        HarvestProduct == eggplant ->
        (
            addItems(HarvestProduct,1),
            random(150,250,Exp),
            addFarmingExp(Exp),
            retract(harvest(HarvestProduct,X,Y))
        );
        HarvestProduct == tomato ->
        (
            addItems(HarvestProduct,1),
            random(150,250,Exp),
            addFarmingExp(Exp),
            retract(harvest(HarvestProduct,X,Y))
        );
        HarvestProduct == potato ->
        (
            random(2,5,Amount),
            addItems(HarvestProduct,Amount),
            random(100,150,Exp),
            TotalExp is Exp*Amount,
            addFarmingExp(TotalExp),
            retract(harvest(HarvestProduct,X,Y))
        );
        HarvestProduct == cauliflower ->
        (
            addItems(HarvestProduct,1),
            random(450,500,Exp),
            addFarmingExp(Exp),
            retract(harvest(HarvestProduct,X,Y))
        )
    ),!
.

harvest:-
    positionX(X),
    positionY(Y),
    \+harvest(_,X,Y),
    write('Tidak ada tanaman yang dapat di panen disini'),nl,!.