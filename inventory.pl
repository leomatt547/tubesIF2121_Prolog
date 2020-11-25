:- dynamic(items/2).

/* items(jobID,namaItem,quantity)
JobID 1 = health
JobID 2 = armor
JobID 3 = weapon

General Items*/
items(1,red_potion,0,1).
items(2,blue_potion,0,1).
items(3,pink_potion,0,1).
/* General Weapons */
items(4,starter_sword,0,3).
items(5,cheat_dagger,0,3).
/* General Armors */
items(6,starter_cloak,0,2).
items(7,mecha_suit,0,2).
items(8,plot_armor,0,2).

/* Hero Only Weapons */
items(0,longsword,0,3).
items(0,excalibur,0,3).
/* Hero Only Armors */
items(0,iron_armor,0,2).
items(0,hero_suit,0,2).

/* Paladin Only Weapons */
items(0,spiked_shield,0,3).
items(0,paladin_shield,0,3).
/* Paladin Only Armors*/
items(0,silver_breastplate,0,2).
items(0,golden_suit,0,2).

/* Wizard Only Weapons */
items(0,crooked_wand,0,3).
items(0,excelsior,0,3).
/* Wizard Only Armors */
items(0,red_robe,0,2).
items(0,grand_robe,0,2).