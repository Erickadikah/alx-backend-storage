-- SQL script that creates a store procedure that computes
-- avarage weighted scores for a student

DELIMITER //
CREATE PROCEDURE ComputeAverageWeightedScoreForUser(IN user_id INT)
BEGIN
	UPDATE users
	SET average_score = (
		SELECT SUM(weighted.score * weighted.weight) / SUM(weighted.weight)
		FROM (
			SELECT score, project_id, projects.weight
			FROM corrections
			JOIN projects ON corrections.project_id = projects.id
			WHERE user_id = corrections.user_id
			AND corrections.project_id = id
		) AS weighted
	)
	WHERE id = user_id
END//
DELIMITER//
