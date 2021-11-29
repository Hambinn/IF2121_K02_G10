/* ***** RANDOM FISHING ROD 1 ***** */
/* Dapet Junk Item */
randomFishRod1(TypeFish) :-
    TypeFish =< 50,
    write('You didnt get anything!'),nl,
    addFishingExp(100),
    addWaktu(6),!.

/* Dapet Common Item */
randomFishRod1(TypeFish) :-
    TypeFish > 50,
    addItems(TypeFish,1),nl,
    addFishingExp(200),
    addWaktu(6),!.

/* ***** RANDOM FISHING ROD 2 ***** */
/* Dapet Junk Item */
randomFishRod2(TypeFish) :-
    TypeFish =< 50,
    write('You didnt get anything!'),nl,
    addFishingExp(100),
    addWaktu(6),!.

/* Dapet Common Item */
randomFishRod2(TypeFish) :-
    TypeFish > 50,
    addItems(TypeFish,2),nl,
    addFishingExp(300),
    addWaktu(6),!.

/* ***** FISHING ***** */
fish :-
    positionX(X),
    positionY(Y),
    Top is Y - 1,
    Left is X - 1,
    Right is X + 1,
    Bot is Y + 1,
    (
        isWaterTile(Left,Y,Left,Y,Left,Y,Left,Y,Left,Y,Left,Y,Left,Y,Left,Y),
        realFish;
        (
            isWaterTile(Right,Y,Right,Y,Right,Y,Right,Y,Right,Y,Right,Y,Right,Y,Right,Y),
            realFish;
            (
                isWaterTile(X,Top,X,Top,X,Top,X,Top,X,Top,X,Top,X,Top,X,Top),
                realFish;
                (
                    isWaterTile(X,Bot,X,Bot,X,Bot,X,Bot,X,Bot,X,Bot,X,Bot,X,Bot),
                    realFish;
                    (
                        write('Gak ada air mau mancing dimana oiii')
                    )
                )
            )
        )
    ), !.

/* Gapunya Fishing Rod */
realFish :-
    binjay(_),
    \+inventory(_,fishing_rod_1,_,_,_,_,_,_,_), 
    \+inventory(_,fishing_rod_2,_,_,_,_,_,_,_),
    write('beli fishing rod dulu >:('),!.

/* Punya Fishing Rod 1 */
realFish :-
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

/* Punya Fishing Rod 2 */
realFish :-
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