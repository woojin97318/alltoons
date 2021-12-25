CREATE TABLE genre_table(
    webtoon_num      NUMBER          NOT NULL, 
    webtoon_genre    VARCHAR2(20)    NOT NULL, 
     CONSTRAINT FK_genre_table_webtoon_num
     FOREIGN KEY (webtoon_num) REFERENCES webtoon_info (webtoon_num)
     ON DELETE CASCADE
);