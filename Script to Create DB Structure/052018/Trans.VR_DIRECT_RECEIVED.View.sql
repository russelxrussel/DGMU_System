USE [DGMU]
GO
/****** Object:  View [Trans].[VR_DIRECT_RECEIVED]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Trans].[VR_DIRECT_RECEIVED]
AS
SELECT        Trans.Direct_Receiving_Hdr_TF.IRNum, Trans.Direct_Receiving_Hdr_TF.DateReceived, Trans.Direct_Receiving_Hdr_TF.Remarks, Trans.Direct_Receiving_Line_TF.ItemCode, Master.Item_Data.ItemName, 
                         Trans.Direct_Receiving_Line_TF.Quantity, Trans.Direct_Receiving_Hdr_TF.SupplierCode, Master.Supplier_Data.SupplierName, Master.Supplier_Data.S_Address, Master.Supplier_Data.S_ContactNumber, 
                         Master.Supplier_Data.S_ContactPerson, Trans.Direct_Receiving_Hdr_TF.DI
FROM            Master.Supplier_Data INNER JOIN
                         Trans.Direct_Receiving_Hdr_TF ON Master.Supplier_Data.SupplierCode = Trans.Direct_Receiving_Hdr_TF.SupplierCode INNER JOIN
                         Master.Item_Data INNER JOIN
                         Trans.Direct_Receiving_Line_TF ON Master.Item_Data.ItemCode = Trans.Direct_Receiving_Line_TF.ItemCode ON Trans.Direct_Receiving_Hdr_TF.IRNum = Trans.Direct_Receiving_Line_TF.IRNum

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[8] 3) )"
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
         Begin Table = "Direct_Receiving_Hdr_TF (Trans)"
            Begin Extent = 
               Top = 7
               Left = 222
               Bottom = 234
               Right = 420
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Direct_Receiving_Line_TF (Trans)"
            Begin Extent = 
               Top = 13
               Left = 439
               Bottom = 225
               Right = 642
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Item_Data (Master)"
            Begin Extent = 
               Top = 87
               Left = 721
               Bottom = 217
               Right = 923
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Supplier_Data (Master)"
            Begin Extent = 
               Top = 119
               Left = 0
               Bottom = 435
               Right = 186
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
         Width = 2430
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 3225
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
        ' , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_DIRECT_RECEIVED'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_DIRECT_RECEIVED'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_DIRECT_RECEIVED'
GO
