-- SQL scipt that creates following requirements
-- country, enumeration of countries: US, CO and TN, 
-- never null (= default will be the first element of the enumeration, here US)

CREATE TABLE users (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	email VARCHAR(255) NOT NULL UNIQUE,
	name VARCHAR(255),
	country ENUM('US', 'CO', 'TN') NOT NULL DEFAULT 'US'
);
