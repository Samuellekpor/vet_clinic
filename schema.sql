/* Database schema to keep the structure of entire database. */

 CREATE TABLE animals(
vet_clinic(# id INT GENERATED ALWAYS AS IDENTITY,
vet_clinic(# name VARCHAR,
vet_clinic(# date_of_birth DATE,
vet_clinic(# escape_attempts INT,
vet_clinic(# neutered BOOLEAN,
vet_clinic(# weight_kg DECIMAL
vet_clinic(# );
           
/*Add the column species to the table animals */           
ALTER TABLE animals
ADD species VARCHAR(100);
           
/* Add owners and species tables */
           
CREATE TABLE owners(
id INT GENERATED ALWAYS AS IDENTITY,
full_name VARCHAR(100),
age INT,
PRIMARY KEY(id)
);
           
CREATE TABLE species(
vet_clinic(# id INT GENERATED ALWAYS AS IDENTITY,
vet_clinic(# name VARCHAR(100),
vet_clinic(# PRIMARY KEY(id)
vet_clinic(# );
           
ALTER TABLE animals
vet_clinic-# ADD PRIMARY KEY (id);
           
ALTER TABLE animals
vet_clinic-# DROP COLUMN species;
           
ALTER TABLE animals
vet_clinic-# ADD column species_id INT,
vet_clinic-# ADD FOREIGN KEY (species_id) REFERENCES species(id);
           
ALTER TABLE animals
vet_clinic-# ADD column owner_id INT,
vet_clinic-# ADD FOREIGN KEY (owner_id) REFERENCES owners(id);
