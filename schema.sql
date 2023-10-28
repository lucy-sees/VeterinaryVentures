/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255),
  date_of_birth DATE,
  escape_attempts INTEGER,
  neutered BOOLEAN,
  weight_kg DECIMAL(10,2)
);

ALTER TABLE animals ADD COLUMN owner_id INTEGER;
ALTER TABLE animals ADD species VARCHAR(255);

-- Create a table named owners with the following columns:
--   id: integer (set it as autoincremented PRIMARY KEY)
--   full_name: string
--   age: integer
CREATE TABLE owners(
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR(250),
    age INT,
    PRIMARY KEY(id)
);

-- Create a table named species with the following columns:
--   id: integer (set it as autoincremented PRIMARY KEY)
--   name: string
CREATE TABLE species(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250),
    PRIMARY KEY(id)
);

-- Modify animals table:
-- Make sure that id is set as autoincremented PRIMARY KEY
-- Remove column species
ALTER TABLE animals
DROP COLUMN species;

-- Add column species_id which is a foreign key referencing species table
ALTER TABLE animals
ADD species_id INT;
ALTER TABLE animals
ADD CONSTRAINT fk_species
FOREIGN KEY (species_id)
REFERENCES species(id);

-- Add column owner_id which is a foreign key referencing the owners table
ALTER TABLE animals
ADD owner_id INT;
ALTER TABLE animals
ADD CONSTRAINT fk_owners
FOREIGN KEY (owner_id)
REFERENCES owners(id);

-- Create a table named vets with the following columns:
-- id: integer (set it as autoincremented PRIMARY KEY)
-- name: string
-- age: integer
-- date_of_graduation: date
CREATE TABLE vets(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255),
    age INT,
    date_of_graduation DATE,
    PRIMARY KEY(id)
);

-- Create a table named specializations with the following columns:
-- vet_id: integer
-- species_id: integer
-- Make sure that vet_id and species_id are set as a composite PRIMARY KEY
-- Make sure that vet_id is a foreign key referencing vets table
-- Make sure that species_id is a foreign key referencing species table
CREATE TABLE specializations (
    vet_id INT,
    species_id INT,
    PRIMARY KEY (vet_id, species_id),
    FOREIGN KEY (vet_id) REFERENCES vets(id),
    FOREIGN KEY (species_id) REFERENCES species(id)
);

-- Create a table named visits with the following columns:
-- animal_id: integer
-- vet_id: integer
-- visit_date: date
-- Make sure that animal_id, vet_id and visit_date are set as a composite PRIMARY KEY
-- Make sure that animal_id is a foreign key referencing animals table
-- Make sure that vet_id is a foreign key referencing vets table
CREATE TABLE visits (
    animal_id INT,
    vet_id INT,
    visit_date DATE,
    PRIMARY KEY (animal_id, vet_id, visit_date),
    FOREIGN KEY (animal_id) REFERENCES animals(id),
    FOREIGN KEY (vet_id) REFERENCES vets(id)
);