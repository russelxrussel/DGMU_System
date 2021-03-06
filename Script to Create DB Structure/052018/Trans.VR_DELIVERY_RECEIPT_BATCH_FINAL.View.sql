USE [DGMU]
GO
/****** Object:  View [Trans].[VR_DELIVERY_RECEIPT_BATCH_FINAL]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Trans].[VR_DELIVERY_RECEIPT_BATCH_FINAL]
AS
SELECT        Master.Branch_Data.BranchName, Master.Partners_Data.PartnerName, Utility.Location_Area_RF.LAName, Trans.Delivery_Reciept_TF.id, Trans.Delivery_Reciept_TF.DRNum, 
                         Trans.Delivery_Reciept_TF.BranchCode, Trans.Delivery_Reciept_TF.ItemCodeFresh, Trans.Delivery_Reciept_TF.ItemCodeFrozen, Trans.Delivery_Reciept_TF.InvQtyFresh, 
                         Trans.Delivery_Reciept_TF.InvQtyFrozen, Trans.Delivery_Reciept_TF.FreshQty, Trans.Delivery_Reciept_TF.FrozenQty, Trans.Delivery_Reciept_TF.ConvertedFreshQty, 
                         Trans.Delivery_Reciept_TF.ConvertedFrozenQty, Trans.Delivery_Reciept_TF.OrderDate, Trans.Delivery_Reciept_TF.IsScheduled, Trans.Delivery_Reciept_TF.IsAdded, Trans.Delivery_Reciept_TF.IsCancel, 
                         Trans.Delivery_Reciept_TF.Remarks, Trans.Delivery_Reciept_TF.DU, Trans.Delivery_Reciept_TF.UserCode, Master.Partners_Data.PartnerCode, Trans.Delivery_Reciept_TF.ItemCodeLiempo, 
                         Trans.Delivery_Reciept_TF.LiempoQty, Trans.Delivery_Reciept_TF.LiempoPrice, Trans.Delivery_Reciept_TF.TotalLiempoCost, Trans.Delivery_Info.DriverName, Trans.Delivery_Info.HelperName, 
                         Trans.Delivery_Info.VehiclePlateNumber, Trans.Delivery_Reciept_TF.ConvertedLiempoQty, Trans.Delivery_Reciept_TF.InvQtyLiempo, Trans.Delivery_Reciept_TF.LeegQty, 
                         Trans.Delivery_Reciept_TF.Atsara100Qty, Trans.Delivery_Reciept_TF.Atsara160Qty, Trans.Delivery_Reciept_TF.InvQtyLeeg, Trans.Delivery_Reciept_TF.InvQtyAtsara100, 
                         Trans.Delivery_Reciept_TF.InvQtyAtsara160, Trans.Delivery_Reciept_TF.ItemCodeLeeg, Trans.Delivery_Reciept_TF.ItemCodeAtsara100, Trans.Delivery_Reciept_TF.ItemCodeAtsara160, 
                         Trans.Delivery_Reciept_TF.ConvertedLeegQty, Trans.Delivery_Reciept_TF.ConvertedAtsara100Qty, Trans.Delivery_Reciept_TF.ConvertedAtsara160Qty, Trans.Delivery_Reciept_TF.LeegPrice, 
                         Trans.Delivery_Reciept_TF.TotalLeegCost, Trans.Delivery_Reciept_TF.TotalAtsara100Cost, Trans.Delivery_Reciept_TF.TotalAtsara160Cost, Trans.Partner_Account_Payable.Source, 
                         Trans.Partner_Account_Payable.ItemCode, Master.Item_Data.ItemName, Master.Item_Data.SellingUomCode, Trans.Partner_Account_Payable.ItemQuantity, Trans.Partner_Account_Payable.ItemConversionQty, 
                         Trans.Partner_Account_Payable.Amount, Trans.Partner_Account_Payable.UnitPrice
FROM            Trans.Delivery_Reciept_TF INNER JOIN
                         Master.Branch_Data ON Trans.Delivery_Reciept_TF.BranchCode = Master.Branch_Data.BranchCode INNER JOIN
                         Master.Partners_Data ON Master.Branch_Data.PartnerCode = Master.Partners_Data.PartnerCode INNER JOIN
                         Utility.Location_Area_RF ON Master.Branch_Data.LACode = Utility.Location_Area_RF.LACode INNER JOIN
                         Trans.Partner_Account_Payable ON Trans.Delivery_Reciept_TF.DRNum = Trans.Partner_Account_Payable.Reference INNER JOIN
                         Master.Item_Data ON Trans.Partner_Account_Payable.ItemCode = Master.Item_Data.ItemCode LEFT OUTER JOIN
                         Trans.Delivery_Info ON Trans.Delivery_Reciept_TF.OrderDate = Trans.Delivery_Info.DeliveryOrder AND Master.Branch_Data.LACode = Trans.Delivery_Info.LACode
WHERE        (Trans.Delivery_Reciept_TF.IsCancel = 0)

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[56] 4[7] 2[8] 3) )"
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
         Begin Table = "Delivery_Reciept_TF (Trans)"
            Begin Extent = 
               Top = 16
               Left = 29
               Bottom = 289
               Right = 257
            End
            DisplayFlags = 280
            TopColumn = 25
         End
         Begin Table = "Branch_Data (Master)"
            Begin Extent = 
               Top = 0
               Left = 287
               Bottom = 147
               Right = 479
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Partners_Data (Master)"
            Begin Extent = 
               Top = 0
               Left = 582
               Bottom = 130
               Right = 769
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Location_Area_RF (Utility)"
            Begin Extent = 
               Top = 141
               Left = 729
               Bottom = 271
               Right = 899
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Partner_Account_Payable (Trans)"
            Begin Extent = 
               Top = 349
               Left = 358
               Bottom = 516
               Right = 583
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "Item_Data (Master)"
            Begin Extent = 
               Top = 30
               Left = 16
               Bottom = 242
               Right = 218
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Delivery_Info (Trans)"
            Begin Extent = 
               Top = 194
               Lef' , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_DELIVERY_RECEIPT_BATCH_FINAL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N't = 493
               Bottom = 377
               Right = 690
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
      Begin ColumnWidths = 55
         Width = 284
         Width = 2295
         Width = 2415
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
         Width = 1500
         Width = 1980
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1980
         Width = 1590
         Width = 1500
         Width = 1500
         Width = 1590
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1545
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
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 3180
         Alias = 2355
         Table = 3195
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
' , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_DELIVERY_RECEIPT_BATCH_FINAL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_DELIVERY_RECEIPT_BATCH_FINAL'
GO
