USE [DGMU]
GO
/****** Object:  View [Trans].[VR_ITEMS_LIST]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Trans].[VR_ITEMS_LIST]
AS
SELECT        TOP (100) PERCENT Master.Item_Data.ItemCode, Master.Item_Data.ItemName, Trans.Inventory.TransactionNum, Trans.Inventory.Quantity, Trans.Inventory.DU, Trans.Inventory.IsMoveIn, Master.Inventory_Data.RunningStock, 
                         Master.Inventory_Data.InvUomCode, Trans.Adjustment_TF.ASNum, Trans.Adjustment_TF.AdjCode, Utility.Adjustment_RF.Description, Master.Branch_Data.BranchName, Master.Supplier_Data.SupplierName
FROM            Trans.Supplier_Voucher_Hdr_TF INNER JOIN
                         Master.Supplier_Data ON Trans.Supplier_Voucher_Hdr_TF.SupplierCode = Master.Supplier_Data.SupplierCode RIGHT OUTER JOIN
                         Master.Item_Data INNER JOIN
                         Trans.Inventory ON Master.Item_Data.ItemCode = Trans.Inventory.ItemCode INNER JOIN
                         Master.Inventory_Data ON Master.Item_Data.ItemCode = Master.Inventory_Data.ItemCode ON Trans.Supplier_Voucher_Hdr_TF.VoucherNum = Trans.Inventory.TransactionNum LEFT OUTER JOIN
                         Trans.Delivery_Reciept_TF INNER JOIN
                         Master.Branch_Data ON Trans.Delivery_Reciept_TF.BranchCode = Master.Branch_Data.BranchCode ON Trans.Inventory.TransactionNum = Trans.Delivery_Reciept_TF.DRNum LEFT OUTER JOIN
                         Utility.Adjustment_RF INNER JOIN
                         Trans.Adjustment_TF ON Utility.Adjustment_RF.AdjCode = Trans.Adjustment_TF.AdjCode ON Trans.Inventory.TransactionNum = Trans.Adjustment_TF.ASNum

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[49] 4[11] 2[16] 3) )"
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
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Supplier_Voucher_Hdr_TF (Trans)"
            Begin Extent = 
               Top = 285
               Left = 59
               Bottom = 449
               Right = 233
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Supplier_Data (Master)"
            Begin Extent = 
               Top = 347
               Left = 296
               Bottom = 477
               Right = 482
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Item_Data (Master)"
            Begin Extent = 
               Top = 38
               Left = 25
               Bottom = 257
               Right = 227
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Inventory (Trans)"
            Begin Extent = 
               Top = 0
               Left = 273
               Bottom = 228
               Right = 505
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Inventory_Data (Master)"
            Begin Extent = 
               Top = 284
               Left = 573
               Bottom = 454
               Right = 817
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Delivery_Reciept_TF (Trans)"
            Begin Extent = 
               Top = 26
               Left = 520
               Bottom = 191
               Right = 718
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Branch_Data (Master)"
            Begin Extent = 
               Top = 308
               Left ' , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_ITEMS_LIST'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'= 862
               Bottom = 438
               Right = 1054
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "Adjustment_RF (Utility)"
            Begin Extent = 
               Top = 115
               Left = 1022
               Bottom = 287
               Right = 1206
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Adjustment_TF (Trans)"
            Begin Extent = 
               Top = 17
               Left = 780
               Bottom = 203
               Right = 960
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 14
         Width = 284
         Width = 1500
         Width = 2220
         Width = 2355
         Width = 1785
         Width = 1980
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1605
         Alias = 900
         Table = 2325
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1020
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_ITEMS_LIST'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_ITEMS_LIST'
GO
