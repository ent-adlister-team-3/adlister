USE puff_db;

DROP TABLE IF EXISTS ads;

CREATE TABLE ads (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    title VARCHAR(240) NOT NULL,
    description TEXT NOT NULL,
    price double NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users (id)
    ON DELETE CASCADE
);

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


