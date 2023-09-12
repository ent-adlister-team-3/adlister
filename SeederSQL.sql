USE puff_db;

DROP TABLE IF EXISTS ads;

CREATE TABLE ads
(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    title VARCHAR(240) NOT NULL,
    description TEXT NOT NULL,
    price double NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE CASCADE
);

INSERT INTO ads (user_id, title, description, price)
VALUES (1, 'Gucci Sunglasses', 'Gently used, authentic, black Gucci sunglasses.', 100.00),
       (1, 'Carhartt Shirt', 'Medium size grey Carhartt t-shirt, gently used, small stain on neckline', 10.00),
       (1, 'True Religion Jeans', 'Vintage true religion jeans, small rip on the knee, size: 26', 25.00),
       (1, 'Nine West Blue Sandal Heels', 'Super flattering, size is a 6.5, but fits like a 7.5, 3.5 inch heels',
        25.00),
       (1, 'Torrid Green Skirt', 'Green flowy mini skort, listed as large but fits x-large sizes', 8.00),
       (2, 'Jimmy Choo Stilettos', 'Size 8, Black with rhinestone details, small scuff on right heel', 130.00),
       (2, 'Red Sox Baseball Cap', 'Size 7, New era cap, navy blue, gently used', 10.00),
       (2, 'Nirvana Band Tee',
        'In Utero tee, tour dates on the back, black with yellow lettering, gently used, large size', 15.00),
       (2, 'Red Dress', 'Luly K Red Vintage Dress, like new condition, size small', 20.00),
       (3, 'Nike Pro Socks', 'Brand new! Still in packaging. Black ankle socks one-size fits most', 5.00),
       (3, 'Leather Jacket', 'Brand is unknown, gently used, black, size: large', 30.00),
       (3, 'Slipknot Band Tee', 'Mens tee, brand new condition, size: large', 10.00),
       (3, 'Faded Glory Carpenter Shorts', '34 waist, 13 inseam, gently used', 30.00),
       (3, 'Grey Zip-up Hoodie',
        'Cancun, Mexico jacket, medium size, fits like a small, gently used, small stain on sleeve', 20.00);

INSERT INTO ads (user_id, title, description, price)
VALUE (1, 'test', 'testing', 12.55)
