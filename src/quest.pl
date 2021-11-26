quest:-
    binjay(_),
    positionX(X),
    positionY(Y),
    isQuest(X,Y),
    write('Temukan 3 Tuna, 5 Potato, dan 3 large egg untuk mendapatkan 2000 player xp dan 7000 gold'),nl,
    write('Silahkan kembali lagi jika kamu telah memiliki semua item diatas untuk menukarnya'),nl,
    amountItem(tuna, A),
    amountItem(potato, B),
    amountItem(large_egg, C),
    write(A),nl,
    write('Tukar item? (y/n)'), read(Pilihan),
    (
        Pilihan == 'y' ->
        (
            3 =< A, 5=< B, 3 =< C ->
            addGeneralExp(1000),
            addMoney(7000),
            removeItems(tuna, 3),
            removeItems(potato, 5),
            removeItems(large_egg, 3),
            write('Selamat kamu menyelesaikan quest!'),nl,
            (write('Kamu mendapatkan 1000 player xp dan 5000 gold'),nl);
            (write('Item mu belum cukup! Coba kembali lain waktu!'),nl)
        );
        (
        Pilihan == 'n' ->
        write('Kamu tidak menukar item!'),nl
        )
    ), !.
