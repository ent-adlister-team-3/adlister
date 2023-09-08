USE puff_db;

INSERT INTO users (username, email, password, phone_number)
VALUES ('John', 'john@email.com', 'password', '1234567890'),
       ('Jane', 'jane@email.com', 'password', '1234567890'),
       ('Bob', 'bob@email.com', 'password', '1234567890');

INSERT INTO ads (user_id, title, description, price)
VALUES (1, 'Clothes', 'Clothes', 100),
       (1, 'Shirt', 'Shirt', 25),
       (1, 'Pants', 'Pants', 25),
       (2, 'Shoes', 'Shoes', 50),
       (2, 'Hat', 'Hat', 10),
       (2, 'Gloves', 'Gloves', 15),
       (3, 'Socks', 'Socks', 5),
       (3, 'Jacket', 'Jacket', 75),
       (3, 'Scarf', 'Scarf', 20),
       (3, 'Belt', 'Belt', 10);

