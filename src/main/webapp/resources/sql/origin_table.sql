CREATE TABLE origin_table(
    webtoon_num             NUMBER            NOT NULL, 
    origin_platform_name    VARCHAR2(30)      NOT NULL, 
    origin_webtoon_link     VARCHAR2(1000)    NOT NULL, 
     CONSTRAINT FK_origin_table_webtoon_num
     FOREIGN KEY (webtoon_num) REFERENCES webtoon_info (webtoon_num)
     ON DELETE CASCADE
);