USE [DGMU]
GO
/****** Object:  View [Trans].[VR_DELIVERY_RECEIPT_TRANS]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Trans].[VR_DELIVERY_RECEIPT_TRANS]
AS
SELECT        Master.Branch_Data.BranchName, Master.Item_Data.ItemCode, Master.Item_Data.ItemName, Trans.Delivery_TF.InvQty, Master.Item_Data.InvUomCode, Trans.Delivery_TF.PartnerQty, 
                         Trans.Delivery_TF.PartnerUom, Trans.Delivery_TF.UnitPrice, Trans.Delivery_TF.TotalPrice, Master.Branch_Data.B_Address, Utility.Location_Area_RF.LAName, Trans.Delivery_TF.DRNum
FROM            Master.Item_Data INNER JOIN
                         Trans.Delivery_TF ON Master.Item_Data.ItemCode = Trans.Delivery_TF.ItemCode INNER JOIN
                         Master.Branch_Data ON Trans.Delivery_TF.BranchCode = Master.Branch_Data.BranchCode INNER JOIN
                         Utility.Location_Area_RF ON Master.Branch_Data.LACode = Utility.Location_Area_RF.LACode AND Master.Branch_Data.LACode = Utility.Location_Area_RF.LACode


GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
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
               Top = 14
               Left = 183
               Bottom = 208
               Right = 375
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Item_Data (Master)"
            Begin Extent = 
               Top = 5
               Left = 574
               Bottom = 204
               Right = 783
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Delivery_TF (Trans)"
            Begin Extent = 
               Top = 16
               Left = 369
               Bottom = 219
               Right = 539
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Location_Area_RF (Utility)"
            Begin Extent = 
               Top = 69
               Left = 0
               Bottom = 301
               Right = 170
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
      Begin ColumnWidths = 13
         Width = 284
         Width = 1710
         Width = 1500
         Width = 1500
         Width = 1500
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
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
  ' , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_DELIVERY_RECEIPT_TRANS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'       SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_DELIVERY_RECEIPT_TRANS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_DELIVERY_RECEIPT_TRANS'
GO
