:- dynamic(chickenProduct/2).
:- dynamic(sheepProduct/2).
:- dynamic(cowProduct/2).
:- dynamic(ranchResult/2).
/* 
:- dynamic(chickenProduct/2).
:- dynamic(sheepProduct/2).
:- dynamic(cowProduct/2).
:- dynamic(ranchResult/2)

chickenProduct(ayamKeBerapa,waktuProduct)
ranchResult(productName,jumlah)
*/

/* ******************************** Beli Animals ******************************** */
/* beli chicken */
buyChicken:-
    write('Chicken berhasil dibeli'),nl,
    addItems(125,1),
    inventory(_,chicken,Qty,_,_,_,_,_,_),
    generateChickenProduct(Qty,_), !.

/* beli sheep */
buySheep:-
    write('Sheep berhasil dibeli'),nl,
    addItems(126,1),
    inventory(_,sheep,Qty,_,_,_,_,_,_),
    generateSheepProduct(Qty,_), !.

/* beli cow */
buyCow:-
    write('Cow berhasil dibeli'),nl,
    addItems(127,1),
    inventory(_,cow,Qty,_,_,_,_,_,_),
    generateCowProduct(Qty,_), !.

/* ******************************** Time reduce ******************************** */
/* chicken */
reduceChickenTime(0,_):- !.
reduceChickenTime(N,Jumlah):-
    N > 0,
    chickenProduct(N,TimeC),
    (TimeC > Jumlah ->
        TimeC2 is TimeC - Jumlah,
        retract(chickenProduct(N,TimeC)),
        asserta(chickenProduct(N,TimeC2));

        (TimeC == Jumlah ->
            retract(chickenProduct(N,TimeC)),
            generateChickenProduct(N,_),
            (N =< 2 ->
                random(1,9,Number),
                addRanchResult(Number,1);

                (N > 2 ->
                    random(6,10,Number),
                    addRanchResult(Number,1)
                )
            );

            (TimeC < Jumlah ->
                TimeC2 is Jumlah - TimeC,
                retract(chickenProduct(N,TimeC)),
                generateChickenProduct(N,_),
                chickenProduct(N,NewTime),
                NewTime2 is NewTime - TimeC2,
                retract(chickenProduct(N,NewTime)),
                asserta(chickenProduct(N,NewTime2)),
                (N =< 2 ->
                    random(1,9,Number),
                    addRanchResult(Number,1);

                    (N > 2 ->
                        random(6,10,Number),
                        addRanchResult(Number,1)
                    )
                )
            )
        )
    ),
    N2 is N-1,
    reduceChickenTime(N2,Jumlah),!.

/* sheep */
reduceSheepTime(0,_):- !.
reduceSheepTime(N,Jumlah):-
    N > 0,
    sheepProduct(N,TimeC),
    (TimeC > Jumlah ->
        TimeC2 is TimeC - Jumlah,
        retract(sheepProduct(N,TimeC)),
        asserta(sheepProduct(N,TimeC2));

        (TimeC == Jumlah ->
            retract(sheepProduct(N,TimeC)),
            generateSheepProduct(N,_),
            random(11,12,Number),
            addRanchResult(Number,1);

            (TimeC < Jumlah ->
                TimeC2 is Jumlah - TimeC,
                retract(sheepProduct(N,TimeC)),
                generateSheepProduct(N,_),
                sheepProduct(N,NewTime),
                NewTime2 is NewTime - TimeC2,
                retract(sheepProduct(N,NewTime)),
                asserta(sheepProduct(N,NewTime2)),
                random(11,12,Number),
                addRanchResult(Number,1)
            )
        )
    ),
    N2 is N-1,
    reduceSheepTime(N2,Jumlah),!.

/* cow */
reduceCowTime(0,_):- !.
reduceCowTime(N,Jumlah):-
    N > 0,
    cowProduct(N,TimeC),
    (TimeC > Jumlah ->
        TimeC2 is TimeC - Jumlah,
        retract(cowProduct(N,TimeC)),
        asserta(cowProduct(N,TimeC2));

        (TimeC == Jumlah ->
            retract(cowProduct(N,TimeC)),
            generateCowProduct(N,_),
            random(13,14,Number),
            addRanchResult(Number,1);

            (TimeC < Jumlah ->
                TimeC2 is Jumlah - TimeC,
                retract(cowProduct(N,TimeC)),
                generateCowProduct(N,_),
                cowProduct(N,NewTime),
                NewTime2 is NewTime - TimeC2,
                retract(cowProduct(N,NewTime)),
                asserta(cowProduct(N,NewTime2)),
                random(13,14,Number),
                addRanchResult(Number,1)
            )
        )
    ),
    N2 is N-1,
    reduceCowTime(N2,Jumlah),!.

/* time reduce chicken,sheep,cow */
updateTimeRanch(Jumlah):-
    inventory(_,chicken,JmlhChicken,_,_,_,_,_,_),
    inventory(_,sheep,JmlhSheep,_,_,_,_,_,_),
    inventory(_,cow,JmlhCow,_,_,_,_,_,_),
    reduceChickenTime(JmlhChicken,Jumlah),
    reduceSheepTime(JmlhSheep,Jumlah),
    reduceCowTime(JmlhCow,Jumlah),!.

updateTimeRanch(Jumlah):-
    \+inventory(_,chicken,_,_,_,_,_,_,_),
    inventory(_,sheep,JmlhSheep,_,_,_,_,_,_),
    inventory(_,cow,JmlhCow,_,_,_,_,_,_),
    reduceSheepTime(JmlhSheep,Jumlah),
    reduceCowTime(JmlhCow,Jumlah),!.

updateTimeRanch(Jumlah):-
    inventory(_,chicken,JmlhChicken,_,_,_,_,_,_),
    \+inventory(_,sheep,_,_,_,_,_,_,_),
    inventory(_,cow,JmlhCow,_,_,_,_,_,_),
    reduceChickenTime(JmlhChicken,Jumlah),
    reduceCowTime(JmlhCow,Jumlah),!.

updateTimeRanch(Jumlah):-
    inventory(_,chicken,JmlhChicken,_,_,_,_,_,_),
    inventory(_,sheep,JmlhSheep,_,_,_,_,_,_),
    \+inventory(_,cow,_,_,_,_,_,_,_),
    reduceChickenTime(JmlhChicken,Jumlah),
    reduceSheepTime(JmlhSheep,Jumlah),!.

updateTimeRanch(Jumlah):-
    \+inventory(_,chicken,_,_,_,_,_,_,_),
    \+inventory(_,sheep,_,_,_,_,_,_,_),
    inventory(_,cow,JmlhCow,_,_,_,_,_,_),
    reduceCowTime(JmlhCow,Jumlah),!.

updateTimeRanch(Jumlah):-
    \+inventory(_,chicken,_,_,_,_,_,_,_),
    inventory(_,sheep,JmlhSheep,_,_,_,_,_,_),
    \+inventory(_,cow,_,_,_,_,_,_,_),
    reduceSheepTime(JmlhSheep,Jumlah),!.

updateTimeRanch(Jumlah):-
    inventory(_,chicken,JmlhChicken,_,_,_,_,_,_),
    \+inventory(_,sheep,_,_,_,_,_,_,_),
    \+inventory(_,cow,_,_,_,_,_,_,_),
    reduceChickenTime(JmlhChicken,Jumlah),!.

updateTimeRanch(_):-
    \+inventory(_,chicken,_,_,_,_,_,_,_),
    \+inventory(_,sheep,_,_,_,_,_,_,_),
    \+inventory(_,cow,_,_,_,_,_,_,_),!.

/* ******************************** displayRanch ******************************** */
/* display chicken */
displayRanchChicken(0):- !.
displayRanchChicken(QtyC):-
    QtyC > 0,
    chickenProduct(QtyC,Times),
    write('   Ayam '), write(QtyC), write(' '), write('akan bertelur '), write(Times), write(' jam lagi'),nl,
    QtyC2 is QtyC-1,
    displayRanchChicken(QtyC2),!.

/* display sheep */
displayRanchSheep(0):- !.
displayRanchSheep(QtyC):-
    QtyC > 0,
    sheepProduct(QtyC,Times),
    write('   Sheep '), write(QtyC), write(' '), write('will produced wool '), write(Times), write(' jam lagi'),nl,
    QtyC2 is QtyC-1,
    displayRanchSheep(QtyC2),!.

/* display cow */
displayRanchCow(0):- !.
displayRanchCow(QtyC):-
    QtyC > 0,
    cowProduct(QtyC,Times),
    write('   Cow '), write(QtyC), write(' '), write('will produced milk '), write(Times), write(' jam lagi'),nl,
    QtyC2 is QtyC-1,
    displayRanchCow(QtyC2),!.

/* display All*/
displayRanch:-
    inventory(_,chicken,JmlhChicken,_,_,_,_,_,_),
    inventory(_,sheep,JmlhSheep,_,_,_,_,_,_),
    inventory(_,cow,JmlhCow,_,_,_,_,_,_),
    displayRanchChicken(JmlhChicken),
    displayRanchSheep(JmlhSheep),
    displayRanchCow(JmlhCow),!.

displayRanch:-
    \+inventory(_,chicken,_,_,_,_,_,_,_),
    inventory(_,sheep,JmlhSheep,_,_,_,_,_,_),
    inventory(_,cow,JmlhCow,_,_,_,_,_,_),
    displayRanchSheep(JmlhSheep),
    displayRanchCow(JmlhCow),!.

displayRanch:-
    inventory(_,chicken,JmlhChicken,_,_,_,_,_,_),
    \+inventory(_,sheep,_,_,_,_,_,_,_),
    inventory(_,cow,JmlhCow,_,_,_,_,_,_),
    displayRanchChicken(JmlhChicken),
    displayRanchCow(JmlhCow),!.

displayRanch:-
    inventory(_,chicken,JmlhChicken,_,_,_,_,_,_),
    inventory(_,sheep,JmlhSheep,_,_,_,_,_,_),
    \+inventory(_,cow,_,_,_,_,_,_,_),
    displayRanchChicken(JmlhChicken),
    displayRanchSheep(JmlhSheep),!.

displayRanch:-
    \+inventory(_,chicken,_,_,_,_,_,_,_),
    \+inventory(_,sheep,_,_,_,_,_,_,_),
    inventory(_,cow,JmlhCow,_,_,_,_,_,_),
    displayRanchCow(JmlhCow),!.

displayRanch:-
    \+inventory(_,chicken,_,_,_,_,_,_,_),
    inventory(_,sheep,JmlhSheep,_,_,_,_,_,_),
    \+inventory(_,cow,_,_,_,_,_,_,_),
    displayRanchSheep(JmlhSheep),!.

displayRanch:-
    inventory(_,chicken,JmlhChicken,_,_,_,_,_,_),
    \+inventory(_,sheep,_,_,_,_,_,_,_),
    \+inventory(_,cow,_,_,_,_,_,_,_),
    displayRanchChicken(JmlhChicken),!.

displayRanch:-
    \+inventory(_,chicken,_,_,_,_,_,_,_),
    \+inventory(_,sheep,_,_,_,_,_,_,_),
    \+inventory(_,cow,_,_,_,_,_,_,_),
    write('   Kamu tidak memiliki animal'), !.

/* ******************************** display Result ******************************** */
/* Result Ayam */
displayResultChick:-
    ranchResult(egg,JmlhEgg),    
    ranchResult(large_egg,JmlhLargeEgg),    
    ranchResult(golden_egg,JmlhGoldEgg),
    write('Egg sebanyak '), write(JmlhEgg),nl,    
    write('Large Egg sebanyak '), write(JmlhLargeEgg),nl,    
    write('Golden Egg sebanyak '), write(JmlhGoldEgg),!.  

displayResultChick:-
    \+ranchResult(egg,_),    
    ranchResult(large_egg,JmlhLargeEgg),    
    ranchResult(golden_egg,JmlhGoldEgg), 
    write('Large Egg sebanyak '), write(JmlhLargeEgg),nl,    
    write('Golden Egg sebanyak '), write(JmlhGoldEgg),!.  
    
displayResultChick:-
    ranchResult(egg,JmlhEgg),    
    \+ranchResult(large_egg,_),    
    ranchResult(golden_egg,JmlhGoldEgg),
    write('Egg sebanyak '), write(JmlhEgg),nl,     
    write('Golden Egg sebanyak '), write(JmlhGoldEgg),!.  

displayResultChick:-
    ranchResult(egg,JmlhEgg),    
    ranchResult(large_egg,JmlhLargeEgg),    
    \+ranchResult(golden_egg,_),
    write('Egg sebanyak '), write(JmlhEgg),nl,    
    write('Large Egg sebanyak '), write(JmlhLargeEgg),!.  

displayResultChick:-
    \+ranchResult(egg,_),    
    \+ranchResult(large_egg,_),    
    ranchResult(golden_egg,JmlhGoldEgg),  
    write('Golden Egg sebanyak '), write(JmlhGoldEgg),!.  

displayResultChick:-
    \+ranchResult(egg,_),    
    ranchResult(large_egg,JmlhLargeEgg),    
    \+ranchResult(golden_egg,_),
    write('Large Egg sebanyak '), write(JmlhLargeEgg),!. 

displayResultChick:-
    ranchResult(egg,JmlhEgg),
    \+ranchResult(large_egg,_),    
    \+ranchResult(golden_egg,_),
    write('Egg sebanyak '), write(JmlhEgg), !.  

displayResultChick:-
    \+ranchResult(egg,_),    
    \+ranchResult(large_egg,_),    
    \+ranchResult(golden_egg,_),!.  

/* Result Sheep */
displayResultSheep:-
    ranchResult(wool,JmlhWool),
    ranchResult(premium_wool,JmlhPremWool),
    write('Wool sebanyak '), write(JmlhWool), nl,
    write('Premium wool sebanyak '), write(JmlhPremWool), !.
displayResultSheep:-
    \+ranchResult(wool,_),
    ranchResult(premium_wool,JmlhPremWool),
    write('Premium wool sebanyak '), write(JmlhPremWool), !.
displayResultSheep:-
    ranchResult(wool,JmlhWool),
    \+ranchResult(premium_wool,_),
    write('Wool sebanyak '), write(JmlhWool), !.
displayResultSheep:-
    \+ranchResult(wool,_),
    \+ranchResult(premium_wool,_),!.

/* Result Cow */
displayResultCow:-
    ranchResult(milk,JmlhMilk),
    ranchResult(large_milk,JmlhLargeMilk),
    write('Milk sebanyak '), write(JmlhMilk), nl,
    write('Large Milk sebanyak '), write(JmlhLargeMilk), !.
displayResultCow:-
    \+ranchResult(milk,_),
    ranchResult(large_milk,JmlhLargeMilk),
    write('Large Milk sebanyak '), write(JmlhLargeMilk), !.
displayResultCow:-
    ranchResult(milk,JmlhMilk),
    \+ranchResult(large_milk,_),
    write('Milk sebanyak '), write(JmlhMilk), !.
displayResultCow:-
    \+ranchResult(milk,_),
    \+ranchResult(large_milk,_),!.

/*Result all*/
displayResult:-
    ranchResult(_,_),
    displayResultChick,nl,
    displayResultCow,nl,
    displayResultSheep,!.

displayResult:-
    \+ranchResult(_,_),
    write('   Animals belum produce apa-apa'),!.

/* ******************************** Display all info ******************************** */
displayRanchInfo:-
    write('Hewan yang kamu punya: '),nl,
    displayRanch,nl,
    write('Hasil ranch: '),nl,
    displayResult.

/* ******************************** Display jumlah hewan ******************************** */
displayAnimals:-
    inventory(_,chicken,JmlhChicken,_,_,_,_,_,_),
    inventory(_,sheep,JmlhSheep,_,_,_,_,_,_),
    inventory(_,cow,JmlhCow,_,_,_,_,_,_),
    write('   '), write(JmlhChicken), write(' Chicken'),nl,
    write('   '), write(JmlhSheep), write(' Sheep'),nl,
    write('   '), write(JmlhCow), write(' Cow'),nl,
    !.

displayAnimals:-
    \+inventory(_,chicken,_,_,_,_,_,_,_),
    inventory(_,sheep,JmlhSheep,_,_,_,_,_,_),
    inventory(_,cow,_,JmlhCow,_,_,_,_,_),
    write('   '), write('0'), write(' Chicken'),nl,
    write('   '), write(JmlhSheep), write(' Sheep'),nl,
    write('   '), write(JmlhCow), write(' Cow'),nl,
    !.

displayAnimals:-
    inventory(_,chicken,JmlhChicken,_,_,_,_,_,_),
    \+inventory(_,sheep,_,_,_,_,_,_,_),
    inventory(_,cow,_,JmlhCow,_,_,_,_,_),
    write('   '), write(JmlhChicken), write(' Chicken'),nl,
    write('   '), write('0'), write(' Sheep'),nl,
    write('   '), write(JmlhCow), write(' Cow'),nl,
    !.

displayAnimals:-
    inventory(_,chicken,JmlhChicken,_,_,_,_,_,_),
    inventory(_,sheep,JmlhSheep,_,_,_,_,_,_),
    \+inventory(_,cow,_,_,_,_,_,_,_),
    write('   '), write(JmlhChicken), write(' Chicken'),nl,
    write('   '), write(JmlhSheep), write(' Sheep'),nl,
    write('   '), write('0'), write(' Cow'),nl,
    !.

displayAnimals:-
    \+inventory(_,chicken,_,_,_,_,_,_,_),
    \+inventory(_,sheep,_,_,_,_,_,_,_),
    inventory(_,cow,_,JmlhCow,_,_,_,_,_),
    write('   '), write(0), write(' Chicken'),nl,
    write('   '), write(0), write(' Sheep'),nl,
    write('   '), write(JmlhCow), write(' Cow'),nl,
    !.

displayAnimals:-
    \+inventory(_,chicken,_,_,_,_,_,_,_),
    inventory(_,sheep,JmlhSheep,_,_,_,_,_,_),
    \+inventory(_,cow,_,_,_,_,_,_,_),
    write('   '), write(0), write(' Chicken'),nl,
    write('   '), write(JmlhSheep), write(' Sheep'),nl,
    write('   '), write(0), write(' Cow'),nl,
    !.

displayAnimals:-
    inventory(_,chicken,JmlhChicken,_,_,_,_,_,_),
    \+inventory(_,sheep,_,_,_,_,_,_,_),
    \+inventory(_,cow,_,_,_,_,_,_,_),
    write('   '), write(JmlhChicken), write(' Chicken'),nl,
    write('   '), write(0), write(' Sheep'),nl,
    write('   '), write(0), write(' Cow'),nl,
    !.

displayAnimals:-
    \+inventory(_,chicken,_,_,_,_,_,_,_),
    \+inventory(_,sheep,_,_,_,_,_,_,_),
    \+inventory(_,cow,_,_,_,_,_,_,_),
    write('   '), write(0), write(' Chicken'),nl,
    write('   '), write(0), write(' Sheep'),nl,
    write('   '), write(0), write(' Cow'),nl,
    write('   '), write('beli hewan dulu >:('),nl,
    !.
    

/* ******************************** Generate animals ******************************** */
/* Chicken */
generateChickenProduct(NamaChicken,_):-
    myRanchingLevel(Level),
    (Level =< 10 ->
        asserta(chickenProduct(NamaChicken,12));

        (Level > 10, Level =< 20 ->
            asserta(chickenProduct(NamaChicken,8));

            (Level > 20 ->
                asserta(chickenProduct(NamaChicken,6))
            )
        )
    ),
    !.

/* Sheep */
generateSheepProduct(NamaSheep,_):-
    myRanchingLevel(Level),
    (Level =< 10 ->
        asserta(sheepProduct(NamaSheep,18));

        (Level > 10, Level =< 20 ->
            asserta(sheepProduct(NamaSheep,14));

            (Level > 20 ->
                asserta(sheepProduct(NamaSheep,12))
            )
        )
    ),
    !.

/* Cow */
generateCowProduct(NamaCow,_):-
    myRanchingLevel(Level),
    (Level =< 10 ->
        asserta(cowProduct(NamaCow,22));

        (Level > 10, Level =< 20 ->
            asserta(cowProduct(NamaCow,18));

            (Level > 20 ->
                asserta(cowProduct(NamaCow,18))
            )
        )
    ),
    !.
/* ******************************** Generate animals ******************************** */
ranch:-
    binjay(_),
    positionX(X),
    positionY(Y),
    isRanch(X, Y),
    write('Welcome to ranch! you have:'), nl,
    displayAnimals,
    write('What you want to do?'),nl,
    write('  to ranch, ketik:'), nl,
    write('     '), write('chicken.'),nl,
    write('     '), write('sheep.'),nl,
    write('     '), write('cow.'),nl,
    write('  to display information ketik:'), nl,
    write('     '), write('displayRanchInfo.'),!
    .

ranch:-
    binjay(_),
    positionX(X),
    positionY(Y),
    \+isRanch(X, Y),
    write('kamu tidak berada di atas tile ranch')
    .

chicken:-
    ranchResult(egg,JmlhEgg),    
    ranchResult(large_egg,JmlhLargeEgg),    
    ranchResult(golden_egg,JmlhGoldEgg),
    Sum is JmlhEgg + JmlhLargeEgg + JmlhGoldEgg,
    addItems(egg,JmlhEgg), nl,
    addItems(large_egg,JmlhLargeEgg), nl,
    addItems(golden_egg,JmlhGoldEgg),
    retract(ranchResult(egg,JmlhEgg)),
    retract(ranchResult(large_egg,JmlhLargeEgg)),
    retract(ranchResult(golden_egg,JmlhGoldEgg)),
    addRanchingExp(Sum),
    !.  
chicken:-
    \+ranchResult(egg,_),    
    ranchResult(large_egg,JmlhLargeEgg),    
    ranchResult(golden_egg,JmlhGoldEgg),
    Sum is JmlhLargeEgg + JmlhGoldEgg,  
    addItems(large_egg,JmlhLargeEgg), nl,
    addItems(golden_egg,JmlhGoldEgg), nl,
    retract(ranchResult(large_egg,JmlhLargeEgg)),
    retract(ranchResult(golden_egg,JmlhGoldEgg)),
    addRanchingExp(Sum),
    !.  
chicken:-
    ranchResult(egg,JmlhEgg),    
    \+ranchResult(large_egg,_),    
    ranchResult(golden_egg,JmlhGoldEgg),
    Sum is JmlhEgg + JmlhGoldEgg,
    addItems(egg,JmlhEgg), nl,
    addItems(golden_egg,JmlhGoldEgg), nl,
    retract(ranchResult(egg,JmlhEgg)),
    retract(ranchResult(golden_egg,JmlhGoldEgg)),
    addRanchingExp(Sum),
    !.  
chicken:-
    ranchResult(egg,JmlhEgg),    
    ranchResult(large_egg,JmlhLargeEgg),    
    \+ranchResult(golden_egg,_),
    Sum is JmlhEgg + JmlhLargeEgg,
    addItems(egg,JmlhEgg), nl,
    addItems(large_egg,JmlhLargeEgg), nl,
    retract(ranchResult(egg,JmlhEgg)),
    retract(ranchResult(large_egg,JmlhLargeEgg)),
    addRanchingExp(Sum),
    !.  
chicken:-
    \+ranchResult(egg,_),    
    \+ranchResult(large_egg,_),    
    ranchResult(golden_egg,JmlhGoldEgg),
    Sum is JmlhGoldEgg,
    addItems(golden_egg,JmlhGoldEgg), nl,
    retract(ranchResult(golden_egg,JmlhGoldEgg)),
    addRanchingExp(Sum),
    !.  
chicken:-
    \+ranchResult(egg,_),    
    ranchResult(large_egg,JmlhLargeEgg),    
    \+ranchResult(golden_egg,_),
    Sum is JmlhLargeEgg,
    addItems(large_egg,JmlhLargeEgg), nl,
    retract(ranchResult(large_egg,JmlhLargeEgg)),
    addRanchingExp(Sum),
    !.  
chicken:-
    ranchResult(egg,JmlhEgg),    
    \+ranchResult(large_egg,_),    
    \+ranchResult(golden_egg,_),
    Sum is JmlhEgg,
    addItems(egg,JmlhEgg),nl,
    retract(ranchResult(egg,JmlhEgg)),
    addRanchingExp(Sum),
    !.  
chicken:-
    \+ranchResult(egg,_),    
    \+ranchResult(large_egg,_),    
    \+ranchResult(golden_egg,_),
    write('you got nothing, check again later'),
    !.  

sheep:-
    ranchResult(wool,JmlhWool),
    ranchResult(premium_wool,JmlhPremWool),
    Sum is JmlhWool + JmlhPremWool,
    addItems(wool,JmlhWool),nl,
    addItems(wool,JmlhPremWool),nl,
    retract(ranchResult(wool,JmlhWool)),
    retract(ranchResult(premium_wool,JmlhPremWool)),
    addRanchingExp(Sum),!.
sheep:-
    \+ranchResult(wool,_),
    ranchResult(premium_wool,JmlhPremWool),
    Sum is JmlhPremWool,
    addItems(wool,JmlhPremWool),nl,
    retract(ranchResult(premium_wool,JmlhPremWool)),
    addRanchingExp(Sum),!.
sheep:-
    ranchResult(wool,JmlhWool),
    \+ranchResult(premium_wool,_),
    Sum is JmlhWool,
    addItems(wool,JmlhWool),nl,
    retract(ranchResult(wool,JmlhWool)),
    addRanchingExp(Sum),!.
sheep:-
    \+ranchResult(wool,_),
    \+ranchResult(premium_wool,_),
    write('you got nothing, check again later'),!.

cow:-
    ranchResult(milk,JmlhMilk),
    ranchResult(large_milk,JmlhLargeMilk),
    Sum is JmlhMilk + JmlhLargeMilk,
    addItems(milk,JmlhMilk),nl,
    addItems(large_milk,JmlhLargeMilk),nl,
    retract(ranchResult(milk,JmlhMilk)),
    retract(ranchResult(large_milk,JmlhLargeMilk)),
    addRanchingExp(Sum),
    !.
cow:-
    \+ranchResult(milk,_),
    ranchResult(large_milk,JmlhLargeMilk),
    Sum is JmlhLargeMilk,
    addItems(large_milk,JmlhLargeMilk),nl,
    retract(ranchResult(large_milk,JmlhLargeMilk)),
    addRanchingExp(Sum),
    !.
cow:-
    ranchResult(milk,JmlhMilk),
    \+ranchResult(large_milk,_),
    Sum is JmlhMilk,
    addItems(milk,JmlhMilk),nl,
    retract(ranchResult(milk,JmlhMilk)),
    addRanchingExp(Sum),
    !.
cow:-
    \+ranchResult(milk,_),
    \+ranchResult(large_milk,_),
    write('you got nothing, check again later'),!.
/* ******************************** Hasil production ******************************** */
addRanchResult(N,Jmlh):-
    N =:= 1,
    \+ranchResult(egg,_),
    asserta(ranchResult(egg,Jmlh)),!.

addRanchResult(N,Jmlh):-
    N =:= 1,
    ranchResult(egg,Qty),
    Qty2 is Qty + Jmlh,
    retract(ranchResult(egg,Qty)),
    asserta(ranchResult(egg,Qty2)),!.

addRanchResult(N,Jmlh):-
    N =:= 2,
    \+ranchResult(egg,_),
    asserta(ranchResult(egg,Jmlh)),!.

addRanchResult(N,Jmlh):-
    N =:= 2,
    ranchResult(egg,Qty),
    Qty2 is Qty + Jmlh,
    retract(ranchResult(egg,Qty)),
    asserta(ranchResult(egg,Qty2)),!.

addRanchResult(N,Jmlh):-
    N =:= 3,
    \+ranchResult(egg,_),
    asserta(ranchResult(egg,Jmlh)),!.

addRanchResult(N,Jmlh):-
    N =:= 3,
    ranchResult(egg,Qty),
    Qty2 is Qty + Jmlh,
    retract(ranchResult(egg,Qty)),
    asserta(ranchResult(egg,Qty2)),!.

addRanchResult(N,Jmlh):-
    N =:= 4,
    \+ranchResult(egg,_),
    asserta(ranchResult(egg,Jmlh)),!.

addRanchResult(N,Jmlh):-
    N =:= 4,
    ranchResult(egg,Qty),
    Qty2 is Qty + Jmlh,
    retract(ranchResult(egg,Qty)),
    asserta(ranchResult(egg,Qty2)),!.

addRanchResult(N,Jmlh):-
    N =:= 5,
    \+ranchResult(egg,_),
    asserta(ranchResult(egg,Jmlh)),!.

addRanchResult(N,Jmlh):-
    N =:= 5,
    ranchResult(egg,Qty),
    Qty2 is Qty + Jmlh,
    retract(ranchResult(egg,Qty)),
    asserta(ranchResult(egg,Qty2)),!.

addRanchResult(N,Jmlh):-
    N =:= 6,
    \+ranchResult(egg,_),
    asserta(ranchResult(egg,Jmlh)),!.

addRanchResult(N,Jmlh):-
    N =:= 6,
    ranchResult(egg,Qty),
    Qty2 is Qty + Jmlh,
    retract(ranchResult(egg,Qty)),
    asserta(ranchResult(egg,Qty2)),!.

addRanchResult(N,Jmlh):-
    N =:= 7,
    \+ranchResult(large_egg,_),
    asserta(ranchResult(large_egg,Jmlh)),!.

addRanchResult(N,Jmlh):-
    N =:= 7,
    ranchResult(large_egg,Qty),
    Qty2 is Qty + Jmlh,
    retract(ranchResult(large_egg,Qty)),
    asserta(ranchResult(large_egg,Qty2)),!.

addRanchResult(N,Jmlh):-
    N =:= 8,
    \+ranchResult(large_egg,_),
    asserta(ranchResult(large_egg,Jmlh)),!.

addRanchResult(N,Jmlh):-
    N =:= 8,
    ranchResult(large_egg,Qty),
    Qty2 is Qty + Jmlh,
    retract(ranchResult(large_egg,Qty)),
    asserta(ranchResult(large_egg,Qty2)),!.

addRanchResult(N,Jmlh):-
    N =:= 9,
    \+ranchResult(large_egg,_),
    asserta(ranchResult(large_egg,Jmlh)),!.

addRanchResult(N,Jmlh):-
    N =:= 9,
    ranchResult(large_egg,Qty),
    Qty2 is Qty + Jmlh,
    retract(ranchResult(large_egg,Qty)),
    asserta(ranchResult(large_egg,Qty2)),!.

addRanchResult(N,Jmlh):-
    N =:= 10,
    \+ranchResult(golden_egg,_),
    asserta(ranchResult(golden_egg,Jmlh)),!.

addRanchResult(N,Jmlh):-
    N =:= 10,
    ranchResult(golden_egg,Qty),
    Qty2 is Qty + Jmlh,
    retract(ranchResult(golden_egg,Qty)),
    asserta(ranchResult(golden_egg,Qty2)),!.

addRanchResult(N,Jmlh):-
    N =:= 11,
    \+ranchResult(wool,_),
    asserta(ranchResult(wool,Jmlh)),!.

addRanchResult(N,Jmlh):-
    N =:= 11,
    ranchResult(wool,Qty),
    Qty2 is Qty + Jmlh,
    retract(ranchResult(wool,Qty)),
    asserta(ranchResult(wool,Qty2)),!.

addRanchResult(N,Jmlh):-
    N =:= 12,
    \+ranchResult(premium_wool,_),
    asserta(ranchResult(premium_wool,Jmlh)),!.

addRanchResult(N,Jmlh):-
    N =:= 12,
    ranchResult(premium_wool,Qty),
    Qty2 is Qty + Jmlh,
    retract(ranchResult(premium_wool,Qty)),
    asserta(ranchResult(premium_wool,Qty2)),!.

addRanchResult(N,Jmlh):-
    N =:= 13,
    \+ranchResult(milk,_),
    asserta(ranchResult(milk,Jmlh)),!.

addRanchResult(N,Jmlh):-
    N =:= 13,
    ranchResult(milk,Qty),
    Qty2 is Qty + Jmlh,
    retract(ranchResult(milk,Qty)),
    asserta(ranchResult(milk,Qty2)),!.

addRanchResult(N,Jmlh):-
    N =:= 14,
    \+ranchResult(large_milk,_),
    asserta(ranchResult(large_milk,Jmlh)),!.

addRanchResult(N,Jmlh):-
    N =:= 14,
    ranchResult(large_milk,Qty),
    Qty2 is Qty + Jmlh,
    retract(ranchResult(large_milk,Qty)),
    asserta(ranchResult(large_milk,Qty2)),!.