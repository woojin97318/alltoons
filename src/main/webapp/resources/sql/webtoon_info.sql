CREATE TABLE webtoon_info(
    webtoon_num        NUMBER            NOT NULL, 
    webtoon_title      VARCHAR2(100)     NOT NULL, 
    webtoon_image      VARCHAR2(100)     DEFAULT 'default_image.png' NOT NULL, 
    webtoon_writer     VARCHAR2(50)      NOT NULL, 
    webtoon_content    VARCHAR2(1000)    NOT NULL, 
    webtoon_hit        NUMBER(10)        NULL, 
     PRIMARY KEY (webtoon_num)
);

create sequence webtoon_num_seq increment by 1 start with 1;