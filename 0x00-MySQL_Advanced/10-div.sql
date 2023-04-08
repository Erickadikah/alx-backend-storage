-- function to divide INT value being passed in
-- this  function does not perform any SQL operatio on the database.

DELIMITER //

CREATE FUNCTION SafeDiv (a INT, b INT)
RETURNS FLOAT
DETERMINISTIC
NO SQL
BEGIN
	IF b = 0 THEN
		RETURN 0;
	ELSE
		RETURN a / b;
	END IF;
END//

DELIMITER ;
