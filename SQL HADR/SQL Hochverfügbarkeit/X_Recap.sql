/*


500GB DB- Ausfall der DB

A Ausfall des Server bzw der DB max 15min
B Wie hoch darf der Datenverlust sein in Zeit? 10 min
C Client konfigurierbar

--> Hochverfügbar

LogShipping x 0
RModel: Bulk
Infrastruktur: Freigabe, Agent, Dom, mind SQL Std
Idee SQL Alias 
With standby

Spiegeln x 0
SQL Native Client Client: Connectionstring  Failover Partner=HV-SQL2;Server SPN=""
Infrastruktur: "Kanal" (default 5022) Firewall!
				ab SQL Std
				initalisierte DB (V + T) - Restore with no recovery


Cluster  0, weil Dienst läuft


AVG     x   x



Replikation  0x 0x



*/

--kleine Aufgabe:
--DBX wollen wir spieglen
--Spiegeln einrichten mit Hilfe einer duch Logshipping initalisierten DB


--Wichtig:
/*
Backup Auftrag deaktiviern
Copy Auftrag deaktiveren
Restore deaktiveren

der Reihe nach Copy und Restore manuell starten

auf master DB des Sekundären set partner starten
dann auf master des Prinzipals set partner starten
*/


--ISCSI
..vhdx ..

--weitere HDD in CLuster mit iscsi einbinden

SQLBAKHDD--> den Server 1 und 2 zur Verfügung

--Formatieren
--iscsi initartor starten
--IP Adresse der Servernetzverwenden


