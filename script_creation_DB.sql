CREATE TABLE examen
(
	id_cours_examen VARCHAR(64) NOT NULL,
	nbr_etudiants_prevu INT NOT NULL,
	nbr_etudiants_presents INT NOT NULL,
	debut TIME NOT NULL,
	fin TIME NOT NULL,
	PRIMARY KEY (id_cours_examen)
);

CREATE TABLE local
(
	numero_local VARCHAR(64) NOT NULL,
	nbr_places INT NOT NULL,
	id_cours_examen VARCHAR(64) NOT NULL,
	PRIMARY KEY (numero_local),
	FOREIGN KEY (id_cours_examen) REFERENCES examen(id_cours_examen)
);

CREATE TABLE place
(
	numero_chaise INT NOT NULL,
	libre_ou_non BOOL NOT NULL,
	numero_local VARCHAR(64) NOT NULL,
	PRIMARY KEY (numero_chaise, numero_local),
	FOREIGN KEY (numero_local) REFERENCES local(numero_local)
);


CREATE TABLE etudiant
(
	cip CHAR(8) NOT NULL,
	nom VARCHAR(64) NOT NULL,
	prenom VARCHAR(64) NOT NULL,
	presence BOOL NOT NULL,
	id_cours_examen VARCHAR(64),
	numero_chaise INT NOT NULL,
	PRIMARY KEY(cip),
	FOREIGN KEY (id_cours_examen) REFERENCES examen(id_cours_examen),
	FOREIGN KEY (numero_chaise) REFERENCES place(numero_chaise)
);

CREATE TABLE sorties
(
	id_sortie INT NOT NULL,
	heure_debut TIME NOT NULL,
	heure_fin TIME NOT NULL,
	cip CHAR(8) NOT NULL,
	PRIMARY KEY (id_sortie),
	FOREIGN KEY (cip) REFERENCES etudiant(cip)
);
