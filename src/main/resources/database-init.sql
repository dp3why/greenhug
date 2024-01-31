DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS menu_items;
DROP TABLE IF EXISTS restaurants;
DROP TABLE IF EXISTS carts;
DROP TABLE IF EXISTS authorities;
DROP TABLE IF EXISTS customers;


CREATE TABLE customers
(
    id         SERIAL PRIMARY KEY   NOT NULL,
    email      TEXT UNIQUE          NOT NULL,
    enabled    BOOLEAN DEFAULT TRUE NOT NULL,
    password   TEXT                 NOT NULL,
    first_name TEXT,
    last_name  TEXT
);


CREATE TABLE authorities
(
    id        SERIAL PRIMARY KEY NOT NULL,
    email     TEXT               NOT NULL,
    authority TEXT               NOT NULL,
    CONSTRAINT fk_customer FOREIGN KEY (email) REFERENCES customers (email) ON DELETE CASCADE
);


CREATE TABLE carts
(
    id          SERIAL PRIMARY KEY NOT NULL,
    customer_id INTEGER UNIQUE     NOT NULL,
    total_price NUMERIC            NOT NULL,
    CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES customers (id) ON DELETE CASCADE
);


CREATE TABLE restaurants
(
    id        SERIAL PRIMARY KEY NOT NULL,
    name      TEXT               NOT NULL,
    address   TEXT,
    image_url TEXT,
    phone     TEXT
);


CREATE TABLE menu_items
(
    id            SERIAL PRIMARY KEY NOT NULL,
    restaurant_id INTEGER            NOT NULL,
    name          TEXT               NOT NULL,
    price         NUMERIC            NOT NULL,
    description   TEXT,
    image_url     TEXT,
    CONSTRAINT fk_restaurant FOREIGN KEY (restaurant_id) REFERENCES restaurants (id) ON DELETE CASCADE
);


CREATE TABLE order_items
(
    id           SERIAL PRIMARY KEY NOT NULL,
    menu_item_id INTEGER            NOT NULL,
    cart_id      INTEGER            NOT NULL,
    price        NUMERIC            NOT NULL,
    quantity     INTEGER            NOT NULL,
    CONSTRAINT fk_cart FOREIGN KEY (cart_id) REFERENCES carts (id) ON DELETE CASCADE,
    CONSTRAINT fk_menu_item FOREIGN KEY (menu_item_id) REFERENCES menu_items (id) ON DELETE CASCADE
);


INSERT INTO restaurants (name, address, image_url, phone)
VALUES ('Burger King', '773 N Mathilda Ave, Sunnyvale, CA 94085',
        'https://img.cdn4dd.com/cdn-cgi/image/fit=contain,width=1920,format=auto,quality=50/https://cdn.doordash.com/media/store%2Fheader%2F10171.png',
        '(408) 736-0101'),
       ('Starbird Chicken', '1241 W El Camino Real, Sunnyvale, CA 94086',
        'https://img.cdn4dd.com/cdn-cgi/image/fit=cover,width=1000,height=300,format=auto,quality=80/https://doordash-static.s3.amazonaws.com/media/store/header/1a7a2b7b-3114-46cc-b3fe-ad2bf3d29b49.jpg',
        '(650) 988-6630'),
       ('Fashion Wok', '163 S Murphy Ave, Sunnyvale, CA 94086',
        'https://img.cdn4dd.com/cdn-cgi/image/fit=contain,width=1920,format=auto,quality=50/https://cdn.doordash.com/media/store%2Fheader%2F273997.jpg',
        '(408) 739-8866'),
       ('Pizza My Heart', '110 E El Camino Real, Sunnyvale, CA 94087',
        'https://img.cdn4dd.com/cdn-cgi/image/fit=cover,width=1000,height=300,format=auto,quality=80/https://doordash-static.s3.amazonaws.com/media/store/header/4545.png',
        '(408) 245-4100');


INSERT INTO menu_items (description, image_url, name, price, restaurant_id)
VALUES ('Made with white meat chicken, our Chicken Fries are coated in a light crispy breading seasoned with savory spices and herbs.',
        'https://img.cdn4dd.com/cdn-cgi/image/fit=contain,width=300,format=auto,quality=50/https://cdn.doordash.com/media/photos/f439436f-c5ab-47af-bac4-7b73ab60a24b-retina-large.jpg',
        'Chicken Fries - 9 Pc', 4.89, 1),
       ('Our Whopper Sandwich is a 1/4 lb* of savory flame-grilled beef topped with juicy tomatoes, fresh lettuce, creamy mayonnaise, ketchup, crunchy pickles, and sliced white onions on a soft sesame seed bun.',
        'https://img.cdn4dd.com/cdn-cgi/image/fit=contain,width=300,format=auto,quality=50/https://cdn.doordash.com/media/photos/f878a689-618b-4c70-a00f-e7b1f320adc9-retina-large.jpg',
        'Whopper Meal', 10.59, 1),
       ('Our Impossible™ Whopper Sandwich features a savory flame-grilled patty made from plants topped with juicy tomatoes, fresh lettuce, creamy mayonnaise, ketchup, crunchy pickles, and sliced white onions on a soft sesame seed bun',
        'https://img.cdn4dd.com/cdn-cgi/image/fit=contain,width=1920,format=auto,quality=50/https://cdn.doordash.com/media/photos/5c306a5f-fdd2-41d2-a660-9762aaa8eee8-retina-large.jpg',
        'Impossible™ Whopper', 7.99, 1),
       ('Say hello to our HERSHEY’S® Sundae Pie. One part crunchy chocolate crust and one part chocolate crème filling, garnished with a delicious topping and real HERSHEY’S® Chocolate Chips',
        'https://img.cdn4dd.com/cdn-cgi/image/fit=contain,width=1920,format=auto,quality=50/https://cdn.doordash.com/media/photos/80b1670d-e9c0-4886-a5b7-1ad48edd24ca-retina-large.jpg',
        'HERSHEYS® Sundae Pie', 3.09, 1),
       ('Our Whopper Sandwich is a 1/4 lb* of savory flame-grilled beef topped with juicy tomatoes, fresh lettuce, creamy mayonnaise, ketchup, crunchy pickles, and sliced white onions on a soft sesame seed bun.',
        'https://img.cdn4dd.com/cdn-cgi/image/fit=contain,width=1920,format=auto,quality=50/https://cdn.doordash.com/media/photos/9b3d7985-e457-43b3-938d-5184f48c2687-retina-large-jpeg',
        'Whopper', 6.39, 1),
       ('Our Double Whopper Sandwich is a pairing of two 1/4 lb* savory flame-grilled beef patties topped with juicy tomatoes, fresh lettuce, creamy mayonnaise, ketchup, crunchy pickles, and sliced white onions on a soft sesame seed bun',
        'https://img.cdn4dd.com/cdn-cgi/image/fit=contain,width=1920,format=auto,quality=50/https://cdn.doordash.com/media/photos/45addf4a-e8a8-47cb-a705-cce1d10ce86d-retina-large.jpg',
        'Double Whopper Meal', 11.69, 1),
       ('Our Double Whopper Sandwich is a pairing of two 1/4 lb* savory flame-grilled beef patties topped with juicy tomatoes, fresh lettuce, creamy mayonnaise, ketchup, crunchy pickles, and sliced white onions on a soft sesame seed bun',
        'https://img.cdn4dd.com/cdn-cgi/image/fit=contain,width=1920,format=auto,quality=50/https://cdn.doordash.com/media/photos/31dd68c2-06ec-42ad-bcd4-da7bd3425437-retina-large-jpeg',
        'Spicy Crispy Chicken Sandwich', 6.09, 1),
       ('Our Original Chicken Sandwich is lightly breaded and topped with a simple combination of shredded lettuce and creamy mayonnaise on a sesame seed bun',
        'https://img.cdn4dd.com/cdn-cgi/image/fit=contain,width=1920,format=auto,quality=50/https://cdn.doordash.com/media/photos/3e437f54-fa4e-4e9d-bf80-8a1e5b120f32-retina-large-jpeg',
        'Original Chicken Sandwich', 6.09, 1),
       ('Our Bacon King Sandwich features two 1/4 lb* savory flame-grilled beef patties, topped a with hearty portion of thick-cut smoked bacon, melted American cheese and topped with ketchup and creamy mayonnaise all on a soft sesame seed bun.',
        'https://img.cdn4dd.com/cdn-cgi/image/fit=contain,width=1920,format=auto,quality=50/https://cdn.doordash.com/media/photos/adb96c32-3c5b-4375-ba92-b30767d2513d-retina-large.jpg',
        'Bacon King Sandwich Meal', 12.19, 1),
       ('Cool down with our creamy hand spun OREO® Shake.',
        'https://img.cdn4dd.com/cdn-cgi/image/fit=contain,width=1920,format=auto,quality=50/https://cdn.doordash.com/media/photos/c3ad483f-bad7-44f1-96af-4c3dcfc63c6d-retina-large.jpg',
        'Classic OREO® Shake', 3.99, 1),

       ('Crispy Chicken, romaine cabbage blend, tomatoes, roasted corn, avocado mash, pepitas, crispy tortillas, cotija, cilantro, green onions, Chipotle Lime Dressing.',
        'https://img.cdn4dd.com/cdn-cgi/image/fit=contain,width=1920,format=auto,quality=50/https://doordash-static.s3.amazonaws.com/media/photosV2/00e4e6c8-c4f3-4570-9636-fb9c37ebacb6-retina-large.png',
        'Chicken Chop Salad', 14.06, 2),
       ('Nashville Hot Crispy Chicken, classic slaw, dill pickles, mayo, Greek Yogurt Ranch.',
        'https://img.cdn4dd.com/cdn-cgi/image/fit=contain,width=1920,format=auto,quality=50/https://doordash-static.s3.amazonaws.com/media/photosV2/5356a46a-360d-4ed8-a009-9169c4545aba-retina-large.png',
        'Nashville Hotbird® Sandwich', 11.86, 2),
       ('3 or 4 Crispy Chicken Tenders served with fries, super slaw and choice of 2 house-made sauces.',
        'https://img.cdn4dd.com/cdn-cgi/image/fit=contain,width=1920,format=auto,quality=50/https://doordash-static.s3.amazonaws.com/media/photosV2/dbfa155e-9872-4fd7-b0d2-a375a17d3642-retina-large.png',
        'Classic Tender Box', 13.89, 2),
       ('40 wings, choice of two 6 oz house-made sauces, up to 4 flavors.',
        'https://img.cdn4dd.com/cdn-cgi/image/fit=contain,width=1920,format=auto,quality=50/https://doordash-static.s3.amazonaws.com/media/photosV2/858a5b70-135e-403c-8e0e-2b9eed7ece57-retina-large.jpg',
        '40 Wing Platter', 20.27, 2),
       ('Sweet Thai Crispy Tenders, romaine cabbage blend, cucumbers, carrots, Asian herb mix, crispy shallots, toasted sesame seeds, sweet chili vinaigrette, Spicy Herb Aioli.',
        'https://img.cdn4dd.com/cdn-cgi/image/fit=contain,width=1920,format=auto,quality=50/https://doordash-static.s3.amazonaws.com/media/photosV2/a6895c63-53cc-4720-bf77-413b2dca1a7f-retina-large.png',
        'Thai Chicken Salad', 14.76, 2),
       ('Crispy Vegetarian fillet, sliced tomato, classic slaw, dill pickles, Star Sauce.',
        'https://img.cdn4dd.com/cdn-cgi/image/fit=contain,width=1920,format=auto,quality=50/https://doordash-static.s3.amazonaws.com/media/photosV2/14a27efb-bdb2-4903-9be8-eab7e7eb4acc-retina-large.png',
        'Gardenbird® Sandwich', 11.86, 2),
       ('10 wings and a choice of 2 house-made sauces.',
        'https://img.cdn4dd.com/cdn-cgi/image/fit=contain,width=1920,format=auto,quality=50/https://doordash-static.s3.amazonaws.com/media/photosV2/f42729a3-b74c-49f1-b2dc-230c9d541a10-retina-large.jpg',
        '10 Wings', 13.97, 2),
       ('Crispy Chicken, romaine cabbage blend, gorgonzola, pickled red onion, avocado mash, tomatoes, radish, egg, Green Goddess Dressing.',
        'https://img.cdn4dd.com/cdn-cgi/image/fit=contain,width=1920,format=auto,quality=50/https://doordash-static.s3.amazonaws.com/media/photosV2/0bf7546e-c6fc-4479-bcc7-67ca100335e0-retina-large.png',
        'Green Goddess Cobb Salad', 14.76, 2),

       ('Medium spicy.',
        'https://img.cdn4dd.com/cdn-cgi/image/fit=contain,width=1920,format=auto,quality=50/https://cdn.doordash.com/media/photos/5b34852e-d253-461c-8be8-1bb0bc5e39be-retina-large.jpg',
        'Stir Fried Pork with Pepper', 13.99, 3),
       ('',
        'https://img.cdn4dd.com/cdn-cgi/image/fit=contain,width=1920,format=auto,quality=50/https://cdn.doordash.com/media/photos/bf70f262-0c55-41e1-89bc-84c061ae485f-retina-large.jpg',
        'Eggplant with Minced Pork, Garlic, Cilantro', 14.99, 3),
       ('Mild spicy.',
        'https://img.cdn4dd.com/cdn-cgi/image/fit=contain,width=1920,format=auto,quality=50/https://cdn.doordash.com/media/photos/cb870c77-ace1-49ec-aa2f-9e18de102242-retina-large.jpg',
        'Stir Fried Cauliflower with Pork', 14.99, 3),
       ('Mild spicy.',
        'https://img.cdn4dd.com/cdn-cgi/image/fit=contain,width=1920,format=auto,quality=50/https://cdn.doordash.com/media/photos/1acf9c6b-189d-4583-a151-7ef522c283d9-retina-large.jpg',
        'Poached Fish Fillets in Sour Soup', 17.99, 3),
       ('Very spicy.',
        'https://img.cdn4dd.com/cdn-cgi/image/fit=contain,width=1920,format=auto,quality=50/https://cdn.doordash.com/media/photos/7f05859d-5e83-476d-a45a-73a3eb8a94e0-retina-large.jpg',
        'Stir Fried Beef with Pepper', 16.99, 3),
       ('Medium spicy.',
        'https://img.cdn4dd.com/cdn-cgi/image/fit=contain,width=1920,format=auto,quality=50/https://cdn.doordash.com/media/photos/8b2ca9fc-2c1d-4bf2-96ff-d0bd3c415e8d-retina-large.jpg',
        'Stir Fried Shredded Tripe with Wugang Tofu', 19.99, 3),
       ('Very spicy.',
        'https://img.cdn4dd.com/cdn-cgi/image/fit=contain,width=1920,format=auto,quality=50/https://cdn.doordash.com/media/photos/89ad8679-346e-41d8-b98f-3501fff4b277-retina-large.jpg',
        'Poached Sliced Beef in Hot Chili Oil', 17.99, 3),
       ('With chopped broccoli, peas, carrots, bok choy, egg.',
        'https://img.cdn4dd.com/cdn-cgi/image/fit=contain,width=1920,format=auto,quality=50/https://cdn.doordash.com/media/photos/ec06c431-9426-4971-a129-920440e1c9ce-retina-large.jpg',
        'Fried Rice', 9.5, 3),
       ('Very spicy.',
        'https://img.cdn4dd.com/cdn-cgi/image/fit=contain,width=1920,format=auto,quality=50/https://cdn.doordash.com/media/photos/2fe1b87f-d41f-4fa4-8cae-5f2ee5bb97e4-retina-large.jpg',
        'Smashed Green Pepper, Chinese Eggplant & Preserved Egg', 11.99, 3),
       ('Spicy',
        'https://img.cdn4dd.com/cdn-cgi/image/fit=contain,width=1920,format=auto,quality=50/https://cdn.doordash.com/media/photos/a307e73d-dd12-4841-be14-6f5825a64c59-retina-large.jpg',
        'Stir Fried A-Choy with Minced Garlic', 10.99, 3),

       ('Real Canadian Bacon and juicy pineapple',
        'https://img.cdn4dd.com/cdn-cgi/image/fit=contain,width=1920,format=auto,quality=50/https://doordash-static.s3.amazonaws.com/media/photos/ef0f78d4-ef00-49fc-b882-c8dce4ae0313-retina-large.jpg',
        'Maui Wowie Slice', 6.99, 4),
       ('Chicken, Bacon, Mushrooms, Garlic, Green Onions in a White Sauce. Named after a favorite customer from Santa Cruz.',
        'https://img.cdn4dd.com/cdn-cgi/image/fit=contain,width=1920,format=auto,quality=50/https://doordash-static.s3.amazonaws.com/media/photosV2/7d34149e-3a38-4024-a2f4-15933bb91698-retina-large.jpeg',
        'DLex Chicken Bacon', 18.99, 4),
       ('Enjoy pizza with Sunset on Beach',
        'https://img.cdn4dd.com/cdn-cgi/image/fit=contain,width=1920,format=auto,quality=50/https://doordash-static.s3.amazonaws.com/media/photos/89a2f066-e7ff-4287-b268-a060a4975457-retina-large-jpeg',
        'Sunset Beach', 19.99, 4),
       ('Vegan Big Sur Pizza, Gluten Free',
        'https://img.cdn4dd.com/cdn-cgi/image/fit=contain,width=1920,format=auto,quality=50/https://doordash-static.s3.amazonaws.com/media/photos/01f9dcbb-f6ed-4d29-acb7-fc31a1c4e143-retina-large.jpg',
        'Vegan Big Sur', 17.99, 4);



