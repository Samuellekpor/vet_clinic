/* Populate database with sample data. */

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', '2020-02-03', NULL, TRUE, 10.23);
INSERT 0 1
vet_clinic=# INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', '2018-10-15', 2, TRUE, 8);
INSERT 0 1
vet_clinic=# INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', '2021-01-07', 1, FALSE, 15.04);
INSERT 0 1
vet_clinic=# INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', '2017-05-12', 5, TRUE, 11);
INSERT 0 1
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander', '2020-02-08', NULL, FALSE, -11);
INSERT 0 1
vet_clinic=# INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Plantmon', '2021-11-15', 2, TRUE, -5.7);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtle', '1993-04-02', 3, FALSE, -12.13);
INSERT 0 1
vet_clinic=# INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Angemon', '2005-06-12', 1, TRUE, -45);
INSERT 0 1
vet_clinic=# INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Boarmon', '2005-06-07', 7, TRUE, 20.4);
INSERT 0 1
vet_clinic=# INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Blossom', '1998-10-13', 3, TRUE, 17);
INSERT 0 1
vet_clinic=# INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Ditto', '2022-05-14', 4, TRUE, 22);

/* Update owners species and animals data */

INSERT INTO owners(full_name, age) VALUES ('Sam Smith', 34),('Jennifer Orwell', 19),('Bob', 45),('Melody Pond', 77),('Dean Winchester', 14),('Jodie Whittaker', 38);
INSERT 0 6
INSERT INTO species(name) VALUES ('Pokemon'),('Digimon');
INSERT 0 2

UPDATE animals
SET species_id = 2
WHERE name LIKE '%mon';

UPDATE animals
SET species_id = 1
WHERE species_id IS NULL;

UPDATE animals
SET owner_id = 1
WHERE name = 'Agumon';

UPDATE animals
SET owner_id = 2
WHERE name = 'Gabumon' OR name = 'Pikachu';

UPDATE animals
SET owner_id = 3
WHERE name = 'Devimon' OR name = 'Plantmon';

UPDATE animals
SET owner_id = 4
WHERE name in ('Charmander','Squirtle', 'Blossom');

UPDATE animals
SET owner_id = 5
WHERE name IN ('Angemon','Boarmon');

/* Add join tables datas */

 INSERT INTO vets(name, age, date_of_graduation) VALUES ('William Tatcher', 45, '2000-04-23'),
 ('Maisy Smith', 26, '2019-01-17'),('Stephanie Mendez', 64, '1981-05-04'),('Jack Harkness', 38, '2008-06-08');
 
 INSERT INTO specializations(vet_id, species_id) VALUES (1,1),(3,1),(3,2),(4,2);
 
INSERT INTO visits(vet_id, animal_id, date_of_visit) VALUES (1, 1, '2020-05-24'),
(3, 1, '2020-07-22'),(4, 2, '2021-02-02'),(2, 3, '2020-01-05'),(2, 3, '2020-03-08'),
(2, 3, '2020-05-14'),(3, 4, '2021-05-04'),(4, 5, '2021-02-24'),(2, 6, '2019-12-21'),
(1, 6, '2020-08-10'),(2, 6, '2021-04-07'),(3, 7, '2019-09-29'),(4, 8, '2020-10-03'),
(4, 8, '2020-11-04'),(2, 9, '2019-01-24'),(2, 9, '2019-05-15'),(2, 9, '2020-02-27'),
(2, 9, '2020-08-03'),(3, 10, '2020-05-24'),(1, 10, '2021-01-11');

-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';
