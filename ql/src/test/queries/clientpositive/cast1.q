--! qt:dataset:src
set hive.mapred.mode=nonstrict;
CREATE TABLE dest1(c1 INT, c2 DOUBLE, c3 DOUBLE, c4 DOUBLE, c5 INT, c6 STRING, c7 INT) STORED AS TEXTFILE;

EXPLAIN
FROM src INSERT OVERWRITE TABLE dest1 SELECT 3 + 2, 3.0 + 2, 3 + 2.0, 3.0 + 2.0, 3 + CAST(2.0 AS INT) + CAST(CAST(0 AS SMALLINT) AS INT), CAST(1 AS BOOLEAN), CAST(TRUE AS INT) WHERE src.key = 86;

FROM src INSERT OVERWRITE TABLE dest1 SELECT 3 + 2, 3.0 + 2, 3 + 2.0, 3.0 + 2.0, 3 + CAST(2.0 AS INT) + CAST(CAST(0 AS SMALLINT) AS INT), CAST(1 AS BOOLEAN), CAST(TRUE AS INT) WHERE src.key = 86;

select dest1.* FROM dest1;

