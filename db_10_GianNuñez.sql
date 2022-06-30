DROP DATABASE dbConferenceVG;
create database dbConferenceVG;
use dbConferenceVG;

create table PARTICIPANTE (
	IDPAR int auto_increment,
    FECREGPAR date ,
    NOMPAR varchar(50),
    APEPAR varchar(80),
    DNIPAR char(8),
    TIPPAR char(1),
    CELPAR char(9),
    EMAPAR varchar(90),
    DIRPAR varchar(90),
    ESTPAR char(1),
    CONSTRAINT IDPAR PRIMARY KEY (IDPAR)
);
create table PONENTE (
	CODPON char(5),
	NOMPON varchar(50),
	APEPON varchar(80),
	CELPON char(8),
	DNIPON char(9),
	EMAPON varchar(90),
	DIRPON varchar(90),
	CONSTRAINT CODPON PRIMARY KEY (CODPON)
);

 create table CONFERENCIA (
	CODCONF char(5),
    TEMCONF varchar(90),
    FECCONF date,
    PONCONF char(5),
    CONSTRAINT CODCONF PRIMARY KEY (CODCONF)
 );
 
 create table REGISTRO  (
	CODREG char(5),
    CODPAR int,
    FECREG date,
    CERTREG char(1),
    CONSTRAINT CODREG PRIMARY KEY (CODREG)
 );
    
 create table REGISTRODETALLE(
	IDREGDET int auto_increment,
    CODREG char(5),
    FECREG char(5),
    CERTREG int,
    CONSTRAINT IDREGDET PRIMARY KEY (IDREGDET)
 );    


ALTER TABLE PARTICIPANTE
	ADD CONSTRAINT PARTICIPANTE_REGISTRO FOREIGN KEY (CODREG) REFERENCES REGISTRO(IDPAR);

ALTER TABLE PARTICIPANTE
	ADD CONSTRAINT PARTICIPANTE_REGISTRO FOREIGN KEY (IDPAR) REFERENCES REGISTRO(CODREG);

ALTER TABLE PARTICIPANTE
	ADD CONSTRAINT PARTICIPANTE_REGISTRO FOREIGN KEY (IDPAR) REFERENCES REGISTRO(CODREG);





INSERT INTO PARTICIPANTE
(NOMPAR, APEPAR, DNIPAR,TIPPAR,CELPAR,EMAPAR,DIRPAR,ESTPAR)
VALUES  
    ("Juan","Campos Perez","40255133","1","986512478","juan.comapos@vallegrande.edu.pe","AV. MiraFlores","A"),
    ("Sofia","Solano Avila","64978531","1","974815258","sofia.solano@vallegrande.edu.pe","Jr. Hullaga","A"),
    ("Maria","Rosales Guerra","15925874","1","986532147","maria.rosales@vallegrande.edu.pe","Calle Girasoles","A"),
    ("Marcos","Alarcon Hermosa","48781512","2","","marcos.alarcon@vallegrande.edu.pe","","A"),
    ("Martin","Saman Arata","84152631","2","","martin.saman@vallegrande.edu.pe","Jr. Union","A"),
    ("Jose","Quispe Luyo","48161937","2","978415321","jose.quispe@vallegrande.edu.pe","Calle Avancay","A"),
    ("Claudia"," Barrasca Carrazco","78452596","3","","cbarraza@gmail.com","Jr. Los Jardines","A"),
    ("Jhonana"," Bendezu Anccasi","74321564","3","","jbendezu@yahoo.com","","A"),
	("Mario","Acosta Palomino","15326499","3","931764521","mario.acosta@outlookcom","AV. MiraFlores","A");



INSERT INTO PONENTE
(CODPON, NOMPON, APEPON,CELPON,DNIPON,EMAPON,DIRPON)
VALUES  
("P0001","Alverto","Corrales Lozada","","15273798","alberto.corrales@yahoo.com","Calle los Portales" ),
("P0002","Juana","Sanchez Ortega","974815258","15273798","alberto.corrales@yahoo.com","AV. la libertad" ), 
("P0003","Javier","Corrales Lozada","995236147","13256497","javier.nakasome@gmail.com","Jr. San Martin" ),
("P0004","Sonia","Huayta Medina","","15273798","sonia.huayta@gmail.com","AV. las Garderias" ),
("P0005","Fabiano","Carrion Avila","","15273798","","Jr. Hunacayo" );


INSERT INTO CONFERENCIA
(CODCONF, TEMCONF, FECCONF,PONCONF)
VALUES  
("C0001","Gestion de datos con MYSQL","15/07/2022","P0001"),
("C0002","Joins paso a paso ","16/07/2022","P0002"),
("C0003","Consulata con parametros","17/07/2022","P0003"),
("C0004","Administracion de datos con MYSQL","16/07/2022","P0004"),
("C0005","Gestion de backup de base de datos ","15/07/2022","P0005");

INSERT INTO REGISTRO
(CODREG,FECREG,CERTREG)
VALUES 
("R0001","1","S"),
("R0002","3","S"),
("R0003","4","S"),
("R0004","7","S"),
("R0005","2","N"),
("R0006","5","N"),
("R0007","6","N"),
("R0008","7","N");

INSERT INTO REGISTRODETALLE
(IDREGDET,CODREG,FECREG,CERTREG)
VALUES 
("1","R0001","C0001","2"),
("2","R0001","C0002","1"),
("3","R0002","C0001","4"),
("4","R0002","C0003","1"),
("5","R0003","C0004","1"),
("6","R0004","C0005","2"),
("7","R0005","C0005","3"),
("8","R0005","C0003","2"),
("3"),
("4"),
("2"),
("6"),
("1");


select * from PARTICIPANTE;
select * from PONENTE;
select * from CONFERENCIA;
select * from REGISTRO;