USE [DGMU]
GO
/****** Object:  View [Trans].[VR_DELIVERY_SUMMARY]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Trans].[VR_DELIVERY_SUMMARY]
AS
SELECT        Master.Branch_Data.BranchName, Master.Partners_Data.PartnerName, Utility.Location_Area_RF.LAName, Trans.Delivery_Reciept_TF.id, Trans.Delivery_Reciept_TF.DRNum, Trans.Delivery_Reciept_TF.BranchCode, 
                         Trans.Delivery_Reciept_TF.ItemCodeFresh, Trans.Delivery_Reciept_TF.ItemCodeFrozen, Trans.Delivery_Reciept_TF.InvQtyFresh, Trans.Delivery_Reciept_TF.InvQtyFrozen, Trans.Delivery_Reciept_TF.FreshQty, 
                         Trans.Delivery_Reciept_TF.FrozenQty, Trans.Delivery_Reciept_TF.ConvertedFreshQty, Trans.Delivery_Reciept_TF.ConvertedFrozenQty, Trans.Delivery_Reciept_TF.OrderDate, Trans.Delivery_Reciept_TF.IsScheduled, 
                         Trans.Delivery_Reciept_TF.IsAdded, Trans.Delivery_Reciept_TF.IsCancel, Trans.Delivery_Reciept_TF.Remarks, Trans.Delivery_Reciept_TF.DU, Trans.Delivery_Reciept_TF.UserCode, Master.Partners_Data.PartnerCode, 
                         Trans.Delivery_Reciept_TF.ItemCodeLiempo, Trans.Delivery_Reciept_TF.LiempoQty, Trans.Delivery_Reciept_TF.LiempoPrice, Trans.Delivery_Reciept_TF.TotalLiempoCost, Trans.Delivery_Info.DriverName, 
                         Trans.Delivery_Info.HelperName, Trans.Delivery_Info.VehiclePlateNumber, Trans.Delivery_Reciept_TF.ConvertedLiempoQty, Trans.Delivery_Reciept_TF.InvQtyLiempo, Trans.Delivery_Reciept_TF.LeegQty, 
                         Trans.Delivery_Reciept_TF.Atsara100Qty, Trans.Delivery_Reciept_TF.Atsara160Qty, Trans.Delivery_Reciept_TF.InvQtyLeeg, Trans.Delivery_Reciept_TF.InvQtyAtsara100, Trans.Delivery_Reciept_TF.InvQtyAtsara160, 
                         Trans.Delivery_Reciept_TF.ItemCodeLeeg, Trans.Delivery_Reciept_TF.ItemCodeAtsara100, Trans.Delivery_Reciept_TF.ItemCodeAtsara160, Trans.Delivery_Reciept_TF.ConvertedLeegQty, 
                         Trans.Delivery_Reciept_TF.ConvertedAtsara100Qty, Trans.Delivery_Reciept_TF.ConvertedAtsara160Qty, Trans.Delivery_Reciept_TF.LeegPrice, Trans.Delivery_Reciept_TF.TotalLeegCost, 
                         Trans.Delivery_Reciept_TF.TotalAtsara100Cost, Trans.Delivery_Reciept_TF.TotalAtsara160Cost, Trans.Delivery_Info.Trip1Drivers, Trans.Delivery_Info.Trip1Helpers, Trans.Delivery_Info.Trip1VehicleDetails, 
                         Trans.Delivery_Info.Is2Trip, Trans.Delivery_Reciept_TF.Is2Trip AS IsTrip2_Branch, Trans.Delivery_Info.T1Remarks, Trans.Delivery_Info.T2Remarks, Trans.Delivery_Info.Trip2Drivers, Trans.Delivery_Info.Trip2Helpers, 
                         Trans.Delivery_Info.Trip2VehicleDetails
FROM            Utility.Location_Area_RF RIGHT OUTER JOIN
                         Trans.Delivery_Reciept_TF INNER JOIN
                         Master.Branch_Data ON Trans.Delivery_Reciept_TF.BranchCode = Master.Branch_Data.BranchCode INNER JOIN
                         Master.Partners_Data ON Master.Branch_Data.PartnerCode = Master.Partners_Data.PartnerCode LEFT OUTER JOIN
                         Trans.Delivery_Info ON Trans.Delivery_Reciept_TF.Assigned_LACode = Trans.Delivery_Info.LACode AND Trans.Delivery_Reciept_TF.OrderDate = Trans.Delivery_Info.DeliveryOrder ON 
                         Utility.Location_Area_RF.LACode = Trans.Delivery_Reciept_TF.Assigned_LACode
WHERE        (Trans.Delivery_Reciept_TF.IsCancel = 0)

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[19] 2[22] 3) )"
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
         Top = -160
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Delivery_Info (Trans)"
            Begin Extent = 
               Top = 235
               Left = 425
               Bottom = 650
               Right = 644
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Delivery_Reciept_TF (Trans)"
            Begin Extent = 
               Top = 82
               Left = 90
               Bottom = 312
               Right = 304
            End
            DisplayFlags = 280
            TopColumn = 39
         End
         Begin Table = "Branch_Data (Master)"
            Begin Extent = 
               Top = 0
               Left = 506
               Bottom = 212
               Right = 698
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Partners_Data (Master)"
            Begin Extent = 
               Top = 0
               Left = 633
               Bottom = 130
               Right = 821
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Location_Area_RF (Utility)"
            Begin Extent = 
               Top = 209
               Left = 621
               Bottom = 339
               Right = 791
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
      Begin ColumnWidths = 58
         Width = 284
         Width = 2205
         Width = 2415
         Width = 2055
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500' , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_DELIVERY_SUMMARY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1530
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
         Column = 1440
         Alias = 1365
         Table = 2925
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
' , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_DELIVERY_SUMMARY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_DELIVERY_SUMMARY'
GO
