-- Create products table

CREATE TABLE IF NOT EXISTS products (
    id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);


-- Create variants table

CREATE TABLE IF NOT EXISTS variants (
    id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    concentration VARCHAR(50),
    flavor VARCHAR(50),
    weight VARCHAR(50)
);


-- Create addresses table

CREATE TABLE IF NOT EXISTS addresses (
    id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    line1 VARCHAR(255) NOT NULL,
    line2 VARCHAR(255),
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    zip_code VARCHAR(20) NOT NULL
);


-- Create the sample_requests table with foreign key references

CREATE TABLE IF NOT EXISTS sample_requests (
    id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    product_id BIGINT NOT NULL,
    variant_id BIGINT NOT NULL,
    sample_quantity VARCHAR(100) NOT NULL,
    sample_application TEXT,
    address_id BIGINT NOT NULL,
    additional_information TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(255) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(id),
    FOREIGN KEY (variant_id) REFERENCES variants(id),
    FOREIGN KEY (address_id) REFERENCES addresses(id)
);

--
--
-- INSERT INTO products (name) VALUES
--     ('Milk Concentrate Protein'),
--     ('Whey Protein Isolate'),
--     ('Casein Protein'),
--     ('Soy Protein'),
--     ('Pea Protein'),
--     ('Rice Protein'),
--     ('Hemp Protein'),
--     ('Hydrolyzed Collagen'),
--     ('Multivitamin Complex'),
--     ('Omega-3 Fish Oil');
--
-- INSERT INTO variants (concentration, flavor, weight) VALUES
--      ('50%', 'Vanilla', '250g'),
--      ('80%', 'Chocolate', '500g'),
--      ('60%', 'Strawberry', '300g'),
--      ('70%', 'Banana', '400g'),
--      ('85%', 'Unflavored', '250g'),
--      ('50%', 'Vanilla', '1000g'),
--      ('75%', 'Chocolate', '850g'),
--      ('45%', 'Mint', '500g'),
--      ('90%', 'Cookies & Cream', '300g'),
--      ('55%', 'Peanut Butter', '700g');
--
-- INSERT INTO addresses (line1, line2, city, state, zip_code) VALUES
--     ('2103 N Campbell Ave', '', 'Chicago', 'IL', '60647'),
--     ('504 Grant Place', '', 'Chicago', 'IL', '60614'),
--     ('1234 W Belmont Ave', 'Apt 1', 'Chicago', 'IL', '60657'),
--     ('1000 S Michigan Ave', 'Apt 504', 'Chicago', 'IL', '60605'),
--     ('2345 N Clark St', 'Suite 200', 'Chicago', 'IL', '60614'),
--     ('350 W Hubbard St', 'Suite 630', 'Chicago', 'IL', '60654'),
--     ('400 N State St', '', 'Chicago', 'IL', '60654'),
--     ('2300 S Throop St', 'Apt 7', 'Chicago', 'IL', '60608'),
--     ('1500 S Western Ave', 'Floor 3', 'Chicago', 'IL', '60608'),
--     ('780 N Aberdeen St', 'Unit 12', 'Chicago', 'IL', '60642');
--
-- INSERT INTO sample_requests (product_id, variant_id, sample_quantity, sample_application, address_id, additional_information, created_by) VALUES
--       (16, 18, '2 packs', 'Product Testing', 18, 'Need ASAP', 'John Doe'),
--       (17, 19, '5 packs', 'Clinical Trial', 18, 'Follow up in 2 weeks', 'Jane Smith'),
--       (18, 20, '3 packs', 'Customer Sample', 18, 'Urgent', 'Emily Johnson'),
--       (19, 21, '1 pack', 'Internal Review', 19, 'Include brochures', 'Mike Brown'),
--       (20, 22, '4 packs', 'Promotional Event', 20, 'Extra samples', 'Jessica Lee'),
--       (21, 23, '2 packs', 'Trade Show', 21, 'Deliver to booth 32', 'Chris Green'),
--       (22, 24, '3 packs', 'Market Analysis', 22, 'Sensitive', 'Laura White');
--