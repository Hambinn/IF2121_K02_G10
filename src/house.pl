dynamic(diary/1).



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
            addHari(1),
            write('Kamu terbangun dipagi hari yang cerah'),nl,
            (write('Kamu bersiap untuk bekerja lebih giat lagi hari ini!'),nl);
        
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
                    displayDiary(-1)
                )
            )
    ), !.

writeDiary(Day):-
    Day =:= 1,
    write('tuliskan diary tentang Day 1: '),nl,
    read(Diary),
    asserta(diary(Day)),
    tell('day1.txt'),
    write(Diary),
    told, !.

writeDiary(Day):-
    Day =:= 2,
    write('tuliskan diary tentang Day 2: '),nl,
    read(Diary),
    asserta(diary(Day)),
    tell('day2.txt'),
    write(Diary),
    told, !.

writeDiary(Day):-
    Day =:= 3,
    write('tuliskan diary tentang Day 3: '),nl,
    read(Diary),
    asserta(diary(Day)),
    tell('day3.txt'),
    write(Diary),
    told, !.

writeDiary(Day):-
    Day =:= 4,
    write('tuliskan diary tentang Day 4: '),nl,
    read(Diary),
    asserta(diary(Day)),
    tell('day4.txt'),
    write(Diary),
    told, !.

writeDiary(Day):-
    Day =:= 5,
    write('tuliskan diary tentang Day 5: '),nl,
    read(Diary),
    asserta(diary(Day)),
    tell('day5.txt'),
    write(Diary),
    told, !.

writeDiary(Day):-
    Day =:= 6,
    write('tuliskan diary tentang Day 6: '),nl,
    read(Diary),
    asserta(diary(Day)),
    tell('day6.txt'),
    write(Diary),
    told, !.

writeDiary(Day):-
    Day =:= 7,
    write('tuliskan diary tentang Day 7: '),nl,
    read(Diary),
    asserta(diary(Day)),
    tell('day7.txt'),
    write(Diary),
    told, !.

writeDiary(Day):-
    Day =:= 8,
    write('tuliskan diary tentang Day 8: '),nl,
    read(Diary),
    asserta(diary(Day)),
    tell('day8.txt'),
    write(Diary),
    told, !.

writeDiary(Day):-
    Day =:= 9, 
    write('tuliskan diary tentang Day 9: '),nl,
    read(Diary),
    asserta(diary(Day)),
    tell('day9.txt'),
    write(Diary),
    told, !.

writeDiary(Day):-
    Day =:= 10,
    write('tuliskan diary tentang Day 10: '),nl,
    read(Diary),
    asserta(diary(Day)),
    tell('day10.txt'),
    write(Diary),
    told, !.

writeDiary(Day):-
    Day =:= 11,
    write('tuliskan diary tentang Day 11: '),nl,
    read(Diary),
    asserta(diary(Day)),
    tell('day11.txt'),
    write(Diary),
    told, !.

writeDiary(Day):-
    Day =:= 12,
    write('tuliskan diary tentang Day 12: '),nl,
    read(Diary),
    asserta(diary(Day)),
    tell('day12.txt'),
    write(Diary),
    told, !.

writeDiary(Day):-
    Day =:= 13,
    write('tuliskan diary tentang Day 13: '),nl,
    read(Diary),
    asserta(diary(Day)),
    tell('day13.txt'),
    write(Diary),
    told, !.

writeDiary(Day):-
    Day =:= 14,
    write('tuliskan diary tentang Day 14: '),nl,
    read(Diary),
    asserta(diary(Day)),
    tell('day14.txt'),
    write(Diary),
    told, !.

writeDiary(Day):-
    Day =:= 15,
    write('tuliskan diary tentang Day 15: '),nl,
    read(Diary),
    asserta(diary(Day)),
    tell('day15.txt'),
    write(Diary),
    told, !.

writeDiary(Day):-
    Day =:= 16,
    write('tuliskan diary tentang Day 16: '),nl,
    read(Diary),
    asserta(diary(Day)),
    tell('day16.txt'),
    write(Diary),
    told, !.

writeDiary(Day):-
    Day =:= 17,
    write('tuliskan diary tentang Day 17: '),nl,
    read(Diary),
    asserta(diary(Day)),
    tell('day17.txt'),
    write(Diary),
    told, !.

writeDiary(Day):-
    Day =:= 18,
    write('tuliskan diary tentang Day 18: '),nl,
    read(Diary),
    asserta(diary(Day)),
    tell('day18.txt'),
    write(Diary),
    told, !.

writeDiary(Day):-
    Day =:= 19,
    write('tuliskan diary tentang Day 19: '),nl,
    read(Diary),
    asserta(diary(Day)),
    tell('day19.txt'),
    write(Diary),
    told, !.

writeDiary(Day):-
    Day =:= 20,
    write('tuliskan diary tentang Day 20: '),nl,
    read(Diary),
    asserta(diary(Day)),
    tell('day20.txt'),
    write(Diary),
    told, !.

writeDiary(Day):-
    Day =:= 21,
    write('tuliskan diary tentang Day 21: '),nl,
    read(Diary),
    asserta(diary(Day)),
    tell('day21.txt'),
    write(Diary),
    told, !.

writeDiary(Day):-
    Day =:= 22,
    write('tuliskan diary tentang Day 22: '),nl,
    read(Diary),
    asserta(diary(Day)),
    tell('day22.txt'),
    write(Diary),
    told, !.

writeDiary(Day):-
    Day =:= 23,
    write('tuliskan diary tentang Day 23: '),nl,
    read(Diary),
    asserta(diary(Day)),
    tell('day23.txt'),
    write(Diary),
    told, !.

writeDiary(Day):-
    Day =:= 24,
    write('tuliskan diary tentang Day 24: '),nl,
    read(Diary),
    asserta(diary(Day)),
    tell('day24.txt'),
    write(Diary),
    told, !.

writeDiary(Day):-
    Day =:= 25,
    write('tuliskan diary tentang Day 25: '),nl,
    read(Diary),
    asserta(diary(Day)),
    tell('day25.txt'),
    write(Diary),
    told, !.

writeDiary(Day):-
    Day =:= 26,
    write('tuliskan diary tentang Day 26: '),nl,
    read(Diary),
    asserta(diary(Day)),
    tell('day26.txt'),
    write(Diary),
    told, !.

writeDiary(Day):-
    Day =:= 27,
    write('tuliskan diary tentang Day 27: '),nl,
    read(Diary),
    asserta(diary(Day)),
    tell('day27.txt'),
    write(Diary),
    told, !.

writeDiary(Day):-
    Day =:= 28,
    write('tuliskan diary tentang Day 28: '),nl,
    read(Diary),
    asserta(diary(Day)),
    tell('day28.txt'),
    write(Diary),
    told, !.

writeDiary(Day):-
    Day =:= 29,
    write('tuliskan diary tentang Day 29: '),nl,
    read(Diary),
    asserta(diary(Day)),
    tell('day29.txt'),
    write(Diary),
    told, !.

writeDiary(Day):-
    Day =:= 30,
    write('tuliskan diary tentang Day 30: '),nl,
    read(Diary),
    asserta(diary(Day)),
    tell('day30.txt'),
    write(Diary),
    told, !.

writeDiary(Day):-
    Day =:= 31,
    write('tuliskan diary tentang Day 31: '),nl,
    read(Diary),
    asserta(diary(Day)),
    tell('day31.txt'),
    write(Diary),
    told, !.

writeDiary(Day):-
    Day =:= 32,
    write('tuliskan diary tentang Day 32: '),nl,
    read(Diary),
    asserta(diary(Day)),
    tell('day32.txt'),
    write(Diary),
    told, !.

writeDiary(Day):-
    Day =:= 33,
    write('tuliskan diary tentang Day 33: '),nl,
    read(Diary),
    asserta(diary(Day)),
    tell('day33.txt'),
    write(Diary),
    told, !.

writeDiary(Day):-
    Day =:= 34,
    write('tuliskan diary tentang Day 34: '),nl,
    read(Diary),
    asserta(diary(Day)),
    tell('day34.txt'),
    write(Diary),
    told, !.

writeDiary(Day):-
    Day =:= 35,
    write('tuliskan diary tentang Day 35: '),nl,
    read(Diary),
    asserta(diary(Day)),
    tell('day35.txt'),
    write(Diary),
    told, !.

writeDiary(Day):-
    Day =:= 36,
    write('tuliskan diary tentang Day 36: '),nl,
    read(Diary),
    asserta(diary(Day)),
    tell('day36.txt'),
    write(Diary),
    told, !.

writeDiary(Day):-
    Day =:= 37,
    write('tuliskan diary tentang Day 37: '),nl,
    read(Diary),
    asserta(diary(Day)),
    tell('day37.txt'),
    write(Diary),
    told, !.

writeDiary(Day):-
    Day =:= 38,
    write('tuliskan diary tentang Day 38: '),nl,
    read(Diary),
    asserta(diary(Day)),
    tell('day38.txt'),
    write(Diary),
    told, !.

writeDiary(Day):-
    Day =:= 39,
    write('tuliskan diary tentang Day 39: '),nl,
    read(Diary),
    asserta(diary(Day)),
    tell('day39.txt'),
    write(Diary),
    told, !.

writeDiary(Day):-
    Day =:= 40,
    write('tuliskan diary tentang Day 40: '),nl,
    read(Diary),
    asserta(diary(Day)),
    tell('day40.txt'),
    write(Diary),
    told, !.

displayDiary(-1):- 
    write('Here are the list of your entries: '),nl,
    displayDiary(0),!.
displayDiary(41):- !.
displayDiary(N):- 
    \+diary(N),
    N2 is N + 1,
    displayDiary(N2),!.
displayDiary(N):-
    diary(N),
    write('-   '), write('Diary Day '), write(N), nl,
    N2 is N + 1,
    displayDiary(N2),!.




/*writeDiary:-*/
/*readDiary:-*/

