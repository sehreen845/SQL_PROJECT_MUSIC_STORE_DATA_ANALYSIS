/*Easy Questions
Qno 1 : Who is the senior most employee based on job
title? */

SELECT * FROM employee
ORDER BY levels DESC
limit 1

/*Qno 2 : Which country have the most invoices? */
SELECT * FROM invoice

SELECT COUNT(*) as c, billing_country 
from invoice
group by billing_country
ORDER BY c desc

Q no 3: what are top 3 values of total invoice?
SELECT total FROM invoice
ORDER BY total desc
limit 3

--Qno 4 : Which city has the best customers? We would 
--like to throw a promotional music festival in the city we made the
--most money. Write a query that returns one city that 
--has the highest sum of invoice totals. Return both 
--the city name & sum of all invoice totals?

select * from invoice

SELECT SUM(total) as invoice_total, billing_city
from invoice
group by billing_city
order by invoice_total desc

/*Qno 5 : Who is the best customer? The customer
who has spent the most money will be declared the best customer
write a query that return the person who has spent 
the most money.*/

SELECT customer.customer_id,customer.first_name,
customer.last_name, SUM(invoice.total) as total
from customer
JOIN invoice ON customer.customer_id = invoice.customer_id
GROUP BY customer.customer_id
ORDER BY total DESC
limit 1


--Question Set 2 - Moderate
--Write query to return the email, first_name,
--last_name & genera of all Rock listeners.
--Return your list ordered alphabetially 
--by email starting with A

SELECT DISTINCT email, first_name, last_name
FROM customer
JOIN invoice ON 
customer.customer_id = invoice.customer_id
JOIN invoice_line ON 
invoice.invoice_id = invoice_line.invoice_id
WHERE track_id IN(
    SELECT track_id FROM track
	JOIN genre ON track.genre_id = genre.genre_id
	WHERE genre.name LIKE 'Rock'
)
ORDER BY email;

/*Lets invite the artists who have written the most rock
music in our dataset. Write a query that returns the 
artist name and total track count of the top 10 
rock bands.*/

SELECT artist.artist_id, artist.name,COUNT(artist.artist_id) AS number_of_songs
FROM track
JOIN album ON album.album_id = track.album_id
JOIN artist ON artist.artist_id = album.artist_id
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name LIKE 'Rock'
GROUP BY artist.artist_id
ORDER BY number_of_songs DESC
LIMIT 10;


/* Q3: Return all the track names that have a song length longer than the average song length. 
Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first. */

SELECT name,miliseconds
FROM track
WHERE miliseconds > (
	SELECT AVG(miliseconds) AS avg_track_length
	FROM track )
ORDER BY miliseconds DESC;













