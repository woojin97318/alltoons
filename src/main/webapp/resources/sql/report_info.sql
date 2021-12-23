CREATE TABLE report_info(
    report_num       NUMBER           NOT NULL, 
    user_email       VARCHAR2(50)     NOT NULL, 
    report_content   VARCHAR2(100)    NOT NULL, 
    report_time      DATE             DEFAULT sysdate NOT NULL, 
    review_num       NUMBER           NOT NULL, 
     PRIMARY KEY (report_num),
     CONSTRAINT FK_report_info_user_email
     FOREIGN KEY (user_email) REFERENCES user_info (user_email)
     ON DELETE CASCADE, 
     CONSTRAINT FK_report_info_review_num
     FOREIGN KEY (review_num) REFERENCES review_info (review_num)
     ON DELETE CASCADE
);

create sequence report_num_seq increment by 1 start with 1;