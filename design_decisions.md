# Tervezési döntések



* A STACK vezérlő nem jelez hibát, ha teli stack esetén `push` vagy üres stack esetén `pop` műveletet kezdeményez.
Teli stack melletti `push` hatástalan, nem vátoztatja a stack tartalmát, míg az üres stack melletti `pop` `B00..00`-t ad vissza.
Azért döntöttünk így, mert a Stack állapotát csak az ACU Core befolyásolhatja, ezért az ACU-n firmware programozásakor 
elkerülhetjük azokat az ilyen eseteket.
* Úgyanezen ok miatt nem biztosítunk külön vezérlőjeleket arra, hogy az ACU Core lekérdezze a stack méretét.

# Elnevezések
* User logic
* ACU Core
* Adapter
* EDAC
