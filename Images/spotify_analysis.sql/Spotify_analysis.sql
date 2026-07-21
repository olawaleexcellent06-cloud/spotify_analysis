SELECT * FROM `spotify songs`.popular_spotify_songs;

SELECT COUNT(*) AS Total_Songs
FROM `spotify songs`.popular_spotify_songs;

SELECT COUNT(DISTINCT `artist(s)_name`) AS total_unique_artists
FROM `spotify songs`.popular_spotify_songs;

select AVG(streams) As Avg_streams
from `spotify songs`.popular_spotify_songs;

select MAX(streams) As MAX_streams
from `spotify songs`.popular_spotify_songs;

select MIN(streams) As MIN_streams
from `spotify songs`.popular_spotify_songs;

Select track_name, `artist(s)_name`, streams
from `spotify songs`.popular_spotify_songs
ORDER BY streams DESC
LIMIT 10;

SELECT `artist(s)_name`, COUNT(*) AS total_songs
FROM `spotify songs`.popular_spotify_songs
GROUP BY `artist(s)_name`
ORDER BY total_songs DESC
LIMIT 10;

SELECT released_year, count(*) AS count_of_released_year
FROM `spotify songs`.popular_spotify_songs
GROUP BY released_year 
ORDER BY count_of_released_year desc
limit 1;

SELECT released_year, count(*) AS count_of_released_year
FROM `spotify songs`.popular_spotify_songs
GROUP BY released_year 
ORDER BY count_of_released_year desc
limit 1;

SELECT released_year, count(*) AS count_of_released_year
FROM `spotify songs`.popular_spotify_songs
GROUP BY released_year 
ORDER BY count_of_released_year desc
limit 1;

SELECT released_year, count(*) AS count_of_released_year
FROM `spotify songs`.popular_spotify_songs
GROUP BY released_year 
ORDER BY count_of_released_year desc
limit 1;

SELECT released_month, count(*) AS count_of_released_month
FROM `spotify songs`.popular_spotify_songs
GROUP BY released_month
ORDER BY count_of_released_month desc
limit 1;

select Avg(bpm)
from `spotify songs`.popular_spotify_songs;

Select track_name,`artist(s)_name`,in_spotify_playlists
From `spotify songs`.popular_spotify_songs
order by in_spotify_playlists desc
limit 10;

select track_name, `artist(s)_name`, in_apple_playlists
from `spotify songs`.popular_spotify_songs
order by in_apple_playlists desc
limit 10;

select `artist(s)_name`,sum(streams) AS  total_streams
from `spotify songs`.popular_spotify_songs
group by `artist(s)_name`
order by total_streams desc
limit 10;

select `artist(s)_name`, Avg(streams) as Avg_streams
from `spotify songs`.popular_spotify_songs
group by `artist(s)_name`
having avg(streams) < (select Avg(streams) from `spotify songs`.popular_spotify_songs);

select released_year,Avg(streams) AS Average_streams
from  `spotify songs`.popular_spotify_songs
group by released_year
order by Average_streams desc
limit 1;

select `key`,Count(*) As Total_Key
from `spotify songs`.popular_spotify_songs
group by `key`
order by Total_key desc
limit 1;

select `mode`,count(*) As Division
from `spotify songs`.popular_spotify_songs
group by `mode`;

select `danceability_%`,track_name, `artist(s)_name`
from `spotify songs`.popular_spotify_songs 
where `danceability_%` > 80
order by `danceability_%` desc;

select `energy_%`,track_name, `artist(s)_name`
from  `spotify songs`.popular_spotify_songs 
where `energy_%` >(select Avg(`energy_%`)
from  `spotify songs`.popular_spotify_songs 
)
order by  `energy_%`desc;

select in_spotify_charts,In_apple_charts,track_name,`artist(s)_name`
from  `spotify songs`.popular_spotify_songs 
where in_spotify_charts > 0
and in_apple_charts > 0;

Select track_name,`artist(s)_name`,streams,
  CASE
  WHEN streams >= 1000000000
  Then 'Mega Hit' when streams >= 500000000
  Then 'Hit'
  when streams >= 100000000
  Then 'Moderate' 
  else 'Low Popularity' 
  End as Popularity
  from  `spotify songs`.popular_spotify_songs 
order by streams desc;
  
select `artist(s)_name`,count(*) AS Total_artist_songs
from  `spotify songs`.popular_spotify_songs 
group by `artist(s)_name` 
having count(*) > 3
order by Total_artist_songs desc;

select `artist(s)_name`,count(*) AS Total_artist_songs, Avg(streams) AS Avg_streams
from  `spotify songs`.popular_spotify_songs  
group by `artist(s)_name`
having count(*) > 3 AND( select Avg(streams)
from  `spotify songs`.popular_spotify_songs)
order by Avg_streams;

Select `danceability_%`, track_name,`artist(s)_name`
from `spotify songs`.popular_spotify_songs 
where `danceability_%` > (select Avg(`danceability_%`)
from `spotify songs`.popular_spotify_songs )
And streams < ( select Avg(streams) from  `spotify songs`.popular_spotify_songs 
) order by `danceability_%` desc;

select `acousticness_%`, `artist(s)_name`,track_name
from `spotify songs`.popular_spotify_songs 
order by `acousticness_%` desc
limit 10;

select `artist(s)_name`, count(DISTINCT released_year) As  released_years
from `spotify songs`.popular_spotify_songs 
group by  `artist(s)_name`
Having count(DISTINCT released_year) > 1
Order by released_years desc;

select 
CASE
  WHEN released_year < 2020
Then 'Before 2020'
  Else '2020 and Later'
  End as released_period,
  Avg(streams) As Average_streams
  from `spotify songs`.popular_spotify_songs 
  group by released_period;
  
select in_spotify_playlists, in_apple_playlists,track_name,`artist(s)_name`
from `spotify songs`.popular_spotify_songs
order by in_spotify_playlists desc,
in_apple_playlists desc 
limit 10;

select `artist(s)_name`,Sum(streams) AS total_streams,
Rank() over (order by sum(streams) desc) As artist_rank
from `spotify songs`.popular_spotify_songs
group by `artist(s)_name`;

select 
   released_year, 
   count(*) AS total_songs,
   Avg(streams) As average_streams,
   max(streams) As Hightest_streams,
   min(streams) As lowest_streams
   from `spotify songs`.popular_spotify_songs
group by released_year
order by released_year;


  