-- SQL trigger that resets the attribute valid_email when email has been changed
-- this function checks if the row being changed refers to the new value

DELIMITER //

CREATE TRIGGER reset_valid_email
AFTER UPDATE ON users
FOR EACH ROW
BEGIN
	IF NEW.email <> OLD.email THEN
	UPDATE users SET valid_email = 0 WHERE id = NEW.email;
	END IF;
END//

DELIMITER;
