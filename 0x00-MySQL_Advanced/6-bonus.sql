-- Sql procedure that adds a new orrection foa students
-- takes three argumemnts @user_id, @project_name, and @score
-- first we check if a project ith the give name exists in the project
-- if not it creates a new project with that name
--  it then inserts a ne corretion into the corrections table with the given user ID
-- project ID

DELIMITER //
CREATE PROCEDURE AddBonus
(
  IN user_id INT,
  IN project_name VARCHAR(50),
  IN score DECIMAL(10,2)
)
BEGIN
  IF NOT EXISTS(SELECT name FROM projects WHERE name = project_name) THEN
    INSERT INTO projects(name) VALUES(project_name);
  END IF;
  INSERT INTO corrections (user_id, project_id, score)
  VALUES(user_id, (SELECT id FROM projects WHERE name = project_name), score);
END//
DELIMITER ;
