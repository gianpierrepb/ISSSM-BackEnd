USE [master]
GO
/****** Object:  Database [ISSMDB]    Script Date: 30/09/2018 21:27:35 ******/
CREATE DATABASE [ISSMDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ISSMDB', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.YESENIA\MSSQL\DATA\ISSMDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ISSMDB_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.YESENIA\MSSQL\DATA\ISSMDB_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ISSMDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ISSMDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ISSMDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ISSMDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ISSMDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ISSMDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ISSMDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ISSMDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ISSMDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ISSMDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ISSMDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ISSMDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ISSMDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ISSMDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ISSMDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ISSMDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ISSMDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ISSMDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ISSMDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ISSMDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ISSMDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ISSMDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ISSMDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ISSMDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ISSMDB] SET RECOVERY FULL 
GO
ALTER DATABASE [ISSMDB] SET  MULTI_USER 
GO
ALTER DATABASE [ISSMDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ISSMDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ISSMDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ISSMDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ISSMDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ISSMDB', N'ON'
GO
USE [ISSMDB]
GO
/****** Object:  Table [dbo].[Tarea]    Script Date: 30/09/2018 21:27:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tarea](
	[TareaID] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioID] [int] NULL,
	[Detalle] [varchar](255) NULL,
	[Estado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TareaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 30/09/2018 21:27:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[UsuarioID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [varchar](255) NULL,
	[FirstName] [varchar](255) NULL,
	[Genero] [varchar](255) NULL,
	[Correo] [varchar](255) NULL,
	[Distrito] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[UsuarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Tarea] ON 

INSERT [dbo].[Tarea] ([TareaID], [UsuarioID], [Detalle], [Estado]) VALUES (1, 1, N'Comprar huevos', 0)
INSERT [dbo].[Tarea] ([TareaID], [UsuarioID], [Detalle], [Estado]) VALUES (2, 1, N'Enviar correo a Fernando', 0)
INSERT [dbo].[Tarea] ([TareaID], [UsuarioID], [Detalle], [Estado]) VALUES (3, 1, N'Recoger ropa de la lavanderia', 0)
INSERT [dbo].[Tarea] ([TareaID], [UsuarioID], [Detalle], [Estado]) VALUES (4, 1, N'Pagar recibo de luz', 0)
INSERT [dbo].[Tarea] ([TareaID], [UsuarioID], [Detalle], [Estado]) VALUES (6, 2, N'Enviar correo a Fernando', 0)
INSERT [dbo].[Tarea] ([TareaID], [UsuarioID], [Detalle], [Estado]) VALUES (7, 2, N'Recoger ropa de la lavanderia', 0)
INSERT [dbo].[Tarea] ([TareaID], [UsuarioID], [Detalle], [Estado]) VALUES (8, 2, N'Pagar recibo de luz', 0)
INSERT [dbo].[Tarea] ([TareaID], [UsuarioID], [Detalle], [Estado]) VALUES (9, 3, N'Comprar articulos de aseo', 0)
SET IDENTITY_INSERT [dbo].[Tarea] OFF
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([UsuarioID], [LastName], [FirstName], [Genero], [Correo], [Distrito]) VALUES (1, N'Jimenez Peres', N'Juan', N'Masculino', N'jjimenez@correo.com', N'La Molina')
INSERT [dbo].[Usuario] ([UsuarioID], [LastName], [FirstName], [Genero], [Correo], [Distrito]) VALUES (2, N'Peralta Juarez', N'Elena', N'Femenino', N'eperalta@correo.com', N'Miraflores')
INSERT [dbo].[Usuario] ([UsuarioID], [LastName], [FirstName], [Genero], [Correo], [Distrito]) VALUES (3, N'Rojas Veredic', N'Josue', N'Masculino', N'jrojas@correo.com', N'Lima')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
ALTER TABLE [dbo].[Tarea]  WITH CHECK ADD FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[Usuario] ([UsuarioID])
GO
USE [master]
GO
ALTER DATABASE [ISSMDB] SET  READ_WRITE 
GO
