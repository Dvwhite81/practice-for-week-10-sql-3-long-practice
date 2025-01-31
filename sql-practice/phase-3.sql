SELECT 'Phase 3';

-- Find the name of the cats co-owned by both George Beatty and Melynda Abshire
-- Your code here
SELECT DISTINCT cats.name
FROM cats
WHERE cats.id IN (
    SELECT cat_id
    FROM cat_owners
    WHERE owner_id IN (
        SELECT owners.id
        FROM owners
        WHERE
            owners.first_name = 'George'
            AND owners.last_name = 'Beatty'
    )
    AND cats.id IN (
        SELECT cat_id
        FROM cat_owners
        WHERE owner_id IN (
            SELECT owners.id
            FROM owners
            WHERE
            owners.first_name = 'Melynda'
            AND owners.last_name = 'Abshire'
        )
    )
);
