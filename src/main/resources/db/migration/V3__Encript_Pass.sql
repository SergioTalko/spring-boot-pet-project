CREATE extension IF NOT EXISTS pgcrypto;

UPDATE user_test
SET password = crypt(password, gen_salt('bf', 8));