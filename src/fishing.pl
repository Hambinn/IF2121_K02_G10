/* ***** RANDOM FISHING ROD 1 ***** */
/* Dapet Junk Item */
randomFishRod1(TypeFish) :-
    TypeFish =< 50,
    write('You didnt get anything!'),nl,
    addFishingExp(2),!.

/* Dapet Common Item */
randomFishRod1(TypeFish) :-
    TypeFish > 50,
    addItems(TypeFish,1),nl,
    addFishingExp(30),!.

/* ***** RANDOM FISHING ROD 2 ***** */
/* Dapet Junk Item */
randomFishRod2(TypeFish) :-
    TypeFish =< 50,
    write('You didnt get anything!'),nl,
    addFishingExp(5),!.

/* Dapet Common Item */
randomFishRod2(TypeFish) :-
    TypeFish > 50,
    addItems(TypeFish,2),nl,
    addFishingExp(50),!.

/* ***** FISHING ***** */
/* Gapunya Fishing Rod */
fish :-
    binjay(_),
    \+inventory(_,fishing_rod_1,_,_,_,_,_,_,_), 
    \+inventory(_,fishing_rod_2,_,_,_,_,_,_,_),
    write('beli fishing rod dulu >:('),!.

/* Punya Fishing Rod 1 */
fish :-
    binjay(_),
    inventory(_,fishing_rod_1,_,_,_,_,_,_,_), 
    myFishingLevel(Level),
    ( Level =< 15 ->
        random(48,54,TypeFish),
        Z is TypeFish,
        randomFishRod1(Z)
    ;
        ( Level > 15 ->
            random(49,58,TypeFish),
            Z is TypeFish,

            randomFishRod1(Z)
        )
    ),
    !.

/* Punya Fishing Rod 1 */
fish :-
    binjay(_),
    inventory(_,fishing_rod_2,_,_,_,_,_,_,_), 
    myFishingLevel(Level),
    ( Level =< 15 ->
        random(48,54,TypeFish),
        Z is TypeFish,
        randomFishRod2(Z)
    ;
        ( Level > 15 ->
            random(49,58,TypeFish),
            Z is TypeFish,

            randomFishRod2(Z)
        )
    ),
    !.