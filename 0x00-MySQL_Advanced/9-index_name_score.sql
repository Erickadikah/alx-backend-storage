-- SQL index that creates an index_name_first_score on table names
-- first letter of name and score  are retrieved

CREATE INDEX idx_name_first_score, score FROM names;
