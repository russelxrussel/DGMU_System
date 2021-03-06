USE [DGMU]
GO
/****** Object:  View [Trans].[VR_PARTNER_PO]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Trans].[VR_PARTNER_PO]
AS
SELECT        Master.Partners_Data.PartnerCode, Master.Partners_Data.PartnerName, Trans.Partner_PO_Hdr.PONum, Master.Branch_Data.BranchName, Master.Item_Data.ItemName, Trans.Partner_PO_Rows.InvQty, 
                         Trans.Partner_PO_Rows.PartnerQty, Trans.Partner_PO_Rows.UnitPrice, Trans.Partner_PO_Hdr.RequestDate, Trans.Partner_PO_Hdr.Remarks, Master.Partners_Data.P_Address, 
                         Master.Partners_Data.P_ContactNumber, Master.Partners_Data.P_ContactPerson, Trans.Partner_PO_Rows.PartnerUom, Trans.Partner_PO_Rows.TotalPrice
FROM            Master.Branch_Data INNER JOIN
                         Trans.Partner_PO_Rows INNER JOIN
                         Trans.Partner_PO_Hdr ON Trans.Partner_PO_Rows.PONum = Trans.Partner_PO_Hdr.PONum AND Trans.Partner_PO_Rows.PONum = Trans.Partner_PO_Hdr.PONum INNER JOIN
                         Master.Partners_Data ON Trans.Partner_PO_Hdr.PartnerCode = Master.Partners_Data.PartnerCode ON Master.Branch_Data.BranchCode = Trans.Partner_PO_Rows.BranchCode INNER JOIN
                         Master.Item_Data ON Trans.Partner_PO_Rows.ItemCode = Master.Item_Data.ItemCode


GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[47] 4[12] 2[15] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = -150
      End
      Begin Tables = 
         Begin Table = "Branch_Data (Master)"
            Begin Extent = 
               Top = 271
               Left = 742
               Bottom = 441
               Right = 995
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Item_Data (Master)"
            Begin Extent = 
               Top = 0
               Left = 787
               Bottom = 225
               Right = 989
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Partners_Data (Master)"
            Begin Extent = 
               Top = 12
               Left = 4
               Bottom = 208
               Right = 191
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Partner_PO_Hdr (Trans)"
            Begin Extent = 
               Top = 7
               Left = 220
               Bottom = 222
               Right = 451
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Partner_PO_Rows (Trans)"
            Begin Extent = 
               Top = 18
               Left = 510
               Bottom = 281
               Right = 684
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 16
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1650
         Width = 1800
         Width = 1815
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Wid' , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_PARTNER_PO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'th = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_PARTNER_PO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_PARTNER_PO'
GO
