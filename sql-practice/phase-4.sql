SELECT 'Phase 4';

-- Give "Red" the cat one of every toy the other cats have
-- Your code here
/*
SELECT id FROM cats WHERE name = 'Red';
-- Red's ID is 9

SELECT name FROM toys WHERE cat_id <> 9;
-- Cat toys Red needs:
    -- Catnip Mouse
    -- Feather Wand
    -- Scratcher
    -- Laser Pointer
    -- Chew Toy
    -- Tunnel
    -- Flopping Fish
    -- Crinkle Ball
    -- Cheetos
    -- Yarn
*/

INSERT INTO toys (cat_id, name)
    SELECT (SELECT id FROM cats WHERE name = 'Red'), name
FROM toys
WHERE cat_id <> (SELECT id FROM cats WHERE name = 'Red');

-- Check Red's toys
/*
SELECT name FROM toys WHERE cat_id = 9;
*/

-- Query spoiled cats reporting the most spoiled first
-- Your code here

-- Print cats
SELECT 'Cats: ';
SELECT name FROM cats
ORDER BY id;

-- Print number of toys
SELECT 'Number of toys: ';
SELECT COUNT(toys.name)
FROM toys
JOIN cats ON (toys.cat_id = cats.id)
GROUP BY cats.name
ORDER BY cats.id;

SELECT 'Spoiled cats: ';
SELECT cats.name, COUNT(toys.name)
FROM cats
JOIN toys ON (cats.id = toys.cat_id)
GROUP BY cats.name
HAVING COUNT(toys.name) > 1
ORDER BY COUNT(toys.name) DESC;
