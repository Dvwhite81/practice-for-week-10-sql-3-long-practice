SELECT 'Phase 1';

--Insert new cat named "Red" born this year
-- Your code here
INSERT INTO cats
    (name, birth_year)
VALUES
    ('Red', 2023);

--Assign ownership of new cat to George Beatty using subqueries
-- Your code here
INSERT INTO cat_owners
    (cat_id, owner_id)
VALUES (
    (SELECT id FROM cats
        WHERE name = 'Red'),
    (SELECT id FROM owners
        WHERE first_name = 'George'
        AND last_name = 'Beatty')
);

--Query to verify INSERTs worked properly
-- Your code here
SELECT cats.name
FROM cats
JOIN cat_owners ON (cats.id = cat_owners.cat_id)
JOIN owners ON (cat_owners.owner_id = owners.id)
WHERE owners.first_name = 'George'
    AND owners.last_name = 'Beatty';
