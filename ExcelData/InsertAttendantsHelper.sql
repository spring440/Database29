CREATE PROCEDURE [dbo].[InsertAttendant]
	@name nvarchar(255)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE 
	@firstName nvarchar(100),
	@lastName  nvarchar(100)
	
	SET @firstName =  SUBSTRING(@name, 1, CHARINDEX(' ', @name) - 1)
	SET @lastName =  REVERSE(SUBSTRING(REVERSE(@name), 1, CHARINDEX(' ', REVERSE(@name)) - 1))

	IF NOT EXISTS(SELECT firstName FROM Attendants WHERE firstName= @firstName) AND NOT EXISTS(SELECT lastName FROM Attendants WHERE firstName= @lastName)
	BEGIN
		INSERT INTO Attendants(firstName, lastName)
		VALUES (@firstName, @lastName)
		
		INSERT INTO Presenters(attendantID) SELECT attendantID FROM Attendants WHERE firstName = @firstName AND lastName = @lastName
	END
END
GO