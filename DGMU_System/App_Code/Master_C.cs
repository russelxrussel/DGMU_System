using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace DGMU_System
{
  

    public class Partner_C : Base_C
    {
        //Retrieval
        public DataTable GET_PARTNERS_DATA()
        {
            DataTable dt = new DataTable();
            dt = queryCommandDT_StoredProc("[Master].[GET_PARTNERS_DATA]");
            return dt;
        }



        //CRUD
        public void INSERT_PARTNER_DATA(string _partnerCode, string _partnerName, string _pAddress, string _pContactNumbers, string _pContactPerson, string _itemCode,string _priceCode)
        {
            using (SqlConnection cn = new SqlConnection(CS))
            {

                using (SqlCommand cmd = new SqlCommand("[Master].[INSERT_PARTNER_DATA]", cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;


                    cmd.Parameters.AddWithValue("@PARTNERCODE", _partnerCode);
                    cmd.Parameters.AddWithValue("@PARTNERNAME", _partnerName);
                    cmd.Parameters.AddWithValue("@P_ADDRESS", _pAddress);
                    cmd.Parameters.AddWithValue("@P_CONTACTNUMBERS", _pContactNumbers);
                    cmd.Parameters.AddWithValue("@P_CONTACTPERSON", _pContactPerson);
                    cmd.Parameters.AddWithValue("ITEMCODE", _itemCode);
                    cmd.Parameters.AddWithValue("PRICECODE", _priceCode);
                  


                    cn.Open();

                    cmd.ExecuteNonQuery();

                }
            }
        }

        public void UPDATE_PARTNER_DATA(string _partnerCode, string _partnerName, string _pAddress, string _pContactNumbers, string _pContactPerson, string _priceCode, string _liempoPriceCode, string _leegPriceCode, string _atsaraPriceCode)
        {
            using (SqlConnection cn = new SqlConnection(CS))
            {

                using (SqlCommand cmd = new SqlCommand("[Master].[UPDATE_PARTNER_DATA]", cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;


                    cmd.Parameters.AddWithValue("@PARTNERCODE", _partnerCode);
                    cmd.Parameters.AddWithValue("@PARTNERNAME", _partnerName);
                    cmd.Parameters.AddWithValue("@P_ADDRESS", _pAddress);
                    cmd.Parameters.AddWithValue("@P_CONTACTNUMBERS", _pContactNumbers);
                    cmd.Parameters.AddWithValue("@P_CONTACTPERSON", _pContactPerson);
                    cmd.Parameters.AddWithValue("@PRICECODE", _priceCode);
                    cmd.Parameters.AddWithValue("@LIEMPOPRICECODE", _liempoPriceCode);
                    cmd.Parameters.AddWithValue("@LEEG_PRICE_CODE", _leegPriceCode);
                    cmd.Parameters.AddWithValue("@ATSARA_PRICE_CODE", _atsaraPriceCode);


                    cn.Open();

                    cmd.ExecuteNonQuery();

                }

            }
        }

    }

    public class Branch_C : Base_C
    {
        //Retrieval
        public DataTable GET_BRANCHES_DATA()
        {
            DataTable dt = new DataTable();
            dt = queryCommandDT_StoredProc("[Master].[GET_BRANCH_DATA]");
            return dt;
        }



        //Transaction
        public void INSERT_BRANCH_DATA(string _branchCode, string _partnerCode,string _laCode, string _branchName, string _bAddress, string _bContactNumbers, string _supervisor)
        {
            using (SqlConnection cn = new SqlConnection(CS))
            {

                using (SqlCommand cmd = new SqlCommand("[Master].[INSERT_BRANCH_DATA]", cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@BRANCHCODE", _branchCode);
                    cmd.Parameters.AddWithValue("@PARTNERCODE", _partnerCode);
                    cmd.Parameters.AddWithValue("@LACODE", _laCode);
                    cmd.Parameters.AddWithValue("@BRANCHNAME", _branchName);
                    cmd.Parameters.AddWithValue("@B_ADDRESS", _bAddress);
                    cmd.Parameters.AddWithValue("@B_CONTACTNUMBERS", _bContactNumbers);
                    cmd.Parameters.AddWithValue("@SUPERVISOR", _supervisor);




                    cn.Open();

                    cmd.ExecuteNonQuery();

                }
            }
        }

        public void UPDATE_BRANCH_DATA(string _branchCode, string _partnerCode, string _laCode, string _branchName, string _bAddress, string _bContactNumbers, string _supervisor)
        {
            using (SqlConnection cn = new SqlConnection(CS))
            {

                using (SqlCommand cmd = new SqlCommand("[Master].[UPDATE_BRANCH_DATA]", cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@BRANCHCODE", _branchCode);
                    cmd.Parameters.AddWithValue("@PARTNERCODE", _partnerCode);
                    cmd.Parameters.AddWithValue("@LACODE", _laCode);
                    cmd.Parameters.AddWithValue("@BRANCHNAME", _branchName);
                    cmd.Parameters.AddWithValue("@B_ADDRESS", _bAddress);
                    cmd.Parameters.AddWithValue("@B_CONTACTNUMBERS", _bContactNumbers);
                    cmd.Parameters.AddWithValue("@SUPERVISOR", _supervisor);




                    cn.Open();

                    cmd.ExecuteNonQuery();

                }
            }
        }
    }

    public class Supplier_C : Base_C
    {
        //Retrieval
        public DataTable GET_SUPPLIERS_DATA()
        {
            DataTable dt = new DataTable();
            dt = queryCommandDT_StoredProc("[Master].[GET_SUPPLIER_DATA]");
            return dt;
        }

        //Transaction
        public void INSERT_SUPPLIER_DATA(string _supplierCode, string _supplierName, string _sAddress, string _sContactNumbers, string _sContactPerson, int _iItemSubCatID, string _priceCode)
        {
            using (SqlConnection cn = new SqlConnection(CS))
            {

                using (SqlCommand cmd = new SqlCommand("[Master].[INSERT_SUPPLIER_DATA]", cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;


                    cmd.Parameters.AddWithValue("@SUPPLIERCODE", _supplierCode);
                    cmd.Parameters.AddWithValue("@SUPPLIERNAME", _supplierName);
                    cmd.Parameters.AddWithValue("@S_ADDRESS", _sAddress);
                    cmd.Parameters.AddWithValue("@S_CONTACTNUMBERS", _sContactNumbers);
                    cmd.Parameters.AddWithValue("@S_CONTACTPERSON", _sContactPerson);
                    cmd.Parameters.AddWithValue("@ITEMSUBCATID", _iItemSubCatID);
                    cmd.Parameters.AddWithValue("@PRICECODE", _priceCode);




                    cn.Open();

                    cmd.ExecuteNonQuery();

                }
            }
        }

        public void UPDATE_SUPPLIER_DATA(string _supplierCode, string _supplierName, string _sAddress, string _sContactNumbers, string _sContactPerson, int _iItemSubCatID, string _priceCode)
        {
            using (SqlConnection cn = new SqlConnection(CS))
            {

                using (SqlCommand cmd = new SqlCommand("[Master].[UPDATE_SUPPLIER_DATA]", cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;


                    cmd.Parameters.AddWithValue("@SUPPLIERCODE", _supplierCode);
                    cmd.Parameters.AddWithValue("@SUPPLIERNAME", _supplierName);
                    cmd.Parameters.AddWithValue("@S_ADDRESS", _sAddress);
                    cmd.Parameters.AddWithValue("@S_CONTACTNUMBERS", _sContactNumbers);
                    cmd.Parameters.AddWithValue("@S_CONTACTPERSON", _sContactPerson);
                    cmd.Parameters.AddWithValue("@ITEMSUBCATID", _iItemSubCatID);
                    cmd.Parameters.AddWithValue("@PRICECODE", _priceCode);



                    cn.Open();

                    cmd.ExecuteNonQuery();

                }
            }
        }
    
    }

    public class Item_C : Base_C
    {
        //Retrieval
        public DataTable GET_ITEM_DATA()
        {
            DataTable dt = new DataTable();
            dt = queryCommandDT_StoredProc("[Master].[GET_ITEM_DATA]");
            return dt;
        }

        //Transaction
        public void INSERT_ITEM_DATA(string _itemCode, string _itemName, string _invUomCode,  double _conversionQty)
        {
            using (SqlConnection cn = new SqlConnection(CS))
            {

                using (SqlCommand cmd = new SqlCommand("[Master].[INSERT_ITEM_DATA]", cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@ITEMCODE", _itemCode);
                    cmd.Parameters.AddWithValue("@ITEMNAME", _itemName);
                    cmd.Parameters.AddWithValue("@INVUOMCODE", _invUomCode);
                    cmd.Parameters.AddWithValue("@CONVERSIONQTY", _conversionQty);
           
                    cn.Open();

                    cmd.ExecuteNonQuery();

                }
            }
        }

        public void UPDATE_ITEM_DATA(string _itemCode, string _itemName,  double _conversionQty)
        {
            using (SqlConnection cn = new SqlConnection(CS))
            {

                using (SqlCommand cmd = new SqlCommand("[Master].[UPDATE_ITEM_DATA]", cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@ITEMCODE", _itemCode);
                    cmd.Parameters.AddWithValue("@ITEMNAME", _itemName);
                    cmd.Parameters.AddWithValue("@CONVERSIONQTY", _conversionQty);

                    cn.Open();

                    cmd.ExecuteNonQuery();

                }
            }
        }
    }

    public class Inventory_C : Base_C
    {
        //Retrieval
        public DataTable GET_STORAGE_DATA()
        {
            DataTable dt = new DataTable();
            dt = queryCommandDT_StoredProc("[Master].[GET_STORAGE_DATA]");
            return dt;
        }

    }

}