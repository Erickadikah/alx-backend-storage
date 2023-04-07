-- function to divide INT value being passed in

DELIMITER //

CREATE PROCEDURE SafeDiv (IN a INT, IN b INT, OUT result INT)
BEGIN
	SET result = a / b;
END//

DELIMITER ;
