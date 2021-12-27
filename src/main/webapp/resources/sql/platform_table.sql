CREATE TABLE platform_table(
    webtoon_num              NUMBER            NOT NULL, 
    webtoon_platform_name    VARCHAR2(20)      NOT NULL, 
    webtoon_link             VARCHAR2(1000)    NOT NULL, 
     CONSTRAINT FK_platform_table_webtoon_num
     FOREIGN KEY (webtoon_num) REFERENCES webtoon_info (webtoon_num)
     ON DELETE CASCADE
);