-- SQL trigger that decreases the quantity of an item after adding an order
-- The trigger will subtract the quantity of the new orderfrom th coresspondingitems
-- show how any items are remaining in stock

DELIMITER //

CREATE TRIGGER decrease_item_quantity AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    UPDATE items SET quantity = quantity - NEW.number WHERE name = NEW.item_name;
END//

DELIMITER ;
