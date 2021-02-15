/* Get all table names from specific database */
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE' AND TABLE_CATALOG='Put database name here'
ORDER BY TABLE_NAME


/* Get row counts for every table */
SELECT t.name AS TableName, i.rows AS RowCount
FROM sysobjects AS t, sysindexes AS i
WHERE t.xtype = 'U' AND i.id = t.id AND i.indid IN (0,1)
ORDER BY TableName;


/* Get row counts for specific tables */
SELECT t.name AS TableName, i.rows AS RowCount
FROM sysobjects AS t, sysindexes AS i
WHERE t.xtype = 'U' AND i.id = t.id AND i.indid IN (0,1)
AND t.name
IN 
(
'Add table name here', 'Add another table name here'
)
ORDER BY TableName;


/* Get column counts for every table */
SELECT [Schema] = s.name
    , [Table] = t.name
    , number = COUNT(*)
FROM sys.columns c
INNER JOIN sys.tables t ON c.object_id = t.object_id
INNER JOIN sys.schemas s ON t.schema_id = s.schema_id
GROUP BY t.name, s.name


/* Get column counts for specific tables */
SELECT [Schema] = s.name
    , [Table] = t.name
    , number = COUNT(*)
FROM sys.columns c
INNER JOIN sys.tables t ON c.object_id = t.object_id
INNER JOIN sys.schemas s ON t.schema_id = s.schema_id
WHERE t.name
IN 
(
'Add table name here', 'Add another table name here'
)
GROUP BY t.name, s.name
