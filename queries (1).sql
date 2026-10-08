-- OTT Content Trend Analysis | table: titles (netflix.db)

-- Q1: top 10 genres
SELECT main_genre, COUNT(*) AS total
FROM titles
GROUP BY main_genre
ORDER BY total DESC
LIMIT 10;

-- Q2: har saal kitne Movies / TV Shows add hue
SELECT year_added, type, COUNT(*) AS added
FROM titles
WHERE year_added IS NOT NULL
GROUP BY year_added, type
ORDER BY year_added;

-- Q3: countries jinke 50 se zyada titles hain
SELECT main_country, COUNT(*) AS total
FROM titles
WHERE main_country != 'Unknown'
GROUP BY main_country
HAVING COUNT(*) > 50
ORDER BY total DESC;

-- Q4: movie ki average length release year ke hisaab se
SELECT release_year, ROUND(AVG(duration_num), 1) AS avg_minutes
FROM titles
WHERE type = 'Movie' AND release_year >= 2000
GROUP BY release_year
ORDER BY release_year;
