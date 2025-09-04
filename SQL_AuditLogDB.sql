USE AuditLogDB
GO

CREATE TABLE [dbo].[AuditLog](
	[Timestamp] [DATETIME2] NOT NULL,
	[UserDID] [NCHAR] NOT NULL,
	[ServiceName] [NCHAR] NOT NULL,
	[ActionType] [NCHAR] NOT NULL
)
GO