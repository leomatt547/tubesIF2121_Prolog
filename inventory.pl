:- dynamic(items/2).

/* items(jobID,namaItem,quantity)
JobID 0 = general

General Items*/
items(0,red_potion,0).
items(0,blue_potion,0).
items(0,pink_potion,0).
/* General Weapons */
items(0,starter_sword,0).
items(0,cheat_dagger,0).
/* General Armors */
items(0,starter_cloak,0).
items(0,mecha_suit,0).
items(0,plot_armor,0).

/* Hero Only Weapons */
items(1,longsword,1).
items(1,excalibur,0).
/* Hero Only Armors */
items(1,iron_armor,0).
items(1,hero_suit,0).

/* Paladin Only Weapons */
items(2,spiked_shield,0).
items(2,paladin_shield,0).
/* Paladin Only Armors*/
items(2,silver_breastplate,0).
items(2,golden_suit,0).

/* Wizard Only Weapons */
items(3,crooked_wand,0).
items(3,excelsior,0).
/* Wizard Only Armors */
items(3,red_robe,0).
items(3,grand_robe,0).