-- SQL script that lists all bands from metal_band Glam rock 
-- as thier man style, ranked by their years of being active lifespan in years
-- attributed formed and split for computing
-- COALESCE variable holding bands that have not split
-- assumed their current year is 2022

SELECT band_name, (COALESCE(split, 2022) - formed) AS lifespan
FROM metal_bands
WHERE style LIKE '%Glam rock%'
ORDER BY
CASE WHEN (COALESCE(split, 2022) - formed) != 0
	THEN lifespan
	ELSE 0
END DESC,
band_name  DESC;

