CREATE TABLE examen
(
	id_cours_examen VARCHAR(64) NOT NULL,
	nbr_etudiants_prevu INT NOT NULL,
	nbr_etudiants_presents INT NOT NULL,
	debut TIME NOT NULL,
	fin TIME NOT NULL,
	PRIMARY KEY (id_cours_examen)
);

CREATE TABLE etudiant
(
	cip CHAR(8) NOT NULL,
	nom VARCHAR(64) NOT NULL,
	prenom VARCHAR(64) NOT NULL,
	PRIMARY KEY(cip),
);

CREATE TABLE place
(
	numero_chaise INT NOT NULL,
	numero_local VARCHAR(64) NOT NULL,
	cip CHAR(8),
	presence BOOL,
	id_cours_examen VARCHAR(64),
	PRIMARY KEY (numero_chaise, numero_local),
	FOREIGN KEY (cip) REFERENCES etudiant(cip)
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
