using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace DGMU_System
{
    public class Transaction_C : Base_C
    {
        public Transaction_C()
        { 
       
        }

        #region "GET DATA"
        public DataTable GET_PARTNER_PRICE_AMOUNT()
        {
            DataTable dt = new DataTable();
            dt = queryCommandDT_StoredProc("[Trans].[GET_PARTNER_PRICE]");
            return dt;
        }

        public DataTable GET_DELIVERY_LIST()
        { 
            DataTable dt = new DataTable();
            dt = queryCommandDT_StoredProc("[Trans].[GET_DELIVERY_LIST]");
            return dt;
        }

        public DataTable GET_DELIVERY_TEMP()
        {
            DataTable dt = new DataTable();
            dt = queryCommandDT_StoredProc("[Trans].[GET_DELIVERY_TEMP]");
            return dt;
        }

        public DataTable GET_DELIVERY_SCHEDULE()
        {
            DataTable dt = new DataTable();
            dt = queryCommandDT_StoredProc("[Trans].[GET_DELIVERY_SCHEDULE]");
            return dt;
        }

        //VERSION 1
        public DataTable GET_OPENING_RUNNING_STOCK(DateTime _selectedDate)
        {
            DataTable dt = new DataTable();
            using (SqlConnection cn = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("[Trans].[GET_OPENING_AND_RUNNING_STOCK]", cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@SELECTEDDATE", _selectedDate);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                }
            }

            return dt;
        }

        //VERSION 2 04/26/2018 
        public DataTable GET_OPENING_ENDING_STOCK(DateTime _selectedDate)
        {
            DataTable dt = new DataTable();
            using (SqlConnection cn = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("[Trans].[GET_OPENING_AND_ENDING_STOCK]", cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@SELECTEDDATE", _selectedDate);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                }
            }

            return dt;
        }

        public DataTable GET_ITEM_RUNNING_STOCK(DateTime _selectedDate)
        {
            DataTable dt = new DataTable();
            using (SqlConnection cn = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("[Trans].[GET_ITEM_RUNNING_STOCK]", cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@SELECTEDDATE", _selectedDate);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                }
            }

            return dt;
        }

        public DataTable GET_DELIVERY_INPUT()
        {
            DataTable dt = new DataTable();
            dt = queryCommandDT_StoredProc("[Trans].[GET_DELIVERY_INPUT]");
            return dt;
        }

        public DataTable GET_SCHEDULED_DELIVERY(DateTime _dtSchedule)
        {
            DataTable dt = new DataTable();

            using (SqlConnection cn = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("[Trans].[GET_DELIVERY_SCHEDULED_FINAL]", cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@DATEDELIVER", _dtSchedule);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                }
            }

            return dt;
       
        }

        public DataTable GET_DELIVERY_INFO(DateTime _dtDeliveryOrder, string _LACode)
        {
            DataTable dt = new DataTable();

            using (SqlConnection cn = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("[Trans].[GET_DELIVERY_INFO]", cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@DELIVERYORDER", _dtDeliveryOrder);
                    cmd.Parameters.AddWithValue("@LACODE", _LACode);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                }
            }

            return dt;
        }

        public DataTable GET_PREVIOUS_SCHEDULED_DELIVERY(string _branchCode)
        {
            DataTable dt = new DataTable();

            using (SqlConnection cn = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("[Trans].[GET_PREVIOUS_DELIVERY_SCHEDULED_FINAL]", cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@BRANCHCODE", _branchCode);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                }
            }

            return dt;

        }
        public DataTable GET_PARTNER_DEPOSIT()
        {
            DataTable dt = new DataTable();
            dt = queryCommandDT_StoredProc("[Trans].[GET_PARTNER_DEPOSIT]");
            return dt;
        }

        public DataTable GET_PARTNER_PAYABLE()
        {
            DataTable dt = new DataTable();
            dt = queryCommandDT_StoredProc("[Trans].[GET_PARTNER_PAYABLE]");
            return dt;
        }


        //GET THE SOURCE OF PARTNER DISTRIBUTION TO BRANCH
        public DataTable GET_BRANCHITEM_DISTRIBUTION()
        {
            DataTable dt = new DataTable();
            dt = queryCommandDT_StoredProc("[Trans].[GET_PARTNER_ITEM_FOR_DISTRIBUTION]");
            return dt;

        }


        //GET THE QUANTITY AND DATE FROM OPEN DISTRIBUTION
        public DataTable GET_DISTRIBUTED_BRANCH_ITEM2(string _ptbNum, string _branchCode)
        { 
         DataTable dt = new DataTable();

            using (SqlConnection cn = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("[Trans].[GET_BRANCH_DISTRIBUTED_ITEM]", cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@PTBNUM", _ptbNum);
                    cmd.Parameters.AddWithValue("@BRANCHCODE", _branchCode);

                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cmd;
                    da.Fill(dt);
                }
            }

            return dt;
        }

        public DataTable GET_DISTRIBUTED_BRANCH_ITEM()
        {
            DataTable dt = new DataTable();
            dt = queryCommandDT_StoredProc("[Trans].[GET_BRANCH_DISTRIBUTED_ITEM]");
            return dt;

        }
        #endregion


        #region "TRANSACTION"


        //SUPPLIER P.O
        //Will Get only PO that open status
        public DataTable GET_LIST_OPEN_SUPPLIER_PO(string _supplierCode)
        {
            DataTable dt = new DataTable();

            using (SqlConnection cn = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("[Trans].[GET_SUPPLIER_PO_LIST]", cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@SUPPLIERCODE", _supplierCode);

                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cmd;
                    da.Fill(dt);
                }
            }

            return dt;

        }

        public DataTable GET_SUPPLIER_VOUCHER_HDR()
        {
            DataTable dt = new DataTable();
            dt = queryCommandDT_StoredProc("[Trans].[GET_SUPPLIER_VOUCHER]");
            return dt;
        }
        public DataTable GET_SELECTED_SUPPLIER_PO_ITEM(string _ponum)
        {
            DataTable dt = new DataTable();

            using (SqlConnection cn = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("[Trans].[GET_SUPPLIER_PO_ITEMS]", cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@PONUM", _ponum);

                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cmd;
                    da.Fill(dt);
                }
            }

            return dt;

        }
        public void INSERT_SUPPLIER_VOUCHER_HDR(string _voucherNum, string _supplierCode, string _bank, string _chequeNum, DateTime _receiveDate, string _remarks, string _userCode)
        {
            using (SqlConnection cn = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("[Trans].[INSERT_SUPPLIER_VOUCHER_HDR]", cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@VOUCHERNUM", _voucherNum);
                    cmd.Parameters.AddWithValue("@SUPPLIERCODE", _supplierCode);
                    cmd.Parameters.AddWithValue("@BANKNAME", _bank);
                    cmd.Parameters.AddWithValue("@CHEQUENUMBER", _chequeNum);
                    cmd.Parameters.AddWithValue("@RECEIVEDATE", _receiveDate);
                    cmd.Parameters.AddWithValue("@REMARKS", _remarks);
                    cmd.Parameters.AddWithValue("@USERCODE", _userCode);


                    cn.Open();

                    cmd.ExecuteNonQuery();

                }
            }
        }

        //public void INSERT_SUPPLIER_GRPO_TRANS_HDR(string _grponum,string _ponum, string _supplierCode, DateTime _requestDate, string _remarks, string _userCode)
        //{
        //    using (SqlConnection cn = new SqlConnection(CS))
        //    {
        //        using (SqlCommand cmd = new SqlCommand("[Trans].[GR_Supplier_PO_Hdr]", cn))
        //        {
        //            cmd.CommandType = CommandType.StoredProcedure;

        //            cmd.Parameters.AddWithValue("@GRPONUM", _grponum);
        //            cmd.Parameters.AddWithValue("@SUPPLIERCODE", _supplierCode);
        //            cmd.Parameters.AddWithValue("@REQUESTDATE", _requestDate);
        //            cmd.Parameters.AddWithValue("@PONUM", _ponum);
        //            cmd.Parameters.AddWithValue("@REMARKS", _remarks);
        //            cmd.Parameters.AddWithValue("@USERCODE", _userCode);


        //            cn.Open();

        //            cmd.ExecuteNonQuery();

        //        }
        //    }
        //}

        public void INSERT_SUPPLIER_VOUCHER_ROWS(string _voucherNum, string _itemcode, int _itemSubID, double _invQty, string _invUomCode, double _supplierQty, string _supplierUomCode, double _supplierPrice, string _userCode)
        {
            using (SqlConnection cn = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("[Trans].[INSERT_SUPPLIER_VOUCHER_ROWS]", cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;


                    cmd.Parameters.AddWithValue("@VOUCHERNUM", _voucherNum);
                    
                    cmd.Parameters.AddWithValue("@ITEMCODE", _itemcode);
                    cmd.Parameters.AddWithValue("@ITEMSUBID", _itemSubID);
                    cmd.Parameters.AddWithValue("@INVQTY", _invQty);
                    cmd.Parameters.AddWithValue("@INVUOMCODE", _invUomCode);
                    cmd.Parameters.AddWithValue("@SUPPLIERQTY", _supplierQty);
                    cmd.Parameters.AddWithValue("@SUPPLIERUOMCODE", _supplierUomCode);
                    cmd.Parameters.AddWithValue("@SUPPLIERPRICE", _supplierPrice);
                    cmd.Parameters.AddWithValue("@USERCODE", _userCode);


                    cn.Open();

                    cmd.ExecuteNonQuery();

                }
            }
        }

        public void INSERT_SUPPLIER_VOUCHER(string _voucherNum, string _supplierCode, string _bank, string _chequeNum, DateTime _receiveDate, string _remarks, string _itemcode, int _itemSubID, double _invQty, string _invUomCode, double _supplierQty, string _supplierUomCode, double _supplierPrice, string _userCode)
        {
            using (SqlConnection cn = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("[Trans].[INSERT_SUPPLIER_VOUCHER]", cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;


                    cmd.Parameters.AddWithValue("@VOUCHERNUM", _voucherNum);
                    cmd.Parameters.AddWithValue("@SUPPLIERCODE", _supplierCode);
                    cmd.Parameters.AddWithValue("@BANKNAME", _bank);
                    cmd.Parameters.AddWithValue("@CHEQUENUMBER", _chequeNum);
                    cmd.Parameters.AddWithValue("@RECEIVEDATE", _receiveDate);
                    cmd.Parameters.AddWithValue("@REMARKS", _remarks);
                    cmd.Parameters.AddWithValue("@ITEMCODE", _itemcode);
                    cmd.Parameters.AddWithValue("@ITEMSUBID", _itemSubID);
                    cmd.Parameters.AddWithValue("@INVQTY", _invQty);
                    cmd.Parameters.AddWithValue("@INVUOMCODE", _invUomCode);
                    cmd.Parameters.AddWithValue("@SUPPLIERQTY", _supplierQty);
                    cmd.Parameters.AddWithValue("@SUPPLIERUOMCODE", _supplierUomCode);
                    cmd.Parameters.AddWithValue("@SUPPLIERPRICE", _supplierPrice);
                    cmd.Parameters.AddWithValue("@USERCODE", _userCode);


                    cn.Open();

                    cmd.ExecuteNonQuery();

                }
            }
        }

        public void UPDATE_SUPPLIER_PURCHASE_ORDER_TRANS_HDR_STATUS(string _ponum, string _docStatus)
        {

            using (SqlConnection cn = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("[Trans].[UPDATE_SUPPLIER_PO_HDR_STATUS]", cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@PONUM", _ponum);
                    cmd.Parameters.AddWithValue("@DOCSTATUS", _docStatus);

                    cn.Open();

                    cmd.ExecuteNonQuery();

                }


            }

        }

        //PARTNER P.O
        public void INSERT_PARTNER_PURCHASE_ORDER_TRANS_HDR(string _ponum, string _partnerCode, DateTime _requestDate, string _remarks, string _userCode)
        {
            using (SqlConnection cn = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("[Trans].[INSERT_PARTNER_PO_TRANS_HDR]", cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@PARTNERCODE", _partnerCode);
                    cmd.Parameters.AddWithValue("@REQUESTDATE", _requestDate);
                    cmd.Parameters.AddWithValue("@PONUM", _ponum);
                    cmd.Parameters.AddWithValue("@REMARKS", _remarks);
                    cmd.Parameters.AddWithValue("@USERCODE", _userCode);


                    cn.Open();

                    cmd.ExecuteNonQuery();

                }
            }
        }

       
        public void INSERT_PARTNER_PURCHASE_ORDER_TRANS_ROWS(string _ponum, string _branchCode,string _itemcode, double _invQty, double _partnerQty, string _partnerUOM, double _unitPrice,double _totalPrice,double _remainingQty, string _userCode)
        {
            using (SqlConnection cn = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("[Trans].[INSERT_PARTNER_PO_TRANS_ROWS]", cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;


                    cmd.Parameters.AddWithValue("@PONUM", _ponum);
                    cmd.Parameters.AddWithValue("@BRANCHCODE", _branchCode);
                    cmd.Parameters.AddWithValue("@ITEMCODE", _itemcode);
                    cmd.Parameters.AddWithValue("@INVQTY", _invQty);
                    cmd.Parameters.AddWithValue("@PARTNERQTY", _partnerQty);
                    cmd.Parameters.AddWithValue("@PARTNERUOM", _partnerUOM);
                    cmd.Parameters.AddWithValue("@UNITPRICE", _unitPrice);
                    cmd.Parameters.AddWithValue("@TOTALPRICE", _totalPrice);
                    cmd.Parameters.AddWithValue("@REMAININGQTY", _remainingQty);
                    cmd.Parameters.AddWithValue("@USERCODE", _userCode);


                    cn.Open();

                    cmd.ExecuteNonQuery();

                }
            }
        }


         public void INSERT_DELIVERY_RECEIPT_TRANS(string _drnum, string _branchCode,string _itemcode, double _invQty, double _partnerQty, string _partnerUOM, double _unitPrice,double _totalPrice,double _remainingQty, DateTime _orderDate,string _remarks , string _userCode)
        {
            using (SqlConnection cn = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("[Trans].[INSERT_DELIVERY_RECEIPT]", cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;


                    cmd.Parameters.AddWithValue("@DRNUM", _drnum);
                    cmd.Parameters.AddWithValue("@BRANCHCODE", _branchCode);
                    cmd.Parameters.AddWithValue("@ITEMCODE", _itemcode);
                    cmd.Parameters.AddWithValue("@INVQTY", _invQty);
                    cmd.Parameters.AddWithValue("@PARTNERQTY", _partnerQty);
                    cmd.Parameters.AddWithValue("@PARTNERUOM", _partnerUOM);
                    cmd.Parameters.AddWithValue("@UNITPRICE", _unitPrice);
                    cmd.Parameters.AddWithValue("@TOTALPRICE", _totalPrice);
                    cmd.Parameters.AddWithValue("@REMAININGQTY", _remainingQty);
                    cmd.Parameters.AddWithValue("@ORDERDATE", _orderDate);
                    cmd.Parameters.AddWithValue("@REMARKS", _remarks);
                    cmd.Parameters.AddWithValue("@USERCODE", _userCode);


                    cn.Open();

                    cmd.ExecuteNonQuery();

                }
            }
        }

         public void INSERT_DELIVERY_RECEIPT_TRANS_FINAL(string _drnum, string _partnerCode,string _branchCode, 
             string _itemCodeFresh, string _itemCodeFrozen,string _itemCodeLiempo, string _itemCodeLeeg, string _itemCodeAtsara100, string _itemCodeAtsara160,
             double _freshQty, double _frozenQty, double _liempoQty, double _leegQty, double _atsara100Qty, double _atsara160Qty,
             bool _isCancel, bool _isAdded, DateTime _orderDate, string _remarks, string _assigned_laCode, bool _is2trip, string _usercode, 
             int _T1Driver1, int _T1Driver2, int _T1Helper1, int _T1Helper2, int _T1Vehicle,  string _T1Remarks,
             int _T2Driver1, int _T2Driver2, int _T2Helper1, int _T2Helper2, int _T2Vehicle, string _T2Remarks)
        {
            using (SqlConnection cn = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("[Trans].[INSERT_DELIVERY_RECEIPT_FINAL]", cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;


                    cmd.Parameters.AddWithValue("@DRNUM", _drnum);
                    cmd.Parameters.AddWithValue("@PARTNERCODE", _partnerCode);
                    cmd.Parameters.AddWithValue("@BRANCHCODE", _branchCode);
                    cmd.Parameters.AddWithValue("@ITEMCODEFRESH", _itemCodeFresh);
                    cmd.Parameters.AddWithValue("@ITEMCODEFROZEN", _itemCodeFrozen);
                    cmd.Parameters.AddWithValue("@ITEMCODELIEMPO", _itemCodeLiempo);
                    cmd.Parameters.AddWithValue("@ITEMCODELEEG", _itemCodeLeeg);
                    cmd.Parameters.AddWithValue("@ITEMCODEATSARA100", _itemCodeAtsara100);
                    cmd.Parameters.AddWithValue("@ITEMCODEATSARA160", _itemCodeAtsara160);

                  
                    cmd.Parameters.AddWithValue("@FRESHQTY", _freshQty);
                    cmd.Parameters.AddWithValue("@FROZENQTY", _frozenQty);
                    cmd.Parameters.AddWithValue("@LIEMPOQTY", _liempoQty);
                    cmd.Parameters.AddWithValue("@LEEGQTY", _leegQty);
                    cmd.Parameters.AddWithValue("@ATSARA100QTY", _atsara100Qty);
                    cmd.Parameters.AddWithValue("@ATSARA160QTY", _atsara160Qty);

                    cmd.Parameters.AddWithValue("@ISCANCEL", _isCancel);
                    cmd.Parameters.AddWithValue("@ISADDED", _isAdded);
                    cmd.Parameters.AddWithValue("@ORDERDATE", _orderDate);
                    cmd.Parameters.AddWithValue("@REMARKS", _remarks);
                    cmd.Parameters.AddWithValue("@ASSIGNED_LACODE", _assigned_laCode);
                    cmd.Parameters.AddWithValue("@IS2TRIP", _is2trip);
                    cmd.Parameters.AddWithValue("@USERCODE", _usercode);
                  
                    cmd.Parameters.AddWithValue("@T1DRIVER1", _T1Driver1);
                    cmd.Parameters.AddWithValue("@T1DRIVER2", _T1Driver2);
                    cmd.Parameters.AddWithValue("@T1HELPER1", _T1Helper1);
                    cmd.Parameters.AddWithValue("@T1HELPER2", _T1Helper2);
                    cmd.Parameters.AddWithValue("@T1VEHICLE", _T1Vehicle);

                    cmd.Parameters.AddWithValue("@T1REMARKS", _T1Remarks);

                    cmd.Parameters.AddWithValue("@T2DRIVER1", _T2Driver1);
                    cmd.Parameters.AddWithValue("@T2DRIVER2", _T2Driver2);
                    cmd.Parameters.AddWithValue("@T2HELPER1", _T2Helper1);
                    cmd.Parameters.AddWithValue("@T2HELPER2", _T2Helper2);
                    cmd.Parameters.AddWithValue("@T2VEHICLE", _T2Vehicle);

                    cmd.Parameters.AddWithValue("@T2REMARKS", _T2Remarks);


                    cn.Open();

                    cmd.ExecuteNonQuery();

                }
            }
        }

         public void UPDATE_DELIVERY_RECEIPT_TRANS_FINAL(string _branchCode, DateTime _orderDate, string _remarks, string _userCode)
         {
             using (SqlConnection cn = new SqlConnection(CS))
             {
                 using (SqlCommand cmd = new SqlCommand("[Trans].[UPDATE_DELIVERY_RECEIPT_FINAL]", cn))
                 {
                     cmd.CommandType = CommandType.StoredProcedure;

                     cmd.Parameters.AddWithValue("@BRANCHCODE", _branchCode);
                     cmd.Parameters.AddWithValue("@ORDERDATE", _orderDate);
                     cmd.Parameters.AddWithValue("@REMARKS", _remarks);
                     cmd.Parameters.AddWithValue("@USERCODE", _userCode);


                     cn.Open();

                     cmd.ExecuteNonQuery();

                 }
             }
         }

        //UPDATE DELIVERY STATUS FOR TODAY
         public void INSERT_PICKUP_TRANSFER(string _ptNum, string _ptbNum, string _partnerCode, string _itemCode, int _quantity, string _remarks, DateTime _dateTrans)
         {
             using (SqlConnection cn = new SqlConnection(CS))
             {
                 using (SqlCommand cmd = new SqlCommand("[Trans].[INSERT_PICKUP_TRANSFER]", cn))
                 {
                     cmd.CommandType = CommandType.StoredProcedure;

                     cmd.Parameters.AddWithValue("@PTNUM", _ptNum);
                     cmd.Parameters.AddWithValue("@PTBNUM", _ptbNum);
                     cmd.Parameters.AddWithValue("@PARTNERCODE", _partnerCode);
                     cmd.Parameters.AddWithValue("@ITEMCODE", _itemCode);
                     cmd.Parameters.AddWithValue("@QUANTITY", _quantity);
                     cmd.Parameters.AddWithValue("@REMARKS", _remarks);
                     cmd.Parameters.AddWithValue("@DATETRANS", _dateTrans);
                     cn.Open();

                     cmd.ExecuteNonQuery();

                 }
             }
         }

         public void UPDATE_DELIVERY_SCHEDULE(string _drnum, DateTime _deliveryDate)
         {
             using (SqlConnection cn = new SqlConnection(CS))
             {
                 using (SqlCommand cmd = new SqlCommand("[Trans].[UPDATE_DELIVERY_SCHEDULE]", cn))
                 {
                     cmd.CommandType = CommandType.StoredProcedure;


                     cmd.Parameters.AddWithValue("@DRNUM", _drnum);
                     cmd.Parameters.AddWithValue("@DELIVERYDATE", _deliveryDate);
                     cn.Open();

                     cmd.ExecuteNonQuery();

                 }
             }
         }

         public void UPDATE_DELIVERY_SCHEDULE_TODAY(string _drnum, DateTime _deliveryDate)
         {
             using (SqlConnection cn = new SqlConnection(CS))
             {
                 using (SqlCommand cmd = new SqlCommand("[Trans].[UPDATE_DELIVERY_SCHEDULE_TODAY]", cn))
                 {
                     cmd.CommandType = CommandType.StoredProcedure;


                     cmd.Parameters.AddWithValue("@DRNUM", _drnum);
                     cmd.Parameters.AddWithValue("@DELIVERYDATE", _deliveryDate);
                     cn.Open();

                     cmd.ExecuteNonQuery();

                 }
             }
         }
         public void UPDATE_DELIVERY_SCHEDULE_CLOSE()
         { 
              using (SqlConnection cn = new SqlConnection(CS))
             {
                 using (SqlCommand cmd = new SqlCommand("[Trans].[UPDATE_DELIVERY_SCHEDULE_CLOSE]", cn))
                 {
                     cmd.CommandType = CommandType.StoredProcedure;

                     cn.Open();

                     cmd.ExecuteNonQuery();

                 }
             }
     
         }
         public void UPDATE_DELIVERY_SCHEDULE_ADD(string _drNum, string _remarks, DateTime _deliveryDate)
         {
             using (SqlConnection cn = new SqlConnection(CS))
             {
                 using (SqlCommand cmd = new SqlCommand("[Trans].[UPDATE_DELIVERY_ADD]", cn))
                 {
                     cmd.CommandType = CommandType.StoredProcedure;


                     cmd.Parameters.AddWithValue("@DRNUM", _drNum);
                     cmd.Parameters.AddWithValue("@REMARKS", _remarks);
                     cmd.Parameters.AddWithValue("@DELIVERYDATE", _deliveryDate);
                     cn.Open();

                     cmd.ExecuteNonQuery();

                 }
             }
         }

         public void UPDATE_DELIVERY_SCHEDULE_CANCEL(string _drNum, string _remarks)
         {
             using (SqlConnection cn = new SqlConnection(CS))
             {
                 using (SqlCommand cmd = new SqlCommand("[Trans].[UPDATE_DELIVERY_POSTPONE]", cn))
                 {
                     cmd.CommandType = CommandType.StoredProcedure;


                     cmd.Parameters.AddWithValue("@DRNUM", _drNum);
                     cmd.Parameters.AddWithValue("REMARKS", _remarks);
                     cn.Open();

                     cmd.ExecuteNonQuery();

                 }
             }
         }


        //STOCK TRANSFER
         public void INSERT_STOCK_TRANSFER_TRANS(string _stNum, DateTime _dateTransfer, string _storageFrom, string _storageTo, string _itemCode, double _quantity, string _remarks, string _userCode, bool _exist)
         {
             using (SqlConnection cn = new SqlConnection(CS))
             {
                 using (SqlCommand cmd = new SqlCommand("[Trans].[INSERT_STOCK_TRANSFER]", cn))
                 {
                     cmd.CommandType = CommandType.StoredProcedure;


                     cmd.Parameters.AddWithValue("@STNUM", _stNum);
                     cmd.Parameters.AddWithValue("@DATETRANSFER", _dateTransfer);
                     cmd.Parameters.AddWithValue("@STORAGEFROM", _storageFrom);
                     cmd.Parameters.AddWithValue("@STORAGETO", _storageTo);
                     cmd.Parameters.AddWithValue("@ITEMCODE", _itemCode);
                     cmd.Parameters.AddWithValue("@QUANTITY", _quantity);
                     cmd.Parameters.AddWithValue("@REMARKS", _remarks);
                     cmd.Parameters.AddWithValue("@USERCODE", _userCode);
                     cmd.Parameters.AddWithValue("@EXIST", _exist);


                     cn.Open();

                     cmd.ExecuteNonQuery();

                 }
             }
         }

         public bool CHECK_STORAGE_EXIST(string _storageCode, string _itemCode)
         {
             bool x = false;

             using (SqlConnection cn = new SqlConnection(CS))
             {
                 using (SqlCommand cmd = new SqlCommand("Master.CHECK_STORAGE_STOCK_EXIST", cn))
                 {

                     cmd.CommandType = CommandType.StoredProcedure;
                     cmd.Parameters.AddWithValue("@STORAGECODE", _storageCode);
                     cmd.Parameters.AddWithValue("@ITEMCODE", _itemCode);

                     cn.Open();

                     x = (bool)cmd.ExecuteScalar();
                 }

                 return x;
             }
         }

         //DEPOSIT PARTNER 

         public void INSERT_PARTNER_DEPOSIT(string _depositNum, string _partnerCode, double _depositAmount, DateTime _depositDate, string _chequeNumber, string _bank, string _remarks, string _userCode)
         {
             using (SqlConnection cn = new SqlConnection(CS))
             {
                 using (SqlCommand cmd = new SqlCommand("[Trans].[INSERT_PARTNER_DEPOSIT]", cn))
                 {
                     cmd.CommandType = CommandType.StoredProcedure;

                     cmd.Parameters.AddWithValue("@DEPOSITNUM", _depositNum);
                     cmd.Parameters.AddWithValue("@PARTNERCODE", _partnerCode);
                     cmd.Parameters.AddWithValue("@DEPOSITAMOUNT", _depositAmount);
                     cmd.Parameters.AddWithValue("@DEPOSITDATE", _depositDate);
                     cmd.Parameters.AddWithValue("@CHEQUENUMBER", _chequeNumber);
                     cmd.Parameters.AddWithValue("@BANK", _bank);
                     cmd.Parameters.AddWithValue("@REMARKS", _remarks);
                     cmd.Parameters.AddWithValue("@USERCODE", _userCode);
                     

                     cn.Open();

                     cmd.ExecuteNonQuery();

                 }
             }
         }


         public void INSERT_STOCK_ADJUSTMENT(string _asNum, string _adjCode, string _itemCode, int _quantity, DateTime _adjDate, string _reference, string _remarks)
         {
             using (SqlConnection cn = new SqlConnection(CS))
             {
                 using (SqlCommand cmd = new SqlCommand("[Trans].[INSERT_STOCK_ADJUSTMENT]", cn))
                 {
                     cmd.CommandType = CommandType.StoredProcedure;

                     cmd.Parameters.AddWithValue("@ASNUM", _asNum);
                     cmd.Parameters.AddWithValue("@ADJCODE", _adjCode);
                     cmd.Parameters.AddWithValue("@ITEMCODE", _itemCode);
                     cmd.Parameters.AddWithValue("@QUANTITY", _quantity);
                     cmd.Parameters.AddWithValue("@ADJDATE", _adjDate);
                     cmd.Parameters.AddWithValue("@REFERENCE", _reference);
                     cmd.Parameters.AddWithValue("@REMARKS", _remarks);
                  


                     cn.Open();

                     cmd.ExecuteNonQuery();

                 }
             }
         }

        
        //STOCK RETURN NEW RECORD
         public void INSERT_STOCK_BRANCH_RETURN(string _srNum, string _branchCode, string _itemCode, double _quantity, bool _creditToAccount, DateTime _dateReturn, string _remarks)
         {
             using (SqlConnection cn = new SqlConnection(CS))
             {
                 using (SqlCommand cmd = new SqlCommand("[Trans].[INSERT_BRANCH_STOCK_RETURN]", cn))
                 {
                     cmd.CommandType = CommandType.StoredProcedure;

                     cmd.Parameters.AddWithValue("@SRNUM",_srNum);
                     cmd.Parameters.AddWithValue("@BRANCHCODE", _branchCode);
                     cmd.Parameters.AddWithValue("@ITEMCODE", _itemCode);
                     cmd.Parameters.AddWithValue("@QUANTITY", _quantity);
                     cmd.Parameters.AddWithValue("@CREDITTOACCOUNT", _creditToAccount);
                     cmd.Parameters.AddWithValue("@DATERETURN", _dateReturn);
                     cmd.Parameters.AddWithValue("@REMARKS", _remarks);



                     cn.Open();

                     cmd.ExecuteNonQuery();

                 }
             }
         }
        
        
        //INSERT ITEM TO BRANCH FROM DISTRIBUTION PROCESS
         public void INSERT_DISTRIBUTED_BRANCH_ITEM(string _ptbNum, string _dptNum, string _branchCode, string _branchItemCode, int _quantityReceived, DateTime _dateTrans, string _remarks, string _userCode)
         {
             using (SqlConnection cn = new SqlConnection(CS))
             {
                 using (SqlCommand cmd = new SqlCommand("[Trans].[INSERT_PICKUP_TRANS_DISTRIBUTE]", cn))
                 {
                     cmd.CommandType = CommandType.StoredProcedure;

                     cmd.Parameters.AddWithValue("@PTBNUM", _ptbNum);
                     cmd.Parameters.AddWithValue("@DPTNUM", _dptNum);
                     cmd.Parameters.AddWithValue("@BRANCHCODE", _branchCode);
                     cmd.Parameters.AddWithValue("@BRANCHITEMCODE", _branchItemCode);
                     cmd.Parameters.AddWithValue("@QUANTITYRECEIVED", _quantityReceived);
                     cmd.Parameters.AddWithValue("@DATETRANS", _dateTrans);
                     cmd.Parameters.AddWithValue("@REMARKS", _remarks);
                     cmd.Parameters.AddWithValue("@USERCODE", _userCode);



                     cn.Open();

                     cmd.ExecuteNonQuery();

                 }
             }     
         }

        //RECEIVING ITEM
        public void INSERT_RECEIVED_ITEM(string _irNum, string _supplierCode, string _itemCode, int _quantity, DateTime _dateReceived, string _remarks, string _userCode)
        {
            using (SqlConnection cn = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("[Trans].[INSERT_RECEIVING_ITEM]", cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@IRNUM", _irNum);
                    cmd.Parameters.AddWithValue("@SUPPLIERCODE", _supplierCode);
                    cmd.Parameters.AddWithValue("@ITEMCODE", _itemCode);
                    cmd.Parameters.AddWithValue("@QUANTITY", _quantity);
                    cmd.Parameters.AddWithValue("@DATERECEIVED", _dateReceived);
                    cmd.Parameters.AddWithValue("@REMARKS", _remarks);
                    cmd.Parameters.AddWithValue("@USERCODE", _userCode);


                    cn.Open();

                    cmd.ExecuteNonQuery();

                }
            }
        }

        #endregion

    }
}