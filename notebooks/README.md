# Bank Reviews Analysis System

## Project Overview

This project collects, processes, analyzes, and stores mobile banking application reviews using PostgreSQL and Python.

The system:
- stores bank metadata
- stores customer reviews
- performs sentiment analysis
- identifies review themes
- supports SQL-based analytics

---

# Technologies Used

- Python
- PostgreSQL
- pandas
- psycopg2
- TextBlob

---

# Database Setup

## 1. Install PostgreSQL

Download and install PostgreSQL:

https://www.postgresql.org/download/

---

## 2. Create Database

Open PostgreSQL terminal (`psql`) and run:

```sql
CREATE DATABASE bank_reviews;

## 3. Create Tables

Run the SQL schema file:

psql -U postgres -d bank_reviews -f schema.sql
Database Schema

Banks Table
Stores metadata about banks.

Column	Type
bank_id	SERIAL PRIMARY KEY
bank_name	VARCHAR(255) UNIQUE
app_name	VARCHAR(255)
Reviews Table

Stores processed review data.

Column	Type
review_id	SERIAL PRIMARY KEY
bank_id	INTEGER (Foreign Key)
review_text	TEXT
rating	INTEGER
review_date	DATE
sentiment_label	VARCHAR(50)
sentiment_score	NUMERIC(5,2)
identified_theme	VARCHAR(255)
source	VARCHAR(100)
CSV File Structure

Expected CSV columns:

[
    'review text',
    'rating (1–5)',
    'review date',
    'bank / app name',
    'source'
]
Python Setup

Install dependencies:

pip install pandas psycopg2 textblob
Running the Data Insertion Script

Run:

python insert_reviews.py

The script:

loads the CSV
cleans data
performs sentiment analysis
inserts banks and reviews into PostgreSQL
Data Integrity Verification
Count Reviews Per Bank
SELECT
    b.bank_name,
    COUNT(r.review_id) AS total_reviews
FROM banks b
LEFT JOIN reviews r
ON b.bank_id = r.bank_id
GROUP BY b.bank_name;
Average Rating Per Bank
SELECT
    b.bank_name,
    ROUND(AVG(r.rating), 2) AS average_rating
FROM banks b
JOIN reviews r
ON b.bank_id = r.bank_id
GROUP BY b.bank_name;
Check for NULL Values
SELECT *
FROM reviews
WHERE review_text IS NULL
   OR rating IS NULL
   OR review_date IS NULL;
Project Structure
project/
│
├── cleaned_reviews.csv
├── schema.sql
├── README.md
Author

Mihiret Fasika

# Git Commands to Commit Everything

```steps
git add .
git commit -m "adding notebooks and Databse of Task-3"
git push