#!/bin/bash

# WC-nevelde (http://wcnevelde.com) takarító-dolgozó „jómunkásember” BOT
# Copyright (C) 2016 Balázs Úr <urbalazs@gmail.com>
# Release date: 2016-10-21
# Version: 1.0
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


# Felhasználói adatok
USERNAME=
PASSWORD=
USERAGENT="Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:49.0) Gecko/20100101 Firefox/49.0"
COOKIE=/tmp/wc-nevelde-cookie


# A BOT futtatása
echo -n 'BOT futtatása: '
date "+%Y-%m-%d %H:%M:%S"

echo -n 'A WC-nevelde oldal betöltése...     '
wget --save-cookies $COOKIE --keep-session-cookies -O /dev/null -q --user-agent=$USERAGENT http://wcnevelde.com/index.php
echo ' [ OK ]'

echo -n 'Belépés az oldalra...               '
wget --save-cookies $COOKIE --load-cookies $COOKIE --keep-session-cookies -O /dev/null -q --post-data="login_nick=$USERNAME&login_passwd=$PASSWORD&login=Bejelentkezés"  --user-agent=$USERAGENT http://wcnevelde.com/index.php
echo ' [ OK ]'

echo -n 'A WC szaros, de kipucolom...        '
wget --load-cookies $COOKIE --keep-session-cookies -O /dev/null -q --user-agent=$USERAGENT http://wcnevelde.com/wc.php?action=pucol
echo ' [ OK ]'

echo -n 'Elmegyek dolgozni...                '
wget --load-cookies $COOKIE --keep-session-cookies -O /dev/null -q --user-agent=$USERAGENT http://wcnevelde.com/munkahely.php?action=munka
echo ' [ OK ]'

echo -n 'Ha lehet, akkor fejlesztem a WC-t...'
wget --load-cookies $COOKIE --keep-session-cookies -O /dev/null -q --user-agent=$USERAGENT http://wcnevelde.com/bolt.php?action=szintnov
echo ' [ OK ]'

echo -n 'Végeztem mára, kilépek...           '
wget --load-cookies $COOKIE --keep-session-cookies -O /dev/null -q --user-agent=$USERAGENT http://wcnevelde.com/wc.php?action=logout
rm $COOKIE
echo ' [ OK ]'
