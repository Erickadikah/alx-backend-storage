-- SQL index that creates an index_name_first_score on table names
-- first name  and score  are retrieved
-- shows easier retrival of data

CREATE INDEX idx_name_first_score ON names(name(1), score);
