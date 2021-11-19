:- dynamic(inventory/9).    
/* inventory(id,name,qty,sell,buy,level,farmLevel,fishLevel,ranchLevel) */

:- include('items.pl').

/* Maximum Inventory Slots : 100 */
inventoryCapacity(100).

/* ****** RULES ****** */

/* *** SELEKTOR *** */
/* Mengembalikan total items pada Inventory */
totalInventory(Length) :-
    findall(Qty, inventory(_,_,Qty,_,_,_,_,_,_), ListofQty),
    sumList(ListofQty,Length)
.

/* Rules tambahan untuk mengembalikan total elemen pada List of Qty */
/* sumList(List,Sum) */
sumList([], 0).
sumList([Head|Tail], Sum) :-
   sumList(Tail,Sum1),
   Sum is Head + Sum1
.

/* *** ADD ITEMS *** */
/* Belum ada item 'itemName' di Inventory */
addItems(ItemName,Quantity) :-
    inventoryCapacity(Max),
    totalInventory(Length),
    Length + Quantity =< Max,
    \+inventory(_,ItemName,_,_,_,_,_,_,_),
    items(ID,ItemName,Qty,Sell,Buy,Level,FarmLevel,FishLevel,RanchLevel),
    Qty2 is Qty + Quantity,
    asserta(inventory(ID,ItemName,Qty2,Sell,Buy,Level,FarmLevel,FishLevel,RanchLevel)),
    write('You get '), write(Quantity), write(' '), write(ItemName), write('!'),!
.
addItems(ItemID,Quantity) :-
    inventoryCapacity(Max),
    totalInventory(Length),
    Length + Quantity =< Max,
    \+inventory(ItemID,_,_,_,_,_,_,_,_),
    items(ItemID,Name,Qty,Sell,Buy,Level,FarmLevel,FishLevel,RanchLevel),
    Qty2 is Qty + Quantity,
    asserta(inventory(ItemID,Name,Qty2,Sell,Buy,Level,FarmLevel,FishLevel,RanchLevel)),
    write('You get '), write(Quantity), write(' '), write(Name), write('!'),!
.

/* Sudah ada item 'itemName' di Inventory */
addItems(ItemName,Quantity) :-
    inventoryCapacity(Max),
    totalInventory(Length),
    Length + Quantity =< Max,
    inventory(_,ItemName,Qty,_,_,_,_,_,_),
    Qty2 is Qty + Quantity,
    retract(inventory(ID,ItemName,Qty,Sell,Buy,Level,FarmLevel,FishLevel,RanchLevel)),
    asserta(inventory(ID,ItemName,Qty2,Sell,Buy,Level,FarmLevel,FishLevel,RanchLevel)),
    write('You get '), write(Quantity), write(' '), write(ItemName), write('!'),!
.
addItems(ItemID,Quantity) :-
    inventoryCapacity(Max),
    totalInventory(Length),
    Length + Quantity =< Max,
    inventory(ItemID,_,Qty,_,_,_,_,_,_),
    Qty2 is Qty + Quantity,
    retract(inventory(ItemID,Name,Qty,Sell,Buy,Level,FarmLevel,FishLevel,RanchLevel)),
    asserta(inventory(ItemID,Name,Qty2,Sell,Buy,Level,FarmLevel,FishLevel,RanchLevel)),
    write('You get '), write(Quantity), write(' '), write(Name), write('!'),!
.

/* Inventory sudah penuh sebelum penambahan items */
addItems(_,_) :-
    inventoryCapacity(Max),
    totalInventory(Length),
    Length = Max,
    write('Inventory full, no items were picked up!'),!,fail
.

/* Penambahan items melebih kapasitas inventory */
addItems(ItemName,Quantity) :-
    inventoryCapacity(Max),
    totalInventory(Length),
    Length + Quantity > Max,
    QtyAvailable is Max - Length,
    inventory(_,ItemName,Qty,_,_,_,_,_,_),
    Qty2 is Qty + QtyAvailable,
    retract(inventory(ID,ItemName,Qty,Sell,Buy,Level,FarmLevel,FishLevel,RanchLevel)),
    asserta(inventory(ID,ItemName,Qty2,Sell,Buy,Level,FarmLevel,FishLevel,RanchLevel)),
    write('Inventory full, only '), write(QtyAvailable), write(' '), write(ItemName), write(' were picked up!'),!
.

/* *** REMOVE ITEMS *** */
/* Item harus mencukupi */

/* Sudah ada item 'itemName' di inventory, jumlah mencukupi, dan tidak menjadi 0 setelah berkurang */
removeItems(ItemName,Quantity) :-
    inventory(_,ItemName,Qty,_,_,_,_,_,_),
    Qty2 is Qty - Quantity,
    Qty2 > 0,
    retract(inventory(ID,ItemName,Qty,Sell,Buy,Level,FarmLevel,FishLevel,RanchLevel)),
    asserta(inventory(ID,ItemName,Qty2,Sell,Buy,Level,FarmLevel,FishLevel,RanchLevel)),!
.
removeItems(ItemID,Quantity) :-
    inventory(ItemID,_,Qty,_,_,_,_,_,_),
    Qty2 is Qty - Quantity,
    Qty2 > 0,
    retract(inventory(ItemID,Name,Qty,Sell,Buy,Level,FarmLevel,FishLevel,RanchLevel)),
    asserta(inventory(ItemID,Name,Qty2,Sell,Buy,Level,FarmLevel,FishLevel,RanchLevel)),!
.

/* Sudah ada item 'itemName' di inventory, jumlah mencukupi, dan menjadi 0 setelah berkurang */
removeItems(ItemName,Quantity) :-
    inventory(_,ItemName,Qty,_,_,_,_,_,_),
    Qty2 is Qty - Quantity,
    Qty2 =:= 0,
    retract(inventory(_,ItemName,Qty,_,_,_,_,_,_)),!
.
removeItems(ItemID,Quantity) :-
    inventory(ItemID,_,Qty,_,_,_,_,_,_),
    Qty2 is Qty - Quantity,
    Qty2 =:= 0,
    retract(inventory(ItemID,_,Qty,_,_,_,_,_,_)),!
.