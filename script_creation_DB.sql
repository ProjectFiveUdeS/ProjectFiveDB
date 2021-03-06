CREATE TABLE examen
(
	id_cours_examen VARCHAR(64) NOT NULL,
	nbr_etudiants_prevu INT NOT NULL,
	nbr_etudiants_presents INT NOT NULL,
	debut TIME NOT NULL,
	debut_adapte TIME, 
	tiers_temps TIME NOT NULL,
	tiers_temps_adapte TIME,
	fin TIME NOT NULL,
	fin_adapte TIME,
	date_examen DATE NOT NULL,
	PRIMARY KEY (id_cours_examen)
);

CREATE TABLE etudiant
(
	cip CHAR(8) NOT NULL,
	nom VARCHAR(64) NOT NULL,
	prenom VARCHAR(64) NOT NULL,
	adapte BOOL NOT NULL,
	PRIMARY KEY(cip)
);

CREATE TABLE local
(
	numero_local VARCHAR(64) NOT NULL,
	nombre_places INT NOT NULL,
	description_local VARCHAR(64),
	PRIMARY KEY (numero_local)
);

CREATE TABLE place
(
	numero_chaise INT NOT NULL,
	numero_local VARCHAR(64) NOT NULL,
	PRIMARY KEY (numero_chaise, numero_local),
	FOREIGN KEY (numero_local) REFERENCES local(numero_local)
);

CREATE TABLE assis_a
(
	cip CHAR(8) NOT NULL,
	presence BOOL NOT NULL,
	numero_chaise INT NOT NULL,
	numero_local VARCHAR(64) NOT NULL,
	id_cours_examen VARCHAR(64) NOT NULL,
	PRIMARY KEY (cip, id_cours_examen),
	FOREIGN KEY (cip) REFERENCES etudiant(cip),
	FOREIGN KEY (numero_chaise, numero_local) REFERENCES place(numero_chaise, numero_local),
	FOREIGN KEY (id_cours_examen) REFERENCES examen(id_cours_examen)
);

CREATE TABLE sorties
(
    id_sortie INT NOT NULL,
    heure_debut TIME,
    heure_fin TIME,
    cip CHAR(8) NOT NULL,
    type_sortie INT NOT NULL,
    PRIMARY KEY (id_sortie),
    FOREIGN KEY (cip) REFERENCES etudiant(cip)
);

