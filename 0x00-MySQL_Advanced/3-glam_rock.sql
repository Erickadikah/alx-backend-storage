-- SQL script that lists all bands from metal_band Glam rock 
-- as thier man style, ranked by thir--years of being active lifespan in years
-- attributed formed and split for computing

SELECT band_name, COALESCE(split, 2023) - formed as lifespan
FROM metal_bands
WHERE style LIKE '%Glam rock%'
ORDER BY lifespan DESC;
