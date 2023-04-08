-- SQL procedure that computes ComputeAverageScoreForUser
-- and stores the avarage score for students
-- takes input as sutudent id then calulates the avarage score of the presented
-- returns avarage_score && students id

DELIMITER //

CREATE PROCEDURE ComputeAverageScoreForUser(IN user_id INT)
BEGIN
    DECLARE avg_score DECIMAL(10,2);

    SELECT AVG(score) INTO avg_score FROM corrections WHERE corrections.user_id = user_id;
    UPDATE users  SET average_score = avg_score
    WHERE id = user_id;
END //

DELIMITER ;
