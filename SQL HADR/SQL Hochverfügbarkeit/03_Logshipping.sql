/* schulung\Administrator


3 Auftr�ge: macht immer der Agent

Alles was manuell l�uft, erledigt der SQL Server

zB Vollsicherung auf anderen Server restoren

Wichtig: Die Rechte werden ohne Vererbung vergeben, evtl doch wichtig, wenn man Rechte vergibt;-)

Jeder Remotezugroff findet mit SQL Dienstkonto statt ausser bei 
managed Servicekonten (NT Service), dann ist es das Computerkonto



3 Jobs
1. Backup Log auf OrigServer
2. Kopieren der LogBackups zu den Replikas
3. Restore der DBs aus Logbackup


Vorbereitung:

Vollsicherung der DB (Pfad, Dateien)



Idee: cool , wenn alle Server ungef�hr identisch


Agent:			schulung \ sqlAgent ppedv2019!
SQL Server:		schulung \ svcSQL ppedv2019!



--Freigabe f�r Agent
\\nodeone\STDINSTANZ