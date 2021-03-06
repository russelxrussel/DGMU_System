USE [DGMU]
GO
/****** Object:  View [Trans].[VR_SUPPLIER_VOUCHER]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Trans].[VR_SUPPLIER_VOUCHER]
AS
SELECT        Master.Supplier_Data.SupplierCode, Master.Supplier_Data.SupplierName, Master.Supplier_Data.S_Address, Trans.Supplier_Voucher_Hdr_TF.VoucherNum, Trans.Supplier_Voucher_Hdr_TF.ReceiveDate, 
                         Trans.Supplier_Voucher_Hdr_TF.BankName, Trans.Supplier_Voucher_Hdr_TF.ChequeNumber, Trans.Supplier_Voucher_Hdr_TF.Remarks, Master.Supplier_Data.S_ContactPerson, 
                         Trans.Supplier_Voucher_Rows_TF.InvQty, Trans.Supplier_Voucher_Rows_TF.SupplierQty, Trans.Supplier_Voucher_Rows_TF.SupplierPrice, Master.Item_Data.ItemName, 
                         Utility.Item_SubCat_RF.ItemSubName
FROM            Trans.Supplier_Voucher_Hdr_TF INNER JOIN
                         Master.Supplier_Data ON Trans.Supplier_Voucher_Hdr_TF.SupplierCode = Master.Supplier_Data.SupplierCode INNER JOIN
                         Trans.Supplier_Voucher_Rows_TF ON Trans.Supplier_Voucher_Hdr_TF.VoucherNum = Trans.Supplier_Voucher_Rows_TF.VoucherNum INNER JOIN
                         Master.Item_Data ON Trans.Supplier_Voucher_Rows_TF.ItemCode = Master.Item_Data.ItemCode INNER JOIN
                         Utility.Item_SubCat_RF ON Trans.Supplier_Voucher_Rows_TF.ItemSubID = Utility.Item_SubCat_RF.ItemSubCatID AND Trans.Supplier_Voucher_Rows_TF.ItemCode = Utility.Item_SubCat_RF.ItemCode


GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[51] 4[9] 2[9] 3) )"
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
         Begin Table = "Supplier_Voucher_Hdr_TF (Trans)"
            Begin Extent = 
               Top = 0
               Left = 207
               Bottom = 240
               Right = 435
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Supplier_Data (Master)"
            Begin Extent = 
               Top = 54
               Left = 0
               Bottom = 279
               Right = 186
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Supplier_Voucher_Rows_TF (Trans)"
            Begin Extent = 
               Top = 5
               Left = 618
               Bottom = 230
               Right = 849
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Item_Data (Master)"
            Begin Extent = 
               Top = 349
               Left = 582
               Bottom = 489
               Right = 784
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Item_SubCat_RF (Utility)"
            Begin Extent = 
               Top = 140
               Left = 377
               Bottom = 282
               Right = 547
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
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = ' , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_SUPPLIER_VOUCHER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'1500
         Width = 1500
         Width = 1500
         Width = 1575
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
' , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_SUPPLIER_VOUCHER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_SUPPLIER_VOUCHER'
GO
