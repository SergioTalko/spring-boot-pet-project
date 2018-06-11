INSERT INTO User_test (id,username, password, active )
    VALUES (10, 'admin', '123', true);

INSERT INTO user_role(user_id, roles) VALUES
  (10, 'USER'), (10, 'ADMIN');