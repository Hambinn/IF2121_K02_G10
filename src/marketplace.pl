shop:-
    binjay(_),
    positionX(X),
    positionY(Y),
    isMarket(X,Y),
    myMoney(Money),
    write('Kamu berada di marketplace, gold anda berjumlah: '), write(Money), nl,
    write('Apa yang ingin kamu lakukan?'), nl,
    write('1. beli item'), nl,
    write('2. jual item'), nl,
    write('3. kembali ke map'), nl,
    write('Pilihan: '), read(Pilihan), nl,
    ( 
        Pilihan == 1 ->
            write('Item yang tersedia:'), nl,
            write('1. Shovel level 1 (200 gold)'),nl,
            write('2. Shovel level 2 (500 gold)'),nl,
            write('3. Fishing Rod level 1(200 gold'),nl,
            write('4. Fishing Rod level 2 (500 gold)'),nl,
            write('5. Milk Pail level 1 (200 gold)'),nl,
            write('6. Milk Pail level 2 (500 gold)'),nl,
            write('7. Shears (200 gold)'),nl,
            write('8. Shears 2 (500 gold)'),nl,
            write('9. Wheat Seeds (30 gold)'),nl,
            write('10. Corn Seeds (100 gold)'),nl,
            write('11. Eggplant Seeds (150 gold)'),nl,
            write('12. Tomato Seeds (150 gold)'),nl,
            write('13. Potato Seeds (200 gold)'),nl,
            write('14. Cauliflower Seeds (240 gold)'),nl,
            write('15. Chicken (500 gold)'),nl,
            write('16. Sheep (500 gold)'),nl,
            write('17. Cow (500 gold)'),nl,
            write('Pilihan: '), read(PilItem),
            (
                PilItem == 1 ->
                    myMoney(Money),
                    (
                        200<Money ->
                         (write('Shovel berhasil dibeli'), nl),
                         addItems(shovel_1,1),
                         reduceMoney(200);
                        (write('Uangmu tidak cukup'), nl)
                    );
                    PilItem == 2 ->
                    myMoney(Money),
                    amountItem(shovel_1,Shovel1),
                    (
                        500<Money, Shovel1>0  ->
                         (write('Shovel berhasil dibeli'), nl),
                         addItems(shovel_2,1),
                         removeItems(shovel_1),
                         reduceMoney(500);
                        (write('Uangmu tidak cukup'), nl)
                    );
                    PilItem == 3 ->
                    myMoney(Money),
                    (
                        200<Money ->
                         (write('Fishing Rod berhasil dibeli'), nl),
                         addItems(fishing_rod_1,1),
                         reduceMoney(200);
                        (write('Uangmu tidak cukup'), nl)
                    );
                    PilItem == 4 ->
                    myMoney(Money),
                    amountItem(fishing_rod_1,Rod1),
                    (
                        500<Money, Rod1>0 ->
                         (write('Fishing Rod berhasil dibeli'), nl),
                         addItems(fishing_rod_2,1),
                         removeItems(fishing_rod_1),
                         reduceMoney(500);
                        (write('Uangmu tidak cukup'), nl)
                    );
                    PilItem == 5 ->
                    myMoney(Money),
                    (
                        200<Money ->
                        (write('Milk Pail berhasil dibeli'), nl),
                        addItems(milk_pail_1,1),
                        reduceMoney(200);                      
                        (write('Uangmu tidak cukup'), nl)
                    );
                    PilItem == 6 ->
                    myMoney(Money),
                    amountItem(milk_pail_1,Pail1),
                    (
                        500<Money, Pail1>0 ->
                         (write('Milk Pail berhasil dibeli'), nl),
                         addItems(milk_pail_2,1),
                         removeItems(milk_pail_1),
                         reduceMoney(500);
                        (write('Uangmu tidak cukup'), nl)
                    );
                    PilItem == 7 ->
                    myMoney(Money),
                    (
                        200<Money ->
                        (write('Shears berhasil dibeli'), nl),
                        addItems(shears_1,1),
                        reduceMoney(200);
                        (write('Uangmu tidak cukup'), nl)
                    );
                    PilItem == 8 ->
                    myMoney(Money),
                    (
                        500<Money ->
                        (write('Shears berhasil dibeli'), nl),
                        addItems(shears_2,1),
                        reduceMoney(500);
                        (write('Uangmu tidak cukup'), nl)
                    );
                    PilItem == 9 ->
                    myMoney(Money),
                    (
                        30<Money ->
                        (write('Wheat Seeds berhasil dibeli'), nl),
                        addItems(wheat_seeds,1),
                        reduceMoney(30);
                        (write('Uangmu tidak cukup'), nl)
                    );
                    PilItem == 10 ->
                    myMoney(Money),
                    (
                        100<Money ->
                        (write('Corn Seeds berhasil dibeli'), nl),
                        addItems(corn_seeds,1),
                        reduceMoney(100);
                        (write('Uangmu tidak cukup'), nl)
                    );
                    PilItem == 11 ->
                    myMoney(Money),
                    (
                        150<Money ->
                        (write('Eggplant Seeds berhasil dibeli'), nl),
                        addItems(eggplant_seeds,1),
                        reduceMoney(150);
                        (write('Uangmu tidak cukup'), nl)
                    );
                    PilItem == 12 ->
                    myMoney(Money),
                    (
                        150<Money ->
                        (write('Tomato Seeds berhasil dibeli'), nl),
                        addItems(tomato_seeds,1),
                        reduceMoney(150);
                        (write('Uangmu tidak cukup'), nl)
                    );
                    PilItem == 13 ->
                    myMoney(Money),
                    (
                        200<Money ->
                        (write('Potato Seeds berhasil dibeli'), nl),
                        addItems(potato_seeds,1),
                        reduceMoney(200);
                        (write('Uangmu tidak cukup'), nl)
                    );
                    PilItem == 14 ->
                    myMoney(Money),
                    (
                        240<Money ->
                        (write('Cauliflower Seeds berhasil dibeli'), nl),
                        addItems(cauliflower_seeds,1),
                        reduceMoney(240);
                        (write('Uangmu tidak cukup'), nl)
                    );
                    PilItem == 15 ->
                    myMoney(Money),
                    (
                        500<Money ->
                        buyChicken;
                        (write('Uangmu tidak cukup'), nl)
                    );
                    PilItem == 16 ->
                    myMoney(Money),
                    (
                        500<Money ->
                        buySheep;
                        (write('Uangmu tidak cukup'), nl)
                    );
                    PilItem == 17 ->
                    myMoney(Money),
                    (
                        500<Money ->
                        buyCow;
                        (write('Uangmu tidak cukup'), nl)
                    )
            );
        (
            Pilihan == 2 ->
                amountItem(egg,A),
                amountItem(large_egg,B),
                amountItem(golden_egg,C),
                amountItem(wool,D),
                amountItem(premium_wool,E),
                amountItem(milk,F),
                amountItem(premium_milk,G),
                amountItem(wheat,H),
                amountItem(corn,I),
                amountItem(eggplant,J),
                amountItem(tomato,K),
                amountItem(potato,L),
                amountItem(cauliflower,N),
                amountItem(carp,O),
                amountItem(rainbow_trout,P),
                amountItem(bullhead,Q),
                amountItem(largemouth_bass,R),
                amountItem(salmon,S),
                amountItem(tuna,T),
                amountItem(polka_dot_stingray,U),
                amountItem(arowana,V),
                write('Item yang bisa dijual:'), nl,
                write('1. egg (x ') , write(A), write(') (150)'),nl,
                write('2. large egg (x ') , write(B), write(') (285)'),nl,
                write('3. golden egg (x ') , write(C), write(') (1500)'),nl,
                write('4. wool (x ') , write(D), write(') (1020)'),nl,
                write('5. premium wool (x ') , write(E), write(') (2000)'),nl,
                write('6. milk (x ') , write(F), write(') (375)'),nl,
                write('7. large milk (x ') , write(G), write(') (570)'),nl,
                write('8. wheat (x ') , write(H), write(') (75)'),nl,
                write('9. corn (x ') , write(I), write(') (150)'),nl,
                write('10. eggplant (x ') , write(J), write(') (180)'),nl,
                write('11. tomato (x ') , write(K), write(') (180)'),nl,
                write('12. potato (x ') , write(L), write(') (240)'),nl,
                write('13. cauliflower (x ') , write(N), write(') (525)'),nl,
                write('14. carp (x ') , write(O), write(') (150)'),nl,
                write('15. rainbow trout (x ') , write(P), write(') (195)'),nl,
                write('16. bullhead (x ') , write(Q), write(') (225)'),nl,
                write('17. largemouth bass (x ') , write(R), write(') (300)'),nl,
                write('18. salmon (x ') , write(S), write(') (375)'),nl,
                write('19. tuna (x ') , write(T), write(') (450)'),nl,
                write('20. polka dot stingray (x ') , write(U), write(') (540)'),nl,
                write('21. arowana (x ') , write(V), write(') (1050)'),nl,
                write('Pilihan: '), read(PilJual),
                (
                    PilJual == 1 ->
                    myMoney(Money),
                    amountItem(egg,Egg),
                    (
                        1=<Egg ->
                        addMoney((150*Egg)),
                        removeItems(egg,Egg),
                        (write('Egg berhasil dijual'), nl);
                        (write('Item tidak ada di inventory'), nl)
                    );
                    PilJual == 2 ->
                    myMoney(Money),
                    amountItem(large_egg,LargeEgg),
                    (
                        1=<LargeEgg ->
                        addMoney((285*LargeEgg)),
                        removeItems(large_egg,LargeEgg),
                        (write('Large Egg berhasil dijual'), nl);
                        (write('Item tidak ada di inventory'), nl)
                    );
                    PilJual == 3 ->
                    myMoney(Money),
                    amountItem(golden_egg,GoldEgg),
                    (
                        1=<GoldEgg ->
                        addMoney((1500*GoldEgg)),
                        removeItems(golden_egg,GoldEgg),
                        (write('Golden Egg berhasil dijual'), nl);
                        (write('Item tidak ada di inventory'), nl)
                    );
                    PilJual == 4 ->
                    myMoney(Money),
                    amountItem(wool,Wool),
                    (
                        1=<Wool ->
                        addMoney((1020*Wool)),
                        removeItems(wool,Wool),
                        (write('Wool berhasil dijual'), nl);
                        (write('Item tidak ada di inventory'), nl)
                    );
                    PilJual == 5 ->
                    myMoney(Money),
                    amountItem(premium_wool,PremWool),
                    (
                        1=<PremWool ->
                        addMoney((2000*PremWool)),
                        removeItems(premium_wool,PremWool),
                        (write('Premium Wool berhasil dijual'), nl);
                        (write('Item tidak ada di inventory'), nl)
                    );
                    PilJual == 6 ->
                    myMoney(Money),
                    amountItem(milk,Milk),
                    (
                        1=<Milk ->
                        addMoney((375*Milk)),
                        removeItems(milk,Milk),
                        (write('Milk berhasil dijual'), nl);
                        (write('Item tidak ada di inventory'), nl)
                    );
                    PilJual == 7 ->
                    myMoney(Money),
                    amountItem(large_milk,LargeMilk),
                    (
                        1=<LargeMilk ->
                        addMoney((570*LargeMilk)),
                        removeItems(large_milk,LargeMilk),
                        (write('Large Milk berhasil dijual'), nl);
                        (write('Item tidak ada di inventory'), nl)
                    );
                    PilJual == 8 ->
                    myMoney(Money),
                    amountItem(wheat,Wheat),
                    (
                        1=<Wheat ->
                        addMoney((75*Wheat)),
                        removeItems(wheat,Wheat),
                        (write('Wheat berhasil dijual'), nl);
                        (write('Item tidak ada di inventory'), nl)
                    );
                    PilJual == 9 ->
                    myMoney(Money),
                    amountItem(corn,Corn),
                    (
                        1=<Corn ->
                        addMoney((150*Corn)),
                        removeItems(corn,Corn),
                        (write('Corn berhasil dijual'), nl);
                        (write('Item tidak ada di inventory'), nl)
                    );
                    PilJual == 10 ->
                    myMoney(Money),
                    amountItem(eggplant,Eggplant),
                    (
                        1=<Eggplant ->
                        addMoney((180*Eggplant)),
                        removeItems(eggplant,Eggplant),
                        (write('Eggplant berhasil dijual'), nl);
                        (write('Item tidak ada di inventory'), nl)
                    );
                    PilJual == 11 ->
                    myMoney(Money),
                    amountItem(tomato,Tomato),
                    (
                        1=<Tomato ->
                        addMoney((180*Tomato)),
                        removeItems(tomato,Tomato),
                        (write('Tomato berhasil dijual'), nl);
                        (write('Item tidak ada di inventory'), nl)
                    );
                    PilJual == 12 ->
                    myMoney(Money),
                    amountItem(potato,Potato),
                    (
                        1=<Potato ->
                        addMoney((240*Potato)),
                        removeItems(potato,Potato),
                        (write('Potato berhasil dijual'), nl);
                        (write('Item tidak ada di inventory'), nl)
                    );
                    PilJual == 13 ->
                    myMoney(Money),
                    amountItem(cauliflower,Cauli),
                    (
                        1=<Cauli ->
                        addMoney((525*Cauli)),
                        removeItems(cauliflower,Cauli),
                        (write('cauliflower berhasil dijual'), nl);
                        (write('Item tidak ada di inventory'), nl)
                    );
                    PilJual == 14 ->
                    myMoney(Money),
                    amountItem(carp,Carp),
                    (
                        1=<Carp ->
                        addMoney((150*Carp)),
                        removeItems(carp,Carp),
                        (write('carp berhasil dijual'), nl);
                        (write('Item tidak ada di inventory'), nl)
                    );
                    PilJual == 15 ->
                    myMoney(Money),
                    amountItem(rainbow_trout,Rainbow),
                    (
                        1=<Rainbow ->
                        addMoney((195*Rainbow)),
                        removeItems(rainbow_trout,Rainbow),
                        (write('rainbow_trout berhasil dijual'), nl);
                        (write('Item tidak ada di inventory'), nl)
                    );
                    PilJual == 16 ->
                    myMoney(Money),
                    amountItem(bullhead,Bull),
                    (
                        1=<Bull ->
                        addMoney((1225*Bull)),
                        removeItems(bullhead,Bull),
                        (write('bullhead berhasil dijual'), nl);
                        (write('Item tidak ada di inventory'), nl)
                    );
                    PilJual == 17 ->
                    myMoney(Money),
                    amountItem(largemouth_bass,Bass),
                    (
                        1=<Bass ->
                        addMoney((300*Bass)),
                        removeItems(largemouth_bass,Bass),
                        (write('largemouth bass berhasil dijual'), nl);
                        (write('Item tidak ada di inventory'), nl)
                    );
                    PilJual == 18 ->
                    myMoney(Money),
                    amountItem(salmon,Salmon),
                    (
                        1=<Salmon ->
                        addMoney((375*Salmon)),
                        removeItems(salmon,Salmon),
                        (write('salmon berhasil dijual'), nl);
                        (write('Item tidak ada di inventory'), nl)
                    );
                    PilJual == 19 ->
                    myMoney(Money),
                    amountItem(tuna,Tuna),
                    (
                        1=<Tuna ->
                        addMoney((450*Tuna)),
                        removeItems(tuna,Tuna),
                        (write('tuna berhasil dijual'), nl);
                        (write('Item tidak ada di inventory'), nl)
                    );
                    PilJual == 20 ->
                    myMoney(Money),
                    amountItem(polka_dot_stingray,Polka),
                    (
                        1=<Polka ->
                        addMoney((540*Polka)),
                        removeItems(polka_dot_stingray,Polka),
                        (write('polka dot stingray berhasil dijual'), nl);
                        (write('Item tidak ada di inventory'), nl)
                    );
                    PilJual == 21 ->
                    myMoney(Money),
                    amountItem(arowana,Arowana),
                    (
                        1=<Arowana ->
                        addMoney((1050*Arowana)),
                        removeItems(arowana,Arowana),
                        (write('arowana berhasil dijual'), nl);
                        (write('Item tidak ada di inventory'), nl)
                    )
        );
            (
            Pilihan == 3 ->
            write('kembali ke map')
        )
    )
), 
!.


    