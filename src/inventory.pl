:- dynamic(inventory/9).    
/* inventory(id,name,qty,sell,buy,level,farmLevel,fishLevel,ranchLevel) */

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

/* Mengembalikan jumlah item 'itemName' pada Inventory */
amountItem(ItemName, Amount) :-
    inventory(_,ItemName,Qty,_,_,_,_,_,_),
    Amount is Qty,!
.

/* *** INPUT/OUTPUT *** */
/* inventory */
/* Mencetak informasi inventory */
inventory :-
    totalInventory(Length),
    write('Inventory kamuhh ('), write(Length), write('/100)'),nl,
    makeListItems(ListofLevel,ListofQty,ListofName),
    displayInventory(ListofLevel,ListofQty,ListofName),!
.

/* Mengembalikan list level, quantity, dan name dari item yang ada di inventory */
makeListItems(ListofLevel,ListofQty,ListofName) :-
    findall(Level, inventory(_,_,_,_,_,Level,_,_,_), ListofLevel),
    findall(Qty, inventory(_,_,Qty,_,_,_,_,_,_), ListofQty),
    findall(Name, inventory(_,Name,_,_,_,_,_,_,_), ListofName),!
.

/* Mencetak item-item yang ada di invenotry */
displayInventory([],[],[]).
displayInventory([A|X],[B|Y],[C|Z]) :-
    A >= 1,
    write(B), write(' level '), write(A), write(' '), printItemName(C), nl,
    displayInventory(X,Y,Z).
displayInventory([A|X],[B|Y],[C|Z]) :-
    A < 1,
    write(B), write(' '), printItemName(C), nl,
    displayInventory(X,Y,Z).

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
    write('Ciee dapet '), write(Quantity), write(' '), printItemName(ItemName), write('...'),!
.
addItems(ItemID,Quantity) :-
    inventoryCapacity(Max),
    totalInventory(Length),
    Length + Quantity =< Max,
    \+inventory(ItemID,_,_,_,_,_,_,_,_),
    items(ItemID,Name,Qty,Sell,Buy,Level,FarmLevel,FishLevel,RanchLevel),
    Qty2 is Qty + Quantity,
    asserta(inventory(ItemID,Name,Qty2,Sell,Buy,Level,FarmLevel,FishLevel,RanchLevel)),
    write('Ciee dapet '), write(Quantity), write(' '), printItemName(Name), write('...'),!
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
    write('Ciee dapet '), write(Quantity), write(' '), printItemName(ItemName), write('...'),!
.
addItems(ItemID,Quantity) :-
    inventoryCapacity(Max),
    totalInventory(Length),
    Length + Quantity =< Max,
    inventory(ItemID,_,Qty,_,_,_,_,_,_),
    Qty2 is Qty + Quantity,
    retract(inventory(ItemID,Name,Qty,Sell,Buy,Level,FarmLevel,FishLevel,RanchLevel)),
    asserta(inventory(ItemID,Name,Qty2,Sell,Buy,Level,FarmLevel,FishLevel,RanchLevel)),
    write('Ciee dapet '), write(Quantity), write(' '), printItemName(Name), write('...'),!
.

/* Inventory sudah penuh sebelum penambahan items */
addItems(_,_) :-
    inventoryCapacity(Max),
    totalInventory(Length),
    Length = Max,
    write('Yahh... Inventory-nya full, dadah item :('),!,fail
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
    write('Yahh... Inventory-nya full, hanya '), write(QtyAvailable), write(' '), printItemName(ItemName), write(' yang bisa diambil...'),!
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

/* *** THROW ITEMS *** */
throwItem :-
    write('Inventory kamuhh'),nl,
    makeListItems(ListofLevel,ListofQty,ListofName),
    displayInventory(ListofLevel,ListofQty,ListofName),
    nl,
    write('Mau buang apa?'),nl,
    read(ItemName),
    throwItemName(ItemName),!
.

/* Kondisi tidak ada item yang ingin di-throw */
throwItemName(ItemName) :-
    \+inventory(_,ItemName,_,_,_,_,_,_,_),
    nl,
    write('Maaf banget, tapi itemnya gaada di inventory :('),nl,!
.

/* Kondisi ada item yang ingin di-throw */
throwItemName(ItemName) :-
    inventory(_,ItemName,Qty,_,_,_,_,_,_),
    nl,
    write('Wah kamu punya '), write(Qty), write(' '), printItemName(ItemName), write('! Mau throw berapa '), printItemName(ItemName), write('? (0 untuk cancel)'), nl,
    read(Amount),
    throwAmount(ItemName,Amount)
.

/* Kondisi cancel throw */
throwAmount(ItemName,Qty) :-
    Qty =:= 0,
    nl,
    printItemName(ItemName), write('-nya terharu gajadi di-throw T-T'),nl,!
.

/* Kondisi jumlah yang ingin di-throw tidak cukup */
throwAmount(ItemName,Qty) :-
    inventory(_,ItemName,ItemQty,_,_,_,_,_,_),
    Qty > ItemQty,
    nl,
    write('Yahh ga cukup... '), printItemName(ItemName), write('-nya terharu gajadi di-throw T-T'),nl,!
.

/* Kondisi jumlah yang ingin di-throw tidak cukup */
throwAmount(ItemName,Qty) :-
    inventory(_,ItemName,ItemQty,_,_,_,_,_,_),
    Qty =< ItemQty,
    removeItems(ItemName,Qty),
    nl,
    write('Item-nya berhasil di-throw, dadahh '), write(Qty), write(' '), printItemName(ItemName), nl,!
.

/* *** PRINT ITEMS *** */
printItemName(ItemName) :-
    ItemName == egg,
    write('Egg'),!
.
printItemName(ItemName) :-
    ItemName == large_egg,
    write('Large Egg'),!
.
printItemName(ItemName) :-
    ItemName == golden_egg,
    write('Golden Egg'),!
.
printItemName(ItemName) :-
    ItemName == wool,
    write('Wool'),!
.
printItemName(ItemName) :-
    ItemName == milk,
    write('Milk'),!
.
printItemName(ItemName) :-
    ItemName == large_milk,
    write('Large Milk'),!
.
printItemName(ItemName) :-
    ItemName == wheat,
    write('Wheat'),!
.
printItemName(ItemName) :-
    ItemName == wheat_seeds,
    write('Wheat Seeds'),!
.
printItemName(ItemName) :-
    ItemName == corn,
    write('Corn'),!
.
printItemName(ItemName) :-
    ItemName == corn_seeds,
    write('Corn Seeds'),!
.
printItemName(ItemName) :-
    ItemName == eggplant,
    write('Eggplant'),!
.
printItemName(ItemName) :-
    ItemName == eggplant_seeds,
    write('Eggplant Seeds'),!
.
printItemName(ItemName) :-
    ItemName == tomato,
    write('Tomato'),!
.
printItemName(ItemName) :-
    ItemName == tomato_seeds,
    write('Tomato Seeds'),!
.
printItemName(ItemName) :-
    ItemName == potato,
    write('Potato'),!
.
printItemName(ItemName) :-
    ItemName == potato_seeds,
    write('Potato Seeds'),!
.
printItemName(ItemName) :-
    ItemName == cauliflower,
    write('Cauliflower'),!
.
printItemName(ItemName) :-
    ItemName == cauliflower_seeds,
    write('Cauliflower Seeds'),!
.
printItemName(ItemName) :-
    ItemName == carp,
    write('Carp'),!
.
printItemName(ItemName) :-
    ItemName == rainbow_trout,
    write('Rainbow Trout'),!
.
printItemName(ItemName) :-
    ItemName == bullhead,
    write('Bullhead'),!
.
printItemName(ItemName) :-
    ItemName == largemouth_bass,
    write('Largemouth Bass'),!
.
printItemName(ItemName) :-
    ItemName == salmon,
    write('Salmon'),!
.
printItemName(ItemName) :-
    ItemName == tuna,
    write('Tuna'),!
.
printItemName(ItemName) :-
    ItemName == polka_dot_stingray,
    write('Polka Dot Stingray'),!
.
printItemName(ItemName) :-
    ItemName == arowana,
    write('Arowana'),!
.
printItemName(ItemName) :-
    ItemName == hoe,
    write('Hoe'),!
.
printItemName(ItemName) :-
    ItemName == scythe,
    write('Scythe'),!
.
printItemName(ItemName) :-
    ItemName == fishing_rod_1,
    write('Fishing Rod'),!
.
printItemName(ItemName) :-
    ItemName == fishing_rod_2,
    write('Fishing Rod'),!
.
printItemName(ItemName) :-
    ItemName == milk_pail_1,
    write('Milk Pail'),!
.
printItemName(ItemName) :-
    ItemName == milk_pail_2,
    write('Milk Pail'),!
.
printItemName(ItemName) :-
    ItemName == shears_1,
    write('Shears'),!
.
printItemName(ItemName) :-
    ItemName == shears_2,
    write('Shears'),!
.