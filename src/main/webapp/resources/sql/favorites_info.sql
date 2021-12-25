CREATE TABLE favorites_info(
    user_email     VARCHAR2(50)    NOT NULL, 
    webtoon_num    NUMBER          NOT NULL, 
    favorites      CHAR            DEFAULT 'F' NOT NULL, 
    interest       CHAR            DEFAULT 'F' NOT NULL, 
     CONSTRAINT FK_favorites_info_webtoon_num
     FOREIGN KEY (webtoon_num) REFERENCES webtoon_info (webtoon_num)
     ON DELETE CASCADE,
     CONSTRAINT FK_favorites_info_user_email
     FOREIGN KEY (user_email) REFERENCES user_info (user_email)
     ON DELETE CASCADE
);