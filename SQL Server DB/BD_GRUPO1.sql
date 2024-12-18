CREATE DATABASE Grupo1;
GO

Drop database Grupo1;

USE Grupo1;
GO

--Creación de las tablas

CREATE TABLE DatosBursatiles (
    Id INT PRIMARY KEY IDENTITY(1,1), 
    Fecha DATE NOT NULL,              
    Close_ DECIMAL(10,2),            
    Volume INT,                       
    Open_ DECIMAL(10,2),              
    High DECIMAL(10,2),               
    Low DECIMAL(10,2)                
);



CREATE TABLE AccionesNetflix (
    Id INT PRIMARY KEY IDENTITY(1,1), 
    Fecha DATE NOT NULL,              
    Open_ FLOAT,                      
    High FLOAT,                       
    Low FLOAT,                        
    Close_ FLOAT,                     
    Adj_Close FLOAT,                  
    Volume INT 
);

CREATE TABLE Netflix_Reviews (
    reviewId VARCHAR (255) PRIMARY KEY,
    userName NVARCHAR(255),
    content TEXT,
    score INT,
    thumbsUpCount INT,
    reviewCreatedVersion VARCHAR(50),
    at DATE,
    appVersion VARCHAR(50)
);

ALTER TABLE Netflix_Reviews
ADD Repetidos INT;




CREATE TABLE netflix_titles (
    show_id VARCHAR(10) PRIMARY KEY,  
    type VARCHAR(50),                 
    title VARCHAR(255),               
    director VARCHAR(255),            
    cast TEXT,                        
    country VARCHAR(255),             
    date_added DATE,                  
    release_year INT,                 
    rating VARCHAR(10),               
    duration VARCHAR(50),             
    listed_in VARCHAR(255),           
    description TEXT
);


CREATE TABLE Netflix_Userbase (
    UserID INT PRIMARY KEY,
    SubscriptionType VARCHAR(50),
    MonthlyRevenue INT,
    JoinDate DATE,
    LastPaymentDate DATE,
    Country VARCHAR(100),
    Age INT,
    Gender VARCHAR(10),
    Device VARCHAR(50),
    PlanDuration VARCHAR(50)
);

CREATE TABLE HechosNetflix (
    Fecha DATE NOT NULL,                 
    UserID INT,                          
    show_id VARCHAR(10),                 
    reviewId VARCHAR(255),               
    DatosBursatilesId INT,              
    AccionesNetflixId INT,            

    Reproducciones INT,                  
    TiempoReproducido DECIMAL(10,2),     
    IngresoMensual DECIMAL(10,2),        

    PRIMARY KEY (UserID, show_id),

    FOREIGN KEY (UserID) REFERENCES Netflix_Userbase(UserID),
    FOREIGN KEY (show_id) REFERENCES netflix_titles(show_id),
    FOREIGN KEY (reviewId) REFERENCES Netflix_Reviews(reviewId),
    FOREIGN KEY (DatosBursatilesId) REFERENCES DatosBursatiles(Id),
    FOREIGN KEY (AccionesNetflixId) REFERENCES AccionesNetflix(Id)
);

Drop table HechosNetflix


--Actualizar fechas para pruebas
UPDATE Netflix_Userbase
SET JoinDate = '2020-07-01', LastPaymentDate = '2020-07-31'
WHERE JoinDate IS NULL OR JoinDate > '2020-01-01';



INSERT INTO HechosNetflix (Fecha, UserID, show_id, reviewId, DatosBursatilesId, AccionesNetflixId, Reproducciones, TiempoReproducido, IngresoMensual)
SELECT 
    db.Fecha,                               
    nu.UserID,                                
    nt.show_id,                             
    nr.reviewId,                            
    db.Id AS DatosBursatilesId,              
    an.Id AS AccionesNetflixId,             
    COUNT(nt.show_id) AS Reproducciones,      
    SUM(0.5 * nu.MonthlyRevenue) AS TiempoReproducido,
    nu.MonthlyRevenue AS IngresoMensual       
FROM 
    DatosBursatiles db
LEFT JOIN 
    AccionesNetflix an ON db.Fecha = an.Fecha 
LEFT JOIN 
    Netflix_Userbase nu ON db.Fecha BETWEEN nu.JoinDate AND nu.LastPaymentDate 
LEFT JOIN 
    Netflix_Reviews nr ON nr.at = db.Fecha 
LEFT JOIN 
    netflix_titles nt ON nr.reviewId IS NOT NULL
GROUP BY 
    db.Fecha, nu.UserID, nt.show_id, nr.reviewId, db.Id, an.Id, nu.MonthlyRevenue;


--Métricas de la tabla hechos

--Reproducciones por título y región
SELECT N.Country, T.title, SUM(H.Reproducciones) AS TotalReproducciones
FROM HechosNetflix H
JOIN Netflix_Userbase N ON H.UserID = N.UserID
JOIN netflix_titles T ON H.show_id = T.show_id
GROUP BY N.Country, T.title;

SELECT*FROM HechosNetflix;