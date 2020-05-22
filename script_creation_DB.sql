CREATE TABLE examen
(
<<<<<<< HEAD
	id_cours_examen VARCHAR(64) NOT NULL,
	nbr_etudiants_prevu INT NOT NULL,
	nbr_etudiants_presents INT NOT NULL,
	debut TIME NOT NULL,
	tiers_temps TIME NOT NULL,
	tiers_temps_adapte TIME NOT NULL,
	fin TIME NOT NULL,
	fin_adapte TIME NOT NULL,
	date_examen DATE NOT NULL,
	PRIMARY KEY (id_cours_examen)
=======
    id_cours_examen VARCHAR(64) NOT NULL,
    nbr_etudiants_prevu INT NOT NULL,
    nbr_etudiants_presents INT NOT NULL,
    debut TIME NOT NULL,
    tiers_temps TIME NOT NULL,
    tiers_temps_adapte TIME NOT NULL,
    fin TIME NOT NULL,
    PRIMARY KEY (id_cours_examen)
>>>>>>> 719399be97bb1e8c9497e78e4dd91518a81445e7
);

CREATE TABLE etudiant
(
<<<<<<< HEAD
	cip CHAR(8) NOT NULL,
	nom VARCHAR(64) NOT NULL,
	prenom VARCHAR(64) NOT NULL,
	adapte BOOL NOT NULL,
	PRIMARY KEY(cip)
=======
    cip CHAR(8) NOT NULL,
    nom VARCHAR(64) NOT NULL,
    prenom VARCHAR(64) NOT NULL,
    PRIMARY KEY(cip)
>>>>>>> 719399be97bb1e8c9497e78e4dd91518a81445e7
);

CREATE TABLE local
(
<<<<<<< HEAD
	numero_local VARCHAR(64) NOT NULL,
	nombre_places INT NOT NULL,
	description_local VARCHAR(64),
	PRIMARY KEY (numero_local)
=======
    numero_local INT NOT NULL,
    nombre_places INT NOT NULL,
    description_local VARCHAR(64),
    PRIMARY KEY (numero_local)
>>>>>>> 719399be97bb1e8c9497e78e4dd91518a81445e7
);

CREATE TABLE place
(
<<<<<<< HEAD
	numero_chaise INT NOT NULL,
	numero_local VARCHAR(64) NOT NULL,
	PRIMARY KEY (numero_chaise, numero_local),
	FOREIGN KEY (numero_local) REFERENCES local(numero_local)
=======
    numero_chaise INT NOT NULL,
    numero_local INT NOT NULL,
    PRIMARY KEY (numero_local, numero_chaise),
    FOREIGN KEY (numero_local) REFERENCES local(numero_local)
>>>>>>> 719399be97bb1e8c9497e78e4dd91518a81445e7
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
<<<<<<< HEAD
	id_sortie INT NOT NULL,
	type_sortie INT NOT NULL,
	heure_debut TIME NOT NULL,
	heure_fin TIME NOT NULL,
	cip CHAR(8) NOT NULL,
	PRIMARY KEY (id_sortie),
	FOREIGN KEY (cip) REFERENCES etudiant(cip)
=======
    id_sortie INT NOT NULL,
    heure_debut TIME NOT NULL,
    heure_fin TIME NOT NULL,
    cip CHAR(8) NOT NULL,
    type_sortie INT NOT NULL,
    PRIMARY KEY (id_sortie),
    FOREIGN KEY (cip) REFERENCES etudiant(cip)
>>>>>>> 719399be97bb1e8c9497e78e4dd91518a81445e7
);
