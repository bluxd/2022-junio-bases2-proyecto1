CREATE TABLE Liga(
    liga integer PRIMARY KEY,
    nombre CHAR(250 CHAR) NOT NULL,
    fecha_inicio Date NOT NULL,
    fecha_fin Date NOT NULL
);

CREATE TABLE Jornada(
    jornada integer PRIMARY KEY,
    numero integer NOT NULL,
    Liga_liga integer NOT NULL
    --CONSTRAINT LIGA_JORNADA_FK FOREIGN KEY (Liga_liga) REFERENCES Liga(liga)
);

CREATE TABLE Equipo(
    equipo integer PRIMARY KEY,
    nombre char(300 char) NOT NULL
);

CREATE TABLE Jugador(
    jugador integer PRIMARY KEY,
    nombre char(300 char) NOT NULL,
    goles integer NOT NULL,
    Equipo_equipo integer NOT NULL
    --CONSTRAINT EQUIPO_JUGADOR_FK FOREIGN KEY (Equipo_equipo) REFERENCES Equipo(equipo)
);

CREATE TABLE Partido(
    partido integer PRIMARY KEY,
    fecha date NOT NULL,
    goles_local integer NOT NULL,
    goles_visita integer NOT NULL,
    Jornada_jornada integer NOT NULL,
    Equipo_equipo integer NOT NULL,
    Equipo_equipo1 integer NOT NULL
    --CONSTRAINT JORNADA_PARTIDO_FK FOREIGN KEY (Jornada_jornada) REFERENCES Jornada(jornada),
    --CONSTRAINT EQUIPO_LOCAL_PARTIDO_FK FOREIGN KEY (Equipo_equipo) REFERENCES Equipo(equipo),
    --CONSTRAINT EQUIPO_VISITANTE_PARTIDO_FK FOREIGN KEY (Equipo_equipo1) REFERENCES Equipo(equipo)
);

--DROP TABLE Liga;
--DROP TABLE Jornada;
--DROP TABLE Equipo;
--DROP TABLE Jugador;
--DROP TABLE Partido;
