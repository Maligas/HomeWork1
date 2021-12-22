CREATE TABLE fruit (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    price INTEGER NOT NULL
);

INSERT INTO fruit (name, price)
VALUES ('Яблоко', 100);
 
INSERT INTO fruit (name, price)
VALUES ('Банан', 110);
 
INSERT INTO fruit (name, price)
VALUES ('Слива', 120);

CREATE TABLE user (
    id	INTEGER PRIMARY KEY AUTOINCREMENT,
    login	TEXT NOT NULL UNIQUE,
    password	TEXT NOT NULL UNIQUE,
    registration_date	TEXT NOT NULL,
    birth_date	TEXT NOT NULL
);

CREATE TABLE ord (
    user_id	INTEGER NOT NULL,
    item_id	INTEGER NOT NULL,
    amount	INTEGER NOT NULL,
    discount	INTEGER NOT NULL,
    date	TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (item_id) REFERENCES fruit(id)
);
SELECT * FROM fruit;


select Datetime('now');

INSERT INTO user (login, password, birth_date, registration_date)
VALUES ('user_1', '1', '22.12.2022', '2021-12-22 13:23:22');
INSERT INTO user (login, password, birth_date, registration_date)
VALUES ('user_2', '2', '23.12.2022', '2021-12-22 13:24:22');
INSERT INTO user (login, password, birth_date, registration_date)
VALUES ('user_3', '3', '24.12.2022', '2021-12-22 13:25:22');
INSERT INTO user (login, password, birth_date, registration_date)
VALUES ('user_4', '4', '23.12.2022', '2021-12-22 13:26:22');

INSERT INTO ord (user_id, item_id, amount, discount, date)
VALUES (1, 1, 200, 0, (select datetime('now')));
INSERT INTO ord (user_id, item_id, amount, discount, date)
VALUES (2, 1, 300, 100, (select datetime('now')));
INSERT INTO ord (user_id, item_id, amount, discount, date)
VALUES (3, 1, 400, 123, (select datetime('now')));
INSERT INTO ord (user_id, item_id, amount, discount, date)
VALUES (5, 3, 120, 10, (select datetime('now')));
select date('now');

SELECT login FROM user WHERE id = (SELECT MAX(id) FROM user);

UPDATE user SET registration_date = substr(registration_date, 1,4) || '-' || substr(registration_date, 6,2) || '-' || substr(registration_date,9,2);

SELECT AVG(2023-(select cast(substr(birth_date, 7,4) as int) from user)) FROM user;

select (select login from user where id == user_id) as name, (select name from fruit where id == item_id) as item from ord;
select (select login from user where id == user_id) as name, (select registration_date from user where id=user_id) as reg_data, date from ord;
select (select login from user where id == user_id) as name,(select name from fruit where id == item_id) as item, (select price from fruit where id=item_id) as price_one_item, amount from ord;
select (select name from fruit where id == item_id) as item, discount, (select login from user where id == user_id) as name, date from ord;
select (select login from user where id == user_id) as name, (select birth_date from user where id=user_id) as birth_date, (select registration_date from user where id=user_id) as reg_date, discount from ord;