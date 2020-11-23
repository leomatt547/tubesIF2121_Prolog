:- dynamic(inventory/2).

/* inventory(jobID,namaItem,quantity)
JobID 0 = general

General Items*/
inventory(0,red_potion,0).
inventory(0,blue_potion,0).
inventory(0,pink_potion,0).
/* General Weapons */
inventory(0,starter_sword,0).
inventory(0,cheat_dagger,0).
/* General Armors */
inventory(0,starter_cloak,0).
inventory(0,mecha_suit,0).
inventory(0,plot_armor,0).

/* Hero Only Weapons */
inventory(1,longsword,0).
inventory(1,excalibur,0).
/* Hero Only Armors */
inventory(1,iron_armor,0).
inventory(1,hero_suit,0).

/* Paladin Only Weapons */
inventory(2,spiked_shield,0).
inventory(2,paladin_shield,0).
/* Paladin Only Armors*/
inventory(2,silver_breastplate,0).
inventory(2,golden_suit,0).

/* Wizard Only Weapons */
inventory(3,crooked_wand,0).
inventory(3,excelsior,0).
/* Wizard Only Armors */
inventory(3,red_robe,0).
inventory(3,grand_robe,0).