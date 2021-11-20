:- dynamic(player/1).
:- dynamic(binjay/1).

/* include semua file prolog yang diperlukan */
:- include('map.pl').
:- include('exploration.pl').

title :-
    write('                                      lllllll                                              '), nl, 
    write('                                      l:::::l                                              '), nl, 
    write('                                      l:::::l                                              '), nl,
    write('                                      l:::::l                                              '), nl,
    write('         ssssssssss    aaaaaaaaaaaaa   l::::l  aaaaaaaaaaaaa     mmmmmmm    mmmmmmm        '), nl,
    write('       ss::::::::::s   a::::::::::::a  l::::l  a::::::::::::a  mm:::::::m  m:::::::mm      '), nl, 
    write('     ss:::::::::::::s  aaaaaaaaa:::::a l::::l  aaaaaaaaa:::::am::::::::::mm::::::::::m     '), nl, 
    write('     s::::::ssss:::::s          a::::a l::::l           a::::am::::::::::::::::::::::m     '), nl, 
    write('      s:::::s  ssssss    aaaaaaa:::::a l::::l    aaaaaaa:::::am:::::mmm::::::mmm:::::m     '), nl, 
    write('        s::::::s       aa::::::::::::a l::::l  aa::::::::::::am::::m   m::::m   m::::m     '), nl, 
    write('           s::::::s   a::::aaaa::::::a l::::l a::::aaaa::::::am::::m   m::::m   m::::m     '), nl, 
    write('     ssssss   s:::::sa::::a    a:::::a l::::la::::a    a:::::am::::m   m::::m   m::::m     '), nl, 
    write('     s:::::ssss::::::a::::a    a:::::al::::::a::::a    a:::::am::::m   m::::m   m::::m     '), nl, 
    write('     s::::::::::::::sa:::::aaaa::::::al::::::a:::::aaaa::::::am::::m   m::::m   m::::m     '), nl, 
    write('      s:::::::::::ss  a::::::::::aa:::l::::::la::::::::::aa:::m::::m   m::::m   m::::m     '), nl, 
    write('       ssssssssssddddddddaaaaaaaa  aaallllllll aaaaaaaaaa  aaammmmmm   mmmmmm   mmmmmm     '), nl, 
    write('                          d::::::d                                   iiii                           '), nl, 
    write('                          d::::::d                                  i::::i                          '), nl, 
    write('                          d::::::d                                   iiii                           '), nl, 
    write('                          d:::::d                                                                   '), nl, 
    write('                  ddddddddd:::::d  aaaaaaaaaaaaa rrrrr   rrrrrrrrr iiiiiii                          '), nl, 
    write('                dd::::::::::::::d  a::::::::::::ar::::rrr:::::::::ri:::::i                          '), nl, 
    write('               d::::::::::::::::d  aaaaaaaaa:::::r:::::::::::::::::ri::::i                          '), nl, 
    write('              d:::::::ddddd:::::d           a::::rr::::::rrrrr::::::i::::i                          '), nl, 
    write('              d::::::d    d:::::d    aaaaaaa:::::ar:::::r     r:::::i::::i                          '), nl, 
    write('              d:::::d     d:::::d  aa::::::::::::ar:::::r     rrrrrri::::i                          '), nl, 
    write('              d:::::d     d:::::d a::::aaaa::::::ar:::::r           i::::i                          '), nl, 
    write('              d:::::d     d:::::da::::a    a:::::ar:::::r           i::::i                          '), nl, 
    write('              d::::::ddddd::::::da::::a    a:::::ar:::::r          i::::::i                         '), nl, 
    write('               d:::::::::::::::::a:::::aaaa::::::ar:::::r          i::::::i                         '), nl, 
    write('                d:::::::::ddd::::da::::::::::aa:::r:::::r          i::::::i                         '), nl, 
    write('    bbbbbbbb      dddddddd   ddddd aaaaaaaaaa  aaarrrrrrr          iiiiiiii                         '), nl, 
    write('    b::::::b            iiii                  jjjj                                       '), nl, 
    write('    b::::::b           i::::i                j::::j                                      '), nl, 
    write('    b::::::b            iiii                  jjjj                                       '), nl, 
    write('    b:::::b                                                                              '), nl, 
    write('    b:::::bbbbbbbbb   iiiiiinnnn  nnnnnnnn  jjjjjjj aaaaaaaaaaaayyyyyyy           yyyyyyy'), nl, 
    write('    b::::::::::::::bb i:::::n:::nn::::::::nnj:::::j a::::::::::::y:::::y         y:::::y '), nl, 
    write('    b::::::::::::::::b i::::n::::::::::::::nnj::::j aaaaaaaaa:::::y:::::y       y:::::y  '), nl, 
    write('    b:::::bbbbb:::::::bi::::nn:::::::::::::::j::::j          a::::ay:::::y     y:::::y   '), nl, 
    write('    b:::::b    b::::::bi::::i n:::::nnnn:::::j::::j   aaaaaaa:::::a y:::::y   y:::::y    '), nl, 
    write('    b:::::b     b:::::bi::::i n::::n    n::::j::::j aa::::::::::::a  y:::::y y:::::y     '), nl, 
    write('    b:::::b     b:::::bi::::i n::::n    n::::j::::ja::::aaaa::::::a   y:::::y:::::y      '), nl, 
    write('    b:::::b     b:::::bi::::i n::::n    n::::j::::a::::a    a:::::a    y:::::::::y       '), nl, 
    write('    b:::::bbbbbb::::::i::::::in::::n    n::::j::::a::::a    a:::::a     y:::::::y        '), nl, 
    write('    b::::::::::::::::bi::::::in::::n    n::::j::::a:::::aaaa::::::a      y:::::y         '), nl, 
    write('    b:::::::::::::::b i::::::in::::n    n::::j::::ja::::::::::aa:::a    y:::::y          '), nl, 
    write('    bbbbbbbbbbbbbbbb  iiiiiiiinnnnnn    nnnnnj::::j aaaaaaaaaa  aaaa   y:::::y           '), nl, 
    write('                                             j::::j                   y:::::y            '), nl, 
    write('                                   jjjj      j::::j                  y:::::y             '), nl, 
    write('                                  j::::jj   j:::::j                 y:::::y              '), nl, 
    write('                                  j::::::jjj::::::j                y:::::y               '), nl, 
    write('                                   jj::::::::::::j                yyyyyyy                '), nl, 
    write('                                     jjj::::::jjj                                        '), nl, 
    write('                                        jjjjjj                                           '), nl,nl, 
    write('Pada suatu malam yang melelahkan, anda tertidur setelah mengumpulkan Tugas Besar Alstrukdat.'), nl,
    write('Mata anda mulai menutup sambil berharap ketika anda membuka mata kembali semua Tugas Besar hilang.'), nl,
    write('Hujan begitu deras, anda mulai kedinginan dan mencoba menarik selimut, namun tidak berhasil, anda pun bingung dan terbangun.'), nl,
    write('Anda terkejut karena kamar anda tiba-tiba berubah menjadi tempat yang begitu asing.'), nl,
    write('Anda keluar dari kamar dan terkejut karena berada di negeri antah berantah, sesosok makhluk bersayap tiba-tiba muncul dan menghampiri anda.'), nl,
    write('Peri: Welcome to Binjay, permintaan anda telah dikabulkan, kini anda berada di dunia paralel yang tidak mengenal Tugas Besar.'), nl,
    write('Namun sebagai pendatang baru, anda harus bekerja keras dan memperoleh 20000 Gold dalam waktu 1 tahun.'), nl,
    write('Jika berhasil, anda akan diterima menjadi warga tetap dunia ini.'), nl,
    write('Jika gagal, anda akan disiksa selama 1 tahun lagi dan dikembalikan ke bumi untuk menyelesaikan semua Tugas Besar yang ada.'), nl,
    write('Goodluck.'), nl.

help :-
    write('|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|'), nl,
    write('|                         SALAM DARI BINJAY                           |'), nl,
    write('| 1. gaskeun: Mulai petualanganmu membebaskan diri dari Tugas Besar   |'), nl,
    write('| 2. map    : Menampilkan peta                                        |'), nl,
    write('| 3. status : Menampilkan kondisi terkinimu                           |'), nl,
    write('| 4. w      : Gerak ke utara 1 langkah                                |'), nl,
    write('| 5. s      : Gerak ke selatan 1 langkah                              |'), nl,
    write('| 6. d      : Gerak ke timur 1 langkah                                |'), nl,
    write('| 7. a      : Gerak ke barat 1 langkah                                |'), nl,
    write('| 8. help   : Menampilkan segala bantuan                              |'), nl,
    write('|                                                                     |'), nl,
    write(' ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ').

initBegin :-
    write('~~~~Selamat datang di BINJAY~~~~~'), nl,
    write('Silahkan masukkan nama anda(diawali dengan huruf non kapital): '), nl,
    read(Username),
    asserta(player(Username)), nl,
    write('Hello '), write(Username), nl,
    write('|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|'), nl,
    write('|                            Keahlian                                 |'), nl,
    write('|                                                                     |'), nl,
    write('| 1. fisherman : Temukan ikan legendaris dan jadi kaya!               |'), nl,
    write('|                                                                     |'), nl,
    write('| 2. farmer    : Nyangkul adalah jalan ninja anda. Salam dari Binjay! |'), nl,
    write('|                                                                     |'), nl,
    write('| 3. rancher   : ternak lele bossss!                                  |'), nl,
    write('|                                                                     |'), nl,
    write(' ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ '), nl, 
    write('Silahkan pilih keahlian yang anda inginkan: '), read(ID), nl,

    write('           FISHKISSFISHKIS               '), nl,
    write('       SFISHKISSFISHKISSFISH            F'), nl,
    write('    ISHK   ISSFISHKISSFISHKISS         FI'), nl,
    write('  SHKISS   FISHKISSFISHKISSFISS       FIS'), nl,
    write('HKISSFISHKISSFISHKISSFISHKISSFISH    KISS'), nl,
    write('  FISHKISSFISHKISSFISHKISSFISHKISS  FISHK'), nl,
    write('      SSFISHKISSFISHKISSFISHKISSFISHKISSF'), nl,
    write('  ISHKISSFISHKISSFISHKISSFISHKISSF  ISHKI'), nl,
    write('SSFISHKISSFISHKISSFISHKISSFISHKIS    SFIS'), nl,
    write('  HKISSFISHKISSFISHKISSFISHKISS       FIS'), nl,
    write('    HKISSFISHKISSFISHKISSFISHK         IS'), nl,
    write('       SFISHKISSFISHKISSFISH            K'), nl,
    write('         ISSFISHKISSFISHK               '), nl,
    write('                             +&-'), nl,
    write('                           _.-^-._    .--.'), nl,
    write('                        .-\'   _   \'-. |__|'), nl,
    write('                       /     |_|     \\|  |'), nl,
    write('                      /               \\  |'), nl,
    write('                     /|     _____     |\\ |'), nl,
    write('                      |    |==|==|    |  |'), nl,
    write('  |---|---|---|---|---|    |--|--|    |  |'), nl,
    write('  |---|---|---|---|---|    |==|==|    |  |'), nl,
    write('^jgs^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^'), nl,
    write('                                   .-\'"`/'), nl,
    write('                                  // /\' /\\`\\'), nl,
    write('                                (\'//.-\'/`-.;'), nl,
    write('                                 \\ \\ / /-.'), nl,
    write('              __.__.___..__._.___.\\\\ \\\\----,_'), nl,
    write('           .:{@&#,&#@&,@&#&&,#&@#&@&\\\\` \\-. .-\'-.'), nl,
    write('        .:{@#@,#@&#,@#&&#,@&#&@&,&@#&&\\\\, -._,"- \\'), nl,
    write('      .{#@#&@#@#&#&@&#@#@&#,@#@#&@&&#@#\\ \\// = \\`=\\__'), nl,
    write('      `{#@,@#&@&,@&#@,#@&#@#&@#&@,&#@,#/\\/ =`-. -_=__'), nl,
    write('        `:{@#&@&#@&#@&#@,#&&#@&,@#/.\'  / / "/.-\', /'), nl,
    write('           `:{@#&,#&@#,@&#&@&,@&#/.-// //-\'-_= ",/'), nl,
    write('              `~`~~`~~~`~`~`~~`~( / , /__,___.-"'), nl,
    write('                                 \\ \\\\/'), nl,
    write('                                  `\\\\\\\''), nl,

    write('done').

start :-
    title,
    help.

gaskeun :-
    \+binjay(_),
    asserta(binjay(99)),
    createMap,
    map, !.

gaskeun :-
    binjay(_),
    write('Sudah ada game yang dimulai').

nyerah :-
    \+ binjay(_),
    write('apasihhh belum mulaiii uda nyerah'), !.

nyerah :-
    binjay(_),
    retract(positionX(_)),
    retract(positionY(_)),
    retract(quest(_, _)),
    retract(ranch(_, _)),
    retract(market(_, _)),
    retract(water(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _)),
    retract(binjay(_)),
    write('dadahhhh'), !.