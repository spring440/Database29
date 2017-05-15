/*Creating a backup file for the database*/
BACKUP DATABASE [s17guest29] 
TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL11.CSDB440\MSSQL\Backup\s17guest29Backup.Bak' 
WITH NOFORMAT, NOINIT,  NAME = N's17guest29-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO
