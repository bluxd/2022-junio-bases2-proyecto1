
ALTER SESSION SET current_schema = EQUIPOS;

SELECT * FROM LIGA;
SELECT * FROM JORNADA;
SELECT * FROM EQUIPO;
SELECT * FROM JUGADOR;
SELECT * FROM PARTIDO;


TRUNCATE TABLE Liga;
TRUNCATE TABLE Jornada;
TRUNCATE TABLE Equipo;
TRUNCATE TABLE Jugador;
TRUNCATE TABLE Partido;

DROP TABLE Liga;
DROP TABLE Jornada;
DROP TABLE Equipo;
DROP TABLE Jugador;
DROP TABLE Partido;


expdp EQUIPOS/EQUIPOS@XE dumpfile=backup_jugador_equipo.dmp tables=Jugador,Equipo content=metadata_only
impdp system/Panda12345@XE dumpfile=backup_jugador_equipo.dmp


expdp EQUIPOS/EQUIPOS@XE dumpfile=backup_liga_jornada.dmp tables=Liga,Jornada
impdp system/Panda12345@XE dumpfile=backup_liga_jornada.dmp


cd /u01/app/oracle/admin/XE/dpdump
rm backup*

cp /u01/app/oracle/admin/XE/dpdump/backup_jugador_equipo.dmp /u01/app/oracle/backup-equipos/backup_jugador_equipo.dmp
cp /u01/app/oracle/admin/XE/dpdump/backup_liga_jornada.dmp /u01/app/oracle/backup-equipos/backup_liga_jornada.dmp
chmod u=rw,g=r,o=r backup*

