CREATE SEQUENCE hibernate_sequence
  START 1
  INCREMENT 1;

CREATE TABLE message (
  id       INT8 NOT NULL,
  filename VARCHAR(255),
  tag      VARCHAR(255),
  text     VARCHAR(2048) NOT NULL ,
  user_id  INT8,
  PRIMARY KEY (id)
);
CREATE TABLE user_role (
  user_id INT8 NOT NULL,
  roles   VARCHAR(255)
);
CREATE TABLE user_test (
  id              INT8    NOT NULL,
  activation_code VARCHAR(255),
  active          BOOLEAN NOT NULL,
  email           VARCHAR(255),
  password        VARCHAR(255) NOT NULL ,
  username        VARCHAR(255) NOT NULL ,
  PRIMARY KEY (id)
);

ALTER TABLE if EXISTS message ADD CONSTRAINT message_user_fk FOREIGN KEY (user_id) REFERENCES user_test;

ALTER TABLE if EXISTS user_role ADD CONSTRAINT user_role_fk FOREIGN KEY (user_id) REFERENCES user_test;