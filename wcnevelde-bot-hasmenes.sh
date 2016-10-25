#!/bin/bash

# WC-nevelde (http://wcnevelde.com) barnatallérgyűjtő „hasmenés” BOT
# Copyright (C) 2016 Balázs Úr <urbalazs@gmail.com>
# Release date: 2016-10-21
# Last update: 2016-10-24
# Version: 2.0
#
# This program is free software: you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later
# version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along with
# this program. If not, see <http://www.gnu.org/licenses/>.
#
# ----------------------------------------------------------------------------
#
# Ez a program szabad szoftver; terjeszthető illetve módosítható a Free Software
# Foundation által kiadott GNU General Public License dokumentumában leírtak;
# akár a licenc 3-as, akár (tetszőleges) későbbi változata szerint.
#
# Ez a program abban a reményben kerül közreadásra, hogy hasznos lesz, de
# minden egyéb GARANCIA NÉLKÜL, az ELADHATÓSÁGRA vagy VALAMELY CÉLRA VALÓ
# ALKALMAZHATÓSÁGRA való származtatott garanciát is beleértve. További
# részleteket a GNU General Public License tartalmaz.
#
# A felhasználónak a programmal együtt meg kell kapnia a GNU General Public
# License egy példányát; ha mégsem kapta meg, akkor tekintse meg a
# <http://www.gnu.org/licenses/> oldalon.

clear

# Süti beállítások
USERAGENT="Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36"
COOKIE=/tmp/wc-nevelde-cookie

# Fejléc
echo ""
echo "    wcnevelde.com barnatallér bányász"
echo "    Control-C a leállításhoz"
echo ""

# "Login" képernyő
ALL=$(tput lines)
tput cup $((($ALL / 2) - 3)) 15
printf "BELÉPÉS (hagyd üresen a fájlban lévő adatok használatához)\n"

tput cup $((($ALL / 2) - 1)) 15
printf "Felhasználói név: "
read USERNAME

if [ -z "$USERNAME" ]
then
    # Felhasználói adatok
    USERNAME=
    PASSWORD=
else
    tput cup $(($ALL / 2)) 15
    printf "Jelszó: "
    read -s PASSWORD
fi

clear

# A BOT futtatása
echo " +-------------------------------------+"
echo -n ' |  BOT indítása: '
date "+%Y-%m-%d %H:%M:%S  |"
echo " +-------------------------------------+"
echo ""

echo -n '    Csatlakozás a wcnevelde.com-hoz...  '
wget --save-cookies $COOKIE --keep-session-cookies -O /dev/null -q --user-agent=$USERAGENT http://wcnevelde.com/index.php
echo ' [ OK ]'

echo -n '    Belépés a WC-be...                  '
wget --save-cookies $COOKIE --load-cookies $COOKIE --keep-session-cookies -O /dev/null -q --post-data="login_nick=$USERNAME&login_passwd=$PASSWORD&login=Bejelentkezés"  --user-agent=$USERAGENT http://wcnevelde.com/index.php
echo ' [ OK ]'

echo -n '    Barnatallérok lekérdezése...        '
TALLER=`wget --load-cookies $COOKIE --keep-session-cookies -O - -q --user-agent=$USERAGENT http://wcnevelde.com/wc.php | grep -a 'Barna' | grep -ao "[[:digit:]]\{1,10\}"`
printf ' [ OK ]\n\n'

printf "Most |$TALLER| barnatallérod van. Loop indítása "
sleep 0.5
printf "3..."
sleep 1
printf "2..."
sleep 1 
printf "1...\n\n"
sleep 1

COUNT=0
FOUND=0
while true
do
    let COUNT++
    if [ `wget --load-cookies $COOKIE --keep-session-cookies -O - -q --post-data="duplavagysemmi=0.5" --user-agent=$USERAGENT http://wcnevelde.com/jatekok.php?action=duplavagysemmi | grep -ac 'Nyert'` = 1 ]
    then
        let TALLER++
        let FOUND++
        echo "[`date "+%Y-%m-%d %H:%M:%S"`] TALÁLAT    +1    |$TALLER|"
    else
        echo "[`date "+%Y-%m-%d %H:%M:%S"`] -"
    fi

    # statisztika kiírása minden 100. próba után
    if [[ $(($COUNT % 100)) -eq 0 && $COUNT -gt 0 ]]
    then
        echo ""
        echo "STATISZTIKA: keresések: $COUNT, barnatallér delta: $FOUND, találati arány: $((100*$FOUND/$COUNT))%"
        echo ""
    fi
done
