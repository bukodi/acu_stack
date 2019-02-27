# Tervezési döntések

* A stack mérete csak 2 egész számú hatványa lehet, mert így egyszerűbb a címkezelés
* A stack-ben levő szavak méretének meg kell egyeznie ACU adatbuszának a méretével.
* A STACK vezérlő nem jelez hibát, ha teli stack esetén `push` vagy üres stack esetén `pop` műveletet kezdeményez.
Teli stack melletti `push` hatástalan, nem vátoztatja a stack tartalmát, míg az üres stack melletti `pop` `B00..00`-t ad vissza.
Azért döntöttünk így, mert a Stack állapotát csak az ACU Core befolyásolhatja, ezért az ACU-n firmware programozásakor 
elkerülhetjük azokat az ilyen eseteket.
* Úgyanezen ok miatt nem biztosítunk külön vezérlőjeleket arra, hogy az ACU Core lekérdezze a stack méretét.
* Nem használunk megszakítást
* A `stack_pointer` változó mutathat az első szabad memória cellára, vagy az utoljára használtra is. Mi azt választottuk, hogy az utolsó használatban levő cellát címezze, mert így a `top` művelet esetén közvetlenül használhatjuk.

# Elnevezések
* _User logic_ - Az egyedi interfésszel rendelkező, újrafelhasználható modul, amelyet stack kezelést megvalósítja egy blokk memória modulra épülve.
* _ACU Core_ - ACU, programot végrehajtó központi része
* _Adapter_ - Az MMIO interface irási,olvasási kéréseit fordítja a User Logic számára
* _Memória_ -  EDAC védett blokk memóriát megvalósító modul 
