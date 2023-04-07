-- function to divide and add

DELIMITER //

CREATE FUNCTION SafeDiv (a INT, b INT) RETURNS INT
BEGIN
	IF b = 0 THEN
		RETURN 0;
	ELSE
		RETURN a / b;
	END IF;
END //

DELIMITER ;
