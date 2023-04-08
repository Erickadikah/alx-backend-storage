-- SQL index idx_name_first on table names only the first name is indexed

CREATE INDEX idx_name_first ON names (name (1));
