CREATE DATABASE cineville;
CREATE USER 'marshall07'@'localhost' IDENTIFIED BY 'marshall';
GRANT ALL PRIVILEGES ON * . * TO 'marshall07'@'localhost';
CREATE USER 'user'@'localhost' IDENTIFIED BY 'hawa029';
GRANT SELECT ON * . * TO 'user'@'localhost';

USE cineville;

CREATE TABLE City
(
    id INT NOT NULL PRIMARY KEY  AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    zipcode VARCHAR (8)NOT NULL 
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE Cinema
(
    id INT NOT NULL PRIMARY KEY  AUTO_INCREMENT,
    name VARCHAR(50) NULL,
    address VARCHAR(250) NOT NULL ,
    cityId INT  ,
    FOREIGN KEY (cityId) REFERENCES City(id) ON DELETE SET NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;


CREATE Table Hall(
    id INT NOT NULL PRIMARY KEY  AUTO_INCREMENT,
    numOfSeat INT NOT NULL,
    hallNumber INT NOT NULL,
    cinemaId INT,
    FOREIGN KEY (cinemaId) REFERENCES Cinema(id) ON DELETE SET NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;


 CREATE Table Roles(
     id INT NOT NULL PRIMARY KEY  AUTO_INCREMENT,
     designation VARCHAR (50)
 )ENGINE=InnoDB  DEFAULT CHARSET=utf8;



CREATE Table Users(
    id INT NOT NULL PRIMARY KEY  AUTO_INCREMENT,
    firstName VARCHAR (50) NOT NULL,
    surName VARCHAR (50) NOT NULL,
    email VARCHAR(254) NOT NULL,
    password VARCHAR(60) NOT NULL,
    rolesId INT,
    FOREIGN KEY (rolesId) REFERENCES Roles(id) ON DELETE SET NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;


CREATE Table Movies(
    id INT NOT NULL PRIMARY KEY  AUTO_INCREMENT,
    title VARCHAR (100) NOT NULL ,
    Duration TIME NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE Table Streaming(
     id INT NOT NULL PRIMARY KEY  AUTO_INCREMENT,
     dateOfStream date NOT NULL,
     beginHour time NOT NULL,
     endHour Time NOT NULL,
     moviesId INT ,
     cinemaId INT,
     hallId INT,
     FOREIGN KEY (moviesId) REFERENCES Movies(id) ON DELETE SET NULL,
     FOREIGN KEY (cinemaId) REFERENCES Cinema(id) ON DELETE SET NULL,
     FOREIGN KEY (hallId ) REFERENCES Room(id) ON DELETE SET NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;



CREATE Table Bookings( 
    id INT NOT NULL PRIMARY KEY  AUTO_INCREMENT,
    bookingDate date NOT NULL,
    bookingTime time NOT NULL,
    usersId INT ,
    FOREIGN KEY (usersId) REFERENCES Users(id) ON DELETE SET NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE Table Infos(
    id INT NOT NULL PRIMARY KEY  AUTO_INCREMENT,
    designation VARCHAR (50) NOT NULL,
    ticketPrice DECIMAL(4,2) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE Table Fees (
    id INT NOT NULL PRIMARY KEY  AUTO_INCREMENT,
    seatNumber DECIMAL(9,0) NOT NULL,
    Amount DECIMAL(9,2) NOT NULL,
    bookingId INT ,
    streamId INT ,
    infosId INT ,
    FOREIGN KEY (bookingId) REFERENCES Bookings (id) ON DELETE SET NULL ,
    FOREIGN KEY (streamId) REFERENCES Streaming(id) ON DELETE SET NULL,
    FOREIGN KEY (infosId) REFERENCES Infos (id) ON DELETE SET NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

INSERT INTO City ( zipcode, name) 
VALUES 
('44190' , 'Clisson') , 
('51100' ,'Reims') , 
('44000' ,'Nantes') , 
('49000' ,'Angers') ;

INSERT INTO Cinema (address,cityId,name) 
VALUES
('2 rue des fleurs','1','EVC Clisson'),
('15 avenue voltaire','2','EVC Reims'),
('25 Bis rue pierre-Camille ','3','EVC Nantes') ,
('4 avenue des Iris','4','EVC Angers');

INSERT INTO Hall (numOfSeat,hallNumber,cinemaId)
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
VALUES ('Customers'),('Users'),('Administrator');



INSERT INTO Users (firstName,surName,email,password,rolesId)
VALUES
('Méryl','Dupon', 'meryl@outllok.fr','$2y$10$n0IESCOU/m7B0.8ARGX2yut.Oi0M7k6VtGVpbadFb5uicMazuk/aC','1'),
('Alexis','Morin', 'alexis.morin@outllok.fr','$2y$10$tfpwmlJ9y4EAAa5rKft/EORZVcubLBBjpOAj0DOM7JLTTYJfzJB4q','1'),
('Graziella','Fournel', 'g.fournel@orange.fr','$2y$10$w4aUczCF7lc46latxf6OV.pjnXzcSjnXcYhRXE39gMfOpr3m2roKO','1'),
('Janick','Morin', 'm.janick@outllok.fr','$2y$10$Dm5xWZaqym2jNzELHvFw6eYzOP3n6PWYb/7Vq2X5RSER7QyBdoYJ2','1'),
('Mickael','Guerin', 'micka@outllok.fr','$2y$10$UmW0eK//Wv7D40KQs2pUBeDMWQkcwfdL2mH3xoIjJDbWNAkofP.sm','1'),
('Aline','Marsollier', 'marsoaline@outllok.fr','$2y$10$ecYttYWVVpeCnPkNoGEjfePUg5MiTHEw89emfzOdkUGbFT3P2IDnu','2'),
('Marine','Martin', 'm.martin@outllok.fr','$2y$10$DHelsrydOHkiU83Uj2CeB.f4Q98QaWOvdTKpyxk0FGym7ieCFPEuW','2'),
('Rose','durand', 'rose@free.fr','$2y$10$7PgHsyh00HJ/OYj3gTx4DOkXjPHaN6qWc3N9/00wQLchwRUs/70lu','2'),
('Marion','Alano', 'mariona@orange.fr','$2y$10$UnE0hW/anQoJtClUSoj52eJwG.nJlpvy8XfyC9FkxNnBPUmWFoTCO','2'),
('Emilie','Danion', 'mimid@outllok.fr','$2y$10$Yyb9.a23Dhw3f70UlIE3A.485WbK5DnFS2FbNBvwJuyZEOnNe5o9S','3');


INSERT INTO Movies (title,Duration)
VALUES
('Alain et son chien','02:03:00'),
('La compagnie des anges','01:59:00'),
('Le grimmoire magique','01:35:00'),
('A coté de toi ','01:45:00'),
('Ma soeur et moi','01:54:00'),
('Le petit alain','01:48:00');


INSERT INTO Streaming (date,beginHour,endHour,moviesId,cinemaId,hallId)
VALUES
('2022-02-19','10:00:00','12:00:00','1','1','1'),
('2022-02-19','10:00:00','12:00:00','1','1','2'),
('2022-04-19','14:00:00','16:00:00','2','2','3'),
('2022-05-17','21:00:00','23:00:00','3','3','4'),
('2022-03-20','20:00:00','22:00:00','4','4','2'),
('2022-03-22','19:00:00','21:00:00','5','4','1');


INSERT INTO Reservation(Date_Reservation,Hour_Reservation,id_users)
VALUES
('2022-03-16','18:32:00','1'),
('2022-03-15','14:03:00','2'),
('2022-03-14','12:25:00','3'),
('2022-03-13','10:05:00','4'),
('2022-03-12','11:59:00','5');

INSERT INTO Infos (designation,ticketPrice)
VALUES ('Plein tarif',"9.20"),('Etudiant','7.60'),('Moins de 14 ans','5.90');

INSERT INTO Fees (seatNumber,Amount,bookingId,streamId,infosId)
VALUES
('2','18.40','1','3','1'),
('1','07.60','3','4','2'),
('5','24.50','4','2','3'),
('1','09.20','2','4','1'),
('1','07.60','5','6','2');

--Passage du même film dans un même cinema à la même heure dans des salle différentes--
SELECT title AS 'film', Cinema.name AS 'Cinema' , Streaming.id  AS 'Sceance', Hall.hallNumber AS 'Salle'  , Streaming.beginHour AS "Début"
FROM Streaming
JOIN Movies ON Movies.id = Streaming.moviesId
JOIN cinema ON  cinema.id = Streaming.cinemaId
JOIN Hall on Hall.id= Streaming.hallId
ORDER BY Streaming.beginHour ;

--Liste des différents cinemas
SELECT Cinema.name AS 'cinéma', City.zipcode AS 'Code postal', City.name AS 'Ville'
FROM Cinema
JOIN City on city.id = Cinema.cityId,

