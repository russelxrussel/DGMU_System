USE [DGMU]
GO
/****** Object:  Table [Trans].[Partner_PO_Rows]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Trans].[Partner_PO_Rows](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[PONum] [nvarchar](10) NULL,
	[BranchCode] [nvarchar](6) NULL,
	[ItemCode] [nvarchar](10) NULL,
	[InvQty] [float] NULL,
	[PartnerQty] [float] NULL,
	[PartnerUom] [nvarchar](10) NULL,
	[UnitPrice] [float] NULL,
	[TotalPrice] [float] NULL,
	[RemainingQty] [float] NULL,
	[RowStatus] [nvarchar](1) NULL,
	[DU] [datetime] NOT NULL,
	[UserCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_PPO_Rows] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [Trans].[Partner_PO_Rows] ADD  CONSTRAINT [DF_Partner_PO_Rows_TotalPrice]  DEFAULT ((0)) FOR [TotalPrice]
GO
ALTER TABLE [Trans].[Partner_PO_Rows] ADD  CONSTRAINT [DF_PPO_Rows_RowStatus]  DEFAULT ('O') FOR [RowStatus]
GO
ALTER TABLE [Trans].[Partner_PO_Rows] ADD  CONSTRAINT [DF_PPO_Rows_DU]  DEFAULT (getdate()) FOR [DU]
GO
ALTER TABLE [Trans].[Partner_PO_Rows]  WITH CHECK ADD  CONSTRAINT [FK_PPO_Rows_PO_Hdr] FOREIGN KEY([PONum])
REFERENCES [Trans].[Partner_PO_Hdr] ([PONum])
GO
ALTER TABLE [Trans].[Partner_PO_Rows] CHECK CONSTRAINT [FK_PPO_Rows_PO_Hdr]
GO
