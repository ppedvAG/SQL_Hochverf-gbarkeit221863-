-- Recoverymodel
--was schreibt das Logfile weg?

/*

Vollst�ndig
IUD Bulk werden sehr ausf�hrlich protokolliert
..w�chst schneller
--daher Sicherung des L notwendig
--sicher: auf Sek restore



Massenprotokolliert
I U D Bulk werden protkolliert rudiment�r
..es wird nichts gel�scht
Logfile wird nicht geleert, daher muss es gesichert werden
--Die Sicherung des Logfiles entfernt die Eintr�ge, die dann aber im Backup sind



Einfach 
folgendes wird protokolliert
I U D
Bulkbefehle (select * into , bulk copy bulk insert) rudiment�r

--wird aber sp�ter wieder gel�scht (vollautomatisch)..nach Checkpoint
--> keine Sicherung des Logfiles m�glich, da nix vern�nftiges drin