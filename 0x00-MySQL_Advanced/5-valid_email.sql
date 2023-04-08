-- SQL trigger that resets the attribute valid_email when email has been changed
-- this function checks if the row being changed refers to the new value

DELIMITER //
CREATE TRIGGER updated_email
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
	IF OLD.email != NEW.email THEN
		SET NEW.email = 0;
	END IF;
END//
DELIMITER ;
