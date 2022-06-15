
SELECT * FROM DBA_TABLESPACES;
SELECT * FROM DBA_DATA_FILES;


CREATE TABLESPACE ELECCIONESTBS DATAFILE 'ELECCIONESDTF.tbs' SIZE 250M AUTOEXTEND ON NEXT 10M MAXSIZE 500M;
CREATE USER ELECCIONES IDENTIFIED BY ELECCIONES DEFAULT TABLESPACE ELECCIONESTBS ACCOUNT UNLOCK;
GRANT "DBA" TO "ELECCIONES" WITH ADMIN OPTION;


CREATE TABLESPACE EQUIPOSTBS DATAFILE 'EQUIPOSTBS.tbs' SIZE 250M AUTOEXTEND ON MAXSIZE 500M;
CREATE USER EQUIPOS IDENTIFIED BY EQUIPOS DEFAULT TABLESPACE EQUIPOSTBS ACCOUNT UNLOCK;
GRANT "DBA" TO "EQUIPOS" WITH ADMIN OPTION;

SELECT SID, SERIAL#, STATUS, SERVER
FROM V$SESSION
WHERE USERNAME = 'ADMIN1'
AND   STATUS <> 'KILLED';


show parameter processes;
alter system set processes=1500 scope=spfile;
shutdown IMMEDIATE
startup

show parameter sessions;
alter system set sessions=500 scope=spfile;
shutdown IMMEDIATE
startup

vi /u01/app/oracle/product/11.2.0/xe/dbs/spfileXE.ora



CREATE DIRECTORY backup_equipos  AS  '/u01/app/oracle/backup-equipos';
GRANT read, write ON DIRECTORY backup_equipos TO EQUIPOS;

expdp -parfile export_jugador_equipo.par
expdp -parfile export_liga_jornada.par

impdp -parfile export_jugador_equipo.par
impdp -parfile export_liga_jornada.par

chmod u=rw,g=r,o=r backup*




