/* Populate database with sample data. */
INSERT INTO animals (
        id,
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES (1, 'Agumon', '2020-02-03', 0, true, 10.23),
    (2, 'Gabumon', '2018-11-15', 2, true, 8.00),
    (3, 'Pikachu', '2021-01-07', 1, false, 15.04),
    (4, 'Devimon', '2017-05-12', 5, true, 11.00);
INSERT INTO animals (
        id,
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES (5, 'Charmander', '2020-02-08', 0, false, -11.0),
    (6, 'Plantmon', '2021-11-15', 2, true, -5.7),
    (7, 'Squirtle', '1993-04-02', 3, false, -12.13),
    (8, 'Angemon', '2005-06-12', 1, true, -45.0),
    (9, 'Boarmon', '2005-06-07', 7, true, 20.4),
    (10, 'Blossom', '1998-10-13', 3, true, 17.0),
    (11, 'Ditto', '2022-05-14', 4, true, 22.0);
-- Insert the following data into the owners table:
-- Sam Smith 34 years old.
-- Jennifer Orwell 19 years old.
-- Bob 45 years old.
-- Melody Pond 77 years old.
-- Dean Winchester 14 years old.
-- Jodie Whittaker 38 years old.
INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34),
    ('Jennifer Orwell', 19),
    ('Bob', 45),
    ('Melody Pond', 77),
    ('Dean Winchester', 14),
    ('Jodie Whittaker', 38);
-- Insert the following data into the species table:
-- Pokemon
-- Digimon
INSERT INTO species (name)
VALUES ('Pokemon'),
    ('Digimon');
-- Modify your inserted animals so it includes the species_id value:
-- If the name ends in "mon" it will be Digimon
UPDATE animals
SET species_id = (
        SELECT id
        FROM species
        WHERE name = 'Digimon'
        LIMIT 1
    )
WHERE name LIKE '%mon';

-- All other animals are Pokemon
UPDATE animals
SET species_id = (
        SELECT id
        FROM species
        WHERE name = 'Pokemon'
        LIMIT 1
    )
WHERE species_id IS NULL;

-- Modify your inserted animals to include owner information (owner_id):
-- Sam Smith owns Agumon.
UPDATE animals
SET owner_id = (
        SELECT id
        FROM owners
        WHERE full_name = 'Sam Smith'
        LIMIT 1
    )
WHERE name = 'Agumon';

-- Jennifer Orwell owns Gabumon and Pikachu
UPDATE animals
SET owner_id = (
        SELECT id
        FROM owners
        WHERE full_name = 'Jennifer Orwell'
        LIMIT 1
    )
WHERE name = 'Gabumon'
    OR name = 'Pikachu';
    
-- Bob owns Devimon and Plantmon.
UPDATE animals
SET owner_id = (
        SELECT id
        FROM owners
        WHERE full_name = 'Bob'
    )
WHERE name = 'Devimon'
    OR name = 'Plantmon';
-- Melody Pond owns Charmander, Squirtle, and Blossom.
UPDATE animals
SET owner_id = (
        SELECT id
        FROM owners
        WHERE full_name = 'Melody Pond'
    )
WHERE name = 'Charmander'
    OR name = 'Squirtle'
    OR name = 'Blossom';
-- Dean Winchester owns Angemon and Boarmon.
UPDATE animals
SET owner_id = (
        SELECT id
        FROM owners
        WHERE full_name = 'Dean Winchester'
    )
WHERE name = 'Angemon'
    OR name = 'Boarmon';