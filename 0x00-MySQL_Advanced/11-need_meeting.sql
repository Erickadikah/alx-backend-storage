-- SQL view lists all stdents that have score under 80
-- And no last_meeting or more than 1 month
-- last_meeting > DATE_SUB(DATE(Now()), INTERVAL)); ->
-- specifies the laternative condition
-- checks where for < 80 

CREATE VIEW need_meetingASSELECT name
FROM students
WHERE (score < 80)
AND (last_meeting IS NULL OR last_meeting < ADDDATE(CURDATE(), INTERVAL -1 MONTH));
