/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name <> 'Gabumon';
-- or
-- SELECT * FROM animals WHERE NOT name = 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals; -- Verify that the change was made
ROLLBACK;
SELECT * FROM animals; -- Verify that the species column went back to the state before the transaction

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
SELECT * FROM animals; -- Verify that the changes were made
COMMIT;
SELECT * FROM animals; -- Verify that the changes persist after commit

BEGIN;
DELETE FROM animals;
SELECT * FROM animals; -- Verify that the changes were made
ROLLBACK;
SELECT * FROM animals; -- Verify that the changes were reverted

BEGIN;
DELETE  FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT my_savepoint;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO my_savepoint;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;
SELECT * FROM animals; -- Verify that the changes were made

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, AVG(escape_attempts) FROM animals GROUP BY neutered;

-- Find the minimum and maximum weight of animals for each species.
SELECT species.name, MIN(weight_kg), MAX(weight_kg)
FROM animals
JOIN species ON animals.species_id = species.id
GROUP BY species.name;

-- Find the average number of escape attempts for animals of each species that were born before 2000.
SELECT species.name, AVG(escape_attempts)
FROM animals
JOIN species ON animals.species_id = species.id
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species.name;

-- What animals belong to Melody Pond?
SELECT * FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).
SELECT * FROM animals
JOIN species ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT owners.full_name, animals.name
FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id;

-- How many animals are there per species?
SELECT species.name, COUNT(*) AS count
FROM animals
JOIN species ON animals.species_id = species.id
GROUP BY species.name;

-- List all Digimon owned by Jennifer Orwell.
SELECT animals.name
FROM animals
JOIN species ON animals.species_id = species.id
JOIN owners ON animals.owner_id = owners.id
WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT animals.name
FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

-- Who owns the most animals?
SELECT owners.full_name, COUNT(*) AS count
FROM animals
JOIN owners ON animals.owner_id = owners.id
GROUP BY owners.full_name
ORDER BY count DESC
LIMIT 1;

-- Write queries to answer the following:
-- Who was the last animal seen by William Tatcher?
SELECT visit_date, animals.name AS name_of_animal FROM visits
INNER JOIN animals
ON visits.animal_id = animals.id
INNER JOIN vets
ON visits.vet_id = vets.id
WHERE vets.name = 'William Tatcher'
ORDER BY visit_date DESC LIMIT 1;


-- How many different animals did Stephanie Mendez see?
SELECT DISTINCT COUNT(animals.name) FROM animals
INNER JOIN visits
ON animals.id = visits.animal_id
INNER JOIN vets
ON vet_id= vets.id
WHERE vets.name = 'Stephanie Mendez';


-- List all vets and their specialties, including vets with no specialties.
SELECT vets.name, species.name FROM vets
LEFT JOIN specializations
ON vets.id = specializations.vet_id
LEFT JOIN species
ON specializations.species_id = species.id
ORDER BY vets.name;


-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT animals.name FROM visits
INNER JOIN animals
ON visits.animal_id = animals.id
INNER JOIN vets
ON visits.vet_id = vets.id
WHERE vets.name = 'Stephanie Mendez'
AND visits.visit_date BETWEEN '2020-04-01' AND '2020-08-30';


-- What animal has the most visits to vets?
SELECT COUNT(animals.name), animals.name AS most_visited_animal FROM animals
INNER JOIN visits
ON animals.id = visits.animal_id
GROUP BY animals.name
ORDER BY COUNT(animals.name) DESC LIMIT 1;


-- Who was Maisy Smith's first visit?
SELECT animals.name, MIN(visits.visit_date) FROM animals
INNER JOIN visits
ON animals.id = visits.animal_id
INNER JOIN vets
ON visits.vet_id= vets.id
WHERE vets.name = 'Maisy Smith'
GROUP BY animals.name
ORDER BY MIN(visits.visit_date) LIMIT 1;


-- Details for most recent visit: animal information,
-- vet information, and date of visit.
SELECT V.visit_date, A.name AS animal_name, vets.name FROM visits V
INNER JOIN animals A
ON V.animal_id = A.id
INNER JOIN vets
ON V.vet_id= vets.id
ORDER BY visit_date DESC LIMIT 1;


-- How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(*) FROM visits
INNER JOIN animals
ON visits.animal_id = animals.id
INNER JOIN specializations
ON visits.vet_id= specializations.vet_id
WHERE specializations.species_id <> animals.species_id;


-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT S.name AS needed_specialty FROM visits VI
INNER JOIN animals A
ON VI.animal_id = A.id
INNER JOIN species S
ON A.species_id = S.id
INNER JOIN vets VE
ON VI.vet_id= VE.id
WHERE VE.name = 'Maisy Smith'
GROUP BY S.name
ORDER BY COUNT(*) DESC LIMIT 1;