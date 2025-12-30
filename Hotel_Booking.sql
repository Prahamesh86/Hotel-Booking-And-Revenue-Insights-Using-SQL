create database H_Bookings;

-- Hotel Booking Management System                          
-- StaySphere (smart hotel mangment solution)
-- RoomVerse –  hotel room booking and anlaysis)

use H_Bookings;
create table Customers(
CustomerID int primary key,
FirstName varchar(20),
LastName varchar(20),
Email varchar(20),
Phone varchar(20));
select * from Customers;


create table Rooms(
RoomID int primary key,
RoomNumber varchar(20),
RoomType varchar(20),
PricePerNight decimal(10,2));
select * from Rooms;


create table Bookings(
BookingID int primary key,
CustomerID int,
RoomID int ,
CheckInDate date,
CheckOutDate date,
TotalAmount decimal(10,2),
foreign key (CustomerID) references Customers (CustomerID),
foreign key (RoomID) references Rooms(RoomID));
select * from BOOkings;


create table Reviews (
ReviewID int primary key,
BookingID int,
Rating int,
ReviewText text,
ReviesDate date,
foreign key(BookingID) references Bookings(BookingID));
select * from Reviews;



-- 1. All Over Booking List
 SELECT * FROM Bookings;
 
 -- 2.Total Rooms in the  hotel  
SELECT COUNT(Distinct RoomNumber) AS TotalRooms FROM Rooms;

--  3.  Available Room Categories
select Distinct roomtype from Rooms;

-- 4.   Room Price Pernight by RoomType   
SELECT RoomType, MIN(PricePerNight) AS MinPrice, MAX(PricePerNight) AS MaxPrice, AVG(PricePerNight) AS AvgPrice
FROM Rooms
GROUP BY RoomType;


-- 5.Room Booking Count by RoomNumber (more time)
 SELECT r.RoomNumber, COUNT(b.BookingID) AS BookingCount
FROM Rooms r
LEFT JOIN Bookings b ON r.RoomID = b.RoomID
GROUP BY r.RoomNumber
ORDER BY BookingCount desc;

-- 6.  Popular Room Type Analysis  by RoomType  ( more time )
 SELECT r.RoomType, COUNT(b.BookingID) AS BookingCount
FROM Rooms r
JOIN Bookings b ON r.RoomID = b.RoomID
GROUP BY r.RoomType
ORDER BY BookingCount DESC;

--  7. Monthly Booking Trends by Year
SELECT YEAR(CheckInDate) AS Year, MONTH(CheckInDate) AS Month, COUNT(*) AS BookingCount
FROM Bookings
GROUP BY Year, Month
ORDER BY Year, Month;

-- 8. Earliest & Latest Booking Dates
SELECT MIN(CheckInDate) AS FirstBooking, MAX(CheckOutDate) AS LastBooking
FROM Bookings;



-- 9.Booking Cancellation  Rate 
SELECT 
    (COUNT(*) / (SELECT COUNT(*) FROM Bookings)) * 100 AS CancellationRate
FROM Bookings
WHERE TotalAmount = 0;


-- 10.  Average Stay Duration
SELECT AVG(DATEDIFF(CheckOutDate, CheckInDate)) AS AvgStayDuration
FROM Bookings;


--  11.  Top Guests by Booking Frequency  ( More Time Booked guest)
SELECT c.CustomerID, c.FirstName, c.LastName, COUNT(b.BookingID) AS BookingCount
FROM Customers c
JOIN Bookings b ON c.CustomerID = b.CustomerID
GROUP BY c.CustomerID
ORDER BY BookingCount DESC
LIMIT 10;


-- 12. Customer Specific Bookings
SELECT * FROM bookings WHERE CustomerID = 120;


--  13.  Total Revenue Generated  (income)
SELECT SUM(TotalAmount) AS TotalRevenue
FROM Bookings;


-- 14.  Annual Revenue Analysis ( yearly income) 
SELECT YEAR(CheckInDate) AS Year, 
       SUM(TotalAmount) AS YearlyRevenue
FROM Bookings
GROUP BY Year
ORDER BY Year desc;


-- 15.Monthly Revenue  Trends (per year + month)
SELECT YEAR(CheckInDate) AS Year, 
       MONTH(CheckInDate) AS Month, 
       SUM(TotalAmount) AS MonthlyRevenue
FROM Bookings
GROUP BY Year, Month
ORDER BY Year, Month desc;


-- 16.Revenue per Available Room (average income per room)
SELECT 
    SUM(TotalAmount) / COUNT(DISTINCT RoomID) AS RevPAR
FROM Bookings;



-- 17   RoomType Revenue  (income)
SELECT r.RoomType, SUM(b.TotalAmount) AS Revenue
FROM Bookings b
JOIN Rooms r ON b.RoomID = r.RoomID
GROUP BY r.RoomType;

-- 18. Average Revenue per Booking
SELECT ROUND(AVG(TotalAmount),2) AS AvgRevenuePerBooking
FROM Bookings;


-- 19. Top 5 Spending Customers (paying)
SELECT c.CustomerID, c.FirstName, c.LastName, SUM(b.TotalAmount) AS TotalSpent
FROM Customers c
JOIN Bookings b ON c.CustomerID = b.CustomerID
GROUP BY c.CustomerID
ORDER BY TotalSpent DESC
LIMIT 5;


-- 20. Total Guest Ratings
SELECT SUM(Rating) AS TotalRating
FROM Reviews;

-- 21. RoomType ToTal Rating
SELECT r.RoomType, SUM(rv.Rating) AS TotalRating
FROM Reviews rv
JOIN Bookings b ON rv.BookingID = b.BookingID
JOIN Rooms r ON b.RoomID = r.RoomID
GROUP BY r.RoomType;


-- 22. Total Reviews Count
 select count(*) REviewtext from Reviews;
 
 
-- 23.Top Rated RoomTypes
 SELECT r.RoomType, ROUND(AVG(rv.Rating),2) AS AvgRating
FROM Reviews rv
JOIN Bookings b ON rv.BookingID = b.BookingID
JOIN Rooms r ON b.RoomID = r.RoomID
GROUP BY r.RoomType
ORDER BY AvgRating DESC;


-- 24. Most Booked Rooms   
SELECT r.RoomID,
       r.RoomNumber,
       r.RoomType,
       COUNT(b.BookingID) AS TotalBookings
FROM Bookings b
JOIN Rooms r ON b.RoomID = r.RoomID
GROUP BY r.RoomID, r.RoomNumber, r.RoomType
ORDER BY TotalBookings DESC
limit 0,5;


-- 25.Peak Booking Season (year + month)
SELECT YEAR(CheckInDate) AS Year, MONTH(CheckInDate) AS Month, COUNT(*) AS Bookings
FROM Bookings
GROUP BY Year, Month
ORDER BY Year, Month desc;

-- 26. Customers with Single Booking Only
SELECT c.CustomerID, c.FirstName, c.LastName
FROM Customers c
JOIN Bookings b ON c.CustomerID = b.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
HAVING COUNT(b.BookingID) = 1;

 
 -- 27.  Unique ReviewText Count
 select count(distinct Reviewtext) from Reviews;
 
 -- 28. List of Unique Reviews List
 select distinct Reviewtext from reviews;
 
 --  29.Customers with No Reviews (Silent Guests)
 SELECT c.CustomerID, c.FirstName, c.LastName
FROM Customers c
LEFT JOIN Bookings b ON c.CustomerID = b.CustomerID
LEFT JOIN Reviews rv ON b.BookingID = rv.BookingID
WHERE rv.ReviewID IS NULL;

-- 30. Most Frequent Rating Given by Guests (rating count)
SELECT Rating, COUNT(*) AS Frequency
FROM Reviews
GROUP BY Rating
ORDER BY Frequency DESC
LIMIT 5;

-- 31. views   (query repeat type karycha kam nahi )
CREATE VIEW BookingSummary AS  
SELECT YEAR(CheckInDate) AS Year, MONTH(CheckInDate) AS Month,
       COUNT(*) AS BookingCount,
       SUM(TotalAmount) AS Revenue
FROM Bookings
GROUP BY Year, Month;
select *from BookingSummary;

-- 32.Stored Procedure 

DELIMITER //
CREATE PROCEDURE GetBookingsByYear(IN inputYear INT)
BEGIN
    SELECT RoomType, COUNT(*) AS BookingCount
    FROM Bookings b
    JOIN Rooms r ON b.RoomID = r.RoomID
    WHERE YEAR(CheckInDate) = inputYear
    GROUP BY RoomType;
END 
DELIMITER ;

CALL GetBookingsByYear(2025);
CALL GetBookingsByYear(2024);





