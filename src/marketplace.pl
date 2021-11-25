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
            write('1. Hoe (200 gold)'),nl,
            write('2. Scythe (200 gold)'),nl,
            write('3. Fishing Rod (200 gold'),nl,
            write('4. Fishing Rod 2 (500 gold)'),nl,
            write('5. Milk Pail (200 gold)'),nl,
            write('6. Milk Pail 2 (500 gold)'),nl,
            write('7. Shears (200 gold)'),nl,
            write('8. Shears 2 (500 gold)'),nl,
            write('9. Wheat Seeds (30 gold)'),nl,
            write('10. Corn Seeds (100 gold)'),nl,
            write('11. Eggplant Seeds (150 gold)'),nl,
            write('12. Tomato Seeds (150 gold)'),nl,
            write('13. Potato Seeds (200 gold)'),nl,
            write('14. Cauliflower Seeds (240 gold)'),nl,
            write('Pilihan: '), read(PilItem),
            (
                PilItem == 1 ->
                    myMoney(Money),
                    (
                        200<Money ->
                         addItems(hoe,1),
                         reduceMoney(200),
                        (write('Hoe berhasil dibeli'), nl);
                        (write('Uangmu tidak cukup'), nl)
                    );
                    PilItem == 2 ->
                    myMoney(Money),
                    (
                        200<Money ->
                         addItems(scyte,1),
                         reduceMoney(200),
                        (write('Scyte berhasil dibeli'), nl);
                        (write('Uangmu tidak cukup'), nl)
                    );
                    PilItem == 3 ->
                    myMoney(Money),
                    (
                        200<Money ->
                         addItems(fishing_rod_1,1),
                         reduceMoney(200),
                        (write('Fishing Rod berhasil dibeli'), nl);
                        (write('Uangmu tidak cukup'), nl)
                    );
                    PilItem == 4 ->
                    myMoney(Money),
                    (
                        500<Money ->
                         addItems(fishing_rod_2,1),
                         reduceMoney(500),
                        (write('Fishing Rod berhasil dibeli'), nl);
                        (write('Uangmu tidak cukup'), nl)
                    );
                    PilItem == 5 ->
                    myMoney(Money),
                    (
                        200<Money ->
                        addItems(milk_pail_1,1),
                        reduceMoney(200),                         
                        (write('Milk Pail berhasil dibeli'), nl);
                        (write('Uangmu tidak cukup'), nl)
                    );
                    PilItem == 6 ->
                    myMoney(Money),
                    (
                        500<Money ->
                         addItems(milk_pail_2,1),
                         reduceMoney(500),
                        (write('Milk Pail berhasil dibeli'), nl);
                        (write('Uangmu tidak cukup'), nl)
                    );
                    PilItem == 7 ->
                    myMoney(Money),
                    (
                        200<Money ->
                        addItems(shears_1,1),
                        reduceMoney(200), 
                        (write('Shears berhasil dibeli'), nl);
                        (write('Uangmu tidak cukup'), nl)
                    );
                    PilItem == 8 ->
                    myMoney(Money),
                    (
                        500<Money ->
                        addItems(shears_2,1),
                        reduceMoney(500),
                        (write('Shears berhasil dibeli'), nl);
                        (write('Uangmu tidak cukup'), nl)
                    );
                    PilItem == 9 ->
                    myMoney(Money),
                    (
                        30<Money ->
                        addItems(wheat_seeds,1),
                        reduceMoney(30),
                        (write('Wheat Seeds berhasil dibeli'), nl);
                        (write('Uangmu tidak cukup'), nl)
                    );
                    PilItem == 10 ->
                    myMoney(Money),
                    (
                        100<Money ->
                        addItems(corn_seeds,1),
                        reduceMoney(100),
                        (write('Corn Seeds berhasil dibeli'), nl);
                        (write('Uangmu tidak cukup'), nl)
                    );
                    PilItem == 11 ->
                    myMoney(Money),
                    (
                        150<2 ->
                        addItems(eggplant_seeds,1),
                        reduceMoney(150),
                        (write('Eggplant Seeds berhasil dibeli'), nl);
                        (write('Uangmu tidak cukup'), nl)
                    );
                    PilItem == 12 ->
                    myMoney(Money),
                    (
                        150<2 ->
                        addItems(tomato_seeds,1),
                        reduceMoney(150),
                        (write('Tomato Seeds berhasil dibeli'), nl);
                        (write('Uangmu tidak cukup'), nl)
                    );
                    PilItem == 13 ->
                    myMoney(Money),
                    (
                        200<2 ->
                        addItems(potato_seeds,1),
                        reduceMoney(200),
                        (write('Potato Seeds berhasil dibeli'), nl);
                        (write('Uangmu tidak cukup'), nl)
                    );
                    PilItem == 14 ->
                    myMoney(Money),
                    (
                        240<2 ->
                        addItems(cauliflower_seeds,1),
                        reduceMoney(240),
                        (write('Cauliflower Seeds berhasil dibeli'), nl);
                        (write('Uangmu tidak cukup'), nl)
                    )
            );
        (
            Pilihan == 2 ->
                write('Item yang bisa dijual:'), nl,
                write('1. egg (x') , write(amountItem(egg,amout)), write(') (150)'),nl,
                write('2. large egg (x') , write(amountItem(large_egg,amout)), write(') (285)'),nl,
                write('3. golden egg (x') , write(amountItem(golden_egg,amout)), write(') (1500)'),nl,
                write('4. wool (x') , write(amountItem(wool,amout)), write(') (1020)'),nl,
                write('5. premium wool (x') , write(amountItem(premium_wool,amout)), write(') (2000)'),nl,
                write('6. milk (x') , write(amountItem(milk,amout)), write(') (375)'),nl,
                write('7. large milk (x') , write(amountItem(large_milk,amout)), write(') (570)'),nl,
                write('8. wheat (x') , write(amountItem(wheat,amout)), write(') (75)'),nl,
                write('9. corn (x') , write(amountItem(corn,amout)), write(') (150)'),nl,
                write('10. eggplant (x') , write(amountItem(eggplant,amout)), write(') (180)'),nl,
                write('11. tomato (x') , write(amountItem(tomato,amout)), write(') (180)'),nl,
                write('12. potato (x') , write(amountItem(potato,amout)), write(') (240)'),nl,
                write('13. cauliflower (x') , write(amountItem(cauliflower,amout)), write(') (525)'),nl,
                write('14. carp (x') , write(amountItem(carp,amout)), write(') (150)'),nl,
                write('15. rainbow trout (x') , write(amountItem(rainbow_trout,amout)), write(') (195)'),nl,
                write('16. bullhead (x') , write(amountItem(bullhead,amout)), write(') (225)'),nl,
                write('17. largemouth bass (x') , write(amountItem(largemouth_bass,amout)), write(') (300)'),nl,
                write('18. salmon (x') , write(amountItem(salmon,amout)), write(') (375)'),nl,
                write('19. tuna (x') , write(amountItem(tuna,amout)), write(') (450)'),nl,
                write('20. polka dot stingray (x') , write(amountItem(polka_dot_stingray,amout)), write(') (540)'),nl,
                write('21. arowana (x') , write(amountItem(arowana,amout)), write(') (1050)'),nl,
                write('Pilihan: '), read(PilJual),
                (
                    PilJual == 1 ->
                    myMoney(Money),
                    amountItem(egg,amount),
                    (
                        1=<amount ->
                        addMoney((150*amount)),
                        removeItems(egg,amount),
                        (write('Egg berhasil dijual'), nl);
                        (write('Item tidak ada di inventory'), nl)
                    );
                    PilJual == 2 ->
                    myMoney(Money),
                    amountItem(large_egg,amount),
                    (
                        1=<amount ->
                        addMoney((285*amount)),
                        removeItems(large_egg,amount),
                        (write('Large Egg berhasil dijual'), nl);
                        (write('Item tidak ada di inventory'), nl)
                    );
                    PilJual == 3 ->
                    myMoney(Money),
                    amountItem(golden_egg,amount),
                    (
                        1=<amount ->
                        addMoney((1500*amount)),
                        removeItems(golden_egg,amount),
                        (write('Golden Egg berhasil dijual'), nl);
                        (write('Item tidak ada di inventory'), nl)
                    );
                    PilJual == 4 ->
                    myMoney(Money),
                    amountItem(wool,amount),
                    (
                        1=<amount ->
                        addMoney((1020*amount)),
                        removeItems(wool,amount),
                        (write('Wool berhasil dijual'), nl);
                        (write('Item tidak ada di inventory'), nl)
                    );
                    PilJual == 5 ->
                    myMoney(Money),
                    amountItem(premium_wool,amount),
                    (
                        1=<amount ->
                        addMoney((2000*amount)),
                        removeItems(premium_wool,amount),
                        (write('Premium Wool berhasil dijual'), nl);
                        (write('Item tidak ada di inventory'), nl)
                    );
                    PilJual == 6 ->
                    myMoney(Money),
                    amountItem(milk,amount),
                    (
                        1=<amount ->
                        addMoney((375*amount)),
                        removeItems(milk,amount),
                        (write('Milk berhasil dijual'), nl);
                        (write('Item tidak ada di inventory'), nl)
                    );
                    PilJual == 7 ->
                    myMoney(Money),
                    amountItem(large_milk,amount),
                    (
                        1=<amount ->
                        addMoney((570*amount)),
                        removeItems(large_milk,amount),
                        (write('Large Milk berhasil dijual'), nl);
                        (write('Item tidak ada di inventory'), nl)
                    );
                    PilJual == 8 ->
                    myMoney(Money),
                    amountItem(wheat,amount),
                    (
                        1=<amount ->
                        addMoney((75*amount)),
                        removeItems(wheat,amount),
                        (write('Wheat berhasil dijual'), nl);
                        (write('Item tidak ada di inventory'), nl)
                    );
                    PilJual == 9 ->
                    myMoney(Money),
                    amountItem(corn,amount),
                    (
                        1=<amount ->
                        addMoney((150*amount)),
                        removeItems(corn,amount),
                        (write('Corn berhasil dijual'), nl);
                        (write('Item tidak ada di inventory'), nl)
                    );
                    PilJual == 10 ->
                    myMoney(Money),
                    amountItem(eggplant,amount),
                    (
                        1=<amount ->
                        addMoney((180*amount)),
                        removeItems(eggplant,amount),
                        (write('Eggplant berhasil dijual'), nl);
                        (write('Item tidak ada di inventory'), nl)
                    );
                    PilJual == 11 ->
                    myMoney(Money),
                    amountItem(tomato,amount),
                    (
                        1=<amount ->
                        addMoney((180*amount)),
                        removeItems(tomato,amount),
                        (write('Tomato berhasil dijual'), nl);
                        (write('Item tidak ada di inventory'), nl)
                    );
                    PilJual == 12 ->
                    myMoney(Money),
                    amountItem(potato,amount),
                    (
                        1=<amount ->
                        addMoney((240*amount)),
                        removeItems(potato,amount),
                        (write('Potato berhasil dijual'), nl);
                        (write('Item tidak ada di inventory'), nl)
                    );
                    PilJual == 13 ->
                    myMoney(Money),
                    amountItem(cauliflower,amount),
                    (
                        1=<amount ->
                        addMoney((525*amount)),
                        removeItems(cauliflower,amount),
                        (write('cauliflower berhasil dijual'), nl);
                        (write('Item tidak ada di inventory'), nl)
                    );
                    PilJual == 14 ->
                    myMoney(Money),
                    amountItem(carp,amount),
                    (
                        1=<amount ->
                        addMoney((150*amount)),
                        removeItems(carp,amount),
                        (write('carp berhasil dijual'), nl);
                        (write('Item tidak ada di inventory'), nl)
                    );
                    PilJual == 15 ->
                    myMoney(Money),
                    amountItem(rainbow_trout,amount),
                    (
                        1=<amount ->
                        addMoney((195*amount)),
                        removeItems(rainbow_trout,amount),
                        (write('rainbow_trout berhasil dijual'), nl);
                        (write('Item tidak ada di inventory'), nl)
                    );
                    PilJual == 16 ->
                    myMoney(Money),
                    amountItem(bullhead,amount),
                    (
                        1=<amount ->
                        addMoney((1225*amount)),
                        removeItems(bullhead,amount),
                        (write('bullhead berhasil dijual'), nl);
                        (write('Item tidak ada di inventory'), nl)
                    );
                    PilJual == 17 ->
                    myMoney(Money),
                    amountItem(largemouth_bass,amount),
                    (
                        1=<amount ->
                        addMoney((300*amount)),
                        removeItems(largemouth_bass,amount),
                        (write('largemouth bass berhasil dijual'), nl);
                        (write('Item tidak ada di inventory'), nl)
                    );
                    PilJual == 18 ->
                    myMoney(Money),
                    amountItem(salmon,amount),
                    (
                        1=<amount ->
                        addMoney((375*amount)),
                        removeItems(salmon,amount),
                        (write('salmon berhasil dijual'), nl);
                        (write('Item tidak ada di inventory'), nl)
                    );
                    PilJual == 19 ->
                    myMoney(Money),
                    amountItem(tuna,amount),
                    (
                        1=<amount ->
                        addMoney((450*amount)),
                        removeItems(tuna,amount),
                        (write('tuna berhasil dijual'), nl);
                        (write('Item tidak ada di inventory'), nl)
                    );
                    PilJual == 20 ->
                    myMoney(Money),
                    amountItem(polka_dot_stingray,amount),
                    (
                        1=<amount ->
                        addMoney((540*amount)),
                        removeItems(polka_dot_stingray,amount),
                        (write('polka dot stingray berhasil dijual'), nl);
                        (write('Item tidak ada di inventory'), nl)
                    );
                    PilJual == 21 ->
                    myMoney(Money),
                    amountItem(arowana,amount),
                    (
                        1=<amount ->
                        addMoney((1050*amount)),
                        removeItems(arowana,amount),
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


    