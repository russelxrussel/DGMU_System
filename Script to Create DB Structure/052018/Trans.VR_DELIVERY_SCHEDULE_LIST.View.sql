USE [DGMU]
GO
/****** Object:  View [Trans].[VR_DELIVERY_SCHEDULE_LIST]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Trans].[VR_DELIVERY_SCHEDULE_LIST]
AS
SELECT        Trans.Delivery_Schedule_TF.DeliveryDate, Master.Branch_Data.BranchName, Utility.Location_Area_RF.LAName, Master.Item_Data.ItemName, Trans.Delivery_TF.PartnerQty, Trans.Delivery_TF.PartnerUom, 
                         Trans.Delivery_TF.InvQty, Trans.Delivery_Schedule_TF.DRNum
FROM            Master.Branch_Data INNER JOIN
                         Trans.Delivery_Schedule_TF ON Master.Branch_Data.BranchCode = Trans.Delivery_Schedule_TF.BranchCode INNER JOIN
                         Utility.Location_Area_RF ON Master.Branch_Data.LACode = Utility.Location_Area_RF.LACode AND Master.Branch_Data.LACode = Utility.Location_Area_RF.LACode INNER JOIN
                         Trans.Delivery_TF ON Trans.Delivery_Schedule_TF.DRNum = Trans.Delivery_TF.DRNum INNER JOIN
                         Master.Item_Data ON Trans.Delivery_TF.ItemCode = Master.Item_Data.ItemCode AND Trans.Delivery_TF.ItemCode = Master.Item_Data.ItemCode


GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[49] 4[4] 2[18] 3) )"
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
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Branch_Data (Master)"
            Begin Extent = 
               Top = 0
               Left = 259
               Bottom = 191
               Right = 451
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Delivery_TF (Trans)"
            Begin Extent = 
               Top = 197
               Left = 271
               Bottom = 361
               Right = 441
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "Location_Area_RF (Utility)"
            Begin Extent = 
               Top = 4
               Left = 729
               Bottom = 173
               Right = 910
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Item_Data (Master)"
            Begin Extent = 
               Top = 101
               Left = 592
               Bottom = 262
               Right = 794
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Delivery_Schedule_TF (Trans)"
            Begin Extent = 
               Top = 12
               Left = 18
               Bottom = 253
               Right = 188
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
      Begin ColumnWidths = 9
         Width = 284
         Width = 2055
         Width = 1500
         Width = 1500
         Width = 2355
         Width = 1125
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begi' , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_DELIVERY_SCHEDULE_LIST'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'n ColumnWidths = 11
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
' , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_DELIVERY_SCHEDULE_LIST'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_DELIVERY_SCHEDULE_LIST'
GO
