CREATE TABLE examen
(
	id_cours_examen VARCHAR(64) NOT NULL,
	nbr_etudiants_prevu INT NOT NULL,
	nbr_etudiants_presents INT NOT NULL,
	debut TIME NOT NULL,
	tiers_temps TIME NOT NULL,
	tiers_temps_adapte TIME NOT NULL,
	fin TIME NOT NULL,
	PRIMARY KEY (id_cours_examen)
);

CREATE TABLE etudiant
(
	cip CHAR(8) NOT NULL,
	nom VARCHAR(64) NOT NULL,
	prenom VARCHAR(64) NOT NULL,
	PRIMARY KEY(cip)
<<<<<<< HEAD
=======
);

CREATE TABLE local
(
	numero_local VARCHAR(64) NOT NULL,
	nombre_places INT NOT NULL,
	description_local VARCHAR(64),
	PRIMARY KEY (numero_local),
	FOREIGN KEY (id_cours_examen) REFERENCES examen(id_cours_examen)
>>>>>>> 2d19f20208935a6e7d55cde1e0cad881273910dc
);

CREATE TABLE place
(
	numero_chaise INT NOT NULL,
	numero_local VARCHAR(64) NOT NULL,
	PRIMARY KEY (numero_chaise, numero_local),
	FOREIGN KEY (cip) REFERENCES etudiant(cip),
	FOREIGN KEY (numero_local) REFERENCES local(numero_local)
);

CREATE TABLE assis_a
(
	cip CHAR(8) NOT NULL,
	presence BOOL NOT NULL,
	numero_chaise INT NOT NULL,
	numero_local INT NOT NULL,
	id_cours_examen VARCHAR(64) NOT NULL,
	PRIMARY KEY (cip, id_cours_examen),
	FOREIGN KEY (cip) REFERENCES etudiant(cip),
	FOREIGN KEY (numero_chaise, numero_local) REFERENCES place(numero_chaise, numero_local),
	FOREIGN KEY (id_cours_examen) REFERENCES examen(id_cours_examen)
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
