-- SQL procedure that computes ComputeAverageScoreForUser
-- and stores the avarage score for students
-- takes input as sutudent id then calulates the avarage score of the presented
-- returns avarage_score && students id

DELIMITER //

CREATE PROCEDURE ComputeAverageScoreForUser(IN student_id INT)
BEGIN
    DECLARE avg_score DECIMAL(10,2);

    SELECT AVG(score) INTO avg_score FROM scores WHERE student_id = student_id;

    INSERT INTO average_scores(student_id, avg_score) VALUES (student_id, avg_score);
END //

DELIMITER ;
