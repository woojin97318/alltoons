CREATE TABLE user_info(
    user_email       VARCHAR2(50)     NOT NULL, 
    user_password    VARCHAR2(200)    NOT NULL, 
    user_nick        VARCHAR2(20)     NULL UNIQUE, 
    user_image       VARCHAR2(100)    NULL, 
    division         VARCHAR2(20)     DEFAULT 'common' NOT NULL, 
    session_id       VARCHAR2(100)    DEFAULT 'nan' NOT NULL, 
    limit_time       DATE             NULL, 
    authkey          VARCHAR2(50)     NULL, 
     PRIMARY KEY (user_email)
);