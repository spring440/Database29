USE [s17guest29]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Eric Hernandez
-- Create date: 5/12/17
-- Description:	Retrieved presentation given a track that are in the Budapest
-- =============================================
CREATE PROCEDURE [dbo].[PresentationsPerTrack]
	-- Add the parameters for the stored procedure here
AS
BEGIN 
	BEGIN TRY
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Presentations.title, Tracks.topic, Events.eventName
	FROM Presentations
	INNER JOIN Tracks ON Presentations.trackID = Tracks.trackID
	INNER JOIN Events ON Presentations.eventID = Events.eventID
	WHERE Events.eventName = 'Budapest' 
	ORDER BY Tracks.topic
	END TRY
	BEGIN CATCH
		PRINT 'There was an error'
	END CATCH
END
GO
