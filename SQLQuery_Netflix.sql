select * from netflix;
-- for "house of cards" tell show_id and director
SELECT Director, Show_Id FROM Netflix WHERE Title = 'House of Cards';

--in which year highest no. of tv shows and movies were released
SELECT RIGHT(Release_Date, 4) AS release_year, COUNT(*) AS num_releases
FROM Netflix WHERE LEN(Release_Date) >= 4 GROUP BY RIGHT(Release_Date, 4) ORDER BY num_releases DESC

--how many movies and tv shows were relesed
select Category, COUNT(*) as count from Netflix GROUP BY Category

--show movieds that were released in year 2000
select * from Netflix Where Substring(Release_Date, len(Release_Date)-3,4) = '2001'

-- show tv shows that were released in india
select Title from Netflix where Category = 'TV Show' and Country = 'India'

--select top 10 directors who gave tv show and movies
select top 10 Director, COUNT(*) as count from Netflix group by Director order by count desc

--RECORD WHERE CATEGORY IS MOVIE, TYPE IS COMEDIES, OR COUNTRY IS U.K.
select * from Netflix where Category = 'Movie' and Type = 'Comedies' or Country = 'United Kingdom';

-- IN HOW MANY MOVIES/SHOWS TOM CRUISE WAS CAST
select count(*) as count from Netflix where Cast= 'Tom Cruise'

--DIFFRENT RATINGS DEFINED NY NETFLIX
select distinct Rating from Netflix
select count(distinct Rating) from Netflix


--HOW MANY MOVIES GOT RATING TV-14 IN CANADA
Select count(*) From Netflix where Category = 'Movie' and Rating = 'TV-14' and Country = 'Canada'

--HOW MANY TV SHOWS GOT RATING R AFTER YEAR 2018
--select count(*) as tv_shows_R_rated from Netflix where Category = 'TV Show' and Rating = 'R' and year(SUBSTRING(Release_Date, 1, 4) AS INT) > 2018
SELECT COUNT(*) AS tv_shows_R_rated
FROM Netflix
WHERE Category = 'TV Show' 
  AND Rating = 'R' 
  AND ISNUMERIC(SUBSTRING(Release_Date, 1, 4)) = 1  -- Check if the first 4 characters are numeric
  AND CAST(SUBSTRING(Release_Date, 1, 4) AS INT) > 2018;

-- MAX. DURATION OFMOVIE/SHOW ON NETFLIX
select max(Duration) as max_dur from Netflix

--WHICH COUNTRY HAS HIGHEST NO. OF TV SHOWS
SELECT top 1 Country, COUNT(*) AS num_tv_shows FROM Netflix WHERE Category = 'TV Show' GROUP BY Country ORDER BY num_tv_shows DESC

--SORT DATASET BY YEAR
select * from Netflix order by CAST(RIGHT(Release_Date, 4) AS INT);

-- INSTANCES WHERE CATEGORY IS MOVIE AND TYPE IS DRAMA OR CATEGORY IS TV SHOW AND TYPE IS KIDS TV
select *from Netflix where (Category = 'Movie' and Type = 'Drama') or (Category = 'TV Show' and Type = 'Kids'' TV')
select distinct Type from Netflix