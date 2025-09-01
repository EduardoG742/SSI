-- HEAD
-- Crear la abse de datos Universidad
CREATE DATABASE Universidad
GO

-- Seleccionar la base de datos Universidad
USE [Universidad]
GO

/****** Tablas ******/
CREATE TABLE [dbo].[Alumno](
	[CodigoAlumno] [nchar](10) NOT NULL,
	[EscuelaProfesional] [nchar](10) NULL,
	[Matricula] [nchar](10) NULL,
 CONSTRAINT [PK_Alumno] PRIMARY KEY CLUSTERED ([CodigoAlumno] ASC)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Celular](
	[Celular] [nchar](9) NOT NULL,
	[Operador] [nvarchar](10) NULL,
 CONSTRAINT [PK_Celular] PRIMARY KEY CLUSTERED ([Celular] ASC)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Contactos](
	[CodigoContacto] [nchar](10) NOT NULL,
	[TipoContacto] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Contactos] PRIMARY KEY CLUSTERED ([CodigoContacto] ASC)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Docente](
	[CodigoDocente] [nchar](10) NOT NULL,
	[EscuelaProfesional] [nchar](10) NULL,
 CONSTRAINT [PK_Docente] PRIMARY KEY CLUSTERED ([CodigoDocente] ASC)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[EscuelaProfesional](
	[CodigoEscuela] [nchar](10) NOT NULL,
	[NombreEscuela] [nvarchar](100) NULL,
	[Facultad] [nchar](10) NULL,
 CONSTRAINT [PK_EscuelaProfesional] PRIMARY KEY CLUSTERED ([CodigoEscuela] ASC)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Facultad](
	[CodigoFacultad] [nchar](10) NOT NULL,
	[NombreFacultad] [nvarchar](100) NULL,
 CONSTRAINT [PK_Facultad] PRIMARY KEY CLUSTERED ([CodigoFacultad] ASC)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Matriculas](
	[CodMatricula] [nchar](10) NOT NULL,
	[TipoMatricula] [nchar](10) NULL,
	[ModalidadEstudio] [nchar](10) NULL,
	[EstadoMatricula] [nchar](10) NULL,
 CONSTRAINT [PK_Matriculas] PRIMARY KEY CLUSTERED ([CodMatricula] ASC)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ModalidadEstudio](
	[ID] [nchar](10) NOT NULL,
	[Nombre] [nvarchar](100) NULL,
	[Descripcion] [nvarchar](100) NULL,
	[Abreviatura] [nvarchar](10) NULL,
	[PlanAcademico] [nvarchar](10) NULL,
	[IdPlanEstudios] [nchar](10) NOT NULL,
 CONSTRAINT [PK_ModalidadEstudio] PRIMARY KEY CLUSTERED ([ID] ASC)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Persona](
	[CodPersona] [nchar](8) NOT NULL,
	[CodAlumno] [nchar](10) NULL,
	[CodDocente] [nchar](10) NULL,
	[CodPersonalAdministrativo] [nchar](10) NULL,
	[CodContacto] [nchar](10) NULL,
	[Nombres] [nvarchar](100) NOT NULL,
	[Apellidos] [nvarchar](100) NOT NULL,
	[Celular] [nchar](9) NULL,
	[Correo] [nvarchar](75) NOT NULL,
 CONSTRAINT [PK_Persona] PRIMARY KEY CLUSTERED ([CodPersona] ASC)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PlanEstudios](
	[IdPlanEstudios] [nchar](10) NOT NULL,
 CONSTRAINT [PK_PlanEstudios] PRIMARY KEY CLUSTERED ([IdPlanEstudios] ASC)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TipoContacto](
	[TipoContacto] [nchar](10) NOT NULL,
	[NombreTipoContacto] [nvarchar](20) NULL,
 CONSTRAINT [PK_TipoContacto] PRIMARY KEY CLUSTERED ([TipoContacto] ASC)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TipoMatricula](
	[TipoMatricula] [nchar](10) NOT NULL,
	[NombreTipoMatricula] [nvarchar](30) NULL,
 CONSTRAINT [PK_TipoMatricula] PRIMARY KEY CLUSTERED ([TipoMatricula] ASC)
) ON [PRIMARY]
GO

/****** Relaciones (FKs) ******/
ALTER TABLE [dbo].[Alumno] ADD CONSTRAINT [FK_Alumno_EscuelaProfesional] FOREIGN KEY([EscuelaProfesional])
REFERENCES [dbo].[EscuelaProfesional] ([CodigoEscuela])
GO

ALTER TABLE [dbo].[Alumno] ADD CONSTRAINT [FK_Alumno_Matriculas] FOREIGN KEY([Matricula])
REFERENCES [dbo].[Matriculas] ([CodMatricula])
GO

ALTER TABLE [dbo].[Contactos] ADD CONSTRAINT [FK_Contactos_TipoContacto] FOREIGN KEY([TipoContacto])
REFERENCES [dbo].[TipoContacto] ([TipoContacto])
GO

ALTER TABLE [dbo].[Docente] ADD CONSTRAINT [FK_Docente_EscuelaProfesional] FOREIGN KEY([EscuelaProfesional])
REFERENCES [dbo].[EscuelaProfesional] ([CodigoEscuela])
GO

ALTER TABLE [dbo].[EscuelaProfesional] ADD CONSTRAINT [FK_EscuelaProfesional_Facultad] FOREIGN KEY([Facultad])
REFERENCES [dbo].[Facultad] ([CodigoFacultad])
GO

ALTER TABLE [dbo].[Matriculas] ADD CONSTRAINT [FK_Matriculas_ModalidadEstudio] FOREIGN KEY([ModalidadEstudio])
REFERENCES [dbo].[ModalidadEstudio] ([ID])
GO

ALTER TABLE [dbo].[Matriculas] ADD CONSTRAINT [FK_Matriculas_TipoMatricula] FOREIGN KEY([TipoMatricula])
REFERENCES [dbo].[TipoMatricula] ([TipoMatricula])
GO

ALTER TABLE [dbo].[ModalidadEstudio] ADD CONSTRAINT [FK_ModalidadEstudio_PlanEstudios] FOREIGN KEY([ID])
REFERENCES [dbo].[PlanEstudios] ([IdPlanEstudios])
GO

ALTER TABLE [dbo].[Persona] ADD CONSTRAINT [FK_Persona_Alumno] FOREIGN KEY([CodAlumno])
REFERENCES [dbo].[Alumno] ([CodigoAlumno])
GO

ALTER TABLE [dbo].[Persona] ADD CONSTRAINT [FK_Persona_Celular] FOREIGN KEY([Celular])
REFERENCES [dbo].[Celular] ([Celular])
GO

ALTER TABLE [dbo].[Persona] ADD CONSTRAINT [FK_Persona_Contactos] FOREIGN KEY([CodContacto])
REFERENCES [dbo].[Contactos] ([CodigoContacto])
GO

ALTER TABLE [dbo].[Persona] ADD CONSTRAINT [FK_Persona_Docente] FOREIGN KEY([CodDocente])
REFERENCES [dbo].[Docente] ([CodigoDocente])
GO



-- ==============================================
-- Seleccionar la base de datos Universidad
USE [Universidad]
GO
-- 393bdf67ef375cd39513e0c2641684ec79858202
