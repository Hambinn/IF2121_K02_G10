:- dynamic(hasBuy/1).

alchemist :-
    binjay(_),
    positionX(X),
    positionY(Y),
    isMarket(X,Y),
    myMoney(Money),
    \+hasBuy(_),
    write('Kamu bertemu dengan alchemist...'), nl, sleep(1),
    write('Ia menawarimu beberapa potion, namun kamu hanya bisa membeli sekali...'), nl, nl, sleep(1),
    write('##########################################################################'), nl,
    write('#                                                                        #'), nl,
    write('#                             RAMUAN YANG TERSEDIA                       #'), nl,
    write('#                                                                        #'), nl,
    write('# 1. Farming potion (3000 gold): membuat Level Farming anda menjadi 16   #'), nl,
    write('# 2. Fishing potion (3000 gold): membuat Level Fishing anda menjadi 16   #'), nl,
    write('# 3. Ranching potion (3000 gold): membuat Level Ranching anda menjadi 16 #'), nl,
    write('#                                                                        #'), nl,
    write('##########################################################################'), nl,
    write('Pilihan: '), read(PilItem),
    (
        PilItem == 1 ->
        myMoney(Money),
        (
            3000 =< Money ->
            (
                asserta(hasBuy(1)),
                reduceMoney(3000),
                write('Kamu meminum Farming Potion...'), nl, sleep(1),
                myFarmingLevel(Level),
                Level =< 15 ->
                write('Kamu merasakan ramuan itu merasuk kedalam tubuhmu...'), nl, sleep(1),
                myFarmingLevel(Level),
                MinusLevel is 16 - Level - 1,
                myFarmingExp(Exp),
                MinusExp is 301 - Exp,
                Total is MinusLevel*300 + MinusExp,
                addFarmingExp(Total);
                write('Tidak ada yang terjadi pada tubuhmu...'), nl
            );
            write('Uangmu tidak cukup'), nl
        );
        PilItem == 2 ->
        myMoney(Money),
        (
            3000 =< Money ->
            (
                asserta(hasBuy(1)),
                reduceMoney(3000),
                write('Kamu meminum Fishing Potion...'), nl, sleep(1),
                myFishingLevel(Level),
                Level =< 15 ->
                write('Kamu merasakan ramuan itu merasuk kedalam tubuhmu...'), nl, sleep(1),
                myFishingLevel(Level),
                MinusLevel is 16 - Level - 1,
                myFishingExp(Exp),
                MinusExp is 301 - Exp,
                Total is MinusLevel*300 + MinusExp,
                addFishingExp(Total);
                write('Tidak ada yang terjadi pada tubuhmu...'), nl
            );
            write('Uangmu tidak cukup'), nl
        );
        PilItem == 3 ->
        myMoney(Money),
        (
            3000 =< Money ->
            (
                asserta(hasBuy(1)),
                reduceMoney(3000),
                write('Kamu meminum Ranching Potion...'), nl, sleep(1),
                myRanchingLevel(Level),
                Level =< 15 ->
                write('Kamu merasakan ramuan itu merasuk kedalam tubuhmu...'), nl, sleep(1),
                myRanchingLevel(Level),
                MinusLevel is 16 - Level - 1,
                myRanchingExp(Exp),
                MinusExp is 301 - Exp,
                Total is MinusLevel*300 + MinusExp,
                addRanchingExp(Total);
                write('Tidak ada yang terjadi pada tubuhmu...'), nl
            );
            write('Uangmu tidak cukup'), nl
        )
    ),!
.

alchemist :-
    binjay(_),
    positionX(X),
    positionY(Y),
    isMarket(X,Y),
    hasBuy(_),
    write('Kamu sudah pernah membeli ramuan milik alchemist...'), nl, !
.