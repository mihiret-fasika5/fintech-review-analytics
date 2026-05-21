CREATE TABLE banks (
    bank_id SERIAL PRIMARY KEY,
    bank_name VARCHAR(255) UNIQUE NOT NULL,
    app_name VARCHAR(255)
);
CREATE TABLE reviews (
    review_id SERIAL PRIMARY KEY,
    bank_id INTEGER REFERENCES banks(bank_id),
    review_text TEXT NOT NULL,
    rating INTEGER CHECK (rating BETWEEN 1 AND 5),
    review_date DATE,
    sentiment_label VARCHAR(50),
    sentiment_score NUMERIC(5,2),
    identified_theme VARCHAR(255),
    source VARCHAR(100)
);

/*Count Reviews Per Bank*/
SELECT
    b.bank_name,
    COUNT(r.review_id) AS total_reviews
FROM banks b
LEFT JOIN reviews r
ON b.bank_id = r.bank_id
GROUP BY b.bank_name;

/* Average Rating per bank*/

SELECT
    b.bank_name,
    ROUND(AVG(r.rating), 2) AS average_rating
FROM banks b
JOIN reviews r
ON b.bank_id = r.bank_id
GROUP BY b.bank_name;

/*Check for NULL Values*/
SELECT *
FROM reviews
WHERE review_text IS NULL
   OR rating IS NULL
   OR review_date IS NULL;
