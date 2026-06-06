# 🏨 Hotel Booking & Revenue Insights Using SQL

## 📖 Project Overview
This project analyzes hotel booking operations, customer behavior, room performance, revenue trends, and guest satisfaction using SQL. The objective is to transform raw booking data into actionable business insights that support strategic decision-making in the hospitality industry.

---

## 🎯 Business Problem
Hotels generate large volumes of booking and customer data daily. Without proper analysis, it becomes difficult to:

- Track revenue performance
- Identify booking trends
- Optimize room utilization
- Understand customer behavior
- Improve guest satisfaction

This project addresses these challenges through SQL-driven analytics and reporting.

---

## 🛠 Tech Stack

- MySQL
- MySQL Workbench
- SQL
- ER Modeling
- CSV Datasets
- Git & GitHub

---

## 🗄 Database Design

### Tables
| Table | Description |
|---------|-------------|
| Customers | Guest information |
| Rooms | Room details and pricing |
| Bookings | Booking transactions |
| Reviews | Guest ratings and feedback |

### Entity Relationships
- One Customer → Many Bookings
- One Room → Many Bookings
- One Booking → One Review

---

## 📊 Key SQL Concepts Applied

### Database Operations
- CREATE DATABASE
- CREATE TABLE
- PRIMARY KEY
- FOREIGN KEY

### Data Analysis
- WHERE
- GROUP BY
- ORDER BY
- HAVING

### Aggregate Functions
- SUM()
- COUNT()
- AVG()
- MIN()
- MAX()
- ROUND()

### Joins
- INNER JOIN
- LEFT JOIN

### Date Functions
- YEAR()
- MONTH()
- DATEDIFF()

### Advanced SQL
- Views
- Stored Procedures
- DISTINCT
- LIMIT

---

## 📈 Analysis Performed

### Room Performance Analysis
✔ Total Rooms Available

✔ Room Categories

✔ Most Booked Room Types

✔ Room-wise Booking Distribution

### Booking Trend Analysis
✔ Monthly Booking Trends

✔ Seasonal Booking Patterns

✔ Yearly Booking Analysis

### Customer Analysis
✔ Average Stay Duration

✔ Repeat Customers

✔ Top Guests by Booking Frequency

### Revenue Analysis
✔ Total Revenue Generated

✔ Annual Revenue Trends

✔ Monthly Revenue Trends

✔ Revenue by Room Type

✔ Top Spending Customers

### Guest Satisfaction Analysis
✔ Total Ratings

✔ Room Type Ratings

✔ Highest Rated Room Categories

---

## 📌 Key Business Insights

🔹 Peak booking demand occurs during festive and holiday seasons.

🔹 Premium room categories contribute the highest revenue.

🔹 Repeat guests significantly impact overall occupancy.

🔹 Revenue demonstrates strong seasonal patterns.

🔹 Guest review analysis highlights opportunities for service improvement.

---

## ⚙️ Database Objects

### View
**BookingSummary**

Provides:
- Monthly Booking Count
- Monthly Revenue

### Stored Procedure
**GetBookingsByYear()**

Automates yearly booking analysis and reporting.

---

## 📂 Project Structure
