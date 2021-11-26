peri :-
    write('anda bertemu dengan peri. Pilih tempat untuk berpindah'), nl,
    write('masukkan koordinat x: '), read(X),
    write('masukkan koordinat y: '), read(Y),
    (
        X > 15,
        write('koordinat mana itu bosss');
        (
            Y>16,
            write('koordinat mana itu bosss');
            (
                isWaterTile(X,Y,X,Y,X,Y,X,Y,X,Y,X,Y,X,Y,X,Y),
                write('mau nyebur bosss?');
                (
                    retract(positionX(_)),
                    retract(positionY(_)),
                    asserta(positionX(X)),
                    asserta(positionY(Y)),
                    write('selamat anda berhasil pindah'),
                )
            )
        )
    ), !.