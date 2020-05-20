--Script d'insertion de données exemples dans la base de données
--Par mace2801

INSERT INTO examen
VALUES ('gen280', 42, 0, '09:00:00', '12:00:00');
INSERT INTO examen
VALUES ('gif420', 30, 1, '11:00:00', '13:00:00');
INSERT INTO examen
VALUES ('gel123', 15, 2, '17:00:00', '19:00:00');

INSERT INTO etudiant
VALUES ('robk1234', 'Robert', 'Keven');
INSERT INTO etudiant
VALUES ('macb2901', 'Machabee', 'Bob');
INSERT INTO etudiant
VALUES ('allf2345', 'Allaire', 'Fred');
INSERT INTO etudiant
VALUES ('girm1235', 'Giroux', 'Martin');

INSERT INTO place
VALUES (23, 'C1-3024', 'robk1234', TRUE, 'gel123');
INSERT INTO place
VALUES (24, 'C1-3024', 'macb2901', TRUE, 'gel123');
INSERT INTO place
VALUES (65, 'C1-5001', 'girm1235', TRUE, 'gif420');
INSERT INTO place
VALUES (78, 'C1-5001', 'allf2345', FALSE, 'gif420');

INSERT INTO sorties
VALUES (1, '12:32:00', '12:34:00', 'girm1235');