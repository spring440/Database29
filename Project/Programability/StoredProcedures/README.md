1.) For inserting presenations and speakers you need to run
	EXECUTE insertPresentation 'Name', 'Presentation title'
	File Name:InsertPresentationAndSpeaker.sql
	
2.) For Selecting a presentation based on a speaker you need to run
	EXECUTE selectPresentation 'Name'
	File Name:SelectPresentationFromSpeaker.sql
	
3.) For Selecting a presentation per track in budapest you need to run
	EXECUTE presentationsPerTrack intvalue
	Note* there paramter for this stored procedure is an int value for the track id. 
		  The only track id's associated with budapest are 1-4
	File Name:PresentationsPerTrackInBudapest.sql
	
4.) There is a backup script which just needs to be copied, pasted, and ran in SQL SERVER Mngmt Studio
	File Name:Backup.sql
	