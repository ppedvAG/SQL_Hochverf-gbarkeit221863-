/*

Logshipping
--mittels Backup des Logfiles einen zweiten Server immer wieder restoren
--Zeitdiff: Minuten

--mind 2 Minuten Differenz

das RevoveryModel muss mind auf Massenprotkolliert stehen

--Kopie..! von A auf \\B\...  Freigabe ist Pflicht

theoretisch lassen sich zig weitere Sekundäre Server herstellen

die Zeiten des Restore lassen sich pro Sekundären konfigurieren
Die DB auf den Sek können lesbar sein

Evtl zum Lastenausgleich, wenn auch Daten nicht aktuell

in ca 1 min fertig...

Troubleshooting sehr simpel

Wenn Schwierigkeiten beim Einrichten, dann wäre es ..\\

Kann Std Version





Spiegeln
das RecovModel muss Vollst. sein
nur ein Replica 1:1 nicht lesbar (restoring)
synchron (aber keine Garantie bei Ausfall)
ein automatischer Failover nur bei 3. SQL Server möglich (SSEX)
V+T auf Sek restone mit no recovery
Failover unter 3 Sekunden
Einrichtungsdauer: 10 sek 

depricated aber in anderer Form lebts weiter

Troubleshooting.. Port (FW), Dienstkonten, SSMS



CLUSTER
NT Cluster Voraussetzung
SQL Cluster Installation
NEtzlaufwerk (SAN\iSCSCI)

Ausfall des Dienstes nicht der DBs wird überbrückt
Aufwand rel hoch
Troubleshooting: deutlich komplexer

AD Rechte


SQL Cluster = normaler SQL Server
Kombi mit Spiegeln oder Logshipping




Availability Groups
lesbare Replikas
n-fache Replikas (max 8)
synchron
autom. Failover
Zugriff per virt Namen

Voraussetzung: NT Cluster, aber nicht SQL Cluster

Einrichten in 1 min
--das ist Spiegeln

Voraussetzung = RecModel Vollständig
NT Cluster
Zeugen autom Failover


ENT .. ab SQL 2016 Sp1 auch in STD 
































Cluster

Availability Groupy

Replikation