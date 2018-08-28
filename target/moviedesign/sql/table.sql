-- auto-generated definition
CREATE TABLE t_user
(
  user_id    VARCHAR(10) NOT NULL
    PRIMARY KEY,
  user_name  VARCHAR(20) NULL,
  user_age   INT         NULL,
  user_sex   VARCHAR(4)  NULL,
  user_pswd  VARCHAR(20) NULL,
  user_money DECIMAL     NULL,
  user_phone VARCHAR(11) NULL,
  user_image VARCHAR(50) NULL
)
  COMMENT '用户表'
  ENGINE = InnoDB;

