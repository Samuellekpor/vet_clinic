/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';

SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT name FROM animals WHERE neutered = TRUE AND escape_attempts < 3;

SELECT name, date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered = TRUE;

SELECT * FROM animals WHERE name <> 'Gabumon';

SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

/* Transactions queries*/

BEGIN;
UPDATE animals
SET species = 'unspecified';
ROLLBACK;

BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';

UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;
COMMIT;

BEGIN;
DELETE
FROM animals;
ROLLBACK;

BEGIN;
DELETE
FROM animals
WHERE date_of_birth > '2022-01-01';
SAVEPOINT savepoint1;
UPDATE animals
SET weight_kg = weight_kg * -1;
ROLLBACK TO savepoint1;
UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT;

/*Queries to answer questions*/

SELECT count(*) FROM animals;

SELECT count(*) FROM animals
WHERE escape_attempts IS NULL;

SELECT AVG(weight_kg) AS average_weight FROM animals;

SELECT neutered, SUM(escape_attempts) as escape_number FROM animals GROUP BY neutered;

SELECT species, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;

SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

/* Multiple tables queries */

SELECT full_name, name FROM animals a JOIN owners o ON a.owner_id = o.id
WHERE full_name = 'Melody Pond';

SELECT a.name, s.name
FROM animals a JOIN species s ON a.species_id = s.id
WHERE s.name = 'Pokemon';

SELECT full_name, name FROM animals a RIGHT JOIN owners o ON a.owner_id = o.id;

SELECT s.name, COUNT(a.species_id) FROM species s JOIN animals a on s.id = a.species_id GROUP BY s.name;

SELECT a.name, o.full_name FROM owners o JOIN animals a ON o.id = a.owner_id JOIN species s ON a.species_id = s.id
WHERE s.name = 'Digimon' AND o.full_name = 'Jennifer Orwell';

SELECT a.name, o.full_name FROM animals a JOIN owners o ON a.owner_id = o.id
WHERE o.full_name = 'Dean Winchester' AND a.escape_attempts = 0;

SELECT o.full_name, COUNT(a.name) FROM owners o JOIN animals a ON o.id = a.owner_id
GROUP BY o.full_name
ORDER BY COUNT(a.name) DESC;

/* Join table queries */

SELECT a.name, v.date_of_visit FROM animals a JOIN visits v ON a.id = v.animal_id
vet_clinic-# JOIN vets ve ON v.vet_id = ve.id WHERE ve.name = 'William Tatcher' ORDER BY v.date_of_visit DESC;

SELECT COUNT(a.name) FROM animals a JOIN visits v ON a.id = v.animal_id
vet_clinic-# JOIN vets ve ON v.vet_id = ve.id WHERE ve.name = 'Stephanie Mendez';

SELECT ve.name, s.name FROM vets ve LEFT JOIN specializations sp ON ve.id = sp.vet_id
vet_clinic-# LEFT JOIN species s ON sp.species_id = s.id GROUP BY ve.name, s.name;

SELECT a.name FROM animals a JOIN visits v ON a.id = v.animal_id
vet_clinic-# JOIN vets ve ON v.vet_id = ve.id WHERE ve.name = 'Stephanie Mendez' AND v.date_of_visit BETWEEN '2020-04-01' AND '2020-08-31';

SELECT a.name, COUNT(v.date_of_visit) FROM animals a JOIN visits v ON a.id = v.animal_id
vet_clinic-# GROUP BY a.name ORDER BY COUNT(v.date_of_visit) DESC;

SELECT a.name, v.date_of_visit
vet_clinic-# FROM animals a JOIN visits v ON a.id = v.animal_id JOIN vets ve ON v.vet_id = ve.id
vet_clinic-# WHERE ve.name = 'Maisy Smith'
vet_clinic-# ORDER BY v.date_of_visit ASC LIMIT 1;

SELECT a.id, a.name, a.date_of_birth, a.escape_attempts,a.neutered, a.weight_kg, ve.name as vet_name, ve.age as vet_age, ve.date_of_graduation, v.date_of_visit FROM animals a JOIN visits v ON a.id = v.animal_id
vet_clinic-# JOIN vets ve ON v.vet_id = ve.id ORDER BY v.date_of_visit DESC LIMIT 1;

SELECT COUNT(v.date_of_visit) as not_specialized_visits
vet_clinic-# FROM visits v LEFT JOIN vets ve ON v.vet_id = ve.id LEFT JOIN specializations s ON s.vet_id = ve.id
vet_clinic-# WHERE s.vet_id IS NULL;

SELECT ve.name, a.species_id , COUNT(a.species_id) as species_count from vets ve
vet_clinic-# JOIN visits v ON v.vet_id = ve.id JOIN animals a ON a.id = v.animal_id
vet_clinic-# WHERE ve.name = 'Maisy Smith'
vet_clinic-# GROUP BY (ve.name, a.species_id) ORDER BY species_count DESC LIMIT 1;
