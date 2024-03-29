--Ben Steves
--IRS Database-with information for 1094 and 1095 forms
--CS 342
--11-4-21


USE [master]
GO
/****** Object:  Database [IRS_Forms]    Script Date: 11/4/2021 8:36:50 PM ******/
CREATE DATABASE [IRS_Forms]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IRS_Forms', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\IRS_Forms.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'IRS_Forms_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\IRS_Forms_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [IRS_Forms] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IRS_Forms].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IRS_Forms] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IRS_Forms] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IRS_Forms] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IRS_Forms] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IRS_Forms] SET ARITHABORT OFF 
GO
ALTER DATABASE [IRS_Forms] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [IRS_Forms] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IRS_Forms] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IRS_Forms] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IRS_Forms] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IRS_Forms] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IRS_Forms] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IRS_Forms] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IRS_Forms] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IRS_Forms] SET  DISABLE_BROKER 
GO
ALTER DATABASE [IRS_Forms] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IRS_Forms] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IRS_Forms] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IRS_Forms] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IRS_Forms] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IRS_Forms] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IRS_Forms] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IRS_Forms] SET RECOVERY FULL 
GO
ALTER DATABASE [IRS_Forms] SET  MULTI_USER 
GO
ALTER DATABASE [IRS_Forms] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IRS_Forms] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IRS_Forms] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IRS_Forms] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [IRS_Forms] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [IRS_Forms] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'IRS_Forms', N'ON'
GO
ALTER DATABASE [IRS_Forms] SET QUERY_STORE = OFF
GO
USE [IRS_Forms]
GO
/****** Object:  Table [dbo].[Coverage]    Script Date: 11/4/2021 8:36:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coverage](
	[CovgCode] [nchar](2) NOT NULL,
	[Description] [varchar](200) NULL,
 CONSTRAINT [PK_Coverage] PRIMARY KEY CLUSTERED 
(
	[CovgCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 11/4/2021 8:36:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[SSN] [nchar](11) NOT NULL,
	[EIN] [nchar](10) NOT NULL,
	[FirstName] [varchar](20) NOT NULL,
	[LastName] [varchar](35) NOT NULL,
	[StreetAddress] [varchar](100) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[State] [nchar](2) NOT NULL,
	[ZIP] [nchar](5) NOT NULL,
	[Age] [int] NOT NULL,
	[PlanStartMonth] [int] NOT NULL,
	[Contributon] [money] NOT NULL,
	[CovgCode] [nchar](2) NOT NULL,
	[ReliefCode] [nchar](2) NOT NULL,
 CONSTRAINT [PK_Employee_1] PRIMARY KEY CLUSTERED 
(
	[SSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employer]    Script Date: 11/4/2021 8:36:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employer](
	[EIN] [nchar](10) NOT NULL,
	[FirstName] [varchar](20) NOT NULL,
	[LastName] [varchar](35) NOT NULL,
	[StreetAddress] [varchar](100) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[State] [nchar](2) NOT NULL,
	[ZIP] [nchar](5) NOT NULL,
	[PhoneNumber] [nchar](12) NULL,
	[EntityID] [int] NOT NULL,
	[AggGroup] [bit] NOT NULL,
 CONSTRAINT [PK_Employer] PRIMARY KEY CLUSTERED 
(
	[EIN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployerForms]    Script Date: 11/4/2021 8:36:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployerForms](
	[EIN] [nchar](10) NOT NULL,
	[TransmittedForms] [int] NULL,
	[TotalForms] [int] NULL,
	[AuthTransmittal] [bit] NULL,
 CONSTRAINT [PK_EmployerForms_1] PRIMARY KEY CLUSTERED 
(
	[EIN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GovtEntity]    Script Date: 11/4/2021 8:36:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GovtEntity](
	[EntityID] [int] IDENTITY(1,1) NOT NULL,
	[DGE_EIN] [nchar](10) NOT NULL,
	[FirstName] [varchar](20) NOT NULL,
	[LastName] [varchar](35) NOT NULL,
	[StreetAddress] [varchar](100) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[State] [nvarchar](2) NOT NULL,
	[ZIP] [nchar](5) NOT NULL,
	[PhoneNumber] [nchar](12) NULL,
 CONSTRAINT [PK_GovtEntity_1] PRIMARY KEY CLUSTERED 
(
	[EntityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Relief]    Script Date: 11/4/2021 8:36:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Relief](
	[ReliefCode] [nchar](2) NOT NULL,
	[Description] [varchar](200) NULL,
 CONSTRAINT [PK_Relief] PRIMARY KEY CLUSTERED 
(
	[ReliefCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Employer]    Script Date: 11/4/2021 8:36:50 PM ******/
CREATE NONCLUSTERED INDEX [IX_Employer] ON [dbo].[Employer]
(
	[EIN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employee_CovgCode]  DEFAULT ('1H') FOR [CovgCode]
GO
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employee_ReliefCode]  DEFAULT ('2A') FOR [ReliefCode]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Covg] FOREIGN KEY([CovgCode])
REFERENCES [dbo].[Coverage] ([CovgCode])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Covg]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_EIN] FOREIGN KEY([EIN])
REFERENCES [dbo].[Employer] ([EIN])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_EIN]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Relief] FOREIGN KEY([ReliefCode])
REFERENCES [dbo].[Relief] ([ReliefCode])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Relief]
GO
ALTER TABLE [dbo].[Employer]  WITH CHECK ADD  CONSTRAINT [FK_entity] FOREIGN KEY([EntityID])
REFERENCES [dbo].[GovtEntity] ([EntityID])
GO
ALTER TABLE [dbo].[Employer] CHECK CONSTRAINT [FK_entity]
GO
ALTER TABLE [dbo].[Coverage]  WITH CHECK ADD  CONSTRAINT [CK_Coverage] CHECK  (([CovgCode]='1S' OR [CovgCode]='1R' OR [CovgCode]='1Q' OR [CovgCode]='1P' OR [CovgCode]='1O' OR [CovgCode]='1N' OR [CovgCode]='1M' OR [CovgCode]='1L' OR [CovgCode]='1K' OR [CovgCode]='1J' OR [CovgCode]='1I' OR [CovgCode]='1H' OR [CovgCode]='1G' OR [CovgCode]='1F' OR [CovgCode]='1E' OR [CovgCode]='1D' OR [CovgCode]='1C' OR [CovgCode]='1B' OR [CovgCode]='1A'))
GO
ALTER TABLE [dbo].[Coverage] CHECK CONSTRAINT [CK_Coverage]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [covgcodes] CHECK  (([CovgCode]='1S' OR [CovgCode]='1R' OR [CovgCode]='1Q' OR [CovgCode]='1P' OR [CovgCode]='1O' OR [CovgCode]='1N' OR [CovgCode]='1M' OR [CovgCode]='1L' OR [CovgCode]='1K' OR [CovgCode]='1J' OR [CovgCode]='1I' OR [CovgCode]='1H' OR [CovgCode]='1G' OR [CovgCode]='1F' OR [CovgCode]='1E' OR [CovgCode]='1D' OR [CovgCode]='1C' OR [CovgCode]='1B' OR [CovgCode]='1A'))
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [covgcodes]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [reliefcode] CHECK  (([ReliefCode]='2H' OR [ReliefCode]='2G' OR [ReliefCode]='2F' OR [ReliefCode]='2E' OR [ReliefCode]='2D' OR [ReliefCode]='2C' OR [ReliefCode]='2B' OR [ReliefCode]='2A'))
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [reliefcode]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [startmonth] CHECK  (([PlanStartMonth]<(13)))
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [startmonth]
GO
ALTER TABLE [dbo].[Relief]  WITH CHECK ADD  CONSTRAINT [CK_Relief] CHECK  (([ReliefCode]='2H' OR [ReliefCode]='2G' OR [ReliefCode]='2F' OR [ReliefCode]='2E' OR [ReliefCode]='2D' OR [ReliefCode]='2C' OR [ReliefCode]='2B' OR [ReliefCode]='2A'))
GO
ALTER TABLE [dbo].[Relief] CHECK CONSTRAINT [CK_Relief]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Refers back to coverage code from employee. Allows list of unique codes. Same constraints are applied. ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Coverage', @level2type=N'COLUMN',@level2name=N'CovgCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Allows brief descrption of what each code means' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Coverage', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary identification for employee, 11 chars long fixed' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee', @level2type=N'COLUMN',@level2name=N'SSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Employer linked to employee' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee', @level2type=N'COLUMN',@level2name=N'EIN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key- 10 digit number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employer', @level2type=N'COLUMN',@level2name=N'EIN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to GovtEntity table, which is an identity.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employer', @level2type=N'COLUMN',@level2name=N'EntityID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Yes or no on form, so bit works here.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employer', @level2type=N'COLUMN',@level2name=N'AggGroup'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Number of submitted forms' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmployerForms', @level2type=N'COLUMN',@level2name=N'TransmittedForms'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total number of forms to be submitted' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmployerForms', @level2type=N'COLUMN',@level2name=N'TotalForms'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Yes or no' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmployerForms', @level2type=N'COLUMN',@level2name=N'AuthTransmittal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key to identify the GovtEntity an employer is linked with. Defined as an identity' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GovtEntity', @level2type=N'COLUMN',@level2name=N'EntityID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The EIN of the government entity' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GovtEntity', @level2type=N'COLUMN',@level2name=N'DGE_EIN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Refers back to relief code from employee. Allows list of unique codes. Same constraints are applied. ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Relief', @level2type=N'COLUMN',@level2name=N'ReliefCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Allows brief descrption of what each code means' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Relief', @level2type=N'COLUMN',@level2name=N'Description'
GO
USE [master]
GO
ALTER DATABASE [IRS_Forms] SET  READ_WRITE 
GO
