/*
Für Hochverfügbarkeit lohnt es sicht die System rel identisch aufzusetzen. Dazu gehören Pfade und Dienstkonten

Natürlich sollten auch die Hardwareressourcen identisch sein, um einen ansatzweise idetnische Performance hinzubekommen

Viele HADR Lösungen beginnen mit V Sicherung .. 


Bei uns:


Pfade

C:\_SQLDBS
C:\BACKUP ...   C:\_SQLBackups

\\hv-sql1\backup


Sicherung komprimiert


ppedv2019!

SQL Server Dienst: schulung\svcSQL
SQL Agent		 : schulung\sqlAgent



V    D   TTTT60min nixTTTTTTT


