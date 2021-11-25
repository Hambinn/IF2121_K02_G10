:- dynamic(plants/2).
/* plants(itemName,growTime) */
:- dynamic(plantedPlants/2).
/* plantedPlants(itemName,growTime) */

/* *** REDUCE PLANTED PLANTS GROW TIME *** */
/* Untuk mengurangi lama waktu growTime untuk setiap plants yang sudah ditanam */
reducePlantedGrowTime :-
    makeListPlantedPlants(ListofName,ListofGrowTime),
    reduceListPlantedGrowTime(ListofName,ListofGrowTime),!
.

/* Rule tambahan untuk mengurangi waktu growTime dari list Planted Plants */
reduceListPlantedGrowTime([], []).
reduceListPlantedGrowTime([A|X], [B|Y]) :-
    B > 0,
    B2 is B - 1,
    retract(plantedPlants(A,B)),
    asserta(plantedPlants(A,B2)),
    reduceListGrowTime(X,Y),!.
reduceListPlantedGrowTime([_|X], [B|Y]) :-
    B == 0,
    reduceListPlantedGrowTime(X,Y),!
.

/* Rule tambahan untuk membuat list Planted Plants */
makeListPlantedPlants(ListofName,ListofGrowTime) :-
    findall(Name, plantedPlants(Name,_), ListofName),
    findall(GrowTime, plantedPlants(_,GrowTime), ListofGrowTime),!
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