/* Populate database with sample data. */

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (1, 'Agumon', 'Feb-3-2020', 0, true, 10.23);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (2, 'Gabumon', 'Nov-15-2018', 2, true, 8);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (3, 'Pikachu', 'Jan-07-2021', 1, false, 15.04);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (4, 'Devimon', 'May-12-2017', 5, true, 11);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (5, 'Charmander', 'Feb-8-2020', 0, false, -11);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (6, 'Plantmon', 'Nov-15-2021', 2, true, -5.7);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (7, 'Squirtle', 'Apr-02-1993', 3, false, -12.13);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (8, 'Angemon', 'Jun-12-2005', 1, true, -45);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (9, 'Boarmon', 'Jun-07-2005', 7, true, -20.4);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (10, 'Blossom', 'Oct-13-1998', 3, true, -17);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (11, 'Ditto', 'May-14-2022', 4, true, -22);
INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);
INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');
-- update species_id
Update animals SET species_id = (SELECT id FROM species WHERE name = 'Digimon') WHERE name LIKE '%mon%';
Update animals SET species_id = (SELECT id FROM species WHERE name = 'Pokemon') WHERE name NOT LIKE '%mon%';
Update animals SET owner_id = 1 WHERE name = 'Agumon';
Update animals SET owner_id = 2 WHERE name IN ('Gabumon', 'Pikachu');
Update animals SET owner_id = 3 WHERE name IN ('Devimon', 'Plantmon');
Update animals SET owner_id = 4 WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
Update animals SET owner_id = 5 WHERE name IN ('Angemon', 'Boarmon');
-- insert vets
INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, 'Apr-23-2000');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Maisy Smith', 26, 'Jan-17-2019');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, 'May-04-1981');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Jack Harkness', 38, 'Jun-08-2008');
-- insert specializations
INSERT INTO specializations (vet_id, species_id) VALUES (1, 1);
INSERT INTO specializations (vet_id, species_id) VALUES (3, 1);
INSERT INTO specializations (vet_id, species_id) VALUES (3, 2);
INSERT INTO specializations (vet_id, species_id) VALUES (4, 2);
-- insert visits
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES (1, 1, 'May-24-2020');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES (2, 1, 'Jul-22-2020');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES (4, 2, 'Feb-02-2021');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES (2, 3, 'Jan-05-2020');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES (2, 3, 'Mar-08-2020');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES (2, 3, 'May-14-2020');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES (3, 4, 'May-04-2021');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES (4, 5, 'Feb-24-2021');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES (2, 6, 'Dec-21-2019');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES (1, 6, 'Aug-10-2020');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES (2, 6, 'Apr-07-2021');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES (3, 7, 'Sep-29-2019');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES (4, 8, 'Oct-03-2020');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES (4, 8, 'Nov-04-2020');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES (2, 9, 'Jan-24-2019');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES (2, 9, 'May-15-2019');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES (2, 9, 'Feb-27-2020');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES (2, 9, 'Aug-03-2020');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES (3, 10, 'May-24-2020');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES (1, 10, 'Jan-11-2021');
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;
INSERT INTO owners (full_name, email) SELECT 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';
