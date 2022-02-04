CREATE DATABASE cineville;
CREATE USER 'marshall07'@'localhost' IDENTIFIED BY 'marshall';
GRANT ALL PRIVILEGES ON * . * TO 'marshall07'@'localhost';
CREATE USER 'user'@'localhost' IDENTIFIED BY 'hawa029';
GRANT SELECT ON * . * TO 'user'@'localhost';

USE cineville;

CREATE TABLE City
(
    id INT NOT NULL PRIMARY KEY  AUTO_INCREMENT,
    Postcode DECIMAL(5,0) NOT NULL ,
    Name_city VARCHAR(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE Cinema
(
    id INT NOT NULL PRIMARY KEY  AUTO_INCREMENT,
    Adress VARCHAR(250) NOT NULL ,
    id_city INT  ,
    FOREIGN KEY (id_city) REFERENCES City(id) ON DELETE SET NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

ALTER TABLE Cinema ADD name VARCHAR(50) NULL ;


CREATE Table Room(
    id INT NOT NULL PRIMARY KEY  AUTO_INCREMENT,
    Num_Siting DECIMAL(6,0),
    Num_Room DECIMAL(6,0) ,
    id_cinema INT,
    FOREIGN KEY (id_cinema) REFERENCES Cinema(id) ON DELETE SET NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;


 CREATE Table Roles(
     id INT NOT NULL PRIMARY KEY  AUTO_INCREMENT,
     Role_Name VARCHAR (50)
 )ENGINE=InnoDB  DEFAULT CHARSET=utf8;



CREATE Table Users(
    id INT NOT NULL PRIMARY KEY  AUTO_INCREMENT,
    First_Name VARCHAR (50) NOT NULL,
    Name VARCHAR (50) NOT NULL,
    Email VARCHAR(254) NOT NULL,
    Date_OF_Birth DATE,
    Date_Creation DATE,
    Passeword VARCHAR(60) NOT NULL,
    id_roles INT,
    FOREIGN KEY (id_roles) REFERENCES Roles(id) ON DELETE SET NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;


CREATE Table Movies(
    id INT NOT NULL PRIMARY KEY  AUTO_INCREMENT,
    Title_Movies VARCHAR (50) NOT NULL ,
    Duration TIME NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE Table Session(
     id INT NOT NULL PRIMARY KEY  AUTO_INCREMENT,
     Date_Session date NOT NULL,
     Start_Time time NOT NULL,
     End_Time Time NOT NULL,
     id_movies INT ,
     id_cinema INT,
     id_room INT,
     FOREIGN KEY (id_movies) REFERENCES Movies(id) ON DELETE SET NULL,
     FOREIGN KEY (id_cinema) REFERENCES Cinema(id) ON DELETE SET NULL,
     FOREIGN KEY (id_room) REFERENCES Room(id) ON DELETE SET NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;



CREATE Table Reservation( 
    id INT NOT NULL PRIMARY KEY  AUTO_INCREMENT,
    Date_Reservation date NOT NULL,
    Hour_Reservation time NOT NULL,
    id_users INT ,
    FOREIGN KEY (id_users) REFERENCES Users(id) ON DELETE SET NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE Table rate(
    id INT NOT NULL PRIMARY KEY  AUTO_INCREMENT,
    Description VARCHAR (50) NOT NULL,
    Price DECIMAL(4,2) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE Table Bill (
    id INT NOT NULL PRIMARY KEY  AUTO_INCREMENT,
    Num_seat DECIMAL(9,0) NOT NULL,
    Amount DECIMAL(9,2) NOT NULL,
    id_reservation INT ,
    id_session INT ,
    id_rate INT ,
    FOREIGN KEY (id_reservation) REFERENCES Reservation(id) ON DELETE SET NULL ,
    FOREIGN KEY (id_session) REFERENCES Session(id) ON DELETE SET NULL,
    FOREIGN KEY (id_rate) REFERENCES rate(id) ON DELETE SET NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

INSERT INTO City ( postcode, name_city) 
VALUES 
('44190' , 'Clisson') , 
('51100' ,'Reims') , 
('44000' ,'Nantes') , 
('49000' ,'Angers') ;

INSERT INTO Cinema (adress,id_city,name) 
VALUES
('2 rue des fleurs','1','EVC Clisson'),
('15 avenue voltaire','2','EVC Reims'),
('25 Bis rue pierre-Camille ','3','EVC Nantes') ,
('4 avenue des Iris','4','EVC Angers');

INSERT INTO Room (num_siting,Num_room,id_cinema)
VALUES
('50','1','1'),
('60','2','1'),
('30','3','1'),
('20','4','1'),
('60','5','1'),

('50','1','2'),
('40','2','2'),
('30','3','2'),
('50','4','2'),

('50','1','3'),
('40','2','3'),
('20','3','3'),
('30','4','3'),

('45','1','4'),
('55','2','4'),
('60','3','4'),
('30','4','4');

INSERT INTO Roles (role_name)
VALUES ('Clients'),('Customers'),('Administrator');



INSERT INTO Users (first_Name,name,email,date_of_birth,date_creation,passeword,id_roles)
VALUES
('Méryl','Dupon', 'meryl@outllok.fr','1999-08-23', '2021-09-14','$2y$10$n0IESCOU/m7B0.8ARGX2yut.Oi0M7k6VtGVpbadFb5uicMazuk/aC','1'),
('Alexis','Morin', 'alexis.morin@outllok.fr', '1988-04-15','2021-09-14','$2y$10$tfpwmlJ9y4EAAa5rKft/EORZVcubLBBjpOAj0DOM7JLTTYJfzJB4q','1'),
('Graziella','Fournel', 'g.fournel@orange.fr','1963-07-22', '2021-09-14','$2y$10$w4aUczCF7lc46latxf6OV.pjnXzcSjnXcYhRXE39gMfOpr3m2roKO','1'),
('Janick','Morin', 'm.janick@outllok.fr', '1975-02-14', '2021-09-14','$2y$10$Dm5xWZaqym2jNzELHvFw6eYzOP3n6PWYb/7Vq2X5RSER7QyBdoYJ2','1'),
('Mickael','Guerin', 'micka@outllok.fr', '1998-08-25', '2021-09-14','$2y$10$UmW0eK//Wv7D40KQs2pUBeDMWQkcwfdL2mH3xoIjJDbWNAkofP.sm','1'),
('Aline','Marsollier', 'marsoaline@outllok.fr','1970-06-04', '2021-09-14','$2y$10$ecYttYWVVpeCnPkNoGEjfePUg5MiTHEw89emfzOdkUGbFT3P2IDnu','2'),
('Marine','Martin', 'm.martin@outllok.fr', '1989-09-03', '2021-09-14','$2y$10$DHelsrydOHkiU83Uj2CeB.f4Q98QaWOvdTKpyxk0FGym7ieCFPEuW','2'),
('Rose','durand', 'rose@free.fr', '1986-11-18', '2021-09-14','$2y$10$7PgHsyh00HJ/OYj3gTx4DOkXjPHaN6qWc3N9/00wQLchwRUs/70lu','2'),
('Marion','Alano', 'mariona@orange.fr','1995-12-28', '2021-09-14','$2y$10$UnE0hW/anQoJtClUSoj52eJwG.nJlpvy8XfyC9FkxNnBPUmWFoTCO','2'),
('Emilie','Danion', 'mimid@outllok.fr','1984-01-30', '2021-09-14','$2y$10$Yyb9.a23Dhw3f70UlIE3A.485WbK5DnFS2FbNBvwJuyZEOnNe5o9S','3');


INSERT INTO Movies (Title_Movies,Duration)
VALUES
('Alain et son chien','02:03:00'),
('La compagnie des anges','01:59:00'),
('Le grimmoire magique','01:35:00'),
('A coté de toi ','01:45:00'),
('Ma soeur et moi','01:54:00'),
('Le petit alain','01:48:00');


INSERT INTO Session (Date_Session,Start_Time,End_Time,id_movies,id_cinema,id_room)
VALUES
('2021-12-19','10:00:00','12:00:00','1','1','1'),
('2021-12-19','10:00:00','12:00:00','1','1','2'),
('2021-11-19','14:00:00','16:00:00','2','2','3'),
('2021-09-17','21:00:00','23:00:00','3','3','4'),
('2021-12-20','20:00:00','22:00:00','4','4','2'),
('2021-12-22','19:00:00','21:00:00','5','4','1');


INSERT INTO Reservation(Date_Reservation,Hour_Reservation,id_users)
VALUES
('2021-09-16','18:32:00','1'),
('2021-09-15','14:03:00','2'),
('2021-09-14','12:25:00','3'),
('2021-09-13','10:05:00','4'),
('2021-09-12','11:59:00','5');

INSERT INTO rate (Description,Price)
VALUES ('Plein tarif',"9.20"),('Etudiant','7.60'),('Moins de 14 ans','5.90');

INSERT INTO Bill (Num_seat,Amount,id_reservation,id_session,id_rate)
VALUES
('2','18.40','1','3','1'),
('1','07.60','3','4','2'),
('5','24.50','4','2','3'),
('1','09.20','2','4','1'),
('1','07.60','5','6','2');

--Passage du même film dans un même cinema à la même heure dans des salle différentes--
SELECT Title_Movies AS 'film', Cinema.name AS 'Cinema' , Session.id  AS 'Sceance', Room.Num_Room AS 'Salle'  , Session.Start_Time AS "Début"
FROM Session
JOIN Movies ON Movies.id = Session.id_movies
JOIN cinema ON  cinema.id = Session.id_cinema
JOIN Room on Room.id= Session.id_room
ORDER BY Session.start_time ;

--Liste des différents cinemas
SELECT Cinema.name AS 'Nom', City.postcode AS 'postcode', City.name_city AS 'name'
FROM Cinema
JOIN City on city.id = Cinema.id_city,

