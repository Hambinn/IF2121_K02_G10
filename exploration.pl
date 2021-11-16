w :-
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
    retract(positionY(_)),
    asserta(positionY(Next)),!.

w :-
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
    positionX(X),
    positionY(Y),
    Next is (Y-1),
    isWaterTile(X,Next,X,Next,X,Next,X,Next,X,Next,X,Next,X,Next,X,Next),
    logoWater, !.

w :-
    positionX(X),
    positionY(Y),
    Next is (Y-1),
    isHome(X, Next),
    logoHome,
    retract(positionY(_)),
    asserta(positionY(Next)), !.

w :-
    positionX(X),
    positionY(Y),
    Next is (Y-1),
    isMarket(X, Next),
    logoMarket,
    retract(positionY(_)),
    asserta(positionY(Next)), !.

w :-
    positionX(X),
    positionY(Y),
    Next is (Y-1),
    isQuest(X, Next),
    logoQuest,
    retract(positionY(_)),
    asserta(positionY(Next)), !.

w :-
    positionX(X),
    positionY(Y),
    Next is (Y-1),
    isRanch(X, Next),
    logoRanch,
    retract(positionY(_)),
    asserta(positionY(Next)), !.

s :-
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
    retract(positionY(_)),
    asserta(positionY(Next)),!.

s :-
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
    positionX(X),
    positionY(Y),
    Next is (Y+1),
    isWaterTile(X,Next,X,Next,X,Next,X,Next,X,Next,X,Next,X,Next,X,Next),
    logoWater, !.

s :-
    positionX(X),
    positionY(Y),
    Next is (Y+1),
    isMarket(X, Next),
    logoMarket,
    retract(positionY(_)),
    asserta(positionY(Next)),!.

s :-
    positionX(X),
    positionY(Y),
    Next is (Y+1),
    isQuest(X, Next),
    logoQuest,
    retract(positionY(_)),
    asserta(positionY(Next)),!.

s :-
    positionX(X),
    positionY(Y),
    Next is (Y+1),
    isHome(X, Next),
    logoHome,
    retract(positionY(_)),
    asserta(positionY(Next)),!.

s :-
    positionX(X),
    positionY(Y),
    Next is (Y+1),
    isRanch(X, Next),
    logoRanch,
    retract(positionY(_)),
    asserta(positionY(Next)),!.

d :-
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
    retract(positionX(_)),
    asserta(positionX(Next)),!.

d :-
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
    positionX(X),
    positionY(Y),
    Next is (X+1),
    isWaterTile(Next,Y,Next,Y,Next,Y,Next,Y,Next,Y,Next,Y,Next,Y,Next,Y),
    logoWater, !.

d :-
    positionX(X),
    positionY(Y),
    Next is (X+1),
    isMarket(Next, Y),
    logoMarket,
    retract(positionX(_)),
    asserta(positionX(Next)),!.

d :-
    positionX(X),
    positionY(Y),
    Next is (X+1),
    isHome(Next, Y),
    logoHome,
    retract(positionX(_)),
    asserta(positionX(Next)),!.

d :-
    positionX(X),
    positionY(Y),
    Next is (X+1),
    isQuest(Next, Y),
    logoQuest,
    retract(positionX(_)),
    asserta(positionX(Next)),!.

d :-
    positionX(X),
    positionY(Y),
    Next is (X+1),
    isRanch(Next, Y),
    logoRanch,
    retract(positionX(_)),
    asserta(positionX(Next)),!.
    
a :-
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
    retract(positionX(_)),
    asserta(positionX(Next)),!.

a :-
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
    positionX(X),
    positionY(Y),
    Next is (X-1),
    isWaterTile(Next,Y,Next,Y,Next,Y,Next,Y,Next,Y,Next,Y,Next,Y,Next,Y),
    logoWater, !.

a :-
    positionX(X),
    positionY(Y),
    Next is (X-1),
    isMarket(Next, Y),
    logoMarket,
    retract(positionX(_)),
    asserta(positionX(Next)),!.

a :-
    positionX(X),
    positionY(Y),
    Next is (X-1),
    isHome(Next, Y),
    logoHome,
    retract(positionX(_)),
    asserta(positionX(Next)),!.

a :-
    positionX(X),
    positionY(Y),
    Next is (X-1),
    isQuest(Next, Y),
    logoQuest,
    retract(positionX(_)),
    asserta(positionX(Next)),!.

a :-
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
    write('    Ketik tidur. untuk tidur'), nl.
