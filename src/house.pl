:-dynamic(diary/1).
:-dynamic(init/1).



house:-
    % a
    write('Anda tiba di rumah'),nl,
    write('Anda bisa melakukan beberapa hal dirumah:'),nl,
    write('1. Tidur'),nl,
    write('2. Write Diary'),nl,
    write('3. Read Diary'),nl,
    write('Pilihan: '),read(Pilihan),
    (
        Pilihan == 1 ->
        write('Bila anda tidur, hari akan berganti menjadi hari esok'),nl,
        write('Beberapa tanaman yang Anda tanam munkin sudah bisa di panen'),nl,
        write('Hewan ternak juga sudah bisa di ambil lagi hasil ternaknya'),nl,
        write('Namun hati hati, bila terlalu sering tidur, tidak terasa waktu akan berjalan hingga setahun dan permainan berakhir'),nl,
        write('Yakin akan tidur?(y/n)'), read(PilTidur),
        (
            PilTidur == 'y'->
            waktu(_, Hari),
            addHari(1),
            (
                Lucky is Hari mod 2,
                Lucky == 1,
                peri, nl;
                (
                    write('')
                )
            ),
            write('Kamu terbangun dipagi hari yang cerah'),nl, sleep(2),
            write('Kamu bersiap untuk bekerja lebih giat lagi hari ini!'),nl, sleep(2);
        
            (
                PilTidur == 'n'->
                write('Kamu memutuskan untuk kembali bekerja dan tidak jadi rebahan!'),nl
                )

            );
            (
                Pilihan == 2 ->
                showHari(Day),
                writeDiary(Day),
                (write('sukses menulis diary'),nl);
                (
                    Pilihan == 3 ->
                    displayDiary(-1),
                    write('baca diary yang mana? '),
                    write('(contoh input = day20) : '),
                    read(PilihanDiary),
                    write('Isi diary kamu: '),
                    readDiary(PilihanDiary)
                )
            )
    ), !.