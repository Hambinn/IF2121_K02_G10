:- include('exploration.pl').
:- include('map.pl').
:- include('inventory.pl').
:- include('items.pl').
:- include('player.pl').

shop:-
    binjay(_),
    positionX(X),
    positionY(Y),
    isMarket(X,Y),
    mymoney(Money),
    write('Kamu berada di marketplace, gold anda berjumlah: '), write(Uang), nl,
    write('Apa yang ingin kamu lakukan?'), nl,
    write('1. beli item'), nl,
    write('2. jual item'), nl,
    write('3. kembali ke map'), nl,
    write('Pilihan: '), read(Pilihan), nl,
    (
        Pilihan == 'beli item' ->
        (   write('Item yang tersedia:'), nl,
            write('1. Hoe (200 gold)'),nl,
            write('2. Scythe (200 gold)'),nl,
            write('3. Fishing Rod (200 gold'),nl,
            write('4. Fishing Rod (500 gold)'),nl,
            write('5. Milk Pail (200 gold)'),nl,
            write('6. Milk Pail (500 gold)'),nl,
            write('7. Shears (200 gold)'),nl,
            write('8. Shears (500 gold)'),nl,
            write('9. Wheat Seeds (30 gold)'),nl,
            write('10. Corn Seeds (100 gold)'),nl,
            write('11. Eggplant Seeds (150 gold)'),nl,
            write('12. Tomato Seeds (150 gold)'),nl,
            write('13. Potato Seeds (200 gold)'),nl,
            write('14. Cauliflower Seeds (240 gold)'),nl,
            write('Piliham: '), read(PilItem),nl,
            (
                PilItem == 'Hoe'->
                (
                    mymoney(Money),
                    Money >= 200 ->
                    (
                        retract(mymoney(Money)),
                        NewMoney is Money - 200,
                        assert(mymoney(NewMoney)),
                        addItems(hoe,1),
                    )
                    ;
                    write('Uangmu tidak cukup untuk membeli Hoe!'),nl
                )
                ;
                PilItem == 'Scythe'->
                (
                    mymoney(Money),
                    Money >= 200 ->
                    (
                        retract(mymoney(Money)),
                        NewMoney is Money - 200,
                        assert(mymoney(NewMoney)),
                        addItems(scythe,1),
                    )
                    ;
                    write('Uangmu tidak cukup untuk membeli Scythe!'),nl
                )
                ;
                PilItem == 'Fishing Rod'->
                (
                    mymoney(Money),
                    Money >= 200 ->
                    (
                        retract(mymoney(Money)),
                        NewMoney is Money - 200,
                        assert(mymoney(NewMoney)),
                        addItems(fishing_rod_1,1),
                    )
                    ;
                    write('Uangmu tidak cukup untuk membeli Fishing Rod!'),nl
                )
                ;
                PilItem == 'Fishing Rod (500)'->
                (
                    mymoney(Money),
                    Money >= 500 ->
                    (
                        retract(mymoney(Money)),
                        NewMoney is Money - 500,
                        assert(mymoney(NewMoney)),
                        addItems(fishing_rod_2,1),
                    )
                    ;
                    write('Uangmu tidak cukup untuk membeli Fishing Rod!'),nl
                )
                ;
                PilItem == 'Milk Pail'->
                (
                    mymoney(Money),
                    Money >= 200 ->
                    (
                        retract(mymoney(Money)),
                        NewMoney is Money - 200,
                        assert(mymoney(NewMoney)),
                        addItems(milk_pail_1,1),
                    )
                    ;
                    write('Uangmu tidak cukup untuk membeli Milk Pail!'),nl
                )
                ;
                PilItem == 'Milk Pail (500)'->
                (
                    mymoney(Money),
                    Money >= 500 ->
                    (
                        retract(mymoney(Money)),
                        NewMoney is Money - 500,
                        assert(mymoney(NewMoney)),
                        addItems(milk_pail_2,1),
                    )
                    ;
                    write('Uangmu tidak cukup untuk membeli Milk Pail!'),nl
                )
                ;
                PilItem == 'Shears'->
                (
                    mymoney(Money),
                    Money >= 200 ->
                    (
                        retract(mymoney(Money)),
                        NewMoney is Money - 200,
                        assert(mymoney(NewMoney)),
                        addItems(shears_1,1),
                    )
                    ;
                    write('Uangmu tidak cukup untuk membeli Shears!'),nl
                )
                ;
                PilItem == 'Shears (500)'->
                (
                    mymoney(Money),
                    Money >= 500 ->
                    (
                        retract(mymoney(Money)),
                        NewMoney is Money - 500,
                        assert(mymoney(NewMoney)),
                        addItems(shears_2,1),
                    )
                    ;
                    write('Uangmu tidak cukup untuk membeli Shears!'),nl
                )
                ;
                PilItem == 'Wheat Seeds'->
                (
                    mymoney(Money),
                    Money >= 30 ->
                    (
                        retract(mymoney(Money)),
                        NewMoney is Money - 30,
                        assert(mymoney(NewMoney)),
                        addItems(wheat_seeds,1),
                    )
                    ;
                    write('Uangmu tidak cukup untuk membeli Wheat Seeds!'),nl
                )
                ;
                PilItem == 'Corn Seeds'->
                (
                    mymoney(Money),
                    Money >= 100 ->
                    (
                        retract(mymoney(Money)),
                        NewMoney is Money - 100,
                        assert(mymoney(NewMoney)),
                        addItems(corn_seeds,1),
                    )
                    ;
                    write('Uangmu tidak cukup untuk membeli Corn Seeds!'),nl
                )
                ;
                PilItem == 'Eggplant Seeds'->
                (
                    mymoney(Money),
                    Money >= 150 ->
                    (
                        retract(mymoney(Money)),
                        NewMoney is Money - 150,
                        assert(mymoney(NewMoney)),
                        addItems(eggplant_seeds,1),
                    )
                    ;
                    write('Uangmu tidak cukup untuk membeli Eggplant Seeds!'),nl
                )
                ;
                PilItem == 'Tomato Seeds'->
                (
                    mymoney(Money),
                    Money >= 150 ->
                    (
                        retract(mymoney(Money)),
                        NewMoney is Money - 150,
                        assert(mymoney(NewMoney)),
                        addItems(tomato_seeds,1),
                    )
                    ;
                    write('Uangmu tidak cukup untuk membeli Tomato Seeds!'),nl
                )
                ;
                PilItem == 'Potato Seeds'->
                (
                    mymoney(Money),
                    Money >= 200 ->
                    (
                        retract(mymoney(Money)),
                        NewMoney is Money - 200,
                        assert(mymoney(NewMoney)),
                        addItems(potato_seeds,1),
                    )
                    ;
                    write('Uangmu tidak cukup untuk membeli Potato Seeds!'),nl
                )
                ;
                PilItem == 'Cauliflower Seeds'->
                (
                    mymoney(Money),
                    Money >= 240 ->
                    (
                        retract(mymoney(Money)),
                        NewMoney is Money - 240,
                        assert(mymoney(NewMoney)),
                        addItems(cauliflower_seeds,1),
                    )
                    ;
                    write('Uangmu tidak cukup untuk membeli Cauliflower Seeds!'),nl
                )
                ;
                write('Pilihan tidak tersedia!'),nl
            )
        )
        ;
        Pilihan == 'jual item' ->
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
        write('17. largemouth_bass (x') , write(amountItem(largemouth_bass,amout)), write(') (300)'),nl,
        write('18. salmon (x') , write(amountItem(salmon,amout)), write(') (375)'),nl,
        write('19. tuna (x') , write(amountItem(tuna,amout)), write(') (450)'),nl,
        write('20. polka dot stingray (x') , write(amountItem(polka_dot_stingray,amout)), write(') (540)'),nl,
        write('21. arowana (x') , write(amountItem(arowana,amout)), write(') (1050)'),nl,
    )


    