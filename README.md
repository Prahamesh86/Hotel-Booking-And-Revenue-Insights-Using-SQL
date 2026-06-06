🏨 Hotel Booking and Revenue Insights using SQL
📌 Project Overview

This project focuses on analyzing hotel booking, customer behavior, room performance, revenue trends, and guest reviews using SQL. The system helps hotel management make data-driven decisions by providing valuable business insights.

📖 Presentation File:

🎯 Objectives
Analyze booking patterns and occupancy trends.
Identify top-performing room categories.
Track monthly and yearly revenue.
Understand customer booking behavior.
Evaluate guest satisfaction through ratings and reviews.
🛠️ Tools & Technologies
MySQL
SQL Queries
MySQL Workbench
CSV Datasets
ER Diagram Design
🗂️ Database Schema

The project consists of four tables:

👤 Customers
CustomerID
FirstName
LastName
Email
Phone
🏨 Rooms
RoomID
RoomNumber
RoomType
PricePerNight
📅 Bookings
BookingID
CustomerID
RoomID
CheckInDate
CheckOutDate
TotalAmount
⭐ Reviews
ReviewID
BookingID
Rating
ReviewText
ReviewDate
🔗 ER Diagram

The database follows a relational model with:

One Customer → Many Bookings
One Room → Many Bookings
One Booking → One Review
📊 SQL Concepts Used
DDL Commands
CREATE DATABASE
CREATE TABLE
PRIMARY KEY
FOREIGN KEY
DML Commands
SELECT
INSERT
SQL Clauses
WHERE
GROUP BY
ORDER BY
HAVING
Aggregate Functions
SUM()
COUNT()
AVG()
MIN()
MAX()
ROUND()
Joins
INNER JOIN
LEFT JOIN
Date Functions
YEAR()
MONTH()
DATEDIFF()
Advanced SQL
Views
Stored Procedures
DISTINCT
LIMIT
📈 Business Analysis Performed
🏨 Room Analysis
Total Rooms Available
Room Categories
Popular Room Types
Room Booking Count
📅 Booking Trends
Monthly Booking Trends
Seasonal Booking Analysis
Booking Frequency
👥 Guest Analysis
Average Stay Duration
Top Guests by Booking Count
💰 Revenue Analysis
Total Revenue
Annual Revenue
Monthly Revenue Trends
Revenue by Room Type
Top Spending Customers
⭐ Review Analysis
Total Ratings
Room Type Ratings
Top Rated Room Categories
📌 Key Insights

✅ Peak bookings occur during festive seasons and holidays.

✅ Premium room categories generate the highest revenue.

✅ Repeat customers contribute significantly to bookings.

✅ Revenue shows strong growth during peak travel periods.

✅ Guest ratings help identify service improvement opportunities.

🚀 View & Stored Procedure
View

BookingSummary

Monthly Bookings
Monthly Revenue
Stored Procedure

GetBookingsByYear

Generates booking analysis for a selected year.
📂 Project Files
Hotel_Booking.sql
Customers.csv
Rooms.csv
Bookings.csv
Reviews.csv
ER Diagram
Project Presentation
📸 Project Screenshots

Add screenshots of:

ER Diagram
Revenue Analysis Queries
Booking Trends
Customer Analysis
SQL Output Results
👨‍💻 Author

Prathamesh Sonawane

🎓 Data Science & Data Analytics

📍 Maharashtra, India

💼 Aspiring Data Analyst | SQL | Power BI | Excel | Python
