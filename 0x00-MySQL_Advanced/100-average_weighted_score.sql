-- SQL script that creates a store procedure that computes
-- avarage weighted scores for a student

DELIMITER //
CREATE PROCEDURE ComputeAverageWeightedScoreForUser
user_id INT,
AS
BEGIN
	SELECT SUM(score * weight) / NULLIF(SUM(weight), 0) AS average_weighted_score
	FROM user_scores
	WHERE user_id = @user_id;
END//
DELIMITER//
