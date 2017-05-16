-- =============================================
-- Author:		Eric Hernandez
-- Create date: 5/12/17
-- =============================================
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

/*Attendants Table*//*Organizers, presenters, volunteers, students are all attendants*/
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

/*EventAttendantRoles Table*//*Lookup table to check what roles a person has for an event*/
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

/*EventVendorTables Table*//*Look up table that determines which tables are associated with which vendor at what event.*/
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

/*Grades Table*//*Overall grade for a presentation accumulated by students averages*/
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

/*Levels Table*//*There are only 4 levels: beginner. intermediate, advance, and non techical*/
CREATE TABLE [dbo].[Levels](
	[levelID] [int] IDENTITY(1,1) NOT NULL,
	[levelDifficulty] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Levels] PRIMARY KEY CLUSTERED 
(
	[levelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/*Presentations Table*//*Treated like as the class since the values overlap*/
CREATE TABLE [dbo].[Presentations](
	[presentationID] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[description] [nvarchar](255) NULL,/*This is null because of the way stored procedured will be executed*/
	[levelID] [int] NULL,/*This is null because of the way stored procedured will be executed*/
	[presenterID] [int] NOT NULL,
	[eventID] [int] NULL,/*This is the proposed event where the presentation would occur. A presentation is not finalized until it is in the schedules table*/
	[trackID] [int] NULL,/*This is the proposed track that the presentation would most likely be a part of*/
 CONSTRAINT [PK_Presentations] PRIMARY KEY CLUSTERED 
(
	[presentationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/*Presenters Table*//*Explicit table for which attendants are a presenter. This table is associated with the presentations os only presenters can present*/
CREATE TABLE [dbo].[Presenters](
	[presenterID] [int] IDENTITY(1,1) NOT NULL,
	[attendantID] [int] NOT NULL,
 CONSTRAINT [PK_Presenters] PRIMARY KEY CLUSTERED 
(
	[presenterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/*Regions Table*//*Regions inclde: us/canada, latin america, asia...*/
CREATE TABLE [dbo].[Regions](
	[regionID] [int] IDENTITY(1,1) NOT NULL,
	[regionName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Regions] PRIMARY KEY CLUSTERED 
(
	[regionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/*Roles Table*//*The only roles are: organizer, volunteer, student...*/
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

/*Schedules Table*//*This is where proposed presentations will be finilized with a room and start and end time*/
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

/*Tables Table*//*For table vendors can use at an event. There should only be 10 entried in this table*/
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

/*VendorRankings Table*//*Sperates vendor categories ie bronze, silver, gold, platimun*/
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

/*Venues Table*//*used to associate an event with a location*/
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



