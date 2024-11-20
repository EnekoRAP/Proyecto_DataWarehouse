
CREATE DATABASE Grupo1;
GO

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

CREATE TABLE Netflix_Reviews (
    reviewId UNIQUEIDENTIFIER PRIMARY KEY,
    userName VARCHAR(255),
    content TEXT,
    score INT,
    thumbsUpCount INT,
    reviewCreatedVersion VARCHAR(50),
    at DATETIME,
    appVersion VARCHAR(50)
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
    PlanDuration VARCHAR(50),
	reviewSId UNIQUEIDENTIFIER, 
	FOREIGN KEY (reviewSId) REFERENCES Netflix_Reviews(reviewId)
);

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
    description TEXT,
	Userbaseid INT,             
    FOREIGN KEY (Userbaseid) REFERENCES Netflix_Userbase (UserID)
);

CREATE TABLE AccionesNetflix (
    Id INT PRIMARY KEY IDENTITY(1,1), 
    Fecha DATE NOT NULL,              
    Open_ FLOAT,                      
    High FLOAT,                       
    Low FLOAT,                        
    Close_ FLOAT,                     
    Adj_Close FLOAT,                  
    Volume INT,                       
    DatosBursatilesId INT,            
    titlesid VARCHAR(10),             
    FOREIGN KEY (DatosBursatilesId) REFERENCES DatosBursatiles(Id), 
    FOREIGN KEY (titlesid) REFERENCES netflix_titles(show_id)       
);



-- Insertar datos en la tabla
INSERT INTO AccionesNetflix (Fecha, Open_, High, Low, Close_, Adj_Close, Volume)
VALUES
('2002-05-23', 1.156429, 1.242857, 1.145714, 1.196429, 1.196429, 104790000),
('2002-05-24', 1.214286, 1.225000, 1.197143, 1.210000, 1.210000, 11104800),
('2002-05-28', 1.213571, 1.232143, 1.157143, 1.157143, 1.157143, 6609400),
('2002-05-29', 1.164286, 1.164286, 1.085714, 1.103571, 1.103571, 6757800),
('2002-05-30', 1.107857, 1.107857, 1.071429, 1.071429, 1.071429, 10154200),
('2002-05-31', 1.078571, 1.078571, 1.071429, 1.076429, 1.076429, 8464400),
('2002-06-03', 1.080000, 1.149286, 1.076429, 1.128571, 1.128571, 3151400),
('2002-06-04', 1.135714, 1.140000, 1.110714, 1.117857, 1.117857, 3105200),
('2002-06-05', 1.110714, 1.159286, 1.107143, 1.147143, 1.147143, 1531600),
('2002-06-06', 1.150000, 1.232143, 1.148571, 1.182143, 1.182143, 2305800),
('2002-06-07', 1.177857, 1.177857, 1.103571, 1.118571, 1.118571, 1369200),
('2002-06-10', 1.135000, 1.175000, 1.134286, 1.156429, 1.156429, 484400);

INSERT INTO DatosBursatiles (Fecha, Close_, Volume, Open_, High, Low)
VALUES
('2020-07-27', 495.65, 7863069, 484.51, 496.92, 482.31),
('2020-07-24', 480.45, 7746247, 468.77, 487.17, 467.54),
('2020-07-23', 477.58, 7722034, 491.13, 491.9, 472.02),
('2020-07-22', 489.82, 6954078, 492.19, 497.2, 487.2),
('2020-07-21', 490.1, 9127218, 506, 506.22, 488.61),
('2020-07-20', 502.41, 11940310, 489.14, 504.5, 484.2),
('2020-07-17', 492.99, 24991350, 494.87, 503.59, 484.14),
('2020-07-16', 527.39, 24498990, 526.48, 535.54, 504.36),
('2020-07-15', 523.26, 10066650, 516.3, 529, 510.18),
('2020-07-14', 524.88, 15083300, 517.08, 525.5, 490.49),
('2020-07-13', 525.5, 18399020, 567.98, 575.37, 520.96),
('2020-07-10', 548.73, 21605590, 519.73, 555.88, 511.28),
('2020-07-09', 507.76, 5840541, 508.4, 510, 495.78),
('2020-07-08', 502.78, 5691682, 498.58, 505.1, 493.81),
('2020-07-07', 493.16, 5669870, 497.31, 504.82, 490.83),
('2020-07-06', 493.81, 7838990, 480.77, 499.5, 479.8),
('2020-07-02', 476.89, 6351485, 485.64, 492.28, 475.53),
('2020-07-01', 485.64, 9705870, 454, 488.23, 454),
('2020-06-30', 455.04, 4198545, 450.02, 457.59, 447),
('2020-06-29', 447.24, 4843978, 445.23, 447.67, 432.14);


INSERT INTO netflix_titles (show_id, type, title, director, cast, country, date_added, release_year, rating, duration, listed_in, description)
VALUES
('s1', 'Movie', 'Dick Johnson Is Dead', 'Kirsten Johnson', '', 'United States', '2021-09-25', 2020, 'PG-13', '90 min', 'Documentaries', 'As her father nears the end of his life, filmmaker Kirsten Johnson stages his death in inventive and comical ways to help them both face the inevitable.'),
('s2', 'TV Show', 'Blood & Water', '', 'Ama Qamata, Khosi Ngema, Gail Mabalane, Thabang Molaba, Dillon Windvogel, Natasha Thahane, Arno Greeff, Xolile Tshabalala, Getmore Sithole, Cindy Mahlangu, Ryle De Morny, Greteli Fincham, Sello Maake Ka-Ncube, Odwa Gwanya, Mekaila Mathys, Sandi Schultz, Duane Williams, Shamilla Miller, Patrick Mofokeng', 'South Africa', '2021-09-24', 2021, 'TV-MA', '2 Seasons', 'International TV Shows, TV Dramas, TV Mysteries', 'After crossing paths at a party, a Cape Town teen sets out to prove whether a private-school swimming star is her sister who was abducted at birth.'),
('s3', 'TV Show', 'Ganglands', 'Julien Leclercq', 'Sami Bouajila, Tracy Gotoas, Samuel Jouy, Nabiha Akkari, Sofia Lesaffre, Salim Kechiouche, Noureddine Farihi, Geert Van Rampelberg, Bakary Diombera', '', '2021-09-24', 2021, 'TV-MA', '1 Season', 'Crime TV Shows, International TV Shows, TV Action & Adventure', 'To protect his family from a powerful drug lord, skilled thief Mehdi and his expert team of robbers are pulled into a violent and deadly turf war.'),
('s4', 'TV Show', 'Jailbirds New Orleans', '', '', '', '2021-09-24', 2021, 'TV-MA', '1 Season', 'Docuseries, Reality TV', 'Feuds, flirtations and toilet talk go down among the incarcerated women at the Orleans Justice Center in New Orleans on this gritty reality series.'),
('s5', 'TV Show', 'Kota Factory', '', 'Mayur More, Jitendra Kumar, Ranjan Raj, Alam Khan, Ahsaas Channa, Revathi Pillai, Urvi Singh, Arun Kumar', 'India', '2021-09-24', 2021, 'TV-MA', '2 Seasons', 'International TV Shows, Romantic TV Shows, TV Comedies', 'In a city of coaching centers known to train Indiaâ€™s finest collegiate minds, an earnest but unexceptional student and his friends navigate campus life.'),
('s6', 'TV Show', 'Midnight Mass', 'Mike Flanagan', 'Kate Siegel, Zach Gilford, Hamish Linklater, Henry Thomas, Kristin Lehman, Samantha Sloyan, Igby Rigney, Rahul Kohli, Annarah Cymone, Annabeth Gish, Alex Essoe, Rahul Abburi, Matt Biedel, Michael Trucco, Crystal Balint, Louis Oliver', '', '2021-09-24', 2021, 'TV-MA', '1 Season', 'TV Dramas, TV Horror, TV Mysteries', 'The arrival of a charismatic young priest brings glorious miracles, ominous mysteries and renewed religious fervor to a dying town desperate to believe.');

INSERT INTO Netflix_Userbase (UserID, SubscriptionType, MonthlyRevenue, JoinDate, LastPaymentDate, Country, Age, Gender, Device, PlanDuration)
VALUES
(1, 'Basic', 10, '2022-01-15', '2023-06-10', 'United States', 28, 'Male', 'Smartphone', '1 Month'),
(2, 'Premium', 15, '2021-09-05', '2023-06-22', 'Canada', 35, 'Female', 'Tablet', '1 Month'),
(3, 'Standard', 12, '2023-02-28', '2023-06-27', 'United Kingdom', 42, 'Male', 'Smart TV', '1 Month'),
(4, 'Standard', 12, '2022-07-10', '2023-06-26', 'Australia', 51, 'Female', 'Laptop', '1 Month'),
(5, 'Basic', 10, '2023-05-01', '2023-06-28', 'Germany', 33, 'Male', 'Smartphone', '1 Month'),
(6, 'Premium', 15, '2022-03-18', '2023-06-27', 'France', 29, 'Female', 'Smart TV', '1 Month'),
(7, 'Standard', 12, '2021-12-09', '2023-06-25', 'Brazil', 46, 'Male', 'Tablet', '1 Month'),
(8, 'Basic', 10, '2023-04-02', '2023-06-24', 'Mexico', 39, 'Female', 'Laptop', '1 Month'),
(9, 'Standard', 12, '2022-10-20', '2023-06-23', 'Spain', 37, 'Male', 'Smartphone', '1 Month'),
(10, 'Premium', 15, '2023-01-07', '2023-06-22', 'Italy', 44, 'Female', 'Smart TV', '1 Month'),
(11, 'Basic', 10, '2022-05-16', '2023-06-22', 'United States', 31, 'Female', 'Smartphone', '1 Month'),
(12, 'Premium', 15, '2023-03-23', '2023-06-28', 'Canada', 45, 'Male', 'Tablet', '1 Month'),
(13, 'Standard', 12, '2021-11-30', '2023-06-27', 'United Kingdom', 48, 'Female', 'Laptop', '1 Month'),
(14, 'Basic', 10, '2022-08-01', '2023-06-26', 'Australia', 27, 'Male', 'Smartphone', '1 Month'),
(15, 'Standard', 12, '2023-05-09', '2023-06-28', 'Germany', 38, 'Female', 'Smart TV', '1 Month'),
(16, 'Premium', 15, '2022-04-07', '2023-06-27', 'France', 36, 'Male', 'Tablet', '1 Month'),
(17, 'Basic', 10, '2022-01-24', '2023-06-25', 'Brazil', 30, 'Female', 'Laptop', '1 Month'),
(18, 'Standard', 12, '2021-10-18', '2023-06-24', 'Mexico', 43, 'Male', 'Smartphone', '1 Month'),
(19, 'Premium', 15, '2023-02-15', '2023-06-23', 'Spain', 32, 'Female', 'Smart TV', '1 Month'),
(20, 'Basic', 10, '2023-05-27', '2023-06-22', 'Italy', 41, 'Male', 'Tablet', '1 Month'),
(21, 'Premium', 15, '2023-06-10', '2023-06-22', 'United States', 26, 'Female', 'Laptop', '1 Month'),
(22, 'Basic', 10, '2022-07-22', '2023-06-28', 'Canada', 34, 'Male', 'Smartphone', '1 Month'),
(23, 'Standard', 12, '2021-12-05', '2023-06-27', 'United Kingdom', 49, 'Female', 'Smart TV', '1 Month'),
(24, 'Standard', 12, '2022-04-03', '2023-06-26', 'Australia', 31, 'Male', 'Tablet', '1 Month'),
(25, 'Basic', 10, '2023-03-14', '2023-06-28', 'Germany', 40, 'Female', 'Laptop', '1 Month');

INSERT INTO Netflix_Reviews (reviewId, userName, content, score, thumbsUpCount, reviewCreatedVersion, at, appVersion)
VALUES
('c1dde17a-9fa3-4fac-a511-171e1d761c6a', 'Onyinyechi Izugbara', 'I love Netflix it is the best entertainment for children at my SCHOOL thank GOD we have Netflix.', 5, 0, NULL, '2024-10-14 14:26:08', NULL),
('498b7dd5-d6c6-44a2-8bd7-d7b5a04fc740', 'Prakash Yadavannavar', 'Costly and not helpful time waste hota Hai Jada', 4, 0, '8.123.0 build 9 50748', '2024-10-14 14:08:20', '8.123.0 build 9 50748'),
('18c2b9ca-b6c2-4e22-ae29-a37e77464e58', 'parveen akhter', 'Great', 5, 0, '8.135.1 build 7 50902', '2024-10-14 14:01:47', '8.135.1 build 7 50902'),
('efd12633-03f4-427f-a153-d87f2a4b65f7', 'Siji Siji', 'Great!', 5, 0, NULL, '2024-10-14 13:57:39', NULL),
('5775ec02-a0df-4f11-8f14-4a115c1b543a', 'Harman Kaur', 'this is not workings', 1, 0, '8.126.0 build 9 50771', '2024-10-14 13:57:38', '8.126.0 build 9 50771'),
('13436b8f-34a4-4023-8980-535969cb16d8', 'Justin McEachern', 'The movie catalog suck no new episodes on the original episodes', 2, 0, '8.132.2 build 18 50846', '2024-10-14 13:52:27', '8.132.2 build 18 50846'),
('ba7b6f42-f71d-4e66-ae4c-1f42b8d66f2d', 'ahmad fauzi', 'Why video always freeze but sound still playing? Already clear cache and try many solution, still freeze..', 1, 0, NULL, '2024-10-14 13:28:17', NULL);


--Creacion de vistas

--Datos Bursatiles
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ResumenBursatil] AS
SELECT 
    Fecha, 
    SUM(Volume) AS TotalVolume, 
    AVG(Close_) AS PromedioPrecioCierre, 
    MAX(High) AS PrecioMaximo, 
    MIN(Low) AS PrecioMinimo
FROM 
    DatosBursatiles
GROUP BY 
    Fecha
GO

--Netflix reviews

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ResumenNetflixReviews] AS
SELECT 
    userName, 
    score, 
    COUNT(reviewId) AS TotalReviews, 
    AVG(score * 1.0) AS AvgScore, 
    SUM(thumbsUpCount) AS TotalThumbsUp
FROM 
    Netflix_Reviews
GROUP BY 
    userName, 
    score
GO

--Netflix userbase


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ResumenNetflixUserbase] AS
SELECT 
    SubscriptionType, 
    Country, 
    AVG(MonthlyRevenue) AS AvgRevenue,   
    COUNT(UserID) AS TotalUsers,         
    AVG(Age * 1.0) AS AvgAge             
FROM 
    Netflix_Userbase
GROUP BY 
    SubscriptionType, 
    Country
GO

--Netflix titles

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ResumenNetflixTitles] AS
SELECT 
    type AS TitleType,               
    country AS CountryOfOrigin,      
    listed_in AS Genre,              
    COUNT(show_id) AS TotalTitles,   
    AVG(release_year) AS AvgReleaseYear 
FROM 
    netflix_titles
GROUP BY 
    type, 
    country, 
    listed_in
GO

-- vista acciones netflix

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ResumenAccionesNetflix] AS
SELECT 
    Fecha, 
    SUM(Volume) AS TotalVolume,             
    AVG(Close_) AS PromedioPrecioCierre,    
    MAX(High) AS PrecioMaximo,               
    MIN(Low) AS PrecioMinimo                 
FROM 
    AccionesNetflix
GROUP BY 
    Fecha
GO

-- Creacion de index

--Netflix reviews

CREATE NONCLUSTERED INDEX [IX_ReviewUserName] ON [dbo].[Netflix_Reviews]
(
    [userName] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, 
DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

-- Netflix userbase

CREATE NONCLUSTERED INDEX [IX_SubscriptionType] ON [dbo].[Netflix_Userbase]
(
    [SubscriptionType] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, 
DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

--netflix titles

CREATE NONCLUSTERED INDEX [IX_ReleaseYear] ON [dbo].[netflix_titles]
(
    [release_year] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, 
DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


--Netflix acciones

CREATE NONCLUSTERED INDEX [IX_AccionesFecha] ON [dbo].[AccionesNetflix]
(
    [Fecha] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

--Datos Bursátiles

CREATE NONCLUSTERED INDEX [Idx_Fecha_Close_Volume] ON [dbo].[DatosBursatiles]
(
    [Fecha] ASC,                 
    [Close_] DESC,               
    [Volume] DESC                
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, 
      DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO


--Tabla auditoria
CREATE TABLE AuditLog (
    AuditID INT IDENTITY(1,1) PRIMARY KEY,        
    TableName VARCHAR(100) NOT NULL,             
    ActionType VARCHAR(50) NOT NULL,             
    RecordID INT NOT NULL,                       
    ActionDate DATETIME DEFAULT GETDATE(),       
    UserName VARCHAR(100) NOT NULL,             
    SourceSystem VARCHAR(100) NOT NULL,          
    Version INT NOT NULL,                        
    OldValues TEXT NULL,                         
    NewValues TEXT NULL                          
);
GO



--Triggers de auditoria

--Trigger Insert Netflix Userbase

CREATE TRIGGER trg_Userbase_Insert
ON Netflix_Userbase
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO AuditLog (TableName, ActionType, RecordID, ActionDate, UserName, SourceSystem, Version, OldValues, NewValues)
    SELECT 
        'Netflix_Userbase' AS TableName,
        'INSERT' AS ActionType,
        i.UserID AS RecordID,
        GETDATE() AS ActionDate,
        SYSTEM_USER AS UserName,
        'ETL Process' AS SourceSystem, 
        1 AS Version,
        NULL AS OldValues,
        CONCAT(
            'Subscription_Type: ', i.SubscriptionType, ', ',
            'Monthly_Revenue: ', i.MonthlyRevenue, ', ',
            'Join_Date: ', CONVERT(VARCHAR, i.JoinDate, 120), ', ',
            'Last_Payment_Date: ', CONVERT(VARCHAR, i.LastPaymentDate, 120), ', ',
            'Country: ', i.Country, ', ',
            'Age: ', i.Age, ', ',
            'Gender: ', i.Gender, ', ',
            'Device: ', i.Device, ', ',
            'Plan_Duration: ', i.PlanDuration
        ) AS NewValues
    FROM INSERTED i;
END;
GO


--Verificar funcionamiento

INSERT INTO Netflix_Userbase (UserID, SubscriptionType, MonthlyRevenue, JoinDate, LastPaymentDate, Country, Age, Gender, Device, PlanDuration)
VALUES 
(34, 'Premium', 15.99, '2024-01-01', '2024-11-01', 'USA', 30, 'Female', 'Mobile', 12);

SELECT * 
FROM AuditLog
WHERE TableName = 'Netflix_Userbase'
AND ActionType = 'INSERT';



--Trigger update Netflix Userbase
GO
CREATE TRIGGER trg_Userbase_Update
ON Netflix_Userbase
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO AuditLog (TableName, ActionType, RecordID, ActionDate, UserName, SourceSystem, Version, OldValues, NewValues)
    SELECT 
        'Netflix_Userbase' AS TableName,
        'UPDATE' AS ActionType,
        i.UserID AS RecordID,
        GETDATE() AS ActionDate,
        SYSTEM_USER AS UserName,
        'ETL Process' AS SourceSystem, 
        ISNULL((SELECT MAX(Version) FROM AuditLog WHERE TableName = 'Netflix_Userbase' AND RecordID = i.UserID), 0) + 1 AS Version,
        CONCAT(
            'Subscription_Type: ', d.SubscriptionType, ', ',
            'Monthly_Revenue: ', d.MonthlyRevenue, ', ',
            'Join_Date: ', CONVERT(VARCHAR, d.JoinDate, 120), ', ',
            'Last_Payment_Date: ', CONVERT(VARCHAR, d.LastPaymentDate, 120), ', ',
            'Country: ', d.Country, ', ',
            'Age: ', d.Age, ', ',
            'Gender: ', d.Gender, ', ',
            'Device: ', d.Device, ', ',
            'Plan_Duration: ', d.PlanDuration
        ) AS OldValues,
        CONCAT(
            'Subscription_Type: ', i.SubscriptionType, ', ',
            'Monthly_Revenue: ', i.MonthlyRevenue, ', ',
            'Join_Date: ', CONVERT(VARCHAR, i.JoinDate, 120), ', ',
            'Last_Payment_Date: ', CONVERT(VARCHAR, i.LastPaymentDate, 120), ', ',
            'Country: ', i.Country, ', ',
            'Age: ', i.Age, ', ',
            'Gender: ', i.Gender, ', ',
            'Device: ', i.Device, ', ',
            'Plan_Duration: ', i.PlanDuration
        ) AS NewValues
    FROM INSERTED i
    INNER JOIN DELETED d ON i.UserID = d.UserID;
END;
GO

--Verificacion del update

UPDATE Netflix_Userbase
SET 
    SubscriptionType = 'Basic',
    MonthlyRevenue = 9.99
WHERE UserID = 34;


SELECT *
FROM AuditLog
WHERE TableName = 'Netflix_Userbase'
AND ActionType = 'UPDATE'
AND RecordID = 34;



--Trigger Delete Netflix Userbase
GO
CREATE TRIGGER trg_Userbase_Delete
ON Netflix_Userbase
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO AuditLog (TableName, ActionType, RecordID, ActionDate, UserName, SourceSystem, Version, OldValues, NewValues)
    SELECT 
        'Netflix_Userbase' AS TableName,
        'DELETE' AS ActionType,
        d.UserID AS RecordID,
        GETDATE() AS ActionDate,
        SYSTEM_USER AS UserName,
        'ETL Process' AS SourceSystem, 
        ISNULL((SELECT MAX(Version) FROM AuditLog WHERE TableName = 'Netflix_Userbase' AND RecordID = d.UserID), 0) + 1 AS Version,
        CONCAT(
            'Subscription_Type: ', d.SubscriptionType, ', ',
            'Monthly_Revenue: ', d.MonthlyRevenue, ', ',
            'Join_Date: ', CONVERT(VARCHAR, d.JoinDate, 120), ', ',
            'Last_Payment_Date: ', CONVERT(VARCHAR, d.LastPaymentDate, 120), ', ',
            'Country: ', d.Country, ', ',
            'Age: ', d.Age, ', ',
            'Gender: ', d.Gender, ', ',
            'Device: ', d.Device, ', ',
            'Plan_Duration: ', d.PlanDuration
        ) AS OldValues,
        NULL AS NewValues
    FROM DELETED d;
END;
GO

DELETE FROM Netflix_Userbase
WHERE UserID = 34;

SELECT *
FROM AuditLog
WHERE TableName = 'Netflix_Userbase'
AND ActionType = 'DELETE'
AND RecordID = 34;