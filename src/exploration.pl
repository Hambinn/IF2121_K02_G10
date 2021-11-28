w :-
    \+binjay(_),
    write('Anda belum tiba di Binjay'), !.

w :-
    binjay(_),
    addWaktu(1),
    positionX(X),
    positionY(Y),
    Next is (Y-1),
    \+isTop(X,Next),
    \+isBot(X,Next),
    \+isRight(X,Next),
    \+isLeft(X,Next),
    \+isQuest(X,Next),
    \+isMarket(X,Next),
    \+isWaterTile(X,Next,X,Next,X,Next,X,Next,X,Next,X,Next,X,Next,X,Next),
    \+isHome(X,Next),
    \+isRanch(X,Next),
    \+isDig(X, Next),
    \+isPlant(X, Next),
    \+isHarvest(X, Next),
    retract(positionY(_)),
    asserta(positionY(Next)),!.

w :-
    binjay(_),
    positionX(X),
    positionY(Y),
    Next is (Y-1),
    (
        isTop(X,Next);
        isBot(X,Next);
        isRight(X,Next);
        isLeft(X,Next)
    ),
    write('Kepentok pagar bosss'),!.


w :-
    binjay(_),
    positionX(X),
    positionY(Y),
    Next is (Y-1),
    isWaterTile(X,Next,X,Next,X,Next,X,Next,X,Next,X,Next,X,Next,X,Next),
    logoWater, !.

w :-
    binjay(_),
    positionX(X),
    positionY(Y),
    Next is (Y-1),
    isDig(X, Next),
    write('Anda tiba di tanah berlubang'),
    retract(positionY(_)),
    asserta(positionY(Next)), !.

w :-
    binjay(_),
    positionX(X),
    positionY(Y),
    Next is (Y-1),
    isPlant(X, Next),
    write('Widih ada tanaman'),
    retract(positionY(_)),
    asserta(positionY(Next)), !.

w :-
    binjay(_),
    positionX(X),
    positionY(Y),
    Next is (Y-1),
    isHarvest(X, Next),
    logoHarvest,
    retract(positionY(_)),
    asserta(positionY(Next)), !.

w :-
    binjay(_),
    positionX(X),
    positionY(Y),
    Next is (Y-1),
    isHome(X, Next),
    logoHome,
    retract(positionY(_)),
    asserta(positionY(Next)), !.

w :-
    binjay(_),
    positionX(X),
    positionY(Y),
    Next is (Y-1),
    isMarket(X, Next),
    logoMarket,
    retract(positionY(_)),
    asserta(positionY(Next)), !.

w :-
    binjay(_),
    positionX(X),
    positionY(Y),
    Next is (Y-1),
    isQuest(X, Next),
    logoQuest,
    retract(positionY(_)),
    asserta(positionY(Next)), !.

w :-
    binjay(_),
    positionX(X),
    positionY(Y),
    Next is (Y-1),
    isRanch(X, Next),
    logoRanch,
    retract(positionY(_)),
    asserta(positionY(Next)), !.

s :-
    \+binjay(_),
    write('Anda belum tiba di Binjay'), !.

s :-
    binjay(_),
    addWaktu(1),
    positionX(X),
    positionY(Y),
    Next is (Y+1),
    \+isTop(X,Next),
    \+isBot(X,Next),
    \+isRight(X,Next),
    \+isLeft(X,Next),
    \+isQuest(X,Next),
    \+isMarket(X,Next),
    \+isWaterTile(X,Next,X,Next,X,Next,X,Next,X,Next,X,Next,X,Next,X,Next),
    \+isHome(X,Next),
    \+isRanch(X,Next),
    \+isDig(X, Next),
    \+isPlant(X, Next),
    \+isHarvest(X, Next),
    retract(positionY(_)),
    asserta(positionY(Next)),!.

s :-
    binjay(_),
    positionX(X),
    positionY(Y),
    Next is (Y+1),
    (
        isTop(X,Next);
        isBot(X,Next);
        isRight(X,Next);
        isLeft(X,Next)
    ),
    write('Kepentok pagar bosss'),!.

s :-
    binjay(_),
    positionX(X),
    positionY(Y),
    Next is (Y+1),
    isWaterTile(X,Next,X,Next,X,Next,X,Next,X,Next,X,Next,X,Next,X,Next),
    logoWater, !.

s :-
    binjay(_),
    positionX(X),
    positionY(Y),
    Next is (Y+1),
    isDig(X, Next),
    write('Anda tiba di tanah berlubang'),
    retract(positionY(_)),
    asserta(positionY(Next)),!.

s :-
    binjay(_),
    positionX(X),
    positionY(Y),
    Next is (Y+1),
    isPlant(X, Next),
    write('Widih ada tanaman nihh'),
    retract(positionY(_)),
    asserta(positionY(Next)),!.

s :-
    binjay(_),
    positionX(X),
    positionY(Y),
    Next is (Y+1),
    isHarvest(X, Next),
    logoHarvest,
    retract(positionY(_)),
    asserta(positionY(Next)),!.

s :-
    binjay(_),
    positionX(X),
    positionY(Y),
    Next is (Y+1),
    isMarket(X, Next),
    logoMarket,
    retract(positionY(_)),
    asserta(positionY(Next)),!.

s :-
    binjay(_),
    positionX(X),
    positionY(Y),
    Next is (Y+1),
    isQuest(X, Next),
    logoQuest,
    retract(positionY(_)),
    asserta(positionY(Next)),!.

s :-
    binjay(_),
    positionX(X),
    positionY(Y),
    Next is (Y+1),
    isHome(X, Next),
    logoHome,
    retract(positionY(_)),
    asserta(positionY(Next)),!.

s :-
    binjay(_),
    positionX(X),
    positionY(Y),
    Next is (Y+1),
    isRanch(X, Next),
    logoRanch,
    retract(positionY(_)),
    asserta(positionY(Next)),!.

d :-
    \+binjay(_),
    write('Anda belum tiba di Binjay'), !.

d :-
    binjay(_),
    addWaktu(1),
    positionX(X),
    positionY(Y),
    Next is (X+1),
    \+isTop(Next,Y),
    \+isBot(Next,Y),
    \+isRight(Next,Y),
    \+isLeft(Next,Y),
    \+isQuest(Next,Y),
    \+isMarket(Next,Y),
    \+isWaterTile(Next,Y,Next,Y,Next,Y,Next,Y,Next,Y,Next,Y,Next,Y,Next,Y),
    \+isHome(Next,Y),
    \+isRanch(Next,Y),
    \+isDig(Next, Y),
    \+isPlant(Next, Y),
    \+isHarvest(Next, Y),
    retract(positionX(_)),
    asserta(positionX(Next)),!.

d :-
    binjay(_),
    positionX(X),
    positionY(Y),
    Next is (X+1),
    (
        isTop(Next, Y);
        isBot(Next,Y);
        isRight(Next,Y);
        isLeft(Next,Y)
    ),
    write('Kepentok pagar bosss'),!.

d :-
    binjay(_),
    positionX(X),
    positionY(Y),
    Next is (X+1),
    isWaterTile(Next,Y,Next,Y,Next,Y,Next,Y,Next,Y,Next,Y,Next,Y,Next,Y),
    logoWater, !.

d :-
    binjay(_),
    positionX(X),
    positionY(Y),
    Next is (X+1),
    isDig(Next, Y),
    write('anda tiba di tanah berlubang'),
    retract(positionX(_)),
    asserta(positionX(Next)),!.

d :-
    binjay(_),
    positionX(X),
    positionY(Y),
    Next is (X+1),
    isPlant(Next, Y),
    write('widih ada tanaman nihhh'),
    retract(positionX(_)),
    asserta(positionX(Next)),!.

d :-
    binjay(_),
    positionX(X),
    positionY(Y),
    Next is (X+1),
    isHarvest(Next, Y),
    logoHarvest,
    retract(positionX(_)),
    asserta(positionX(Next)),!.

d :-
    binjay(_),
    positionX(X),
    positionY(Y),
    Next is (X+1),
    isMarket(Next, Y),
    logoMarket,
    retract(positionX(_)),
    asserta(positionX(Next)),!.

d :-
    binjay(_),
    positionX(X),
    positionY(Y),
    Next is (X+1),
    isHome(Next, Y),
    logoHome,
    retract(positionX(_)),
    asserta(positionX(Next)),!.

d :-
    binjay(_),
    positionX(X),
    positionY(Y),
    Next is (X+1),
    isQuest(Next, Y),
    logoQuest,
    retract(positionX(_)),
    asserta(positionX(Next)),!.

d :-
    binjay(_),
    positionX(X),
    positionY(Y),
    Next is (X+1),
    isRanch(Next, Y),
    logoRanch,
    retract(positionX(_)),
    asserta(positionX(Next)),!.

a :-
    \+binjay(_),
    write('Anda belum tiba di Binjay'), !.
    
a :-
    binjay(_),
    addWaktu(1),
    positionX(X),
    positionY(Y),
    Next is (X-1),
    \+isTop(Next,Y),
    \+isBot(Next,Y),
    \+isRight(Next,Y),
    \+isLeft(Next,Y),
    \+isQuest(Next,Y),
    \+isMarket(Next,Y),
    \+isWaterTile(Next,Y,Next,Y,Next,Y,Next,Y,Next,Y,Next,Y,Next,Y,Next,Y),
    \+isHome(Next,Y),
    \+isRanch(Next,Y),
    \+isDig(Next, Y),
    \+isPlant(Next, Y),
    \+isHarvest(Next, Y),
    retract(positionX(_)),
    asserta(positionX(Next)),!.

a :-
    binjay(_),
    positionX(X),
    positionY(Y),
    Next is (X-1),
    (
        isTop(Next, Y);
        isBot(Next,Y);
        isRight(Next,Y);
        isLeft(Next,Y)
    ),
    write('Kepentok pagar bosss'),!.

a :-
    binjay(_),
    positionX(X),
    positionY(Y),
    Next is (X-1),
    isWaterTile(Next,Y,Next,Y,Next,Y,Next,Y,Next,Y,Next,Y,Next,Y,Next,Y),
    logoWater, !.

a :-
    binjay(_),
    positionX(X),
    positionY(Y),
    Next is (X-1),
    isDig(Next, Y),
    write('anda tiba di tanah berlubang'),
    retract(positionX(_)),
    asserta(positionX(Next)),!.

a :-
    binjay(_),
    positionX(X),
    positionY(Y),
    Next is (X-1),
    isPlant(Next, Y),
    write('widih ada tanaman nihhh'),
    retract(positionX(_)),
    asserta(positionX(Next)),!.

a :-
    binjay(_),
    positionX(X),
    positionY(Y),
    Next is (X-1),
    isHarvest(Next, Y),
    logoHarvest,
    retract(positionX(_)),
    asserta(positionX(Next)),!.

a :-
    binjay(_),
    positionX(X),
    positionY(Y),
    Next is (X-1),
    isMarket(Next, Y),
    logoMarket,
    retract(positionX(_)),
    asserta(positionX(Next)),!.

a :-
    binjay(_),
    positionX(X),
    positionY(Y),
    Next is (X-1),
    isHome(Next, Y),
    logoHome,
    retract(positionX(_)),
    asserta(positionX(Next)),!.

a :-
    binjay(_),
    positionX(X),
    positionY(Y),
    Next is (X-1),
    isQuest(Next, Y),
    logoQuest,
    retract(positionX(_)),
    asserta(positionX(Next)),!.

a :-
    binjay(_),
    positionX(X),
    positionY(Y),
    Next is (X-1),
    isRanch(Next, Y),
    logoRanch,
    retract(positionX(_)),
    asserta(positionX(Next)),!.











logoMarket :-
    write('      Selamat datang di'), nl,
    write('            _     _       _              '), nl,
    write('           | |   (_)     (_)             '), nl,
    write('           | |__  _ _ __  _  __ _ _   _  '), nl,
    write('           | \'_ \\| | \'_ \\| |/ _` | | | | '), nl,
    write('           | |_) | | | | | | (_| | |_| | '), nl,
    write('           |_.__/|_|_| |_| |\\__,_|\\__, | '), nl,
    write('                      _ _/ |_ _    __/ | '), nl,
    write('                     (_)__/| (_)  |___/  '), nl,
    write('            _ __ ___  _  __| |_          '), nl,
    write('           | \'_ ` _ \\| |/ _` | |         '), nl,
    write('           | | | | | | | (_| | |         '), nl,
    write('           |_| |_| |_|_|\\__,_|_|         '), nl, nl,
    write('Ketik shop. untuk melihat daftar barang').

logoWater :-
    write('               Ada air nih'), nl,
    write('{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}'), nl,
    write('{                .                        }'), nl,
    write('{               ":"                       }'), nl,
    write('{             ___:____     |"\\/"|         }'), nl,
    write('{           ,\'        `.    \\  /          }'), nl,
    write('{           |  O        \\___/  |          }'), nl,
    write('{         ~^~^~^~^~^~^~^~^~^~^~^~^~       }'), nl,
    write('{                                         }'), nl,
    write('{        Ketik fish. untuk memancing      }'), nl,
    write('{                                         }'), nl,
    write(' ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'), nl.

logoQuest :-
    write('                                       88  88                                                   88                            '), nl,
    write('                                       88  ""                                                   ""                            '), nl,
    write('                                       88                                                                                     '), nl,
    write('8b,dPPYba,    ,adPPYb,d8  88       88  88  88       ,adPPYb,d8  ,adPPYYba,  88,dPYba,,adPYba,   88  8b,dPPYba,    ,adPPYb,d8  '), nl,
    write('88P\'   `"8a  a8"    `Y88  88       88  88  88      a8"    `Y88  ""     `Y8  88P\'   "88"    "8a  88  88P\'   `"8a  a8"    `Y88  '), nl,
    write('88       88  8b       88  88       88  88  88      8b       88  ,adPPPPP88  88      88      88  88  88       88  8b       88  '), nl,
    write('88       88  "8a,   ,d88  "8a,   ,a88  88  88      "8a,   ,d88  88,    ,88  88      88      88  88  88       88  "8a,   ,d88  '), nl,
    write('88       88   `"YbbdP"Y8   `"YbbdP\'Y8  88  88       `"YbbdP"Y8  `"8bbdP"Y8  88      88      88  88  88       88   `"YbbdP"Y8  '), nl,
    write('              aa,    ,88                            aa,    ,88                                                    aa,    ,88  '), nl,
    write('               "Y8bbdP"                              "Y8bbdP"                                                      "Y8bbdP"   '), nl, nl,
    write('Ketik quest. untuk melihat daftar quest yang dapat diambil').


logoRanch :-
    write('               /( ,,,,, )\\'), nl,
    write('              _\\,;;;;;;;,/_'), nl,
    write('           .-"; ;;;;;;;;; ;"-.'), nl,
    write('           \'.__/`_ / \\ _`\\__.\''), nl,
    write('              | (\')| |(\') |'), nl,
    write('              | .--\' \'--. |'), nl,
    write('              |/ o     o \\|'), nl,
    write('              |           |'), nl,
    write('             / \\ _..=.._ / \\'), nl,
    write('            /:. \'._____.\'   \\'), nl,
    write('           ;::\'    / \\      .;'), nl,
    write('           |     _|_ _|_   ::|'), nl,
    write('         .-|     \'==o==\'    \'|-.'), nl,
    write('        /  |  . /       \\    |  \\'), nl,
    write('        |  | ::|         |   | .|'), nl,
    write('        |  (  \')         (.  )::|'), nl,
    write('        |: |   |;  U U  ;|:: | `|'), nl,
    write('        |\' |   | \\ U U / |\'  |  |'), nl,
    write('        ##V|   |_/`"""`\\_|   |V##'), nl,
    write('           ##V##         ##V##'), nl, nl,
    write('Ketik ranch. untuk mulai beternak').

logoHome :-
    write('                _      ()              ()      _'), nl,
    write('               / \\     ||______________||     / \\'), nl,
    write('              /___\\    |                |    /___\\'), nl,
    write('                |      |     BINJAY     |      |'), nl,
    write('               (_)     |_______  _______|     (_)'), nl,
    write('            ___/_\\___  {_______}{_______}  ___/_\\___'), nl,
    write('             |__~__|   %%%%%%%%%%%%%%%%%%   |__~__|'), nl,
    write('          ___|_____|__%%%%%%%%%%%%%%%%%%%%__|_____|___'), nl,
    write('             |     | %%%%%%%%%%%%%%%%%%%%%% |     |'), nl,
    write('              `=====%%%%%%%%%%%%%%%%%%%%%%%%=====`'), nl,
    write('             `=====%%%%%%%%%%%%%%%%%%%%%%%%%%=====`'), nl,
    write('            `=====%%%%%%%%%%%%%%%%%%%%%%%%%%%%=====`'), nl,
    write('           `=====/||||||||||||||||||||||||||||\\=====`'), nl,
    write('          `======||||||||||||||||||||||||||||||======`'), nl,
    write('         `=======||||||||||||||||||||||||||||||=======`'), nl,
    write('        `==============================================`'), nl, nl,
    write('    Ketik house. untuk masuk ke rumah'), nl.

logoHarvest :-
    write('         wWWWw               wWWWw'), nl,
    write('   vVVVv (___) wWWWw         (___)  vVVVv'), nl,
    write('   (___)  ~Y~  (___)  vVVVv   ~Y~   (___)'), nl,
    write('    ~Y~   \\|    ~Y~   (___)    |/    ~Y~'), nl,
    write('    \\|   \\ |/   \\| /  \\~Y~/   \\|    \\ |/'), nl,
    write('   \\\\|// \\\\|// \\\\|/// \\\\|//  \\\\|// \\\\\\|///'), nl,
    write('^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^'), nl,
    write('    Ketik harvest. untuk memanen tanaman'), nl.

logoDie :-
    write(' Anda mendengar suara yang sangat keras dari kejauhan'), nl,sleep(2),
    write('                   DUARRRRRRRR         '), nl, nl,sleep(2),
    write('              Peri tiba-tiba muncul'), nl, sleep(2),
    write(' Anda gagal menyelesaikan misi anda, sebagai hukuman anda akan disiksa'), nl,sleep(3),
    write('     _______'), nl,
    write('    |/      |'), nl,
    write('    |      (_)'), nl,
    write('    |      \\|/'), nl,
    write('    |       |'), nl,
    write('    |      / \\'), nl,
    write('    |'), nl,
    write('  __|___'), nl, sleep(2),
    write('         GAME OVER      ').

logoWin :-
    write('                                  ___________'), nl,
    write('                             .---\'::\'        `---.'), nl,
    write('                            (::::::\'              )'), nl,
    write('                            |`-----._______.-----\'|'), nl,
    write('                            |              :::::::|'), nl,
    write('                           .|               ::::::!-.'), nl,
    write('                           \\|               :::::/|/'), nl,
    write('                            |               ::::::|'), nl,
    write('                            | Special  Award :::::|'), nl,
    write('                            |    for Silliness::::|'), nl,
    write('                            |               ::::::|'), nl,
    write('                            |              .::::::|'), nl,
    write('                            |              :::::::|'), nl,
    write('                             \\            :::::::/'), nl,
    write('                              `.        .:::::::\''), nl,
    write('                                `-._  .::::::-\''), nl,
    write('____________________________________|  """|"_________________________________________'), nl,
    write('                                    |  :::|'), nl,
    write('                                    |   ::|'), nl,
    write('                                   /     ::\\   '), nl,
    write('                              __.-\'      :::`-.__'), nl,
    write('                             (_           ::::::_)'), nl,
    write('                               `"""---------"""\''), nl.

