CREATE TABLE t_movie
(
  movie_id VARCHAR(13)   NOT NULL
    PRIMARY KEY,
  movie_name VARCHAR(50)  NOT NULL,
  cinema_id VARCHAR(13) ,
  cinema_name VARCHAR(20) ,
  movie_type VARCHAR(20) ,
  movie_price DECIMAL,
  movie_info VARCHAR(200),
  director VARCHAR(20),
  roles VARCHAR(200),
  showtime VARCHAR(50),
  screentime VARCHAR(50)
);