CREATE TABLE school.subjects (
	ID INT auto_increment,
    NAME VARCHAR(128),
    DURATION TIME,
    TEACHER_NAME VARCHAR(128),
    
    PRIMARY KEY(ID)
);

-- DATA should be DATE
CREATE TABLE school.students (
	ID INT auto_increment,
    NAME VARCHAR(128),
    CLASS VARCHAR(3),
    BORN_DATA DATE,
    EGN VARCHAR(10),
    SUBJECT_ID INT,
    
    FOREIGN KEY (SUBJECT_ID) REFERENCES school.subjects(ID),
    PRIMARY KEY (ID)
);

-- ID - 1
INSERT INTO school.subjects (NAME, DURATION, TEACHER_NAME)
VALUES ('Maths', '40:00:00', 'Tsvetanka Todorova');

-- ID - 2
INSERT INTO school.subjects (NAME, DURATION, TEACHER_NAME)
VALUES ('Bulgarian', '40:00:00', 'Vaniq Georgieva');

-- ID - 3
INSERT INTO school.subjects (NAME, DURATION, TEACHER_NAME)
VALUES ('OOP', '40:00:00', 'Lubomir Chorbadjiev');

-- ID - 4
INSERT INTO school.subjects (NAME, DURATION, TEACHER_NAME)
VALUES ('TP', '40:00:00', 'Kiko Mitov');

-- ID - 5
INSERT INTO school.subjects (NAME, DURATION, TEACHER_NAME)
VALUES ('WebD', '40:00:00', 'Momchil StranataFamiliq');


INSERT INTO school.students (NAME, CLASS, BORN_DATA, SUBJECT_ID)
VALUES ('Conko', '11A', '1999-04-04', 2);

INSERT INTO school.students (NAME, CLASS, BORN_DATA, SUBJECT_ID)
VALUES ('Monko', '11A', '1999-04-04', 2);

INSERT INTO school.students (NAME, CLASS, BORN_DATA, SUBJECT_ID)
VALUES ('Daradonko', '11A', '1999-04-04', 3);

INSERT INTO school.students (NAME, CLASS, BORN_DATA, SUBJECT_ID)
VALUES ('Milko', '11A', '1999-04-04', 4);


SELECT st.NAME, st.CLASS, sbj.NAME
FROM school.students as st, school.subjects as sbj
WHERE st.SUBJECT_ID=sbj.ID;