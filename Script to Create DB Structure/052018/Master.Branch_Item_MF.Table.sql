USE [DGMU]
GO
/****** Object:  Table [Master].[Branch_Item_MF]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Master].[Branch_Item_MF](
	[BranchItemCodeID] [int] IDENTITY(1,1) NOT NULL,
	[Branch_ItemCode] [nvarchar](6) NOT NULL,
	[Branch_ItemName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Item_Group_RF] PRIMARY KEY CLUSTERED 
(
	[BranchItemCodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
