CREATE extension if not exists pgcrypto;

UPDATE user_test set password= crypt(password, gen_salt('bf', 8));