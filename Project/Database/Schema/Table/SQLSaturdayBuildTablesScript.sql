USE [s17guest29]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/*Addresses Table*/
CREATE TABLE [dbo].[Addresses](
	[addressID] [int] IDENTITY(1,1) NOT NULL,
	[streetAddress] [nvarchar](255) NOT NULL,
	[cityID] [int] NOT NULL,
	[stateID] [int] NOT NULL,
	[zipcode] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[addressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/*Attendants Table*/
CREATE TABLE [dbo].[Attendants](
	[attendantID] [int] IDENTITY(1,1) NOT NULL,
	[firstName] [nvarchar](50) NOT NULL,
	[lastName] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NULL,
	[addressID] [int] NULL,
 CONSTRAINT [PK_Attendants] PRIMARY KEY CLUSTERED 
(
	[attendantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/*Cities Table*/
CREATE TABLE [dbo].[Cities](
	[cityID] [int] IDENTITY(1,1) NOT NULL,
	[cityName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[cityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/*EventAttendantRoles Table*/
CREATE TABLE [dbo].[EventAttendantRoles](
	[eventID] [int] NOT NULL,
	[attendantID] [int] NOT NULL,
	[roleID] [int] NOT NULL,
 CONSTRAINT [PK_EventAttendantRoles] PRIMARY KEY CLUSTERED 
(
	[eventID] ASC,
	[attendantID] ASC,
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/*Events Table*/
CREATE TABLE [dbo].[Events](
	[eventID] [int] NOT NULL,
	[eventDate] [date] NOT NULL,
	[eventName] [nvarchar](255) NOT NULL,
	[regionID] [int] NOT NULL,
	[venueID] [int] NULL,
 CONSTRAINT [PK_Events] PRIMARY KEY CLUSTERED 
(
	[eventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/*EventVendorTables Table*/
CREATE TABLE [dbo].[EventVendorTables](
	[eventID] [int] NOT NULL,
	[vendorID] [int] NOT NULL,
	[tableID] [int] NOT NULL,
 CONSTRAINT [PK_EventVendorTables] PRIMARY KEY CLUSTERED 
(
	[eventID] ASC,
	[vendorID] ASC,
	[tableID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/*Grades Table*/
CREATE TABLE [dbo].[Grades](
	[gradeID] [int] IDENTITY(1,1) NOT NULL,
	[presentationID] [int] NOT NULL,
	[grade] [int] NOT NULL,
 CONSTRAINT [PK_Grades] PRIMARY KEY CLUSTERED 
(
	[gradeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/*Levels Table*/
CREATE TABLE [dbo].[Levels](
	[levelID] [int] IDENTITY(1,1) NOT NULL,
	[levelDifficulty] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Levels] PRIMARY KEY CLUSTERED 
(
	[levelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/*Presentations Table*/
CREATE TABLE [dbo].[Presentations](
	[presentationID] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[description] [nvarchar](255) NULL,
	[levelID] [int] NULL,
	[presenterID] [int] NOT NULL,
	[eventID] [int] NULL,
	[trackID] [int] NULL,
 CONSTRAINT [PK_Presentations] PRIMARY KEY CLUSTERED 
(
	[presentationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/*Presenters Table*/
CREATE TABLE [dbo].[Presenters](
	[presenterID] [int] IDENTITY(1,1) NOT NULL,
	[attendantID] [int] NOT NULL,
 CONSTRAINT [PK_Presenters] PRIMARY KEY CLUSTERED 
(
	[presenterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/*Regions Table*/
CREATE TABLE [dbo].[Regions](
	[regionID] [int] IDENTITY(1,1) NOT NULL,
	[regionName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Regions] PRIMARY KEY CLUSTERED 
(
	[regionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/*Roles Table*/
CREATE TABLE [dbo].[Roles](
	[roleID] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


/*Rooms Table*/
CREATE TABLE [dbo].[Rooms](
	[roomID] [int] IDENTITY(1,1) NOT NULL,
	[roomName] [nvarchar](100) NOT NULL,
	[capacity] [int] NOT NULL,
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[roomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/*Schedules Table*/
CREATE TABLE [dbo].[Schedules](
	[scheduleID] [int] NOT NULL,
	[presentationID] [int] NOT NULL,
	[roomID] [int] NOT NULL,
	[startTime] [time](7) NOT NULL,
	[endTime] [time](7) NOT NULL,
 CONSTRAINT [PK_Schedules] PRIMARY KEY CLUSTERED 
(
	[scheduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/*States Table*/
CREATE TABLE [dbo].[States](
	[stateID] [int] IDENTITY(1,1) NOT NULL,
	[stateName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_States] PRIMARY KEY CLUSTERED 
(
	[stateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/*Tables Table*/
CREATE TABLE [dbo].[Tables](
	[tableID] [int] IDENTITY(1,1) NOT NULL,
	[condition] [nvarchar](50) NULL,
 CONSTRAINT [PK_Tables] PRIMARY KEY CLUSTERED 
(
	[tableID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/*Tracks Table*/
CREATE TABLE [dbo].[Tracks](
	[trackID] [int] IDENTITY(1,1) NOT NULL,
	[topic] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Tracks] PRIMARY KEY CLUSTERED 
(
	[trackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/*VendorRankings Table*/
CREATE TABLE [dbo].[VendorRankings](
	[vendorRankingID] [int] IDENTITY(1,1) NOT NULL,
	[ranking] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_VendorRankings] PRIMARY KEY CLUSTERED 
(
	[vendorRankingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/*Vendors Table*/
CREATE TABLE [dbo].[Vendors](
	[vendorID] [int] IDENTITY(1,1) NOT NULL,
	[vendorName] [nvarchar](100) NOT NULL,
	[vendorRankingID] [int] NOT NULL,
 CONSTRAINT [PK_Vendors] PRIMARY KEY CLUSTERED 
(
	[vendorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/*Venues Table*/
CREATE TABLE [dbo].[Venues](
	[venueID] [int] IDENTITY(1,1) NOT NULL,
	[addressID] [int] NOT NULL,
 CONSTRAINT [PK_Venues] PRIMARY KEY CLUSTERED 
(
	[venueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/*Addresses Table FKs*/
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Addresses_Cities] FOREIGN KEY([cityID])
REFERENCES [dbo].[Cities] ([cityID])
GO

ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Addresses_Cities]
GO

ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Addresses_States] FOREIGN KEY([stateID])
REFERENCES [dbo].[States] ([stateID])
GO

ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Addresses_States]
GO

/*Attendants TABLE FKs*/
ALTER TABLE [dbo].[Attendants]  WITH CHECK ADD  CONSTRAINT [FK_Attendants_Addresses] FOREIGN KEY([addressID])
REFERENCES [dbo].[Addresses] ([addressID])
GO

ALTER TABLE [dbo].[Attendants] CHECK CONSTRAINT [FK_Attendants_Addresses]
GO

/*EventAttendantRoles Table FKs*/
ALTER TABLE [dbo].[EventAttendantRoles]  WITH CHECK ADD  CONSTRAINT [FK_EventAttendantRoles_Attendants] FOREIGN KEY([attendantID])
REFERENCES [dbo].[Attendants] ([attendantID])
GO

ALTER TABLE [dbo].[EventAttendantRoles] CHECK CONSTRAINT [FK_EventAttendantRoles_Attendants]
GO

ALTER TABLE [dbo].[EventAttendantRoles]  WITH CHECK ADD  CONSTRAINT [FK_EventAttendantRoles_Events] FOREIGN KEY([eventID])
REFERENCES [dbo].[Events] ([eventID])
GO

ALTER TABLE [dbo].[EventAttendantRoles] CHECK CONSTRAINT [FK_EventAttendantRoles_Events]
GO

ALTER TABLE [dbo].[EventAttendantRoles]  WITH CHECK ADD  CONSTRAINT [FK_EventAttendantRoles_Roles] FOREIGN KEY([roleID])
REFERENCES [dbo].[Roles] ([roleID])
GO

ALTER TABLE [dbo].[EventAttendantRoles] CHECK CONSTRAINT [FK_EventAttendantRoles_Roles]
GO

/*Events Table FKs*/
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_Regions] FOREIGN KEY([regionID])
REFERENCES [dbo].[Regions] ([regionID])
GO

ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_Regions]
GO

ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_Venues] FOREIGN KEY([venueID])
REFERENCES [dbo].[Venues] ([venueID])
GO

ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_Venues]
GO

/*EventVendorTables Table Fks*/
ALTER TABLE [dbo].[EventVendorTables]  WITH CHECK ADD  CONSTRAINT [FK_EventVendorTables_Events] FOREIGN KEY([eventID])
REFERENCES [dbo].[Events] ([eventID])
GO

ALTER TABLE [dbo].[EventVendorTables] CHECK CONSTRAINT [FK_EventVendorTables_Events]
GO

ALTER TABLE [dbo].[EventVendorTables]  WITH CHECK ADD  CONSTRAINT [FK_EventVendorTables_Tables] FOREIGN KEY([tableID])
REFERENCES [dbo].[Tables] ([tableID])
GO

ALTER TABLE [dbo].[EventVendorTables] CHECK CONSTRAINT [FK_EventVendorTables_Tables]
GO

ALTER TABLE [dbo].[EventVendorTables]  WITH CHECK ADD  CONSTRAINT [FK_EventVendorTables_Vendors] FOREIGN KEY([vendorID])
REFERENCES [dbo].[Vendors] ([vendorID])
GO

ALTER TABLE [dbo].[EventVendorTables] CHECK CONSTRAINT [FK_EventVendorTables_Vendors]
GO

/*Grades Table FKs*/
ALTER TABLE [dbo].[Grades]  WITH CHECK ADD  CONSTRAINT [FK_Grades_Presentations] FOREIGN KEY([presentationID])
REFERENCES [dbo].[Presentations] ([presentationID])
GO

ALTER TABLE [dbo].[Grades] CHECK CONSTRAINT [FK_Grades_Presentations]
GO

/*Presentations Table FKs*/
ALTER TABLE [dbo].[Presentations]  WITH CHECK ADD  CONSTRAINT [FK_Presentations_Events] FOREIGN KEY([eventID])
REFERENCES [dbo].[Events] ([eventID])
GO

ALTER TABLE [dbo].[Presentations] CHECK CONSTRAINT [FK_Presentations_Events]
GO

ALTER TABLE [dbo].[Presentations]  WITH CHECK ADD  CONSTRAINT [FK_Presentations_Levels] FOREIGN KEY([levelID])
REFERENCES [dbo].[Levels] ([levelID])
GO

ALTER TABLE [dbo].[Presentations] CHECK CONSTRAINT [FK_Presentations_Levels]
GO

ALTER TABLE [dbo].[Presentations]  WITH CHECK ADD  CONSTRAINT [FK_Presentations_Presenters] FOREIGN KEY([presenterID])
REFERENCES [dbo].[Presenters] ([presenterID])
GO

ALTER TABLE [dbo].[Presentations] CHECK CONSTRAINT [FK_Presentations_Presenters]
GO

ALTER TABLE [dbo].[Presentations]  WITH CHECK ADD  CONSTRAINT [FK_Presentations_Tracks] FOREIGN KEY([trackID])
REFERENCES [dbo].[Tracks] ([trackID])
GO

ALTER TABLE [dbo].[Presentations] CHECK CONSTRAINT [FK_Presentations_Tracks]
GO


/*Presenters Table FKs*/
ALTER TABLE [dbo].[Presenters]  WITH CHECK ADD  CONSTRAINT [FK_Presenters_Attendants] FOREIGN KEY([attendantID])
REFERENCES [dbo].[Attendants] ([attendantID])
GO

ALTER TABLE [dbo].[Presenters] CHECK CONSTRAINT [FK_Presenters_Attendants]
GO

/*Schedules Table FKs*/
ALTER TABLE [dbo].[Schedules]  WITH CHECK ADD  CONSTRAINT [FK_Schedules_Presentations] FOREIGN KEY([presentationID])
REFERENCES [dbo].[Presentations] ([presentationID])
GO

ALTER TABLE [dbo].[Schedules] CHECK CONSTRAINT [FK_Schedules_Presentations]
GO

ALTER TABLE [dbo].[Schedules]  WITH CHECK ADD  CONSTRAINT [FK_Schedules_Rooms] FOREIGN KEY([roomID])
REFERENCES [dbo].[Rooms] ([roomID])
GO

ALTER TABLE [dbo].[Schedules] CHECK CONSTRAINT [FK_Schedules_Rooms]
GO



/*Vendors Table FKs*/
ALTER TABLE [dbo].[Vendors]  WITH CHECK ADD  CONSTRAINT [FK_Vendors_VendorRankings] FOREIGN KEY([vendorRankingID])
REFERENCES [dbo].[VendorRankings] ([vendorRankingID])
GO

ALTER TABLE [dbo].[Vendors] CHECK CONSTRAINT [FK_Vendors_VendorRankings]
GO


/*Venues Table FKs*/
ALTER TABLE [dbo].[Venues]  WITH CHECK ADD  CONSTRAINT [FK_Venues_Addresses] FOREIGN KEY([addressID])
REFERENCES [dbo].[Addresses] ([addressID])
GO

ALTER TABLE [dbo].[Venues] CHECK CONSTRAINT [FK_Venues_Addresses]
GO


/*=======================================Inserting Data to DB=====================================================*/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertAttendant]/*Helper*/
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

	IF NOT EXISTS(SELECT * FROM Attendants WHERE firstName= @firstName AND lastName = @lastName) 
	BEGIN
		INSERT INTO Attendants(firstName, lastName)
		VALUES (@firstName, @lastName)
		
		INSERT INTO Presenters(attendantID) SELECT attendantID FROM Attendants WHERE firstName = @firstName AND lastName = @lastName
	END
END
GO

INSERT INTO Roles(roleName) 
VALUES
('Presenter'),
('Attendee'),
('Organizer'),
('Volunteer'),
('Sponsor')

INSERT INTO Tracks(topic)
VALUES
('SQL Development'),
('Administration'), 
('Architecture'),
('Big Data'),
('Advanced Analysis Techniques'),
('Analytics and Visualization'),
('BI Information Delivery')


INSERT INTO Levels(levelDifficulty) SELECT 'Beginner' WHERE NOT EXISTS(SELECT * FROM Levels WHERE levelDifficulty= 'Beginner')
INSERT INTO Levels(levelDifficulty) SELECT 'Intermediate' WHERE NOT EXISTS(SELECT * FROM Levels WHERE levelDifficulty= 'Intermediate')
INSERT INTO Levels(levelDifficulty) SELECT 'Advanced' WHERE NOT EXISTS(SELECT * FROM Levels WHERE levelDifficulty= 'Advanced')
INSERT INTO Levels(levelDifficulty) SELECT 'Non-Technical' WHERE NOT EXISTS(SELECT * FROM Levels WHERE levelDifficulty= 'Non-Technical')

INSERT INTO VendorRankings(ranking) SELECT 'Platinum Sponsor' WHERE NOT EXISTS(SELECT * FROM VendorRankings WHERE ranking= 'Platinum Sponsor')
INSERT INTO VendorRankings(ranking) SELECT 'Gold Sponsor' WHERE NOT EXISTS(SELECT * FROM VendorRankings WHERE ranking= 'Gold Sponsor')
INSERT INTO VendorRankings(ranking) SELECT 'Silver Sponsor' WHERE NOT EXISTS(SELECT * FROM VendorRankings WHERE ranking= 'Silver Sponsor')
INSERT INTO VendorRankings(ranking) SELECT 'Bronze Sponsor' WHERE NOT EXISTS(SELECT * FROM VendorRankings WHERE ranking= 'Bronze Sponsor')

INSERT INTO Vendors(vendorName, vendorRankingID)
VALUES 
('VMWare', (SELECT vendorRankingID FROM VendorRankings WHERE ranking = 'Platinum Sponsor')),
('Verizon Digital Media Services', (SELECT vendorRankingID FROM VendorRankings WHERE ranking = 'Platinum Sponsor')),
('Microsoft Corporation (GAP) (GAP Sponsor)', (SELECT vendorRankingID FROM VendorRankings WHERE ranking = 'Platinum Sponsor')),
('Tintri', (SELECT vendorRankingID FROM VendorRankings WHERE ranking = 'Platinum Sponsor')),
('Amazon Web Services, LLC', (SELECT vendorRankingID FROM VendorRankings WHERE ranking = 'Gold Sponsor')),
('Pyramid Analytics (GAP Sponsor)', (SELECT vendorRankingID FROM VendorRankings WHERE ranking = 'Gold Sponsor')),
('Pure Storage', (SELECT vendorRankingID FROM VendorRankings WHERE ranking = 'Gold Sponsor')),
('Profisee', (SELECT vendorRankingID FROM VendorRankings WHERE ranking = 'Gold Sponsor')),
('NetLib Security', (SELECT vendorRankingID FROM VendorRankings WHERE ranking = 'Silver Sponsor')),
('Melissa Data Corp.', (SELECT vendorRankingID FROM VendorRankings WHERE ranking = 'Silver Sponsor')),
('Red Gate Software', (SELECT vendorRankingID FROM VendorRankings WHERE ranking = 'Silver Sponsor')),
('SentryOne', (SELECT vendorRankingID FROM VendorRankings WHERE ranking = 'Silver Sponsor')),
('Hush Hush', (SELECT vendorRankingID FROM VendorRankings WHERE ranking = 'Bronze Sponsor')),
('COZYROC', (SELECT vendorRankingID FROM VendorRankings WHERE ranking = 'Bronze Sponsor')),
('SQLDocKit by Acceleratio Ltd.', (SELECT vendorRankingID FROM VendorRankings WHERE ranking = 'Bronze Sponsor'))

INSERT INTO Regions(regionName) SELECT 'Europe/Middle East/Africa' WHERE NOT EXISTS(SELECT * FROM Regions WHERE regionName= 'Europe/Middle East/Africa')
INSERT INTO Regions(regionName) SELECT 'Canada/US' WHERE NOT EXISTS(SELECT * FROM Regions WHERE regionName= 'Canada/US')
INSERT INTO Regions(regionName) SELECT 'Latin America' WHERE NOT EXISTS(SELECT * FROM Regions WHERE regionName= 'Latin America')
INSERT INTO Regions(regionName) SELECT 'Asia Pacific' WHERE NOT EXISTS(SELECT * FROM Regions WHERE regionName= 'Asia Pacific')
INSERT INTO Regions(regionName) SELECT 'All Regions' WHERE NOT EXISTS(SELECT * FROM Regions WHERE regionName= 'All Regions')

INSERT INTO Events(eventID, eventDate, eventName, regionID)
VALUES
(626, '5/6/2017', 'Budapest', (SELECT regionID FROM Regions WHERE regionName = 'Europe/Middle East/Africa')),
(615, '6/3/2017', 'Baltimore', (SELECT regionID FROM Regions WHERE regionName = 'Canada/US')),
(608, '5/13/2017', 'Bogota', (SELECT regionID FROM Regions WHERE regionName = 'Latin America')),
(616, '5/20/2017', 'Kiyv', (SELECT regionID FROM Regions WHERE regionName = 'Europe/Middle East/Africa')),
(588, '6/3/2017', 'New York', (SELECT regionID FROM Regions WHERE regionName = 'Canada/US')),
(630, '5/20/2017', 'Brisbane', (SELECT regionID FROM Regions WHERE regionName = 'Asia Pacific')),
(599, '5/27/2017', 'Plovdiv', (SELECT regionID FROM Regions WHERE regionName = 'Europe/Middle East/Africa')),
(638, '5/27/2017', 'Philadelphia', (SELECT regionID FROM Regions WHERE regionName = 'Canada/US')),
(001, '5/14/2017', 'All Events', (SELECT regionID FROM Regions WHERE regionName = 'All Regions'))

EXECUTE  InsertAttendant 'Steve Simon'
EXECUTE  InsertAttendant 'Jeremiah Peschka'
EXECUTE  InsertAttendant 'Jeremiah Peschka'
EXECUTE  InsertAttendant 'Kevin Goff'
EXECUTE  InsertAttendant 'Chris Seferlis'
EXECUTE  InsertAttendant 'Steve Simon'
EXECUTE  InsertAttendant 'Mohammad Yusuf'
EXECUTE  InsertAttendant 'Kennie Pontoppidan'
EXECUTE  InsertAttendant 'John Sterrett'
EXECUTE  InsertAttendant 'Thomas Grohser'
EXECUTE  InsertAttendant 'Thomas Grohser'
EXECUTE  InsertAttendant 'Joe Chang'
EXECUTE  InsertAttendant 'Joe Chang'
EXECUTE  InsertAttendant 'Michael Wharton'
EXECUTE  InsertAttendant 'Sunil Kadimdiwan'
EXECUTE  InsertAttendant 'Mike Walsh'
EXECUTE  InsertAttendant 'John Miner'
EXECUTE  InsertAttendant 'John Miner'
EXECUTE  InsertAttendant 'James Serra'
EXECUTE  InsertAttendant 'Joseph D''Antoni'
EXECUTE  InsertAttendant 'Paresh Motiwala'
EXECUTE  InsertAttendant 'Mickey Stuewe'
EXECUTE  InsertAttendant 'John Miner'
EXECUTE  InsertAttendant 'Stacia Misner'
EXECUTE  InsertAttendant 'James Serra'
EXECUTE  InsertAttendant 'James Serra'
EXECUTE  InsertAttendant 'David Hansen'
EXECUTE  InsertAttendant 'Steve Simon'
EXECUTE  InsertAttendant 'Steve Simon'
EXECUTE  InsertAttendant 'Kevin Goff'
EXECUTE  InsertAttendant 'Mickey Stuewe'
EXECUTE  InsertAttendant 'Allan Hirt'
EXECUTE  InsertAttendant 'Allan Hirt'
EXECUTE  InsertAttendant 'SQLSaturday 364'
EXECUTE  InsertAttendant 'Robert Pearl'
EXECUTE  InsertAttendant 'Steve Simon'
EXECUTE  InsertAttendant 'Steve Simon'
EXECUTE  InsertAttendant 'John Flannery'
EXECUTE  InsertAttendant 'John Flannery'
EXECUTE  InsertAttendant 'Steve Simon'
EXECUTE  InsertAttendant 'Steve Simon'
EXECUTE  InsertAttendant 'Edward Pollack'
EXECUTE  InsertAttendant 'Mohammad Yusuf'
EXECUTE  InsertAttendant 'Michael Corey'
EXECUTE  InsertAttendant 'Steve Simon'
EXECUTE  InsertAttendant 'Robert Pearl'
EXECUTE  InsertAttendant 'Gigi Bell'
EXECUTE  InsertAttendant 'John Flannery'
EXECUTE  InsertAttendant 'Allan Hirt'
EXECUTE  InsertAttendant 'Jason Horner'
EXECUTE  InsertAttendant 'Jason Horner'
EXECUTE  InsertAttendant 'Edward Pollack'
EXECUTE  InsertAttendant 'Edward Pollack'
EXECUTE  InsertAttendant 'Brent Ozar'
EXECUTE  InsertAttendant 'James Serra'
EXECUTE  InsertAttendant 'Thomas Grohser'
EXECUTE  InsertAttendant 'Paul Rizza'
EXECUTE  InsertAttendant 'SQLSaturday 364'
EXECUTE  InsertAttendant 'Grant Fritchey'
EXECUTE  InsertAttendant 'Sayed Saeed'
EXECUTE  InsertAttendant 'John Miner'
EXECUTE  InsertAttendant 'Steve Simon'
EXECUTE  InsertAttendant 'Paul Rizza'
EXECUTE  InsertAttendant 'Stéphane Fréchette'
EXECUTE  InsertAttendant 'Chris Bell'
EXECUTE  InsertAttendant 'Andy Leonard'
EXECUTE  InsertAttendant 'Varsham Papikian'
EXECUTE  InsertAttendant 'David Bermingham'
EXECUTE  InsertAttendant 'James Serra'
EXECUTE  InsertAttendant 'Brent Ozar'
EXECUTE  InsertAttendant 'George Walters'
EXECUTE  InsertAttendant 'Allan Hirt'
EXECUTE  InsertAttendant 'Kevin Goff'
EXECUTE  InsertAttendant 'Jack Corbett'
EXECUTE  InsertAttendant 'Kevin Goff'
EXECUTE  InsertAttendant 'David Hansen'
EXECUTE  InsertAttendant 'Stacia Misner'
EXECUTE  InsertAttendant 'John Flannery'
EXECUTE  InsertAttendant 'John Sterrett'
EXECUTE  InsertAttendant 'John Sterrett'
EXECUTE  InsertAttendant 'Brandon Leach'
EXECUTE  InsertAttendant 'Brandon Leach'
EXECUTE  InsertAttendant 'Allan Hirt'
EXECUTE  InsertAttendant 'Jeremiah Peschka'
EXECUTE  InsertAttendant 'SQLSaturday 364'
EXECUTE  InsertAttendant 'SQLSaturday 364'
EXECUTE  InsertAttendant 'Steve Simon'
EXECUTE  InsertAttendant 'Steve Simon'
EXECUTE  InsertAttendant 'Steve Simon'
EXECUTE  InsertAttendant 'James Serra'
EXECUTE  InsertAttendant 'Steve Simon'
EXECUTE  InsertAttendant 'Hilary Cotter'
EXECUTE  InsertAttendant 'Stacia Misner'
EXECUTE  InsertAttendant 'Jason Brimhall'
EXECUTE  InsertAttendant 'Mike Walsh'
EXECUTE  InsertAttendant 'Steve Simon'
EXECUTE  InsertAttendant 'Kevin Schenega'
EXECUTE  InsertAttendant 'Chris Bell'
EXECUTE  InsertAttendant 'Kennie Pontoppidan'
EXECUTE  InsertAttendant 'Todd Chittenden'
EXECUTE  InsertAttendant 'Steve Simon'
EXECUTE  InsertAttendant 'Michael Wharton'
EXECUTE  InsertAttendant 'Jason Horner'
EXECUTE  InsertAttendant 'Chris Bell'
EXECUTE  InsertAttendant 'Edward Pollack'
EXECUTE  InsertAttendant 'SQLSaturday 364'
EXECUTE  InsertAttendant 'Steve Simon'
EXECUTE  InsertAttendant 'Mike Hillwig'
EXECUTE  InsertAttendant 'Stacia Misner'
EXECUTE  InsertAttendant 'SQLSaturday 364'
EXECUTE  InsertAttendant 'Hilary Cotter'
EXECUTE  InsertAttendant 'Jason Brimhall'
EXECUTE  InsertAttendant 'Hilary Cotter'
EXECUTE  InsertAttendant 'Hilary Cotter'
EXECUTE  InsertAttendant 'Stéphane Fréchette'
EXECUTE  InsertAttendant 'Paul Rizza'
EXECUTE  InsertAttendant 'Allan Hirt'
EXECUTE  InsertAttendant 'Kennie Pontoppidan'
EXECUTE  InsertAttendant 'Kevin Goff'
EXECUTE  InsertAttendant 'George Walters'
EXECUTE  InsertAttendant 'Steve Simon'
EXECUTE  InsertAttendant 'George Walters'
EXECUTE  InsertAttendant 'George Walters'
EXECUTE  InsertAttendant 'David Hansen'
EXECUTE  InsertAttendant 'Jason Brimhall'
EXECUTE  InsertAttendant 'Steve Simon'
EXECUTE  InsertAttendant 'Steve Simon'
EXECUTE  InsertAttendant 'Kevin Goff'
EXECUTE  InsertAttendant 'Thomas Grohser'
EXECUTE  InsertAttendant 'Brandon Leach'
EXECUTE  InsertAttendant 'Andy Leonard'
EXECUTE  InsertAttendant 'Carl Berglund'
EXECUTE  InsertAttendant 'Hilary Cotter'
EXECUTE  InsertAttendant 'John Miner'
EXECUTE  InsertAttendant 'Melissa Riley'
EXECUTE  InsertAttendant 'Adam Jorgensen'
EXECUTE  InsertAttendant 'Dennis Messina'
EXECUTE  InsertAttendant 'Richie Rump'
EXECUTE  InsertAttendant 'Chris Bell'
EXECUTE  InsertAttendant 'Jack Corbett'
EXECUTE  InsertAttendant 'Aaron Bertrand'
EXECUTE  InsertAttendant 'Greg Moore'
EXECUTE  InsertAttendant 'Aaron Bertrand'
EXECUTE  InsertAttendant 'Kevin Goff'
EXECUTE  InsertAttendant 'Grant Fritchey'
EXECUTE  InsertAttendant 'Jason Brimhall'
EXECUTE  InsertAttendant 'Brent Ozar'
EXECUTE  InsertAttendant 'David Bermingham'
EXECUTE  InsertAttendant 'James Serra'
EXECUTE  InsertAttendant 'James Serra'
EXECUTE  InsertAttendant 'Kevin Goff'
EXECUTE  InsertAttendant 'Paresh Motiwala'
EXECUTE  InsertAttendant 'Kevin Goff'
EXECUTE  InsertAttendant 'Mike Walsh'
	
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('A dive into Data Quality Services', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Steve Simon', 1, CHARINDEX(' ', 'Steve Simon') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Steve Simon'), 1, CHARINDEX(' ', REVERSE('Steve Simon')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 1)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('A Dynamic World Demands Dynamic SQL', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Jeremiah Peschka', 1, CHARINDEX(' ', 'Jeremiah Peschka') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Jeremiah Peschka'), 1, CHARINDEX(' ', REVERSE('Jeremiah Peschka')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'Kiyv'), 1)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('A Dynamic World Demands Dynamic SQL', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Jeremiah Peschka', 1, CHARINDEX(' ', 'Jeremiah Peschka') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Jeremiah Peschka'), 1, CHARINDEX(' ', REVERSE('Jeremiah Peschka')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'Kiyv'), 1)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Absolute Introductory Session on SQL Server 2014 In-Memory Optimized Databases (Hekaton)', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Kevin Goff', 1, CHARINDEX(' ', 'Kevin Goff') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Kevin Goff'), 1, CHARINDEX(' ', REVERSE('Kevin Goff')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'Budapest'), 1)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('AlwaysOn: Improve reliability and reporting performance with one cool tech', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Chris Seferlis', 1, CHARINDEX(' ', 'Chris Seferlis') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Chris Seferlis'), 1, CHARINDEX(' ', REVERSE('Chris Seferlis')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 1)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('An introduction to Data Mining', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Steve Simon', 1, CHARINDEX(' ', 'Steve Simon') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Steve Simon'), 1, CHARINDEX(' ', REVERSE('Steve Simon')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'Kiyv'), 1)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('An Introduction to Database Design', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Mohammad Yusuf', 1, CHARINDEX(' ', 'Mohammad Yusuf') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Mohammad Yusuf'), 1, CHARINDEX(' ', REVERSE('Mohammad Yusuf')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 1)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Autogenerating a process data warehouse', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Kennie Pontoppidan', 1, CHARINDEX(' ', 'Kennie Pontoppidan') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Kennie Pontoppidan'), 1, CHARINDEX(' ', REVERSE('Kennie Pontoppidan')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Advanced'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 1)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Automate your daily checklist with PBM and CMS', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('John Sterrett', 1, CHARINDEX(' ', 'John Sterrett') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('John Sterrett'), 1, CHARINDEX(' ', REVERSE('John Sterrett')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'Budapest'), 1)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Automated Installing and Configuration of SQL2014/SQL2012 AlwaysOn Across Multiple Datacenters', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Thomas Grohser', 1, CHARINDEX(' ', 'Thomas Grohser') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Thomas Grohser'), 1, CHARINDEX(' ', REVERSE('Thomas Grohser')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 1)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Automated Installing and Configuration of SQL2014/SQL2012 AlwaysOn Across Multiple Datacenters', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Thomas Grohser', 1, CHARINDEX(' ', 'Thomas Grohser') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Thomas Grohser'), 1, CHARINDEX(' ', REVERSE('Thomas Grohser')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'Kiyv'), 1)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Automating Execution Plan Analysis', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Joe Chang', 1, CHARINDEX(' ', 'Joe Chang') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Joe Chang'), 1, CHARINDEX(' ', REVERSE('Joe Chang')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Advanced'), (SELECT eventID FROM Events WHERE eventName = 'Kiyv'), 1)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Automating Execution Plan Analysis', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Joe Chang', 1, CHARINDEX(' ', 'Joe Chang') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Joe Chang'), 1, CHARINDEX(' ', REVERSE('Joe Chang')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Advanced'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 1)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Automating SQL Server using PowerShell', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Michael Wharton', 1, CHARINDEX(' ', 'Michael Wharton') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Michael Wharton'), 1, CHARINDEX(' ', REVERSE('Michael Wharton')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 1)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Balanced Scorecards using SSRS', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Sunil Kadimdiwan', 1, CHARINDEX(' ', 'Sunil Kadimdiwan') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Sunil Kadimdiwan'), 1, CHARINDEX(' ', REVERSE('Sunil Kadimdiwan')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'Budapest'), 1)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Baselines and Performance Monitoring with PAL', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Mike Walsh', 1, CHARINDEX(' ', 'Mike Walsh') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Mike Walsh'), 1, CHARINDEX(' ', REVERSE('Mike Walsh')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 1)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Basic Database Design', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('John Miner', 1, CHARINDEX(' ', 'John Miner') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('John Miner'), 1, CHARINDEX(' ', REVERSE('John Miner')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 1)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Basic Database Programming', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('John Miner', 1, CHARINDEX(' ', 'John Miner') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('John Miner'), 1, CHARINDEX(' ', REVERSE('John Miner')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'Kiyv'), 1)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Become a BI Independent Consultant!', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('James Serra', 1, CHARINDEX(' ', 'James Serra') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('James Serra'), 1, CHARINDEX(' ', REVERSE('James Serra')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'Budapest'), 1)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Becoming a Top DBA--Learning Automation in SQL Server', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Joseph D''Antoni', 1, CHARINDEX(' ', 'Joseph D''Antoni') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Joseph D''Antoni'), 1, CHARINDEX(' ', REVERSE('Joseph D''Antoni')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'Kiyv'), 1)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Best Practices Document', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Paresh Motiwala', 1, CHARINDEX(' ', 'Paresh Motiwala') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Paresh Motiwala'), 1, CHARINDEX(' ', REVERSE('Paresh Motiwala')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'Kiyv'), 1)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Best Practices for Efficient SSRS Report Creation', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Mickey Stuewe', 1, CHARINDEX(' ', 'Mickey Stuewe') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Mickey Stuewe'), 1, CHARINDEX(' ', REVERSE('Mickey Stuewe')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 1)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Biggest Loser: Database Edition', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('John Miner', 1, CHARINDEX(' ', 'John Miner') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('John Miner'), 1, CHARINDEX(' ', REVERSE('John Miner')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 1)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Building a BI Solution in the Cloud', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Stacia Misner', 1, CHARINDEX(' ', 'Stacia Misner') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Stacia Misner'), 1, CHARINDEX(' ', REVERSE('Stacia Misner')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'Budapest'), 1)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Building an Effective Data Warehouse Architecture', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('James Serra', 1, CHARINDEX(' ', 'James Serra') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('James Serra'), 1, CHARINDEX(' ', REVERSE('James Serra')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 2)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Building an Effective Data Warehouse Architecture with the cloud and MPP', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('James Serra', 1, CHARINDEX(' ', 'James Serra') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('James Serra'), 1, CHARINDEX(' ', REVERSE('James Serra')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 2)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Bulk load and minimal logged inserts', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('David Hansen', 1, CHARINDEX(' ', 'David Hansen') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('David Hansen'), 1, CHARINDEX(' ', REVERSE('David Hansen')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Advanced'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 2)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Business Analytics with SQL Server & Power Map:Everything you want to know but were afraid to ask', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Steve Simon', 1, CHARINDEX(' ', 'Steve Simon') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Steve Simon'), 1, CHARINDEX(' ', REVERSE('Steve Simon')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 2)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Challenges to designing financial warehouses, lessons learnt', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Steve Simon', 1, CHARINDEX(' ', 'Steve Simon') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Steve Simon'), 1, CHARINDEX(' ', REVERSE('Steve Simon')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 2)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Change Data Capture in SQL Server 2008/2012', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Kevin Goff', 1, CHARINDEX(' ', 'Kevin Goff') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Kevin Goff'), 1, CHARINDEX(' ', REVERSE('Kevin Goff')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 2)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Changing Your Habits to Improve the Performance of Your T-SQL', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Mickey Stuewe', 1, CHARINDEX(' ', 'Mickey Stuewe') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Mickey Stuewe'), 1, CHARINDEX(' ', REVERSE('Mickey Stuewe')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'Kiyv'), 2)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Clusters Your Way: #SANLess Clusters for Physical, Virtual, and Cloud Environments', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Allan Hirt', 1, CHARINDEX(' ', 'Allan Hirt') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Allan Hirt'), 1, CHARINDEX(' ', REVERSE('Allan Hirt')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'Kiyv'), 2)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Clusters Your Way: #SANLess Clusters for Physical, Virtual, and Cloud Environments', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Allan Hirt', 1, CHARINDEX(' ', 'Allan Hirt') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Allan Hirt'), 1, CHARINDEX(' ', REVERSE('Allan Hirt')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Non-Technical'), (SELECT eventID FROM Events WHERE eventName = 'Kiyv'), 2)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Coffee Break', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('SQLSaturday 364', 1, CHARINDEX(' ', 'SQLSaturday 364') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('SQLSaturday 364'), 1, CHARINDEX(' ', REVERSE('SQLSaturday 364')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Non-Technical'), (SELECT eventID FROM Events WHERE eventName = 'Budapest'), 2)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Creating A Performance Health Repository - using MDW', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Robert Pearl', 1, CHARINDEX(' ', 'Robert Pearl') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Robert Pearl'), 1, CHARINDEX(' ', REVERSE('Robert Pearl')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'Kiyv'), 2)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Creating efficient and effective SSRS BI Solutions', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Steve Simon', 1, CHARINDEX(' ', 'Steve Simon') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Steve Simon'), 1, CHARINDEX(' ', REVERSE('Steve Simon')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'Kiyv'), 2)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Creating efficient and effective SSRS BI Solutions', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Steve Simon', 1, CHARINDEX(' ', 'Steve Simon') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Steve Simon'), 1, CHARINDEX(' ', REVERSE('Steve Simon')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 2)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Data Partitioning', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('John Flannery', 1, CHARINDEX(' ', 'John Flannery') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('John Flannery'), 1, CHARINDEX(' ', REVERSE('John Flannery')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 2)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Data Tier Application Testing with NUnit and Distributed Replay', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('John Flannery', 1, CHARINDEX(' ', 'John Flannery') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('John Flannery'), 1, CHARINDEX(' ', REVERSE('John Flannery')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 2)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Database design for mere developers', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Steve Simon', 1, CHARINDEX(' ', 'Steve Simon') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Steve Simon'), 1, CHARINDEX(' ', REVERSE('Steve Simon')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'Budapest'), 2)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Database design for mere developers', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Steve Simon', 1, CHARINDEX(' ', 'Steve Simon') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Steve Simon'), 1, CHARINDEX(' ', REVERSE('Steve Simon')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 2)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Database Design: Solving Problems Before they Start!', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Edward Pollack', 1, CHARINDEX(' ', 'Edward Pollack') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Edward Pollack'), 1, CHARINDEX(' ', REVERSE('Edward Pollack')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 2)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Database Modeling and Design', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Mohammad Yusuf', 1, CHARINDEX(' ', 'Mohammad Yusuf') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Mohammad Yusuf'), 1, CHARINDEX(' ', REVERSE('Mohammad Yusuf')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 2)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Database Virtualization and Drinking out of the Fire Hose', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Michael Corey', 1, CHARINDEX(' ', 'Michael Corey') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Michael Corey'), 1, CHARINDEX(' ', REVERSE('Michael Corey')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 3)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('DAX and the tabular model', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Steve Simon', 1, CHARINDEX(' ', 'Steve Simon') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Steve Simon'), 1, CHARINDEX(' ', REVERSE('Steve Simon')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'Kiyv'), 3)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('DBA FOR DUMMIES', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Robert Pearl', 1, CHARINDEX(' ', 'Robert Pearl') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Robert Pearl'), 1, CHARINDEX(' ', REVERSE('Robert Pearl')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'Budapest'), 3)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Dealing With Difficult People', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Gigi Bell', 1, CHARINDEX(' ', 'Gigi Bell') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Gigi Bell'), 1, CHARINDEX(' ', REVERSE('Gigi Bell')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'Kiyv'), 3)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Development Lifecycle with SQL Server Data Tools and DACFx', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('John Flannery', 1, CHARINDEX(' ', 'John Flannery') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('John Flannery'), 1, CHARINDEX(' ', REVERSE('John Flannery')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'Kiyv'), 3)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Did You Vote Today? A DBAs Guide to Cluster Quorum', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Allan Hirt', 1, CHARINDEX(' ', 'Allan Hirt') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Allan Hirt'), 1, CHARINDEX(' ', REVERSE('Allan Hirt')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Advanced'), (SELECT eventID FROM Events WHERE eventName = 'Kiyv'), 3)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Dimensional Modeling Design Patterns: Beyond Basics', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Jason Horner', 1, CHARINDEX(' ', 'Jason Horner') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Jason Horner'), 1, CHARINDEX(' ', REVERSE('Jason Horner')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'Kiyv'), 3)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Dimensional Modeling Design Patterns: Beyond Basics', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Jason Horner', 1, CHARINDEX(' ', 'Jason Horner') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Jason Horner'), 1, CHARINDEX(' ', REVERSE('Jason Horner')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'Budapest'), 3)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Diving Into Query Execution Plans', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Edward Pollack', 1, CHARINDEX(' ', 'Edward Pollack') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Edward Pollack'), 1, CHARINDEX(' ', REVERSE('Edward Pollack')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 3)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Dynamic SQL: Writing Efficient Queries on the Fly', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Edward Pollack', 1, CHARINDEX(' ', 'Edward Pollack') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Edward Pollack'), 1, CHARINDEX(' ', REVERSE('Edward Pollack')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'Kiyv'), 3)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Easy Architecture Design for HA and DR', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Brent Ozar', 1, CHARINDEX(' ', 'Brent Ozar') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Brent Ozar'), 1, CHARINDEX(' ', REVERSE('Brent Ozar')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 3)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Enhancing your career: Building your personal brand', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('James Serra', 1, CHARINDEX(' ', 'James Serra') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('James Serra'), 1, CHARINDEX(' ', REVERSE('James Serra')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 3)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Establishing a SLA', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Thomas Grohser', 1, CHARINDEX(' ', 'Thomas Grohser') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Thomas Grohser'), 1, CHARINDEX(' ', REVERSE('Thomas Grohser')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 3)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('ETL not ELT! Common mistakes and misconceptions about SSIS', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Paul Rizza', 1, CHARINDEX(' ', 'Paul Rizza') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Paul Rizza'), 1, CHARINDEX(' ', REVERSE('Paul Rizza')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Advanced'), (SELECT eventID FROM Events WHERE eventName = 'Budapest'), 3)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Event Kickoff and Networking', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('SQLSaturday 364', 1, CHARINDEX(' ', 'SQLSaturday 364') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('SQLSaturday 364'), 1, CHARINDEX(' ', REVERSE('SQLSaturday 364')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Non-Technical'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 3)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Execution Plans: What Can You Do With Them?', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Grant Fritchey', 1, CHARINDEX(' ', 'Grant Fritchey') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Grant Fritchey'), 1, CHARINDEX(' ', REVERSE('Grant Fritchey')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 3)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Faster, Better Decisions with Self Service Business Analytics', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Sayed Saeed', 1, CHARINDEX(' ', 'Sayed Saeed') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Sayed Saeed'), 1, CHARINDEX(' ', REVERSE('Sayed Saeed')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 3)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Full Text Indexing Basics', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('John Miner', 1, CHARINDEX(' ', 'John Miner') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('John Miner'), 1, CHARINDEX(' ', REVERSE('John Miner')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'Budapest'), 3)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Get your Mining Model Predictions out to all', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Steve Simon', 1, CHARINDEX(' ', 'Steve Simon') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Steve Simon'), 1, CHARINDEX(' ', REVERSE('Steve Simon')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 3)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Getting a job with Microsoft', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Paul Rizza', 1, CHARINDEX(' ', 'Paul Rizza') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Paul Rizza'), 1, CHARINDEX(' ', REVERSE('Paul Rizza')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Non-Technical'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 3)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Graph Databases for SQL Server Professionals', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Stéphane Fréchette', 1, CHARINDEX(' ', 'Stéphane Fréchette') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Stéphane Fréchette'), 1, CHARINDEX(' ', REVERSE('Stéphane Fréchette')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 4)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Hacking Exposé - Using SSL to Protect SQL Connections', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Chris Bell', 1, CHARINDEX(' ', 'Chris Bell') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Chris Bell'), 1, CHARINDEX(' ', REVERSE('Chris Bell')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 4)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Hacking the SSIS 2012 Catalog', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Andy Leonard', 1, CHARINDEX(' ', 'Andy Leonard') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Andy Leonard'), 1, CHARINDEX(' ', REVERSE('Andy Leonard')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'Budapest'), 4)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Hidden in plain sight: master your tools', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Varsham Papikian', 1, CHARINDEX(' ', 'Varsham Papikian') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Varsham Papikian'), 1, CHARINDEX(' ', REVERSE('Varsham Papikian')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 4)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Highly Available SQL Server in Windows Azure IaaS', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('David Bermingham', 1, CHARINDEX(' ', 'David Bermingham') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('David Bermingham'), 1, CHARINDEX(' ', REVERSE('David Bermingham')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 4)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('How to Make a LOT More Money as a Consultant', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('James Serra', 1, CHARINDEX(' ', 'James Serra') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('James Serra'), 1, CHARINDEX(' ', REVERSE('James Serra')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 4)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('How to Think Like the Engine', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Brent Ozar', 1, CHARINDEX(' ', 'Brent Ozar') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Brent Ozar'), 1, CHARINDEX(' ', REVERSE('Brent Ozar')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 4)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Hybrid Cloud Scenarios with SQL Server 2014', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('George Walters', 1, CHARINDEX(' ', 'George Walters') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('George Walters'), 1, CHARINDEX(' ', REVERSE('George Walters')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'Budapest'), 4)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Hybrid Solutions: The Future of SQL Server Disaster Recovery', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Allan Hirt', 1, CHARINDEX(' ', 'Allan Hirt') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Allan Hirt'), 1, CHARINDEX(' ', REVERSE('Allan Hirt')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'Budapest'), 4)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Implementing Data Warehouse Patterns with the Microsoft BI Tools', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Kevin Goff', 1, CHARINDEX(' ', 'Kevin Goff') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Kevin Goff'), 1, CHARINDEX(' ', REVERSE('Kevin Goff')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'Budapest'), 4)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Inroduction to Triggers', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Jack Corbett', 1, CHARINDEX(' ', 'Jack Corbett') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Jack Corbett'), 1, CHARINDEX(' ', REVERSE('Jack Corbett')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'Budapest'), 4)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Integrating Reporting Services with SharePoint', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Kevin Goff', 1, CHARINDEX(' ', 'Kevin Goff') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Kevin Goff'), 1, CHARINDEX(' ', REVERSE('Kevin Goff')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 4)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Integration Services (SSIS) for the DBA', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('David Hansen', 1, CHARINDEX(' ', 'David Hansen') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('David Hansen'), 1, CHARINDEX(' ', REVERSE('David Hansen')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 4)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Introducing Power BI', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Stacia Misner', 1, CHARINDEX(' ', 'Stacia Misner') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Stacia Misner'), 1, CHARINDEX(' ', REVERSE('Stacia Misner')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 4)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Introduction to Database Recovery', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('John Flannery', 1, CHARINDEX(' ', 'John Flannery') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('John Flannery'), 1, CHARINDEX(' ', REVERSE('John Flannery')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 1)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Introduction to High Availability with SQL Server', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('John Sterrett', 1, CHARINDEX(' ', 'John Sterrett') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('John Sterrett'), 1, CHARINDEX(' ', REVERSE('John Sterrett')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 1)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Introduction to Powershell for DBA''s', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('John Sterrett', 1, CHARINDEX(' ', 'John Sterrett') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('John Sterrett'), 1, CHARINDEX(' ', REVERSE('John Sterrett')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 1)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Introduction to SQL Server - Part 1', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Brandon Leach', 1, CHARINDEX(' ', 'Brandon Leach') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Brandon Leach'), 1, CHARINDEX(' ', REVERSE('Brandon Leach')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 1)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Introduction to SQL Server - Part 2', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Brandon Leach', 1, CHARINDEX(' ', 'Brandon Leach') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Brandon Leach'), 1, CHARINDEX(' ', REVERSE('Brandon Leach')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 1)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Is That A Failover Cluster On Your Laptop/Desktop?', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Allan Hirt', 1, CHARINDEX(' ', 'Allan Hirt') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Allan Hirt'), 1, CHARINDEX(' ', REVERSE('Allan Hirt')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 1)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Leaving the Windows Open', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Jeremiah Peschka', 1, CHARINDEX(' ', 'Jeremiah Peschka') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Jeremiah Peschka'), 1, CHARINDEX(' ', REVERSE('Jeremiah Peschka')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 1)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Lunch Break', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('SQLSaturday 364', 1, CHARINDEX(' ', 'SQLSaturday 364') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('SQLSaturday 364'), 1, CHARINDEX(' ', REVERSE('SQLSaturday 364')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Non-Technical'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 1)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Lunchtime Keynote', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('SQLSaturday 364', 1, CHARINDEX(' ', 'SQLSaturday 364') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('SQLSaturday 364'), 1, CHARINDEX(' ', REVERSE('SQLSaturday 364')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Non-Technical'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 1)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Master Data Services Best Practices', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Steve Simon', 1, CHARINDEX(' ', 'Steve Simon') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Steve Simon'), 1, CHARINDEX(' ', REVERSE('Steve Simon')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 1)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Master Data Services Disaster Recovery', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Steve Simon', 1, CHARINDEX(' ', 'Steve Simon') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Steve Simon'), 1, CHARINDEX(' ', REVERSE('Steve Simon')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 1)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Mind your language!! Cursors are a dirty word', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Steve Simon', 1, CHARINDEX(' ', 'Steve Simon') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Steve Simon'), 1, CHARINDEX(' ', REVERSE('Steve Simon')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 1)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Modern Data Warehousing', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('James Serra', 1, CHARINDEX(' ', 'James Serra') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('James Serra'), 1, CHARINDEX(' ', REVERSE('James Serra')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 1)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Monitoring Server health via Reporting Services dashboards', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Steve Simon', 1, CHARINDEX(' ', 'Steve Simon') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Steve Simon'), 1, CHARINDEX(' ', REVERSE('Steve Simon')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 1)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Monitoring SQL Server using Extended Events', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Hilary Cotter', 1, CHARINDEX(' ', 'Hilary Cotter') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Hilary Cotter'), 1, CHARINDEX(' ', REVERSE('Hilary Cotter')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 1)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Multidimensional vs Tabular - May the Best Model Win', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Stacia Misner', 1, CHARINDEX(' ', 'Stacia Misner') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Stacia Misner'), 1, CHARINDEX(' ', REVERSE('Stacia Misner')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 2)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Murder They Wrote', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Jason Brimhall', 1, CHARINDEX(' ', 'Jason Brimhall') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Jason Brimhall'), 1, CHARINDEX(' ', REVERSE('Jason Brimhall')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 2)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Never Have to Say "Mayday!!!" Again', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Mike Walsh', 1, CHARINDEX(' ', 'Mike Walsh') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Mike Walsh'), 1, CHARINDEX(' ', REVERSE('Mike Walsh')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 2)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Now you see it! Now you don’t! Conjuring many reports utilizing only one SSRS report.', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Steve Simon', 1, CHARINDEX(' ', 'Steve Simon') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Steve Simon'), 1, CHARINDEX(' ', REVERSE('Steve Simon')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 2)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Optimal Infrastructure Strategies for Cisco UCS, Nexus and SQL Server', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Kevin Schenega', 1, CHARINDEX(' ', 'Kevin Schenega') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Kevin Schenega'), 1, CHARINDEX(' ', REVERSE('Kevin Schenega')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Non-Technical'), (SELECT eventID FROM Events WHERE eventName = 'Budapest'), 2)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Optimizing Protected Indexes', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Chris Bell', 1, CHARINDEX(' ', 'Chris Bell') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Chris Bell'), 1, CHARINDEX(' ', REVERSE('Chris Bell')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'Budapest'), 2)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Partitioning as a design pattern', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Kennie Pontoppidan', 1, CHARINDEX(' ', 'Kennie Pontoppidan') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Kennie Pontoppidan'), 1, CHARINDEX(' ', REVERSE('Kennie Pontoppidan')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Advanced'), (SELECT eventID FROM Events WHERE eventName = 'Budapest'), 2)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Power BI Components in Microsoft''s Self-Service BI Suite', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Todd Chittenden', 1, CHARINDEX(' ', 'Todd Chittenden') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Todd Chittenden'), 1, CHARINDEX(' ', REVERSE('Todd Chittenden')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'New York'), 2)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Power to the people!!', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Steve Simon', 1, CHARINDEX(' ', 'Steve Simon') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Steve Simon'), 1, CHARINDEX(' ', REVERSE('Steve Simon')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'Kiyv'), 2)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('PowerShell Basics for SQLServer', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Michael Wharton', 1, CHARINDEX(' ', 'Michael Wharton') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Michael Wharton'), 1, CHARINDEX(' ', REVERSE('Michael Wharton')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'Kiyv'), 2)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('PowerShell for the Reluctant DBA / Developer', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Jason Horner', 1, CHARINDEX(' ', 'Jason Horner') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Jason Horner'), 1, CHARINDEX(' ', REVERSE('Jason Horner')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'Kiyv'), 2)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Prevent Recovery Amnesia – Forget the Backups', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Chris Bell', 1, CHARINDEX(' ', 'Chris Bell') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Chris Bell'), 1, CHARINDEX(' ', REVERSE('Chris Bell')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'Kiyv'), 2)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Query Optimization Crash Course', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Edward Pollack', 1, CHARINDEX(' ', 'Edward Pollack') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Edward Pollack'), 1, CHARINDEX(' ', REVERSE('Edward Pollack')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'Kiyv'), 3)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Raffle', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('SQLSaturday 364', 1, CHARINDEX(' ', 'SQLSaturday 364') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('SQLSaturday 364'), 1, CHARINDEX(' ', REVERSE('SQLSaturday 364')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Non-Technical'), (SELECT eventID FROM Events WHERE eventName = 'All Events'), 3)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Rapid Application Development with Master Data Services', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Steve Simon', 1, CHARINDEX(' ', 'Steve Simon') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Steve Simon'), 1, CHARINDEX(' ', REVERSE('Steve Simon')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'Kiyv'), 3)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Recovery and Backup for Beginners', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Mike Hillwig', 1, CHARINDEX(' ', 'Mike Hillwig') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Mike Hillwig'), 1, CHARINDEX(' ', REVERSE('Mike Hillwig')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'Kiyv'), 3)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Reduce, Reuse, Recycle: Automating Your BI Framework', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Stacia Misner', 1, CHARINDEX(' ', 'Stacia Misner') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Stacia Misner'), 1, CHARINDEX(' ', REVERSE('Stacia Misner')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'Kiyv'), 3)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Registrations', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('SQLSaturday 364', 1, CHARINDEX(' ', 'SQLSaturday 364') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('SQLSaturday 364'), 1, CHARINDEX(' ', REVERSE('SQLSaturday 364')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Non-Technical'), (SELECT eventID FROM Events WHERE eventName = 'All Events'), 3)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Replicaton Technologies', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Hilary Cotter', 1, CHARINDEX(' ', 'Hilary Cotter') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Hilary Cotter'), 1, CHARINDEX(' ', REVERSE('Hilary Cotter')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Advanced'), (SELECT eventID FROM Events WHERE eventName = 'Kiyv'), 3)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Reporting Services for Mere DBAs', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Jason Brimhall', 1, CHARINDEX(' ', 'Jason Brimhall') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Jason Brimhall'), 1, CHARINDEX(' ', REVERSE('Jason Brimhall')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'Kiyv'), 3)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Scaling with SQL Server Service Broker', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Hilary Cotter', 1, CHARINDEX(' ', 'Hilary Cotter') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Hilary Cotter'), 1, CHARINDEX(' ', REVERSE('Hilary Cotter')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Advanced'), (SELECT eventID FROM Events WHERE eventName = 'Kiyv'), 3)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Scaling with SQL Server Service Broker', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Hilary Cotter', 1, CHARINDEX(' ', 'Hilary Cotter') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Hilary Cotter'), 1, CHARINDEX(' ', REVERSE('Hilary Cotter')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Advanced'), (SELECT eventID FROM Events WHERE eventName = 'Kiyv'), 3)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Self-Service Data Integration with Power Query', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Stéphane Fréchette', 1, CHARINDEX(' ', 'Stéphane Fréchette') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Stéphane Fréchette'), 1, CHARINDEX(' ', REVERSE('Stéphane Fréchette')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'Kiyv'), 3)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Shortcuts to Building SSIS in .Net', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Paul Rizza', 1, CHARINDEX(' ', 'Paul Rizza') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Paul Rizza'), 1, CHARINDEX(' ', REVERSE('Paul Rizza')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'Kiyv'), 3)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('So You Want To Be A Consultant?', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Allan Hirt', 1, CHARINDEX(' ', 'Allan Hirt') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Allan Hirt'), 1, CHARINDEX(' ', REVERSE('Allan Hirt')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'Kiyv'), 3)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('SQL anti patterns', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Kennie Pontoppidan', 1, CHARINDEX(' ', 'Kennie Pontoppidan') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Kennie Pontoppidan'), 1, CHARINDEX(' ', REVERSE('Kennie Pontoppidan')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Advanced'), (SELECT eventID FROM Events WHERE eventName = 'Kiyv'), 3)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('SQL Server 2012/2014 Columnstore index', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Kevin Goff', 1, CHARINDEX(' ', 'Kevin Goff') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Kevin Goff'), 1, CHARINDEX(' ', REVERSE('Kevin Goff')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'Kiyv'), 4)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('SQL Server 2012/2014 Performance Tuning All Up', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('George Walters', 1, CHARINDEX(' ', 'George Walters') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('George Walters'), 1, CHARINDEX(' ', REVERSE('George Walters')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'Kiyv'), 4)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('SQL Server 2014 Data Access Layers', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Steve Simon', 1, CHARINDEX(' ', 'Steve Simon') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Steve Simon'), 1, CHARINDEX(' ', REVERSE('Steve Simon')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'Kiyv'), 4)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('SQL Server 2014 New Features', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('George Walters', 1, CHARINDEX(' ', 'George Walters') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('George Walters'), 1, CHARINDEX(' ', REVERSE('George Walters')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'Kiyv'), 4)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('SQL Server AlwaysOn Availability Groups', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('George Walters', 1, CHARINDEX(' ', 'George Walters') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('George Walters'), 1, CHARINDEX(' ', REVERSE('George Walters')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'Kiyv'), 4)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('SQL Server and the Cloud', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('David Hansen', 1, CHARINDEX(' ', 'David Hansen') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('David Hansen'), 1, CHARINDEX(' ', REVERSE('David Hansen')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'Kiyv'), 4)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('SQL Server Compression and what it can do for you', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Jason Brimhall', 1, CHARINDEX(' ', 'Jason Brimhall') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Jason Brimhall'), 1, CHARINDEX(' ', REVERSE('Jason Brimhall')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Advanced'), (SELECT eventID FROM Events WHERE eventName = 'Kiyv'), 4)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('SQL Server Reporting Services 2014 on Steroids!!', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Steve Simon', 1, CHARINDEX(' ', 'Steve Simon') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Steve Simon'), 1, CHARINDEX(' ', REVERSE('Steve Simon')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'Kiyv'), 4)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('SQL Server Reporting Services Best Practices', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Steve Simon', 1, CHARINDEX(' ', 'Steve Simon') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Steve Simon'), 1, CHARINDEX(' ', REVERSE('Steve Simon')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'Kiyv'), 4)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('SQL Server Reporting Services, attendees choose', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Kevin Goff', 1, CHARINDEX(' ', 'Kevin Goff') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Kevin Goff'), 1, CHARINDEX(' ', REVERSE('Kevin Goff')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'Kiyv'), 4)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('SQL Server Storage Engine under the hood', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Thomas Grohser', 1, CHARINDEX(' ', 'Thomas Grohser') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Thomas Grohser'), 1, CHARINDEX(' ', REVERSE('Thomas Grohser')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'Kiyv'), 4)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('SQL Server Storage internals: Looking under the hood.', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Brandon Leach', 1, CHARINDEX(' ', 'Brandon Leach') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Brandon Leach'), 1, CHARINDEX(' ', REVERSE('Brandon Leach')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Advanced'), (SELECT eventID FROM Events WHERE eventName = 'Kiyv'), 4)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('SSIS 2014 Data Flow Tuning Tips and Tricks', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Andy Leonard', 1, CHARINDEX(' ', 'Andy Leonard') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Andy Leonard'), 1, CHARINDEX(' ', REVERSE('Andy Leonard')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'Kiyv'), 4)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Standalone to High-Availability Clusters over Lunch—with Time to Spare', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Carl Berglund', 1, CHARINDEX(' ', 'Carl Berglund') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Carl Berglund'), 1, CHARINDEX(' ', REVERSE('Carl Berglund')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'Budapest'), 4)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Stress testing SQL Server', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Hilary Cotter', 1, CHARINDEX(' ', 'Hilary Cotter') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Hilary Cotter'), 1, CHARINDEX(' ', REVERSE('Hilary Cotter')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Advanced'), (SELECT eventID FROM Events WHERE eventName = 'Kiyv'), 1)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Table partitioning for Azure SQL Databases', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('John Miner', 1, CHARINDEX(' ', 'John Miner') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('John Miner'), 1, CHARINDEX(' ', REVERSE('John Miner')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'Kiyv'), 1)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Testing', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Melissa Riley', 1, CHARINDEX(' ', 'Melissa Riley') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Melissa Riley'), 1, CHARINDEX(' ', REVERSE('Melissa Riley')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'Kiyv'), 1)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('The future of the data professional', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Adam Jorgensen', 1, CHARINDEX(' ', 'Adam Jorgensen') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Adam Jorgensen'), 1, CHARINDEX(' ', REVERSE('Adam Jorgensen')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'Kiyv'), 1)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('The Quest for the Golden Record:MDM Best Practices', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Dennis Messina', 1, CHARINDEX(' ', 'Dennis Messina') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Dennis Messina'), 1, CHARINDEX(' ', REVERSE('Dennis Messina')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'Budapest'), 1)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('The Quest to Find Bad Data With Data Profiling', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Richie Rump', 1, CHARINDEX(' ', 'Richie Rump') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Richie Rump'), 1, CHARINDEX(' ', REVERSE('Richie Rump')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'Budapest'), 1)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('The Spy Who Loathed Me - An Intro to SQL Security', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Chris Bell', 1, CHARINDEX(' ', 'Chris Bell') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Chris Bell'), 1, CHARINDEX(' ', REVERSE('Chris Bell')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'Budapest'), 1)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Tired of the CRUD? Automate it!', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Jack Corbett', 1, CHARINDEX(' ', 'Jack Corbett') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Jack Corbett'), 1, CHARINDEX(' ', REVERSE('Jack Corbett')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'Budapest'), 1)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Top 5 Ways to Improve Your triggers', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Aaron Bertrand', 1, CHARINDEX(' ', 'Aaron Bertrand') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Aaron Bertrand'), 1, CHARINDEX(' ', REVERSE('Aaron Bertrand')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'Budapest'), 1)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Tricks that have saved my bacon', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Greg Moore', 1, CHARINDEX(' ', 'Greg Moore') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Greg Moore'), 1, CHARINDEX(' ', REVERSE('Greg Moore')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'Budapest'), 1)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('T-SQL : Bad Habits & Best Practices', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Aaron Bertrand', 1, CHARINDEX(' ', 'Aaron Bertrand') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Aaron Bertrand'), 1, CHARINDEX(' ', REVERSE('Aaron Bertrand')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'Budapest'), 1)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('T-SQL for Application Developers - Attendees chose', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Kevin Goff', 1, CHARINDEX(' ', 'Kevin Goff') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Kevin Goff'), 1, CHARINDEX(' ', REVERSE('Kevin Goff')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'Budapest'), 2)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Tune Queries By Fixing Bad Parameter Sniffing', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Grant Fritchey', 1, CHARINDEX(' ', 'Grant Fritchey') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Grant Fritchey'), 1, CHARINDEX(' ', REVERSE('Grant Fritchey')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'Budapest'), 2)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Using Extended Events in SQL Server', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Jason Brimhall', 1, CHARINDEX(' ', 'Jason Brimhall') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Jason Brimhall'), 1, CHARINDEX(' ', REVERSE('Jason Brimhall')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Advanced'), (SELECT eventID FROM Events WHERE eventName = 'Budapest'), 2)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Watch Brent Tune Queries', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Brent Ozar', 1, CHARINDEX(' ', 'Brent Ozar') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Brent Ozar'), 1, CHARINDEX(' ', REVERSE('Brent Ozar')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'Budapest'), 2)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('What every SQL Server DBA needs to know about Windows Server 10 Technical Preview', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('David Bermingham', 1, CHARINDEX(' ', 'David Bermingham') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('David Bermingham'), 1, CHARINDEX(' ', REVERSE('David Bermingham')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'Budapest'), 2)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('What exactly is big data and why should I care?', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('James Serra', 1, CHARINDEX(' ', 'James Serra') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('James Serra'), 1, CHARINDEX(' ', REVERSE('James Serra')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'Budapest'), 2)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('What is it like to work for Microsoft?', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('James Serra', 1, CHARINDEX(' ', 'James Serra') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('James Serra'), 1, CHARINDEX(' ', REVERSE('James Serra')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Beginner'), (SELECT eventID FROM Events WHERE eventName = 'Budapest'), 2)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('What’s new in SQL Server Integration Services 2012', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Kevin Goff', 1, CHARINDEX(' ', 'Kevin Goff') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Kevin Goff'), 1, CHARINDEX(' ', REVERSE('Kevin Goff')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'Budapest'), 2)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Why do we shun using tools for DBA job?', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Paresh Motiwala', 1, CHARINDEX(' ', 'Paresh Motiwala') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Paresh Motiwala'), 1, CHARINDEX(' ', REVERSE('Paresh Motiwala')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'Budapest'), 2)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('Why OLAP? Building SSAS cubes and benefits of OLAP', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Kevin Goff', 1, CHARINDEX(' ', 'Kevin Goff') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Kevin Goff'), 1, CHARINDEX(' ', REVERSE('Kevin Goff')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'Budapest'), 2)
INSERT INTO Presentations(title, presenterID, levelID, eventID, trackID) VALUES ('You''re Doing It Wrong!!', (SELECT presenterID FROM Presenters WHERE (attendantID = (SELECT attendantID FROM Attendants WHERE firstName = (SUBSTRING('Mike Walsh', 1, CHARINDEX(' ', 'Mike Walsh') - 1)) AND lastName = (REVERSE(SUBSTRING(REVERSE('Mike Walsh'), 1, CHARINDEX(' ', REVERSE('Mike Walsh')) - 1)))))),  (SELECT levelID  FROM Levels WHERE levelDifficulty = 'Intermediate'), (SELECT eventID FROM Events WHERE eventName = 'Budapest'), 2)


INSERT INTO Cities(cityName) SELECT 'Lebanon' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Lebanon')
INSERT INTO Cities(cityName) SELECT 'Haney' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Haney')
INSERT INTO Cities(cityName) SELECT 'Hervey Bay' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Hervey Bay')
INSERT INTO Cities(cityName) SELECT 'Lebanon' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Lebanon')
INSERT INTO Cities(cityName) SELECT 'Cambridge' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Cambridge')
INSERT INTO Cities(cityName) SELECT 'Mill Valley' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Mill Valley')
INSERT INTO Cities(cityName) SELECT 'Corvallis' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Corvallis')
INSERT INTO Cities(cityName) SELECT 'Milsons Point' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Milsons Point')
INSERT INTO Cities(cityName) SELECT 'Bellflower' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Bellflower')
INSERT INTO Cities(cityName) SELECT 'Torrance' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Torrance')
INSERT INTO Cities(cityName) SELECT 'Coffs Harbour' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Coffs Harbour')
INSERT INTO Cities(cityName) SELECT 'Puyallup' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Puyallup')
INSERT INTO Cities(cityName) SELECT 'Peterborough' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Peterborough')
INSERT INTO Cities(cityName) SELECT 'Baltimore' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Baltimore')
INSERT INTO Cities(cityName) SELECT 'Berkeley' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Berkeley')
INSERT INTO Cities(cityName) SELECT 'N. Vancouver' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'N. Vancouver')
INSERT INTO Cities(cityName) SELECT 'Bremerton' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Bremerton')
INSERT INTO Cities(cityName) SELECT 'Gateshead' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Gateshead')
INSERT INTO Cities(cityName) SELECT 'Metchosin' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Metchosin')
INSERT INTO Cities(cityName) SELECT 'Berkeley' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Berkeley')
INSERT INTO Cities(cityName) SELECT 'Burien' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Burien')
INSERT INTO Cities(cityName) SELECT 'London' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'London')
INSERT INTO Cities(cityName) SELECT 'Santa Monica' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Santa Monica')
INSERT INTO Cities(cityName) SELECT 'Bremerton' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Bremerton')
INSERT INTO Cities(cityName) SELECT 'Matraville' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Matraville')
INSERT INTO Cities(cityName) SELECT 'Santa Cruz' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Santa Cruz')
INSERT INTO Cities(cityName) SELECT 'Lebanon' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Lebanon')
INSERT INTO Cities(cityName) SELECT 'Colma' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Colma')
INSERT INTO Cities(cityName) SELECT 'Leeds' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Leeds')
INSERT INTO Cities(cityName) SELECT 'Kirkland' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Kirkland')
INSERT INTO Cities(cityName) SELECT 'Oregon City' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Oregon City')
INSERT INTO Cities(cityName) SELECT 'Chula Vista' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Chula Vista')
INSERT INTO Cities(cityName) SELECT 'Oregon City' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Oregon City')
INSERT INTO Cities(cityName) SELECT 'Stoke-on-Trent' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Stoke-on-Trent')
INSERT INTO Cities(cityName) SELECT 'West Covina' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'West Covina')
INSERT INTO Cities(cityName) SELECT 'Springwood' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Springwood')
INSERT INTO Cities(cityName) SELECT 'Portland' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Portland')
INSERT INTO Cities(cityName) SELECT 'Silverwater' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Silverwater')
INSERT INTO Cities(cityName) SELECT 'London' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'London')
INSERT INTO Cities(cityName) SELECT 'Cincinnati' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Cincinnati')
INSERT INTO Cities(cityName) SELECT 'Torrance' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Torrance')
INSERT INTO Cities(cityName) SELECT 'Townsville' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Townsville')
INSERT INTO Cities(cityName) SELECT 'North Sydney' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'North Sydney')
INSERT INTO Cities(cityName) SELECT 'Hervey Bay' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Hervey Bay')
INSERT INTO Cities(cityName) SELECT 'Walla Walla' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Walla Walla')
INSERT INTO Cities(cityName) SELECT 'Wollongong' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Wollongong')
INSERT INTO Cities(cityName) SELECT 'Port Macquarie' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Port Macquarie')
INSERT INTO Cities(cityName) SELECT 'Bellingham' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Bellingham')
INSERT INTO Cities(cityName) SELECT 'London' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'London')
INSERT INTO Cities(cityName) SELECT 'Seattle' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Seattle')
INSERT INTO Cities(cityName) SELECT 'Los Angeles' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Los Angeles')
INSERT INTO Cities(cityName) SELECT 'Everett' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Everett')
INSERT INTO Cities(cityName) SELECT 'Berkeley' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Berkeley')
INSERT INTO Cities(cityName) SELECT 'Colma' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Colma')
INSERT INTO Cities(cityName) SELECT 'Langley' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Langley')
INSERT INTO Cities(cityName) SELECT 'London' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'London')
INSERT INTO Cities(cityName) SELECT 'El Cajon' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'El Cajon')
INSERT INTO Cities(cityName) SELECT 'Burbank' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Burbank')
INSERT INTO Cities(cityName) SELECT 'Redmond' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Redmond')
INSERT INTO Cities(cityName) SELECT 'Bellingham' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Bellingham')
INSERT INTO Cities(cityName) SELECT 'Port Macquarie' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Port Macquarie')
INSERT INTO Cities(cityName) SELECT 'Yakima' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Yakima')
INSERT INTO Cities(cityName) SELECT 'Burbank' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Burbank')
INSERT INTO Cities(cityName) SELECT 'Rhodes' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Rhodes')
INSERT INTO Cities(cityName) SELECT 'Woodland Hills' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Woodland Hills')
INSERT INTO Cities(cityName) SELECT 'Coffs Harbour' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Coffs Harbour')
INSERT INTO Cities(cityName) SELECT 'Sedro Woolley' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Sedro Woolley')
INSERT INTO Cities(cityName) SELECT 'Lake Oswego' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Lake Oswego')
INSERT INTO Cities(cityName) SELECT 'Marysville' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Marysville')
INSERT INTO Cities(cityName) SELECT 'Milton Keynes' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Milton Keynes')
INSERT INTO Cities(cityName) SELECT 'Calgary' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Calgary')
INSERT INTO Cities(cityName) SELECT 'Townsville' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Townsville')
INSERT INTO Cities(cityName) SELECT 'Burbank' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Burbank')
INSERT INTO Cities(cityName) SELECT 'Oxford' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Oxford')
INSERT INTO Cities(cityName) SELECT 'Townsville' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Townsville')
INSERT INTO Cities(cityName) SELECT 'Lynnwood' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Lynnwood')
INSERT INTO Cities(cityName) SELECT 'South Melbourne' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'South Melbourne')
INSERT INTO Cities(cityName) SELECT 'Issaquah' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Issaquah')
INSERT INTO Cities(cityName) SELECT 'Warrnambool' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Warrnambool')
INSERT INTO Cities(cityName) SELECT 'Burlingame' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Burlingame')
INSERT INTO Cities(cityName) SELECT 'Burien' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Burien')
INSERT INTO Cities(cityName) SELECT 'Olympia' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Olympia')
INSERT INTO Cities(cityName) SELECT 'Bury' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Bury')
INSERT INTO Cities(cityName) SELECT 'North Ryde' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'North Ryde')
INSERT INTO Cities(cityName) SELECT 'Stoke-on-Trent' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Stoke-on-Trent')
INSERT INTO Cities(cityName) SELECT 'San Diego' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'San Diego')
INSERT INTO Cities(cityName) SELECT 'Port Orchard' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Port Orchard')
INSERT INTO Cities(cityName) SELECT 'Port Macquarie' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Port Macquarie')
INSERT INTO Cities(cityName) SELECT 'Concord' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Concord')
INSERT INTO Cities(cityName) SELECT 'Newton' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Newton')
INSERT INTO Cities(cityName) SELECT 'Woodland Hills' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Woodland Hills')
INSERT INTO Cities(cityName) SELECT 'Newcastle' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Newcastle')
INSERT INTO Cities(cityName) SELECT 'Shawnee' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Shawnee')
INSERT INTO Cities(cityName) SELECT 'Colma' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Colma')
INSERT INTO Cities(cityName) SELECT 'Oak Bay' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Oak Bay')
INSERT INTO Cities(cityName) SELECT 'Haney' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Haney')
INSERT INTO Cities(cityName) SELECT 'Oakland' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Oakland')
INSERT INTO Cities(cityName) SELECT 'Lebanon' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Lebanon')
INSERT INTO Cities(cityName) SELECT 'Lane Cove' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Lane Cove')
INSERT INTO Cities(cityName) SELECT 'Langley' WHERE NOT EXISTS(SELECT * FROM Cities WHERE cityName= 'Langley')

INSERT INTO States(stateName) SELECT 'Oregon' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'Oregon')
INSERT INTO States(stateName) SELECT 'British Columbia' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'British Columbia')
INSERT INTO States(stateName) SELECT 'Queensland' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'Queensland')
INSERT INTO States(stateName) SELECT 'Oregon' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'Oregon')
INSERT INTO States(stateName) SELECT 'England' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'England')
INSERT INTO States(stateName) SELECT 'California' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'California')
INSERT INTO States(stateName) SELECT 'Oregon' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'Oregon')
INSERT INTO States(stateName) SELECT 'New South Wales' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'New South Wales')
INSERT INTO States(stateName) SELECT 'California' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'California')
INSERT INTO States(stateName) SELECT 'California' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'California')
INSERT INTO States(stateName) SELECT 'New South Wales' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'New South Wales')
INSERT INTO States(stateName) SELECT 'Washington' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'Washington')
INSERT INTO States(stateName) SELECT 'England' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'England')
INSERT INTO States(stateName) SELECT 'Maryland' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'Maryland')
INSERT INTO States(stateName) SELECT 'California' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'California')
INSERT INTO States(stateName) SELECT 'British Columbia' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'British Columbia')
INSERT INTO States(stateName) SELECT 'Washington' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'Washington')
INSERT INTO States(stateName) SELECT 'England' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'England')
INSERT INTO States(stateName) SELECT 'British Columbia' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'British Columbia')
INSERT INTO States(stateName) SELECT 'California' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'California')
INSERT INTO States(stateName) SELECT 'Washington' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'Washington')
INSERT INTO States(stateName) SELECT 'England' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'England')
INSERT INTO States(stateName) SELECT 'California' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'California')
INSERT INTO States(stateName) SELECT 'Washington' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'Washington')
INSERT INTO States(stateName) SELECT 'New South Wales' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'New South Wales')
INSERT INTO States(stateName) SELECT 'California' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'California')
INSERT INTO States(stateName) SELECT 'Oregon' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'Oregon')
INSERT INTO States(stateName) SELECT 'California' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'California')
INSERT INTO States(stateName) SELECT 'England' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'England')
INSERT INTO States(stateName) SELECT 'Washington' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'Washington')
INSERT INTO States(stateName) SELECT 'Oregon' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'Oregon')
INSERT INTO States(stateName) SELECT 'California' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'California')
INSERT INTO States(stateName) SELECT 'Oregon' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'Oregon')
INSERT INTO States(stateName) SELECT 'England' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'England')
INSERT INTO States(stateName) SELECT 'California' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'California')
INSERT INTO States(stateName) SELECT 'New South Wales' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'New South Wales')
INSERT INTO States(stateName) SELECT 'Oregon' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'Oregon')
INSERT INTO States(stateName) SELECT 'New South Wales' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'New South Wales')
INSERT INTO States(stateName) SELECT 'England' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'England')
INSERT INTO States(stateName) SELECT 'Ohio' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'Ohio')
INSERT INTO States(stateName) SELECT 'California' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'California')
INSERT INTO States(stateName) SELECT 'Queensland' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'Queensland')
INSERT INTO States(stateName) SELECT 'New South Wales' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'New South Wales')
INSERT INTO States(stateName) SELECT 'Queensland' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'Queensland')
INSERT INTO States(stateName) SELECT 'Washington' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'Washington')
INSERT INTO States(stateName) SELECT 'New South Wales' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'New South Wales')
INSERT INTO States(stateName) SELECT 'New South Wales' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'New South Wales')
INSERT INTO States(stateName) SELECT 'Washington' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'Washington')
INSERT INTO States(stateName) SELECT 'England' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'England')
INSERT INTO States(stateName) SELECT 'Washington' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'Washington')
INSERT INTO States(stateName) SELECT 'California' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'California')
INSERT INTO States(stateName) SELECT 'Washington' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'Washington')
INSERT INTO States(stateName) SELECT 'California' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'California')
INSERT INTO States(stateName) SELECT 'California' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'California')
INSERT INTO States(stateName) SELECT 'British Columbia' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'British Columbia')
INSERT INTO States(stateName) SELECT 'England' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'England')
INSERT INTO States(stateName) SELECT 'California' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'California')
INSERT INTO States(stateName) SELECT 'California' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'California')
INSERT INTO States(stateName) SELECT 'Washington' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'Washington')
INSERT INTO States(stateName) SELECT 'Washington' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'Washington')
INSERT INTO States(stateName) SELECT 'New South Wales' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'New South Wales')
INSERT INTO States(stateName) SELECT 'Washington' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'Washington')
INSERT INTO States(stateName) SELECT 'California' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'California')
INSERT INTO States(stateName) SELECT 'New South Wales' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'New South Wales')
INSERT INTO States(stateName) SELECT 'California' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'California')
INSERT INTO States(stateName) SELECT 'New South Wales' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'New South Wales')
INSERT INTO States(stateName) SELECT 'Washington' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'Washington')
INSERT INTO States(stateName) SELECT 'Oregon' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'Oregon')
INSERT INTO States(stateName) SELECT 'Washington' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'Washington')
INSERT INTO States(stateName) SELECT 'England' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'England')
INSERT INTO States(stateName) SELECT 'Alberta' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'Alberta')
INSERT INTO States(stateName) SELECT 'Queensland' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'Queensland')
INSERT INTO States(stateName) SELECT 'California' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'California')
INSERT INTO States(stateName) SELECT 'England' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'England')
INSERT INTO States(stateName) SELECT 'Queensland' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'Queensland')
INSERT INTO States(stateName) SELECT 'Washington' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'Washington')
INSERT INTO States(stateName) SELECT 'Victoria' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'Victoria')
INSERT INTO States(stateName) SELECT 'Washington' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'Washington')
INSERT INTO States(stateName) SELECT 'Victoria' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'Victoria')
INSERT INTO States(stateName) SELECT 'California' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'California')
INSERT INTO States(stateName) SELECT 'Washington' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'Washington')
INSERT INTO States(stateName) SELECT 'Washington' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'Washington')
INSERT INTO States(stateName) SELECT 'England' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'England')
INSERT INTO States(stateName) SELECT 'New South Wales' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'New South Wales')
INSERT INTO States(stateName) SELECT 'England' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'England')
INSERT INTO States(stateName) SELECT 'California' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'California')
INSERT INTO States(stateName) SELECT 'Washington' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'Washington')
INSERT INTO States(stateName) SELECT 'New South Wales' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'New South Wales')
INSERT INTO States(stateName) SELECT 'California' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'California')
INSERT INTO States(stateName) SELECT 'British Columbia' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'British Columbia')
INSERT INTO States(stateName) SELECT 'California' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'California')
INSERT INTO States(stateName) SELECT 'New South Wales' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'New South Wales')
INSERT INTO States(stateName) SELECT 'British Columbia' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'British Columbia')
INSERT INTO States(stateName) SELECT 'California' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'California')
INSERT INTO States(stateName) SELECT 'British Columbia' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'British Columbia')
INSERT INTO States(stateName) SELECT 'British Columbia' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'British Columbia')
INSERT INTO States(stateName) SELECT 'California' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'California')
INSERT INTO States(stateName) SELECT 'Oregon' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'Oregon')
INSERT INTO States(stateName) SELECT 'New South Wales' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'New South Wales')
INSERT INTO States(stateName) SELECT 'British Columbia' WHERE NOT EXISTS(SELECT * FROM States WHERE stateName= 'British Columbia')


INSERT INTO Addresses(streetAddress, cityID, zipcode, stateID) 
VALUES
((SELECT '10 Napa Ct.' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '10 Napa Ct.')), (SELECT cityID FROM Cities WHERE cityName = 'Lebanon'), '97355' ,(SELECT stateID FROM States WHERE stateName = 'Oregon')),
((SELECT '1000 Bidweld Street' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1000 Bidweld Street')), (SELECT cityID FROM Cities WHERE cityName = 'Haney'), 'V2W 1W2' ,(SELECT stateID FROM States WHERE stateName = 'British Columbia')),
((SELECT '1002 N. Spoonwood Court' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1002 N. Spoonwood Court')), (SELECT cityID FROM Cities WHERE cityName = 'Hervey Bay'), '4655' ,(SELECT stateID FROM States WHERE stateName = 'Queensland')),
((SELECT '1003 Matterhorn Ct' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1003 Matterhorn Ct')), (SELECT cityID FROM Cities WHERE cityName = 'Lebanon'), '97355' ,(SELECT stateID FROM States WHERE stateName = 'Oregon')),
((SELECT '1005 Matterhorn Ct.' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1005 Matterhorn Ct.')), (SELECT cityID FROM Cities WHERE cityName = 'Cambridge'), 'CB4 4BZ' ,(SELECT stateID FROM States WHERE stateName = 'England')),
((SELECT '1005 Matterhorn Ct.' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1005 Matterhorn Ct.')), (SELECT cityID FROM Cities WHERE cityName = 'Mill Valley'), '94941' ,(SELECT stateID FROM States WHERE stateName = 'California')),
((SELECT '1005 Tanager Court' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1005 Tanager Court')), (SELECT cityID FROM Cities WHERE cityName = 'Corvallis'), '97330' ,(SELECT stateID FROM States WHERE stateName = 'Oregon')),
((SELECT '1005 Tanager Court' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1005 Tanager Court')), (SELECT cityID FROM Cities WHERE cityName = 'Milsons Point'), '2061' ,(SELECT stateID FROM States WHERE stateName = 'New South Wales')),
((SELECT '1006 Deercreek Ln' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1006 Deercreek Ln')), (SELECT cityID FROM Cities WHERE cityName = 'Bellflower'), '90706' ,(SELECT stateID FROM States WHERE stateName = 'California')),
((SELECT '1006 Deercreek Ln' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1006 Deercreek Ln')), (SELECT cityID FROM Cities WHERE cityName = 'Torrance'), '90505' ,(SELECT stateID FROM States WHERE stateName = 'California')),
((SELECT '101 Adobe Dr' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '101 Adobe Dr')), (SELECT cityID FROM Cities WHERE cityName = 'Coffs Harbour'), '2450' ,(SELECT stateID FROM States WHERE stateName = 'New South Wales')),
((SELECT '101 Adobe Dr' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '101 Adobe Dr')), (SELECT cityID FROM Cities WHERE cityName = 'Puyallup'), '98371' ,(SELECT stateID FROM States WHERE stateName = 'Washington')),
((SELECT '101, avenue de la Gare' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '101, avenue de la Gare')), (SELECT cityID FROM Cities WHERE cityName = 'Peterborough'), 'PB12' ,(SELECT stateID FROM States WHERE stateName = 'England')),
((SELECT '1010 Maple' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1010 Maple')), (SELECT cityID FROM Cities WHERE cityName = 'Baltimore'), '21201' ,(SELECT stateID FROM States WHERE stateName = 'Maryland')),
((SELECT '1011 Yolanda Circle' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1011 Yolanda Circle')), (SELECT cityID FROM Cities WHERE cityName = 'Berkeley'), '94704' ,(SELECT stateID FROM States WHERE stateName = 'California')),
((SELECT '1011 Yolanda Circle' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1011 Yolanda Circle')), (SELECT cityID FROM Cities WHERE cityName = 'N. Vancouver'), 'V7L 4J4' ,(SELECT stateID FROM States WHERE stateName = 'British Columbia')),
((SELECT '1013 Holiday Hills Dr.' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1013 Holiday Hills Dr.')), (SELECT cityID FROM Cities WHERE cityName = 'Bremerton'), '98312' ,(SELECT stateID FROM States WHERE stateName = 'Washington')),
((SELECT '1013 Holiday Hills Dr.' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1013 Holiday Hills Dr.')), (SELECT cityID FROM Cities WHERE cityName = 'Gateshead'), 'GA10' ,(SELECT stateID FROM States WHERE stateName = 'England')),
((SELECT '1015 Lynwood Drive' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1015 Lynwood Drive')), (SELECT cityID FROM Cities WHERE cityName = 'Metchosin'), 'V9' ,(SELECT stateID FROM States WHERE stateName = 'British Columbia')),
((SELECT '1019 Carletto Drive' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1019 Carletto Drive')), (SELECT cityID FROM Cities WHERE cityName = 'Berkeley'), '94704' ,(SELECT stateID FROM States WHERE stateName = 'California')),
((SELECT '1019 Mt. Davidson Court' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1019 Mt. Davidson Court')), (SELECT cityID FROM Cities WHERE cityName = 'Burien'), '98168' ,(SELECT stateID FROM States WHERE stateName = 'Washington')),
((SELECT '1019 Mt. Davidson Court' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1019 Mt. Davidson Court')), (SELECT cityID FROM Cities WHERE cityName = 'London'), 'SW8 4BG' ,(SELECT stateID FROM States WHERE stateName = 'England')),
((SELECT '102 Vista Place' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '102 Vista Place')), (SELECT cityID FROM Cities WHERE cityName = 'Santa Monica'), '90401' ,(SELECT stateID FROM States WHERE stateName = 'California')),
((SELECT '1020 Book Road' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1020 Book Road')), (SELECT cityID FROM Cities WHERE cityName = 'Bremerton'), '98312' ,(SELECT stateID FROM States WHERE stateName = 'Washington')),
((SELECT '1020 Carletto Drive' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1020 Carletto Drive')), (SELECT cityID FROM Cities WHERE cityName = 'Matraville'), '2036' ,(SELECT stateID FROM States WHERE stateName = 'New South Wales')),
((SELECT '1020 Carletto Drive' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1020 Carletto Drive')), (SELECT cityID FROM Cities WHERE cityName = 'Santa Cruz'), '95062' ,(SELECT stateID FROM States WHERE stateName = 'California')),
((SELECT '1023 Hawkins Street' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1023 Hawkins Street')), (SELECT cityID FROM Cities WHERE cityName = 'Lebanon'), '97355' ,(SELECT stateID FROM States WHERE stateName = 'Oregon')),
((SELECT '1024 Walnut Blvd.' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1024 Walnut Blvd.')), (SELECT cityID FROM Cities WHERE cityName = 'Colma'), '94014' ,(SELECT stateID FROM States WHERE stateName = 'California')),
((SELECT '1025 Holly Oak Drive' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1025 Holly Oak Drive')), (SELECT cityID FROM Cities WHERE cityName = 'Leeds'), 'LE18' ,(SELECT stateID FROM States WHERE stateName = 'England')),
((SELECT '1025 R St.' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1025 R St.')), (SELECT cityID FROM Cities WHERE cityName = 'Kirkland'), '98033' ,(SELECT stateID FROM States WHERE stateName = 'Washington')),
((SELECT '1025 Yosemite Dr.' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1025 Yosemite Dr.')), (SELECT cityID FROM Cities WHERE cityName = 'Oregon City'), '97045' ,(SELECT stateID FROM States WHERE stateName = 'Oregon')),
((SELECT '1028 Green View Court' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1028 Green View Court')), (SELECT cityID FROM Cities WHERE cityName = 'Chula Vista'), '91910' ,(SELECT stateID FROM States WHERE stateName = 'California')),
((SELECT '1028 Green View Court' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1028 Green View Court')), (SELECT cityID FROM Cities WHERE cityName = 'Oregon City'), '97045' ,(SELECT stateID FROM States WHERE stateName = 'Oregon')),
((SELECT '1037 Hayes Court' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1037 Hayes Court')), (SELECT cityID FROM Cities WHERE cityName = 'Stoke-on-Trent'), 'AS23' ,(SELECT stateID FROM States WHERE stateName = 'England')),
((SELECT '1039 Adelaide St.' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1039 Adelaide St.')), (SELECT cityID FROM Cities WHERE cityName = 'West Covina'), '91791' ,(SELECT stateID FROM States WHERE stateName = 'California')),
((SELECT '104 Hilltop Dr.' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '104 Hilltop Dr.')), (SELECT cityID FROM Cities WHERE cityName = 'Springwood'), '2777' ,(SELECT stateID FROM States WHERE stateName = 'New South Wales')),
((SELECT '104 Kaski Ln.' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '104 Kaski Ln.')), (SELECT cityID FROM Cities WHERE cityName = 'Portland'), '97205' ,(SELECT stateID FROM States WHERE stateName = 'Oregon')),
((SELECT '1040 Greenbush Drive' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1040 Greenbush Drive')), (SELECT cityID FROM Cities WHERE cityName = 'Silverwater'), '2264' ,(SELECT stateID FROM States WHERE stateName = 'New South Wales')),
((SELECT '1040 Northridge Road' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1040 Northridge Road')), (SELECT cityID FROM Cities WHERE cityName = 'London'), 'W1X3SE' ,(SELECT stateID FROM States WHERE stateName = 'England')),
((SELECT '1044 San Carlos' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1044 San Carlos')), (SELECT cityID FROM Cities WHERE cityName = 'Cincinnati'), '45202' ,(SELECT stateID FROM States WHERE stateName = 'Ohio')),
((SELECT '1045 Lolita Drive' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1045 Lolita Drive')), (SELECT cityID FROM Cities WHERE cityName = 'Torrance'), '90505' ,(SELECT stateID FROM States WHERE stateName = 'California')),
((SELECT '1045 Lolita Drive' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1045 Lolita Drive')), (SELECT cityID FROM Cities WHERE cityName = 'Townsville'), '4810' ,(SELECT stateID FROM States WHERE stateName = 'Queensland')),
((SELECT '1047 Las Quebradas Lane' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1047 Las Quebradas Lane')), (SELECT cityID FROM Cities WHERE cityName = 'North Sydney'), '2055' ,(SELECT stateID FROM States WHERE stateName = 'New South Wales')),
((SELECT '1048 Burwood Way' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1048 Burwood Way')), (SELECT cityID FROM Cities WHERE cityName = 'Hervey Bay'), '4655' ,(SELECT stateID FROM States WHERE stateName = 'Queensland')),
((SELECT '1048 Las Quebradas Lane' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1048 Las Quebradas Lane')), (SELECT cityID FROM Cities WHERE cityName = 'Walla Walla'), '99362' ,(SELECT stateID FROM States WHERE stateName = 'Washington')),
((SELECT '1048 Las Quebradas Lane' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1048 Las Quebradas Lane')), (SELECT cityID FROM Cities WHERE cityName = 'Wollongong'), '2500' ,(SELECT stateID FROM States WHERE stateName = 'New South Wales')),
((SELECT '105 Clark Creek Lane' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '105 Clark Creek Lane')), (SELECT cityID FROM Cities WHERE cityName = 'Port Macquarie'), '2444' ,(SELECT stateID FROM States WHERE stateName = 'New South Wales')),
((SELECT '105 Woodruff Ln.' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '105 Woodruff Ln.')), (SELECT cityID FROM Cities WHERE cityName = 'Bellingham'), '98225' ,(SELECT stateID FROM States WHERE stateName = 'Washington')),
((SELECT '1050 Creed Ave' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1050 Creed Ave')), (SELECT cityID FROM Cities WHERE cityName = 'London'), 'W10 6BL' ,(SELECT stateID FROM States WHERE stateName = 'England')),
((SELECT '081, boulevard du Montparnasse' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '081, boulevard du Montparnasse')), (SELECT cityID FROM Cities WHERE cityName = 'Seattle'), '98104' ,(SELECT stateID FROM States WHERE stateName = 'Washington')),
((SELECT '1 Smiling Tree Court' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1 Smiling Tree Court')), (SELECT cityID FROM Cities WHERE cityName = 'Los Angeles'), '90012' ,(SELECT stateID FROM States WHERE stateName = 'California')),
((SELECT '100, rue des Rosiers' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '100, rue des Rosiers')), (SELECT cityID FROM Cities WHERE cityName = 'Everett'), '98201' ,(SELECT stateID FROM States WHERE stateName = 'Washington')),
((SELECT '1002 N. Spoonwood Court' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1002 N. Spoonwood Court')), (SELECT cityID FROM Cities WHERE cityName = 'Berkeley'), '94704' ,(SELECT stateID FROM States WHERE stateName = 'California')),
((SELECT '1005 Fremont Street' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1005 Fremont Street')), (SELECT cityID FROM Cities WHERE cityName = 'Colma'), '94014' ,(SELECT stateID FROM States WHERE stateName = 'California')),
((SELECT '1005 Valley Oak Plaza' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1005 Valley Oak Plaza')), (SELECT cityID FROM Cities WHERE cityName = 'Langley'), 'V3A 4R2' ,(SELECT stateID FROM States WHERE stateName = 'British Columbia')),
((SELECT '1005 Valley Oak Plaza' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1005 Valley Oak Plaza')), (SELECT cityID FROM Cities WHERE cityName = 'London'), 'SW6 SBY' ,(SELECT stateID FROM States WHERE stateName = 'England')),
((SELECT '1007 Cardinet Dr.' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1007 Cardinet Dr.')), (SELECT cityID FROM Cities WHERE cityName = 'El Cajon'), '92020' ,(SELECT stateID FROM States WHERE stateName = 'California')),
((SELECT '1008 Lydia Lane' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1008 Lydia Lane')), (SELECT cityID FROM Cities WHERE cityName = 'Burbank'), '91502' ,(SELECT stateID FROM States WHERE stateName = 'California')),
((SELECT '101 Candy Rd.' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '101 Candy Rd.')), (SELECT cityID FROM Cities WHERE cityName = 'Redmond'), '98052' ,(SELECT stateID FROM States WHERE stateName = 'Washington')),
((SELECT '1011 Green St.' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1011 Green St.')), (SELECT cityID FROM Cities WHERE cityName = 'Bellingham'), '98225' ,(SELECT stateID FROM States WHERE stateName = 'Washington')),
((SELECT '1013 Buchanan Rd' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1013 Buchanan Rd')), (SELECT cityID FROM Cities WHERE cityName = 'Port Macquarie'), '2444' ,(SELECT stateID FROM States WHERE stateName = 'New South Wales')),
((SELECT '1013 Buchanan Rd' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1013 Buchanan Rd')), (SELECT cityID FROM Cities WHERE cityName = 'Yakima'), '98901' ,(SELECT stateID FROM States WHERE stateName = 'Washington')),
((SELECT '1016 Park Avenue' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1016 Park Avenue')), (SELECT cityID FROM Cities WHERE cityName = 'Burbank'), '91502' ,(SELECT stateID FROM States WHERE stateName = 'California')),
((SELECT '1019 Book Road' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1019 Book Road')), (SELECT cityID FROM Cities WHERE cityName = 'Rhodes'), '2138' ,(SELECT stateID FROM States WHERE stateName = 'New South Wales')),
((SELECT '1019 Buchanan Road' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1019 Buchanan Road')), (SELECT cityID FROM Cities WHERE cityName = 'Woodland Hills'), '91364' ,(SELECT stateID FROM States WHERE stateName = 'California')),
((SELECT '1019 Candy Rd.' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1019 Candy Rd.')), (SELECT cityID FROM Cities WHERE cityName = 'Coffs Harbour'), '2450' ,(SELECT stateID FROM States WHERE stateName = 'New South Wales')),
((SELECT '1019 Chance Drive' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1019 Chance Drive')), (SELECT cityID FROM Cities WHERE cityName = 'Sedro Woolley'), '98284' ,(SELECT stateID FROM States WHERE stateName = 'Washington')),
((SELECT '1019 Kenwal Rd.' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1019 Kenwal Rd.')), (SELECT cityID FROM Cities WHERE cityName = 'Lake Oswego'), '97034' ,(SELECT stateID FROM States WHERE stateName = 'Oregon')),
((SELECT '1019 Pennsylvania Blvd' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1019 Pennsylvania Blvd')), (SELECT cityID FROM Cities WHERE cityName = 'Marysville'), '98270' ,(SELECT stateID FROM States WHERE stateName = 'Washington')),
((SELECT '102 Vista Place' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '102 Vista Place')), (SELECT cityID FROM Cities WHERE cityName = 'Milton Keynes'), 'MK8 8DF' ,(SELECT stateID FROM States WHERE stateName = 'England')),
((SELECT '10203 Acorn Avenue' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '10203 Acorn Avenue')), (SELECT cityID FROM Cities WHERE cityName = 'Calgary'), 'T2P 2G8' ,(SELECT stateID FROM States WHERE stateName = 'Alberta')),
((SELECT '1023 Hawkins Street' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1023 Hawkins Street')), (SELECT cityID FROM Cities WHERE cityName = 'Townsville'), '4810' ,(SELECT stateID FROM States WHERE stateName = 'Queensland')),
((SELECT '1023 Riveria Way' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1023 Riveria Way')), (SELECT cityID FROM Cities WHERE cityName = 'Burbank'), '91502' ,(SELECT stateID FROM States WHERE stateName = 'California')),
((SELECT '1023 Riviera Way' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1023 Riviera Way')), (SELECT cityID FROM Cities WHERE cityName = 'Oxford'), 'OX1' ,(SELECT stateID FROM States WHERE stateName = 'England')),
((SELECT '1025 Yosemite Dr.' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1025 Yosemite Dr.')), (SELECT cityID FROM Cities WHERE cityName = 'Townsville'), '4810' ,(SELECT stateID FROM States WHERE stateName = 'Queensland')),
((SELECT '1026 Mt. Wilson Pl.' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1026 Mt. Wilson Pl.')), (SELECT cityID FROM Cities WHERE cityName = 'Lynnwood'), '98036' ,(SELECT stateID FROM States WHERE stateName = 'Washington')),
((SELECT '1026 Mt. Wilson Pl.' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1026 Mt. Wilson Pl.')), (SELECT cityID FROM Cities WHERE cityName = 'South Melbourne'), '3205' ,(SELECT stateID FROM States WHERE stateName = 'Victoria')),
((SELECT '1028 Indigo Ct.' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1028 Indigo Ct.')), (SELECT cityID FROM Cities WHERE cityName = 'Issaquah'), '98027' ,(SELECT stateID FROM States WHERE stateName = 'Washington')),
((SELECT '1028 Indigo Ct.' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1028 Indigo Ct.')), (SELECT cityID FROM Cities WHERE cityName = 'Warrnambool'), '3280' ,(SELECT stateID FROM States WHERE stateName = 'Victoria')),
((SELECT '1028 Royal Oak Rd.' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1028 Royal Oak Rd.')), (SELECT cityID FROM Cities WHERE cityName = 'Burlingame'), '94010' ,(SELECT stateID FROM States WHERE stateName = 'California')),
((SELECT '1029 Birchwood Dr' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1029 Birchwood Dr')), (SELECT cityID FROM Cities WHERE cityName = 'Burien'), '98168' ,(SELECT stateID FROM States WHERE stateName = 'Washington')),
((SELECT '1029 Birchwood Dr' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1029 Birchwood Dr')), (SELECT cityID FROM Cities WHERE cityName = 'Olympia'), '98501' ,(SELECT stateID FROM States WHERE stateName = 'Washington')),
((SELECT '1030 Ambush Dr.' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1030 Ambush Dr.')), (SELECT cityID FROM Cities WHERE cityName = 'Bury'), 'PE17' ,(SELECT stateID FROM States WHERE stateName = 'England')),
((SELECT '1032 Buena Vista' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1032 Buena Vista')), (SELECT cityID FROM Cities WHERE cityName = 'North Ryde'), '2113' ,(SELECT stateID FROM States WHERE stateName = 'New South Wales')),
((SELECT '1032 Coats Road' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1032 Coats Road')), (SELECT cityID FROM Cities WHERE cityName = 'Stoke-on-Trent'), 'AS23' ,(SELECT stateID FROM States WHERE stateName = 'England')),
((SELECT '1035 Arguello Blvd.' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1035 Arguello Blvd.')), (SELECT cityID FROM Cities WHERE cityName = 'San Diego'), '92102' ,(SELECT stateID FROM States WHERE stateName = 'California')),
((SELECT '1036 Mason Dr' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1036 Mason Dr')), (SELECT cityID FROM Cities WHERE cityName = 'Port Orchard'), '98366' ,(SELECT stateID FROM States WHERE stateName = 'Washington')),
((SELECT '1039 Adelaide St.' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1039 Adelaide St.')), (SELECT cityID FROM Cities WHERE cityName = 'Port Macquarie'), '2444' ,(SELECT stateID FROM States WHERE stateName = 'New South Wales')),
((SELECT '104 Hilltop Dr.' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '104 Hilltop Dr.')), (SELECT cityID FROM Cities WHERE cityName = 'Concord'), '94519' ,(SELECT stateID FROM States WHERE stateName = 'California')),
((SELECT '1040 Greenbush Drive' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1040 Greenbush Drive')), (SELECT cityID FROM Cities WHERE cityName = 'Newton'), 'V2L3W8' ,(SELECT stateID FROM States WHERE stateName = 'British Columbia')),
((SELECT '1040 Northridge Road' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1040 Northridge Road')), (SELECT cityID FROM Cities WHERE cityName = 'Woodland Hills'), '91364' ,(SELECT stateID FROM States WHERE stateName = 'California')),
((SELECT '1042 Hooftrail Way' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1042 Hooftrail Way')), (SELECT cityID FROM Cities WHERE cityName = 'Newcastle'), '2300' ,(SELECT stateID FROM States WHERE stateName = 'New South Wales')),
((SELECT '1046 Cloverleaf Circle' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1046 Cloverleaf Circle')), (SELECT cityID FROM Cities WHERE cityName = 'Shawnee'), 'V8Z 4N5' ,(SELECT stateID FROM States WHERE stateName = 'British Columbia')),
((SELECT '1046 San Carlos Avenue' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1046 San Carlos Avenue')), (SELECT cityID FROM Cities WHERE cityName = 'Colma'), '94014' ,(SELECT stateID FROM States WHERE stateName = 'California')),
((SELECT '1047 Las Quebradas Lane' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1047 Las Quebradas Lane')), (SELECT cityID FROM Cities WHERE cityName = 'Oak Bay'), 'V8P' ,(SELECT stateID FROM States WHERE stateName = 'British Columbia')),
((SELECT '1048 Burwood Way' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1048 Burwood Way')), (SELECT cityID FROM Cities WHERE cityName = 'Haney'), 'V2W 1W2' ,(SELECT stateID FROM States WHERE stateName = 'British Columbia')),
((SELECT '105 Woodruff Ln.' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '105 Woodruff Ln.')), (SELECT cityID FROM Cities WHERE cityName = 'Oakland'), '94611' ,(SELECT stateID FROM States WHERE stateName = 'California')),
((SELECT '1050 Creed Ave' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1050 Creed Ave')), (SELECT cityID FROM Cities WHERE cityName = 'Lebanon'), '97355' ,(SELECT stateID FROM States WHERE stateName = 'Oregon')),
((SELECT '1050 Greenhills Circle' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1050 Greenhills Circle')), (SELECT cityID FROM Cities WHERE cityName = 'Lane Cove'), '1597' ,(SELECT stateID FROM States WHERE stateName = 'New South Wales')),
((SELECT '1050 Greenhills Circle' WHERE NOT EXISTS(SELECT * FROM Addresses WHERE streetAddress= '1050 Greenhills Circle')), (SELECT cityID FROM Cities WHERE cityName = 'Langley'), 'V3A 4R2' ,(SELECT stateID FROM States WHERE stateName = 'British Columbia'))

INSERT INTO Attendants(firstName, lastName, email, addressID)
VALUES
('Amanda', 'Long', 'ALong@gmail.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '10 Napa Ct.') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Lebanon')) AND (zipcode = '97355')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'Oregon')) ))),
('Christian', 'Shan', 'CShan@gmail.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1000 Bidweld Street') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Haney')) AND (zipcode = 'V2W 1W2')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'British Columbia')) ))),
('Troy', 'Sara', 'TSara@gmail.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1002 N. Spoonwood Court') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Hervey Bay')) AND (zipcode = '4655')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'Queensland')) ))),
('Kaitlyn', 'Baker', 'KBaker@gmail.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1003 Matterhorn Ct') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Lebanon')) AND (zipcode = '97355')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'Oregon')) ))),
('Suzanne', 'Ma', 'SMa@gmail.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1005 Matterhorn Ct.') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Cambridge')) AND (zipcode = 'CB4 4BZ')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'England')) ))),
('Anna', 'Jones', 'AJones@gmail.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1005 Matterhorn Ct.') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Mill Valley')) AND (zipcode = '94941')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'California')) ))),
('Carlos', 'Baker', 'CBaker@gmail.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1005 Tanager Court') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Corvallis')) AND (zipcode = '97330')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'Oregon')) ))),
('Tanya', 'Munoz', 'TMunoz@gmail.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1005 Tanager Court') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Milsons Point')) AND (zipcode = '2061')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'New South Wales')) ))),
('Tabitha', 'Gill', 'TGill@gmail.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1006 Deercreek Ln') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Bellflower')) AND (zipcode = '90706')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'California')) ))),
('Alexis', 'Lee', 'ALee@gmail.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1006 Deercreek Ln') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Torrance')) AND (zipcode = '90505')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'California')) ))),
('Erick', 'Suri', 'ESuri@gmail.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '101 Adobe Dr') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Coffs Harbour')) AND (zipcode = '2450')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'New South Wales')) ))),
('Marcus', 'Evans', 'MEvans@gmail.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '101 Adobe Dr') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Puyallup')) AND (zipcode = '98371')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'Washington')) ))),
('Marcus', 'Clark', 'MClark@gmail.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '101, avenue de la Gare') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Peterborough')) AND (zipcode = 'PB12')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'England')) ))),
('Gilbert', 'Xu', 'GXu@gmail.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1010 Maple') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Baltimore')) AND (zipcode = '21201')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'Maryland')) ))),
('Paula', 'Rubio', 'PRubio@gmail.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1011 Yolanda Circle') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Berkeley')) AND (zipcode = '94704')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'California')) ))),
('Julian', 'Isla', 'JIsla@gmail.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1011 Yolanda Circle') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'N. Vancouver')) AND (zipcode = 'V7L 4J4')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'British Columbia')) ))),
('Jesse', 'Scott', 'JScott@gmail.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1013 Holiday Hills Dr.') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Bremerton')) AND (zipcode = '98312')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'Washington')) ))),
('Naomi', 'Sanz', 'NSanz@gmail.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1013 Holiday Hills Dr.') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Gateshead')) AND (zipcode = 'GA10')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'England')) ))),
('Isabella', 'Lee', 'ILee@gmail.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1015 Lynwood Drive') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Metchosin')) AND (zipcode = 'V9')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'British Columbia')) ))),
('Dawn', 'Yuan', 'DYuan@gmail.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1019 Carletto Drive') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Berkeley')) AND (zipcode = '94704')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'California')) ))),
('Olivia', 'Blue', 'OBlue@gmail.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1019 Mt. Davidson Court') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Burien')) AND (zipcode = '98168')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'Washington')) ))),
('Emmanuel', 'Lopez', 'ELopez@gmail.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1019 Mt. Davidson Court') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'London')) AND (zipcode = 'SW8 4BG')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'England')) ))),
('Nathan', 'Yang', 'NYang@gmail.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '102 Vista Place') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Santa Monica')) AND (zipcode = '90401')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'California')) ))),
('Gabrielle', 'Wood', 'GWood@gmail.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1020 Book Road') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Bremerton')) AND (zipcode = '98312')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'Washington')) ))),
('Katrina', 'Anand', 'KAnand@gmail.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1020 Carletto Drive') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Matraville')) AND (zipcode = '2036')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'New South Wales')) ))),
('Anthony', 'Jones', 'AJones@gmail.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1020 Carletto Drive') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Santa Cruz')) AND (zipcode = '95062')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'California')) ))),
('Natalie', 'Reed', 'NReed@gmail.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1023 Hawkins Street') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Lebanon')) AND (zipcode = '97355')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'Oregon')) ))),
('Dakota', 'Ross', 'DRoss@gmail.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1024 Walnut Blvd.') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Colma')) AND (zipcode = '94014')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'California')) ))),
('Shawn', 'Goel', 'SGoel@gmail.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1025 Holly Oak Drive') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Leeds')) AND (zipcode = 'LE18')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'England')) ))),
('Nicole', 'Diaz', 'NDiaz@gmail.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1025 R St.') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Kirkland')) AND (zipcode = '98033')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'Washington')) ))),
('Wyatt', 'Davis', 'WDavis@gmail.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1025 Yosemite Dr.') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Oregon City')) AND (zipcode = '97045')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'Oregon')) ))),
('Christy', 'Huang', 'CHuang@gmail.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1028 Green View Court') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Chula Vista')) AND (zipcode = '91910')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'California')) ))),
('Sydney', 'Evans', 'SEvans@gmail.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1028 Green View Court') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Oregon City')) AND (zipcode = '97045')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'Oregon')) ))),
('Katherine', 'Baker', 'KBaker@gmail.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1037 Hayes Court') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Stoke-on-Trent')) AND (zipcode = 'AS23')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'England')) ))),
('Edward', 'Wood', 'EWood@gmail.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1039 Adelaide St.') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'West Covina')) AND (zipcode = '91791')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'California')) ))),
('Johnny', 'Rai', 'JRai@gmail.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '104 Hilltop Dr.') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Springwood')) AND (zipcode = '2777')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'New South Wales')) ))),
('Emily', 'Moore', 'EMoore@gmail.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '104 Kaski Ln.') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Portland')) AND (zipcode = '97205')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'Oregon')) ))),
('Randy', 'Yang', 'RYang@gmail.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1040 Greenbush Drive') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Silverwater')) AND (zipcode = '2264')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'New South Wales')) ))),
('Roy', 'Ruiz', 'RRuiz@gmail.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1040 Northridge Road') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'London')) AND (zipcode = 'W1X3SE')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'England')) ))),
('Marshall', 'Sun', 'MSun@gmail.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1044 San Carlos') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Cincinnati')) AND (zipcode = '45202')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'Ohio')) ))),
('Gabriella', 'Perez', 'GPerez@gmail.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1045 Lolita Drive') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Torrance')) AND (zipcode = '90505')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'California')) ))),
('Erika', 'Gill', 'EGill@gmail.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1045 Lolita Drive') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Townsville')) AND (zipcode = '4810')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'Queensland')) ))),
('Kathryn', 'Shen', 'KShen@gmail.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1047 Las Quebradas Lane') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'North Sydney')) AND (zipcode = '2055')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'New South Wales')) ))),
('Sharon', 'Yuan', 'SYuan@gmail.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1048 Burwood Way') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Hervey Bay')) AND (zipcode = '4655')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'Queensland')) ))),
('Victoria', 'Lee', 'VLee@gmail.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1048 Las Quebradas Lane') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Walla Walla')) AND (zipcode = '99362')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'Washington')) ))),
('Brenda', 'Arun', 'BArun@gmail.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1048 Las Quebradas Lane') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Wollongong')) AND (zipcode = '2500')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'New South Wales')) ))),
('Alex', 'Scott', 'AScott@gmail.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '105 Clark Creek Lane') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Port Macquarie')) AND (zipcode = '2444')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'New South Wales')) ))),
('Yolanda', 'Luo', 'YLuo@gmail.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '105 Woodruff Ln.') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Bellingham')) AND (zipcode = '98225')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'Washington')) ))),
('Martin', 'Vance', 'MVance@gmail.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1050 Creed Ave') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'London')) AND (zipcode = 'W10 6BL')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'England')) ))),
('Jeremy', 'Roberts', 'JRoberts@yahoo.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '081, boulevard du Montparnasse') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Seattle')) AND (zipcode = '98104')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'Washington')) ))),
('Amanda', 'Ramirez', 'ARamirez@yahoo.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1 Smiling Tree Court') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Los Angeles')) AND (zipcode = '90012')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'California')) ))),
('Jada', 'Nelson', 'JNelson@yahoo.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '100, rue des Rosiers') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Everett')) AND (zipcode = '98201')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'Washington')) ))),
('Hunter', 'Wright', 'HWright@yahoo.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1002 N. Spoonwood Court') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Berkeley')) AND (zipcode = '94704')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'California')) ))),
('Sierra', 'Wright', 'SWright@yahoo.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1005 Fremont Street') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Colma')) AND (zipcode = '94014')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'California')) ))),
('Sarah', 'Simmons', 'SSimmons@yahoo.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1005 Valley Oak Plaza') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Langley')) AND (zipcode = 'V3A 4R2')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'British Columbia')) ))),
('Mandar', 'Samant', 'MSamant@yahoo.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1005 Valley Oak Plaza') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'London')) AND (zipcode = 'SW6 SBY')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'England')) ))),
('Isaiah', 'Rogers', 'IRogers@yahoo.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1007 Cardinet Dr.') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'El Cajon')) AND (zipcode = '92020')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'California')) ))),
('Ian', 'Foster', 'IFoster@yahoo.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1008 Lydia Lane') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Burbank')) AND (zipcode = '91502')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'California')) ))),
('Ben', 'Miller', 'BMiller@yahoo.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '101 Candy Rd.') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Redmond')) AND (zipcode = '98052')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'Washington')) ))),
('Sarah', 'Barnes', 'SBarnes@yahoo.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1011 Green St.') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Bellingham')) AND (zipcode = '98225')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'Washington')) ))),
('Casey', 'Martin', 'CMartin@yahoo.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1013 Buchanan Rd') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Port Macquarie')) AND (zipcode = '2444')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'New South Wales')) ))),
('Victoria', 'Murphy', 'VMurphy@yahoo.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1013 Buchanan Rd') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Yakima')) AND (zipcode = '98901')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'Washington')) ))),
('Sydney', 'Rogers', 'SRogers@yahoo.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1016 Park Avenue') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Burbank')) AND (zipcode = '91502')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'California')) ))),
('Marvin', 'Hernandez', 'MHernandez@yahoo.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1019 Book Road') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Rhodes')) AND (zipcode = '2138')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'New South Wales')) ))),
('Carlos', 'Carter', 'CCarter@yahoo.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1019 Buchanan Road') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Woodland Hills')) AND (zipcode = '91364')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'California')) ))),
('Rebekah', 'Garcia', 'RGarcia@yahoo.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1019 Candy Rd.') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Coffs Harbour')) AND (zipcode = '2450')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'New South Wales')) ))),
('Haley', 'Henderson', 'HHenderson@yahoo.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1019 Chance Drive') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Sedro Woolley')) AND (zipcode = '98284')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'Washington')) ))),
('Jacob', 'Taylor', 'JTaylor@yahoo.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1019 Kenwal Rd.') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Lake Oswego')) AND (zipcode = '97034')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'Oregon')) ))),
('Seth', 'Martin', 'SMartin@yahoo.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1019 Pennsylvania Blvd') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Marysville')) AND (zipcode = '98270')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'Washington')) ))),
('Larry', 'Suarez', 'LSuarez@yahoo.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '102 Vista Place') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Milton Keynes')) AND (zipcode = 'MK8 8DF')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'England')) ))),
('Garrett', 'Vargas', 'GVargas@yahoo.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '10203 Acorn Avenue') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Calgary')) AND (zipcode = 'T2P 2G8')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'Alberta')) ))),
('Abby', 'Martinez', 'AMartinez@yahoo.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1023 Hawkins Street') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Townsville')) AND (zipcode = '4810')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'Queensland')) ))),
('Justin', 'Thomas', 'JThomas@yahoo.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1023 Riveria Way') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Burbank')) AND (zipcode = '91502')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'California')) ))),
('Evelyn', 'Martinez', 'EMartinez@yahoo.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1023 Riviera Way') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Oxford')) AND (zipcode = 'OX1')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'England')) ))),
('Pamela', 'Chapman', 'PChapman@yahoo.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1025 Yosemite Dr.') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Townsville')) AND (zipcode = '4810')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'Queensland')) ))),
('Kayla', 'Griffin', 'KGriffin@yahoo.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1026 Mt. Wilson Pl.') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Lynnwood')) AND (zipcode = '98036')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'Washington')) ))),
('Jill', 'Navarro', 'JNavarro@yahoo.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1026 Mt. Wilson Pl.') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'South Melbourne')) AND (zipcode = '3205')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'Victoria')) ))),
('Nathan', 'Walker', 'NWalker@yahoo.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1028 Indigo Ct.') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Issaquah')) AND (zipcode = '98027')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'Washington')) ))),
('Tabitha', 'Moreno', 'TMoreno@yahoo.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1028 Indigo Ct.') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Warrnambool')) AND (zipcode = '3280')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'Victoria')) ))),
('Mason', 'Sanchez', 'MSanchez@yahoo.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1028 Royal Oak Rd.') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Burlingame')) AND (zipcode = '94010')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'California')) ))),
('Natasha', 'Navarro', 'NNavarro@yahoo.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1029 Birchwood Dr') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Burien')) AND (zipcode = '98168')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'Washington')) ))),
('Kevin', 'Russell', 'KRussell@yahoo.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1029 Birchwood Dr') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Olympia')) AND (zipcode = '98501')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'Washington')) ))),
('Katelyn', 'Rivera', 'KRivera@yahoo.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1030 Ambush Dr.') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Bury')) AND (zipcode = 'PE17')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'England')) ))),
('Alfredo', 'Ortega', 'AOrtega@yahoo.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1032 Buena Vista') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'North Ryde')) AND (zipcode = '2113')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'New South Wales')) ))),
('Andrea', 'Campbell', 'ACampbell@yahoo.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1032 Coats Road') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Stoke-on-Trent')) AND (zipcode = 'AS23')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'England')) ))),
('Jeremy', 'Peterson', 'JPeterson@yahoo.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1035 Arguello Blvd.') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'San Diego')) AND (zipcode = '92102')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'California')) ))),
('Arianna', 'Ramirez', 'ARamirez@yahoo.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1036 Mason Dr') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Port Orchard')) AND (zipcode = '98366')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'Washington')) ))),
('Mario', 'Sharma', 'MSharma@yahoo.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1039 Adelaide St.') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Port Macquarie')) AND (zipcode = '2444')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'New South Wales')) ))),
('Adam', 'Collins', 'ACollins@yahoo.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '104 Hilltop Dr.') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Concord')) AND (zipcode = '94519')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'California')) ))),
('Taylor', 'Martin', 'TMartin@yahoo.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1040 Greenbush Drive') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Newton')) AND (zipcode = 'V2L3W8')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'British Columbia')) ))),
('Gabriel', 'Collins', 'GCollins@yahoo.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1040 Northridge Road') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Woodland Hills')) AND (zipcode = '91364')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'California')) ))),
('Randall', 'Martin', 'RMartin@yahoo.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1042 Hooftrail Way') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Newcastle')) AND (zipcode = '2300')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'New South Wales')) ))),
('Samantha', 'Jenkins', 'SJenkins@yahoo.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1046 Cloverleaf Circle') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Shawnee')) AND (zipcode = 'V8Z 4N5')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'British Columbia')) ))),
('Justin', 'Simmons', 'JSimmons@yahoo.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1046 San Carlos Avenue') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Colma')) AND (zipcode = '94014')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'California')) ))),
('Ethan', 'Winston', 'EWinston@yahoo.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1047 Las Quebradas Lane') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Oak Bay')) AND (zipcode = 'V8P')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'British Columbia')) ))),
('Hunter', 'Roberts', 'HRoberts@yahoo.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1048 Burwood Way') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Haney')) AND (zipcode = 'V2W 1W2')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'British Columbia')) ))),
('Nathaniel', 'Murphy', 'NMurphy@yahoo.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '105 Woodruff Ln.') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Oakland')) AND (zipcode = '94611')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'California')) ))),
('Charles', 'Wilson', 'CWilson@yahoo.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1050 Creed Ave') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Lebanon')) AND (zipcode = '97355')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'Oregon')) ))),
('Carrie', 'Alvarez', 'CAlvarez@yahoo.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1050 Greenhills Circle') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Lane Cove')) AND (zipcode = '1597')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'New South Wales')) ))),
('Paige', 'Alexander', 'PAlexander@yahoo.com', (SELECT addressID FROM Addresses WHERE((streetAddress = '1050 Greenhills Circle') AND (cityID = (SELECT cityID FROM Cities WHERE cityName= 'Langley')) AND (zipcode = 'V3A 4R2')  AND (stateID = (SELECT stateID FROM States WHERE stateName= 'British Columbia')) )))



