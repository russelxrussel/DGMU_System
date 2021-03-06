USE [DGMU]
GO
/****** Object:  View [Trans].[VR_STOCK_TRANSFER]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Trans].[VR_STOCK_TRANSFER]
AS
SELECT        Utility.Storage_RF.StorageCode AS StorageFromCode, Utility.Storage_RF.StorageName AS StorageFrom, Master.Item_Data.ItemName, Trans.Storage_TF.Quantity, Storage_RF_1.StorageName AS StorageTo, 
                         Storage_RF_1.StorageCode AS StorageToCode, Trans.Storage_TF.DateTransfer, Trans.Storage_TF.STNum, Trans.Storage_TF.Remarks, Master.Storage_Data.CurrentStock
FROM            Master.Item_Data INNER JOIN
                         Trans.Storage_TF ON Master.Item_Data.ItemCode = Trans.Storage_TF.ItemCode INNER JOIN
                         Utility.Storage_RF ON Trans.Storage_TF.StorageFrom = Utility.Storage_RF.StorageCode INNER JOIN
                         Utility.Storage_RF AS Storage_RF_1 ON Trans.Storage_TF.StorageTo = Storage_RF_1.StorageCode INNER JOIN
                         Master.Storage_Data ON Master.Item_Data.ItemCode = Master.Storage_Data.ItemCode AND Utility.Storage_RF.StorageCode = Master.Storage_Data.StorageCode


GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[43] 4[20] 2[12] 3) )"
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
         Begin Table = "Item_Data (Master)"
            Begin Extent = 
               Top = 49
               Left = 0
               Bottom = 209
               Right = 202
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Storage_RF (Utility)"
            Begin Extent = 
               Top = 0
               Left = 471
               Bottom = 158
               Right = 641
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Storage_TF (Trans)"
            Begin Extent = 
               Top = 3
               Left = 276
               Bottom = 203
               Right = 446
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Storage_RF_1"
            Begin Extent = 
               Top = 149
               Left = 507
               Bottom = 279
               Right = 677
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Storage_Data (Master)"
            Begin Extent = 
               Top = 7
               Left = 245
               Bottom = 227
               Right = 415
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
         Width = 1500
         Width = 1500
         Width = 1980
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         ' , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_STOCK_TRANSFER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_STOCK_TRANSFER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_STOCK_TRANSFER'
GO
