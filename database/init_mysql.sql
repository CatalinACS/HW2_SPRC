CREATE DATABASE IF NOT EXISTS Tema2_Meteorologie;
USE Tema2_Meteorologie;

CREATE TABLE IF NOT EXISTS Tari (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nume VARCHAR(256) UNIQUE,
    lat FLOAT(10, 3) NOT NULL,
    lon FLOAT(10, 3) NOT NULL
);

CREATE TABLE IF NOT EXISTS Orase (
    id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    idTara INT(10),
    nume VARCHAR(256),
    lat FLOAT(10, 3) NOT NULL,
    lon FLOAT(10, 3) NOT NULL,
    CONSTRAINT FOREIGNKEY_Countries FOREIGN KEY (idTara)
        REFERENCES Tari (id) ON DELETE CASCADE,
    CONSTRAINT UNIQCONSTR_Cities UNIQUE (idTara, nume)
);

CREATE TABLE IF NOT EXISTS Temperaturi (
    id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    valoare FLOAT(10, 3) NOT NULL,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    idOras INT(10),
    CONSTRAINT FOREIGNKEY_Cities FOREIGN KEY (idOras)
        REFERENCES Orase (id) ON DELETE CASCADE,
    CONSTRAINT UNIQCONSTR_Temperatures UNIQUE (idOras, timestamp)
);

