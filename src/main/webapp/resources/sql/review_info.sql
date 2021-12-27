CREATE TABLE review_info(
    review_num        NUMBER           NOT NULL, 
    webtoon_num       NUMBER           NOT NULL, 
    user_email        VARCHAR2(50)     NOT NULL, 
    review_content    VARCHAR2(300)    NOT NULL, 
    review_time       DATE             DEFAULT sysdate NOT NULL, 
     PRIMARY KEY (review_num),
     CONSTRAINT FK_review_info_webtoon_num
     FOREIGN KEY (webtoon_num) REFERENCES webtoon_info (webtoon_num)
     ON DELETE CASCADE,
     CONSTRAINT FK_review_info_user_email
     FOREIGN KEY (user_email) REFERENCES user_info (user_email)
     ON DELETE CASCADE
);

create sequence review_num_seq increment by 1 start with 1;