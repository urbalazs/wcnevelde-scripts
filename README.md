# WC-nevelde BOT-ok

This is a Hungarian-language repository for web-based game "WC-nevelde".

## „Hasmenés” BOT

A „hasmenés” BOT folyamatosan termeli („fossa ki magából”) a barnatallérokat,
innen kapta a nevét. A BOT használatához meg kell adni a http://wcnevelde.com/
oldalon regisztrált felhasználónevet és jelszót. Ezeket a parancsfájl 37-38.
sorába kell beírni, közvetlenül az = jel után.

A BOT indításához a `bash wcnevelde-bot-hasmenes.sh` parancsot kell kiadni.

Ha naplózni szeretnéd a BOT futását, akkor át kell irányítani a kimenetet egy
fájlba. Ehhez a `bash wcnevelde-bot-hasmenes.sh >> hasmenes.log` parancsot add
ki. Ha meg szeretnéd nézni futás közben a naplófájlt, akkor azt a
`tail -f hasmenes.log` paranccsal láthatod valós időben.

A BOT minden 100. keresés után statisztikát is megjelenít a megtalált
barnatallérokról, valamint százalékos arányban is kiírja azt.


## „Jómunkásember” BOT

A „jómunkásember” BOT naponta egyszer dolgozik: belép az oldalra, kitakarítja a
szaros WC-t, elmegy dolgozni, valamint fejleszti a WC-t, ha lehetséges. A BOT
használatához meg kell adni a http://wcnevelde.com/ oldalon regisztrált
felhasználónevet és jelszót. Ezeket a parancsfájl 37-38. sorába kell beírni,
közvetlenül az = jel után.

A BOT futtatásához a `bash wcnevelde-bot-jomunkasember.sh` parancsot kell
kiadni. Ezt a BOT-ot csak naponta egyszer kell futtatni, ezért javasolt
valamilyen feladatütemezést beállítani. A legtöbb Linux disztribúció
alapértelmezetten tartalmazza a cron feladatkezelőt. Egy cron-feladat
beállításához add ki a `crontab -e` parancsot, majd írd be a fájlba a következő
sort:

    0 2 * * * bash /teljes/elérésiút/wcnevelde-bot-jomunkasember.sh

A fenti cron-feladat minden nap éjjel 2:00 órakor futtatja le a BOT-ot.

A cron-feladatok használatához bővebb információkért keress rá a kedvenc
keresőddel a *crontab használata* kifejezésre.
