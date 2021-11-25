:- dynamic(lebar/1).
:- dynamic(panjang/1).
:- dynamic(positionX/1).
:- dynamic(positionY/1).
:- dynamic(quest/2).
:- dynamic(questTile/1).
:- dynamic(market/2).
:- dynamic(marketTile/1).
:- dynamic(ranch/2).
:- dynamic(ranchTile/1).
:- dynamic(waterTile/1).
:- dynamic(water/16).
:- dynamic(dig/2).
:- dynamic(plant/2).
:- dynamic(harvest/2).


/*Fungsi untuk membuat Water Tile Random*/
generateWater :-
    asserta(waterTile(1)),
    lebar(L),
    panjang(P),
    NewP is P-2,
    NewL is L-2,
    random(2,NewP,TX1),
    random(2,NewP,TX2),
    random(2,NewP,TX3),
    random(2,NewP,TX4),
    random(2,NewP,TX5),
    random(2,NewP,TX6),
    random(2,NewP,TX7),
    random(2,NewP,TX8),
    random(2,NewL,TY1),
    random(2,NewL,TY2),
    random(2,NewL,TY3),
    random(2,NewL,TY4),
    random(2,NewL,TY5),
    random(2,NewL,TY6),
    random(2,NewL,TY7),
    random(2,NewL,TY8),
    asserta(water(TX1,TY1,TX2,TY2,TX3,TY3,TX4,TY4,TX5,TY5,TX6,TY6,TX7,TY7,TX8,TY8)).

generateQuestTile :-
    asserta(questTile(1)),
    lebar(L),
    panjang(P),
    NewP is P,
    random(15, L, X),
    random(1, NewP, Y),
    asserta(quest(X, Y)).

generateRanchTile :-
    asserta(ranchTile(1)),
    panjang(P),
    random(1, 2, X),
    random(1, P, Y),
    asserta(ranch(X, Y)).

generateMarketTile :-
    asserta(marketTile(1)),
    lebar(L),
    NewL is L-2,
    random(2, NewL, X),
    random(1, 2, Y),
    asserta(market(X, Y)).

generateDigTile :-
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
    ), !.

generateDigTile :-
    positionX(X),
    positionY(Y),
    \+isQuest(X,Y),
    \+isMarket(X,Y),
    \+isWaterTile(X,Y,X,Y,X,Y,X,Y,X,Y,X,Y,X,Y,X,Y),
    \+isHome(X,Y),
    \+isRanch(X,Y),
    \+isDig(X, Y),
    \+isPlant(X, Y),
    asserta(dig(X, Y)), !.

generatePlantTile :-
    positionX(X),
    positionY(Y),
    isDig(X,Y),
    retract(dig(X, Y)),
    asserta(plant(X, Y)), write('tanaman berhasil ditanam, jangan lupa panen ya') , !.

generatePlantTile :-
    positionX(X),
    positionY(Y),
    \+ dig(X,Y),
    write('mau nanam di batu bosss?'), !.

generateHarvestTile :-
    plant(_,_),
    waktu(24, Hari),
    Hari =:= 39,
    forall(plant(X,Y),(
        retract(plant(X,Y)),
        asserta(harvest(X,Y))
    )), !.

isWaterTile(X1,Y1,X2,Y2,X3,Y3,X4,Y4,X5,Y5,X6,Y6,X7,Y7,X8,Y8) :-
    water(TX1,TY1,TX2,TY2,TX3,TY3,TX4,TY4,TX5,TY5,TX6,TY6,TX7,TY7,TX8,TY8),
    (
        (
            X1 == TX1,
            Y1 == TY1
        );
        (
            X2 == TX2,
            Y2 == TY2
        );
        (
            X3 == TX3,
            Y3 == TY3
        );
        (
            X4 == TX4,
            Y4 == TY4
        ); 
        (   
            X5 == TX5,
            Y5 == TY5
        );
        (
            X6 == TX6,
            Y6 == TY6
        );
        (   
            X7 == TX7,
            Y7 == TY7
        );
        (   
            X8 == TX8,
            Y8 == TY8
        )
    ).

isHome(X,Y) :-
    X =:= 8,
    Y =:= 16.

isPlayer(X,Y) :-
    positionX(A),
    positionY(B),
    X =:= A,
    Y =:= B.

isQuest(X,Y) :-
    quest(X1, Y1),
    X =:= X1,
    Y =:= Y1.

isRanch(X,Y) :-
    ranch(X1, Y1),
    X =:= X1,
    Y =:= Y1.

isMarket(X,Y) :-
    market(X1, Y1),
    X =:= X1,
    Y =:= Y1.

isDig(X,Y) :-
    dig(X1, Y1),
    X =:= X1,
    Y =:= Y1.

isHarvest(X, Y) :-
    harvest(X1,Y1),
    X1 =:= X,
    Y1 =:= Y. 

isPlant(X,Y) :-
    plant(X1, Y1),
    X =:= X1,
    Y =:= Y1.

isTop(_,Y) :-
    Y =:= 0.

isBot(_,Y) :-
    lebar(L),
    Max is L+1,
    Y =:= Max.

isLeft(X,_) :-
    X =:= 0.

isRight(X,_) :-
    panjang(P),
    Max is P+1,
    X =:= Max.

printX(X,Y) :-
    isBot(X,Y),
    isRight(X,Y),
    write('#').

printX(X,Y) :-
    isWaterTile(X,Y,X,Y,X,Y,X,Y,X,Y,X,Y,X,Y,X,Y),
    write('o'),
    NextX is (X+1),
    printX(NextX,Y).

printX(X,Y) :-
    isPlayer(X,Y),
    write('P'),
    NextX is (X+1),
    printX(NextX,Y).

printX(X,Y) :-
    isHome(X,Y),
    write('H'),
    NextX is (X+1),
    printX(NextX,Y).

printX(X,Y) :-
    isQuest(X,Y),
    write('Q'),
    NextX is (X+1),
    printX(NextX,Y).

printX(X,Y) :-
    isRanch(X,Y),
    write('R'),
    NextX is (X+1),
    printX(NextX,Y).

printX(X,Y) :-
    isMarket(X,Y),
    write('M'),
    NextX is (X+1),
    printX(NextX,Y).

printX(X,Y) :-
    isDig(X,Y),
    write('='),
    NextX is (X+1),
    printX(NextX,Y).

printX(X,Y) :-
    isPlant(X,Y),
    write('.'),
    NextX is (X+1),
    printX(NextX,Y).

printX(X,Y) :-
    isHarvest(X,Y),
    write('!'),
    NextX is (X+1),
    printX(NextX,Y).

printX(X,Y) :-
    isBot(X,Y),
    write('#'),
    NextX is (X+1),
    printX(NextX,Y).

printX(X,Y) :-
    isLeft(X,Y),
    write('#'),
    NextX is (X+1),
    printX(NextX,Y).


printX(X,Y) :-
    isRight(X,Y),
    write('#'),nl,
    NextX is 0,
    NextY is (Y+1),
    printX(NextX,NextY).

printX(X,Y) :-
    isTop(X,Y),
    write('#'),
    NextX is (X+1),
    printX(NextX,Y).


printX(X,Y) :-
    \+isTop(X,Y),
    \+isBot(X,Y),
    \+isLeft(X,Y),
    \+isRight(X,Y),
    write('-'),
    NextX is (X+1),
    printX(NextX,Y).

initMap(X, Y) :-
    asserta(lebar(X)),
    asserta(panjang(Y)).

initPlayer :-
    asserta(positionX(7)),
    asserta(positionY(16)).

map :- 
    binjay(_),
    printX(0,0),nl,
    legenda,!.

map :-
    \+ binjay(_),
    write('Anda belum tiba di Binjay!!'), !.

legenda :- 
    write('- = tempat nyangkul'),nl,
    write('H = home sweet home'), nl,
    write('Q = ambil quest kuy'),nl,
    write('R = ternak manjah'),nl,
    write('M = belanja santuy'),nl,!.

createMap :-
    initMap(16,15),
    initPlayer,
    generateMarketTile,
    generateQuestTile,
    generateRanchTile,
    asserta(harvest(12,12)),
    generateWater.


