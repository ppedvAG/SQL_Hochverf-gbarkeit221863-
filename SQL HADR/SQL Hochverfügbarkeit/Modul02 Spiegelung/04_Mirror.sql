/*
RecoveryModel FULL

SIMPLE
es werden TX autom verworfen nach Commit .. Das Tlog leert sich selber
TLog kann nicht gesichert werden


BULK
I U D aber BULK nur rudimentär

LogShipping

FULL
ausführlich Protkollierung
auf Sekunde restorebar

Spiegelung braucht FULL


!!! Wenn DB irgendiwe spiegelt/synct, dann verliert man Logins (master) und Jobs(msdb)
--erst ab SQl 2022 weniger ein Problem, aber nur in AVGS

Die Kommunikation zw den Servern via Endpunkte erledigt entweder ein dediziertes Konto 
oder sonst das SQL Dienstkonto der jeweiligen Instanzen


zu tun:

1. Ein Login auf beiden Seiten für das Dienstkonto des SQL Server: schulung\svcSQL
2. Dem Login ein Recht auf den Endpunkt einrichten

Tipp: registrierte Server.. Abfrage wird auf allen Server ausgeführt

Autom FO und Redirect des Client:

man braucht Zeugeninstanz

auf jedem Client den SQLNCLI verwenden und dort den Failoverpartner eintragen:
[oledb] Connectionstring
; Everything after this line is an OLE DB initstring
Provider=SQLNCLI11.1;Integrated Security=SSPI;Persist Security Info=False;User ID="";Initial Catalog=LSMIRROR;Data Source=NodeOne;Initial File Name="";Failover Partner=NodeTwo;Server SPN=""


VollSicherung und T Sicherung auf 2ten Server kopieren und restore with norecovery

USE [master]
RESTORE DATABASE [MirrorDB] FROM  DISK = N'C:\_SQLBACKUPS\STDINSTANZ\MirrorDB.bak' WITH  FILE = 1,  NORECOVERY,  NOUNLOAD,  STATS = 5
RESTORE LOG [MirrorDB] FROM  DISK = N'C:\_SQLBACKUPS\STDINSTANZ\MirrorDB.bak' WITH  FILE = 2,  NORECOVERY,  NOUNLOAD,  STATS = 5

GO



*/
USE [master]
GO
CREATE LOGIN [SQLDOM\svcSQL] FROM WINDOWS WITH DEFAULT_DATABASE=[master]
GO



--Login für SQL Dienstkonto, da dies verwendet wird, wenn man kein dediziertes Konto angegeben hat...
CREATE LOGIN [schulung\svcSQL] FROM WINDOWS 

--Zugriffsrechte auf Spiegelungsendpunkt geben
GRANT CONNECT ON ENDPOINT::Spiegelung TO [SQLDOM\svcSQL]

--evtl von beiden Seiten aus das Script ausführen

USE MASTER

TCP://NodeONE.SQLDOM.dom:5022

TCP://NodeTwo.SQLDOM.dom:5022

--Auf HVSQL1
ALTER DATABASE MIrrorDB 
 SET PARTNER = 'TCP://NodeTwo.SQLDOM.dom:5022'
GO 

USE MASTER


--auf HV-SQL2
ALTER DATABASE MirrorDB 
 SET PARTNER = 'TCP://NodeOne.SQLDOM.dom:5022'
GO 





use Spiegelei

create table test (id int identity, spx char(4100))



insert into test 
select 'XY'
GO 30000



--Spiegelungsmonitor.. rechte Maustaste auf DB.. Tasks

--Failover auf Prinzipalseite
ALTER DATABASE <database_name> SET PARTNER FAILOVER;
GO

--auf Spiegel.. zb wenn der Prizipal gar nicht mehr ansprechbar ist.
--zwingend
--Eventuell nicht synchronisiert

ALTER DATABASE <database_name> SET PARTNER FORCE_SERVICE_ALLOW_DATA_LOSS





