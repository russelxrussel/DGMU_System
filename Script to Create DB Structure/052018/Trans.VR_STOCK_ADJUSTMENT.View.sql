USE [DGMU]
GO
/****** Object:  View [Trans].[VR_STOCK_ADJUSTMENT]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Trans].[VR_STOCK_ADJUSTMENT]
AS
SELECT        Trans.Adjustment_TF.ASNum, Trans.Adjustment_TF.AdjCode, Utility.Adjustment_RF.Description, Master.Item_Data.ItemName, Trans.Adjustment_TF.Quantity, Trans.Adjustment_TF.AdjDate, 
                         Trans.Adjustment_TF.Remarks, Trans.Adjustment_TF.Reference, Master.Branch_Data.BranchName, Master.Supplier_Data.SupplierCode, Master.Supplier_Data.SupplierName
FROM            Utility.Adjustment_RF INNER JOIN
                         Trans.Adjustment_TF ON Utility.Adjustment_RF.AdjCode = Trans.Adjustment_TF.AdjCode INNER JOIN
                         Master.Item_Data ON Trans.Adjustment_TF.ItemCode = Master.Item_Data.ItemCode LEFT OUTER JOIN
                         Master.Supplier_Data ON Trans.Adjustment_TF.Reference = Master.Supplier_Data.SupplierCode LEFT OUTER JOIN
                         Master.Branch_Data ON Trans.Adjustment_TF.Reference = Master.Branch_Data.BranchCode


GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[45] 4[18] 2[13] 3) )"
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
         Top = -192
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Adjustment_RF (Utility)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 160
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Item_Data (Master)"
            Begin Extent = 
               Top = 11
               Left = 530
               Bottom = 141
               Right = 732
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Adjustment_TF (Trans)"
            Begin Extent = 
               Top = 24
               Left = 270
               Bottom = 221
               Right = 468
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Branch_Data (Master)"
            Begin Extent = 
               Top = 149
               Left = 596
               Bottom = 337
               Right = 788
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Supplier_Data (Master)"
            Begin Extent = 
               Top = 234
               Left = 586
               Bottom = 364
               Right = 772
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
      Begin ColumnWidths = 12
         Width = 284
         Width = 1830
         Width = 1500
         Width = 2430
         Width = 1950
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1605
         Width = 1500
         Width = 1500
         W' , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_STOCK_ADJUSTMENT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'idth = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_STOCK_ADJUSTMENT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_STOCK_ADJUSTMENT'
GO
