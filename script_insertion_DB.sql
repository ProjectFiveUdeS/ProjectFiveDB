--Script d'insertion de données exemples dans la base de données
--Par mace2801

INSERT INTO examen
VALUES ('gen280', 42, 0, '09:00:00', NULL, '10:00:00', NULL, '12:00:00', NULL, '2020-04-20');
INSERT INTO examen
VALUES ('gif420', 30, 1, '11:00:00', '10:00:00', '12:00:00', '11:00:00', '13:00:00', '13:00:00', '2020-04-20');
INSERT INTO examen
VALUES ('gel123', 15, 2, '17:00:00', NULL, '18:00:00', NULL, '19:00:00', NULL, '2020-04-21');

INSERT INTO local
VALUES ('C1-3024', 75, 'Une petite classe');
INSERT INTO local
VALUES ('C1-5001', 150, 'Une grosse classe');

INSERT INTO etudiant
VALUES ('robk1234', 'Robert', 'Keven', FALSE);
INSERT INTO etudiant
VALUES ('macb2901', 'Machabee', 'Bob', TRUE);
INSERT INTO etudiant
VALUES ('allf2345', 'Allaire', 'Fred', FALSE);
INSERT INTO etudiant
VALUES ('girm1235', 'Giroux', 'Martin', FALSE);

INSERT INTO place
VALUES (23, 'C1-3024');
INSERT INTO place
VALUES (24, 'C1-3024');
INSERT INTO place
VALUES (65, 'C1-5001');
INSERT INTO place
VALUES (78, 'C1-5001');

INSERT INTO assis_a
VALUES ('robk1234', TRUE, 23, 'C1-3024', 'gel123');
INSERT INTO assis_a
VALUES ('macb2901', TRUE, 24, 'C1-3024', 'gel123');
INSERT INTO assis_a
VALUES ('girm1235', TRUE, 65, 'C1-5001', 'gif420');
INSERT INTO assis_a
VALUES ('allf2345', FALSE, 78, 'C1-5001', 'gif420');

INSERT INTO sorties
VALUES (1, 54, '12:32:00', '12:34:00', 'girm1235');