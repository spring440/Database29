
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Eric Hernandez
-- Create date: 5/12/17
-- Description:	Selects Presentation based on speaker
-- =============================================
CREATE PROCEDURE [dbo].[selectPresentation] 
	-- Add the parameters for the stored procedure here
	@speaker nvarchar(70)
AS
BEGIN
	BEGIN TRY
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE 
	@firstName nvarchar(100),
	@lastName  nvarchar(100)
	
	SET @firstName =  SUBSTRING(@speaker, 1, CHARINDEX(' ', @speaker) - 1)
	SET @lastName =  REVERSE(SUBSTRING(REVERSE(@speaker), 1, CHARINDEX(' ', REVERSE(@speaker)) - 1))
	
	SELECT title FROM Presentations WHERE presenterID = (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = @firstName AND lastName = @lastName)))
	END TRY
	BEGIN CATCH
	
		PRINT 'There was an ERROR'
	END CATCH
END
GO
