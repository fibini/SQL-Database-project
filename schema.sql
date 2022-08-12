/* Database schema to keep the structure of entire database. */


CREATE TABLE animals( 
    id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name text, 
    date_of_birth date, 
    escape_attempts integer, 
    neutered boolean, 
    weight_kg decimal,
    species text
);

CREATE TABLE owners (
    id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name text, 
    age integer
);

CREATE TABLE species (
    id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name text
);

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD species_id integer;
ALTER TABLE animals ADD FOREIGN KEY (species_id) REFERENCES species (id);

ALTER TABLE animals ADD owner_id integer;
ALTER TABLE animals ADD FOREIGN KEY (owner_id) REFERENCES owners (id);

CREATE TABLE vets (
    id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name text,
    age integer,
    date_of_graduation date
);

CREATE TABLE specializations (
    vet_id integer,
    species_id integer
);

ALTER TABLE specializations ADD FOREIGN KEY (species_id) REFERENCES species (id);
ALTER TABLE specializations ADD FOREIGN KEY (vet_id) REFERENCES vets (id);

CREATE TABLE visits (
    vet_id integer,
    animal_id integer,
    date_of_visit date
);

ALTER TABLE visits ADD FOREIGN KEY (vet_id) REFERENCES vets (id);
ALTER TABLE visits ADD FOREIGN KEY (animal_id) REFERENCES animals (id);
