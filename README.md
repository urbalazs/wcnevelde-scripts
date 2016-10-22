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
