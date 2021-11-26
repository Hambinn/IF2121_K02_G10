:- dynamic(items/9).

/* Items berisi data sebagai berikut:
    1. ID
    2. Name
    3. Quantity
    4. Sell Price
    5. Buy Price                
    6. Level                    
    7. Minimum Farming Level
    8. Minimum fishing Level
    9. Minimum ranching level
*/

/* items(id,name,qty,sell,buy,level,farmLevel,fishLevel,ranchLevel) */

/* ****** ANIMAL PRODUCTS ****** */
/* Chicken */
items(1,egg,0,150,0,0,0,0,0).
items(2,egg,0,150,0,0,0,0,0).
items(3,egg,0,150,0,0,0,0,0).
items(4,egg,0,150,0,0,0,0,0).
items(5,egg,0,150,0,0,0,0,0).
items(6,egg,0,150,0,0,0,0,0).
items(7,large_egg,0,285,0,0,0,0,0).
items(8,large_egg,0,285,0,0,0,0,0).
items(9,large_egg,0,285,0,0,0,0,0).
items(10,golden_egg,0,1500,0,0,0,0,0).
/* Sheep */
items(11,wool,0,1020,0,0,0,0,0).
items(12,premium_wool,0,2000,0,0,0,0,0).
/* Cow */
items(13,milk,0,375,0,0,0,0,0).
items(14,large_milk,0,570,0,0,0,0,0).

/* ****** CROPS ****** */
items(21,wheat,0,75,0,0,0,0,0).
items(22,wheat_seeds,0,15,30,0,0,0,0).
items(23,corn,0,150,0,0,0,0,0).
items(24,corn_seeds,0,50,100,0,0,0,0).
items(25,eggplant,0,180,0,0,0,0,0).
items(26,eggplant_seeds,0,75,150,0,0,0,0).
items(27,tomato,0,180,0,0,0,0,0).
items(28,tomato_seeds,0,75,150,0,0,0,0).
items(29,potato,0,240,0,0,0,0,0).
items(30,potato_seeds,0,100,200,0,0,0,0).
items(31,cauliflower,0,525,0,0,0,0,0).
items(32,cauliflower_seeds,0,120,240,0,0,0,0).

/* ****** FISH ****** */
/* Junk Item */
items(48,boots,0,0,0,0,0,0,0).
items(49,seaweed,0,0,0,0,0,0,0).
items(50,ship,0,0,0,0,0,0,0).
/* Common Fish */
items(51,carp,0,150,0,0,0,0,0).
items(52,rainbow_trout,0,195,0,0,0,0,0).
items(53,bullhead,0,225,0,0,0,0,0).
items(54,largemouth_bass,0,300,0,0,0,0,0).
/* Rare Fish */
items(55,salmon,0,375,0,0,0,0,0).
items(56,tuna,0,450,0,0,0,0,0).
items(57,polka_dot_stingray,0,540,0,0,0,0,0).
items(58,arowana,0,1050,0,0,0,0,0).

/* ****** TOOLS ****** */
/* Farming */
items(101,shovel_1,0,0,200,1,0,0,0).
items(102,shovel_2,0,0,500,2,0,0,0).
/* Fishing */
items(111,fishing_rod_1,0,0,200,1,0,0,0).
items(112,fishing_rod_2,0,0,500,2,0,16,0).
/* Ranching */
items(121,milk_pail_1,0,0,200,1,0,0,0).
items(122,milk_pail_2,0,0,500,2,0,0,16).
items(123,shears_1,0,0,200,1,0,0,0).
items(124,shears_2,0,0,500,2,0,0,16).
items(125,chicken,0,0,500,0,0,0,0).
items(126,sheep,0,0,500,0,0,0,0).
items(127,cow,0,0,500,0,0,0,0).