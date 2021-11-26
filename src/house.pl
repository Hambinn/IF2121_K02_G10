:- include('exploration.pl').
:- include('inventory.pl').
:- include('')

writeDiary(FileName):-
    tell(FileName),
    writeInventory,
    writePosisiPlayer,
    told,!.

