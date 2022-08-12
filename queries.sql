/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon%';
SELECT name FROM animals WHERE date_of_birth BETWEEN 'Jan-01-2016'AND 'Dec-31-2019';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;
-- update species to unspecified
BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
-- rollback to previous state
ROLLBACK;
SELECT * FROM animals;
-- update species to digimon
BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon%';
-- update species to pokemon
UPDATE animals SET species = 'pokemon' WHERE name NOT LIKE '%mon%';
SELECT * FROM animals;
COMMIT;
SELECT * FROM animals;
-- delete animals table
BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
-- Delete all animals born after Jan 1st, 2022.
BEGIN;
DELETE FROM animals WHERE date_of_birth > 'Jan-01-2022';
SAVEPOINT save1;
SELECT * FROM animals;
-- Update all animals' weight to be their weight multiplied by -1.
UPDATE animals SET weight_kg = weight_kg * -1;
SELECT * FROM animals;
ROLLBACK TO save1;
SELECT * FROM animals;
-- Update all animals' weights that are negative to be their weight multiplied by -1
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
SELECT * FROM animals;
COMMIT;
SELECT * FROM animals;
-- queries for last six questions
SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts > 0;
SELECT AVG(weight_kg) FROM animals;
SELECT MAX(escape_attempts) FROM animals;
SELECT MAX(weight_kg) FROM animals WHERE species = 'digimon';
SELECT MAX(weight_kg) FROM animals WHERE species = 'pokemon';
SELECT MIN(weight_kg) FROM animals WHERE species = 'pokemon';
SELECT MIN(weight_kg) FROM animals WHERE species = 'digimon';
SELECT AVG(escape_attempts) FROM animals WHERE species = 'digimon' AND date_of_birth BETWEEN 'Jan-01-1990' AND 'Dec-31-2000';
SELECT AVG(escape_attempts) FROM animals WHERE species = 'pokemon' AND date_of_birth BETWEEN 'Jan-01-1990' AND 'Dec-31-2000';
SELECT name FROM animals INNER JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Melody Pond';
SELECT animals.name FROM animals INNER JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';
SELECT owners.full_name, animals.name FROM animals RIGHT JOIN owners ON animals.owner_id = owners.id;
SELECT species.name, COUNT(*) FROM animals JOIN species ON animals.species_id = species.id GROUP BY species.name;
SELECT animals.name FROM animals INNER JOIN species ON animals.species_id = species.id INNER JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';
SELECT animals.name FROM animals INNER JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;
SELECT owners.full_name, Count(*) AS value_occurence FROM animals INNER JOIN owners ON animals.owner_id = owners.id GROUP BY owners.full_name ORDER BY value_occurence DESC LIMIT 1;
-- advanced query multiple tables
SELECT animals.name, date_of_visit FROM animals INNER JOIN visits ON animals.id = visits.animal_id WHERE visits.vet_id = 1 ORDER BY date_of_visit DESC LIMIT 1;
SELECT COUNT(DISTINCT animal_id) FROM visits WHERE vet_id = 3;
SELECT animals.name FROM visits INNER JOIN animals ON visits.animal_id = animals.id WHERE visits.vet_id = 3 AND visits.date_of_visit BETWEEN 'Apr-01-2020'AND 'Aug-30-2020';
SELECT animals.name, COUNT(*) FROM visits INNER JOIN animals ON visits.animal_id = animals.id GROUP BY animals.name ORDER BY COUNT DESC LIMIT 1;
SELECT animals.name,visits.date_of_visit FROM visits INNER JOIN animals ON visits.animal_id = animals.id WHERE visits.vet_id = 2 ORDER BY date_of_visit ASC LIMIT 1;
SELECT * FROM visits INNER JOIN animals ON visits.animal_id = animals.id INNER JOIN vets ON visits.vet_id = vets.id ORDER BY date_of_visit DESC LIMIT 1;
SELECT COUNT(*) FROM visits JOIN vets ON visits.vet_id = vets.id JOIN animals ON visits.animal_id = animals.id WHERE animals.species_id NOT IN (SELECT species_id FROM specializations WHERE vet_id = vets.id);
SELECT species.name FROM visits JOIN animals ON visits.animal_id = animals.id JOIN vets ON visits.vet_id = vets.id JOIN species ON animals.species_id = species.id WHERE vets.name = 'Maisy Smith' GROUP BY species.name ORDER BY COUNT(*) DESC LIMIT 1;
