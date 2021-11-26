:- dynamic(itemType / 1).
:- dynamic(inventory / 3).

% Item Type
itemType(fish).
itemType(gardening).
itemType(equipment).
itemType(seed).
itemType(produce).

% Inventory 
inventory(arwana, fish, 1).
inventory(gurame, fish, 1).
inventory(lele, fish, 1).
inventory(mujair, fish, 1).
inventory(nila, fish, 1).
inventory(wortel, gardening, 0).
inventory(lobak, gardening, 1).
inventory(kentang, gardening, 1).
inventory(bawang, gardening, 1).
inventory(tomat, gardening, 1).
inventory(fishing_rod,equipment,0).
inventory(shovel,equipment,0).
inventory(watering,equipment,0).
inventory(bibit_wortel, seed, 0).
inventory(bibit_lobak, seed, 0).
inventory(bibit_kentang, seed, 0).
inventory(bibit_bawang, seed, 0).
inventory(bibit_tomat, seed, 0).
inventory(telur, produce, 1).
inventory(sutra, produce, 2).
inventory(daging, produce, 3).

% Harga
price(arwana, 100).
price(gurame, 26).
price(lele, 14).
price(mujair, 18).
price(nila, 16).	
price(wortel, 10).
price(lobak, 8).
price(kentang, 12).
price(bawang, 16).
price(tomat, 8).
price(bibit_wortel, 5).
price(bibit_lobak, 4).
price(bibit_kentang, 6).
price(bibit_bawang, 8).
price(bibit_tomat, 4).
price(ayam, 200).
price(domba, 300).
price(sapi, 400).
price(telur, 100).
price(sutra, 150).
price(daging, 200).

price_upgrade_to(shovel,1,100).
price_upgrade_to(shovel,2,100).
price_upgrade_to(shovel,3,100).

price_upgrade_to(fishing_rod,1,100).
price_upgrade_to(fishing_rod,2,100).
price_upgrade_to(fishing_rod,3,100).