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
