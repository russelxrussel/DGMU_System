using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace DGMU_System
{
    public class Utility_C : Base_C
    {
        public Utility_C()
        { 
        
        }

        //Retrieval
        public DataTable GET_UOM_LIST()
        {
            DataTable dt = new DataTable();
            dt = queryCommandDT_StoredProc("[Utility].[GET_UOM_LIST]");
            return dt;
        }


        //PRICE LIST
        public DataTable GET_PRICE_LIST()
        {
            DataTable dt = new DataTable();
            dt = queryCommandDT_StoredProc("[Utility].[GET_PRICE_LIST]");
            return dt;
        }

        //LOCATION AREA LIST
        public DataTable GET_LOCATION_AREA_LIST()
        {
            DataTable dt = new DataTable();
            dt = queryCommandDT_StoredProc("[Utility].[GET_LOCATION_AREA_LIST]");
            return dt;
        }

        //STORAGE AREA
        public DataTable GET_STORAGE_AREA_LIST()
        {
            DataTable dt = new DataTable();
            dt = queryCommandDT_StoredProc("[Utility].[GET_STORAGE_AREA_LIST]");
            return dt;
        }

        //ITEM SUB CATEGORY
        public DataTable GET_ITEM_SUBCAT_LIST()
        {
            DataTable dt = new DataTable();
            dt = queryCommandDT_StoredProc("[Utility].[GET_ITEM_SUBCAT_LIST]");
            return dt;
        }
        


        //PARTNER PRICE
        public DataTable GET_PARTNER_PRICE_LIST()
        {
            DataTable dt = new DataTable();
            dt = queryCommandDT_StoredProc("[Utility].[GET_PARTNER_PRICE_SETUP]");
            return dt;
        }
        public DataTable GET_PARTNER_PRICE_FINAL()
        {
            DataTable dt = new DataTable();
            dt = queryCommandDT_StoredProc("[Utility].[GET_PARTNER_PRICE_FINAL]");
            return dt;
        }


        public DataTable GET_PARTNERS_PRICE()
        {
            DataTable dt = new DataTable();
            dt = queryCommandDT_StoredProc("[Master].[GET_PARTNER_PRICE]");
            return dt;

        }

        public DataTable GET_SUPPLIER_PRICE_LIST()
        {
            DataTable dt = new DataTable();
            dt = queryCommandDT_StoredProc("[Utility].[GET_SUPPLIER_PRICE_SETUP]");
            return dt;
        }

        public DataTable GET_SUPPLIER_ITEM_PRICE()
        {
            DataTable dt = new DataTable();
            dt = queryCommandDT_StoredProc("[Utility].[GET_SUPPLIER_PRICE]");
            return dt;
        }


        //SCHEDULE LIST
        public DataTable GET_BRANCH_SCHEDULE_LIST()
        {
            DataTable dt = new DataTable();
            dt = queryCommandDT_StoredProc("[Utility].[GET_BRANCH_SCHEDULE]");
            return dt;
        }


        public DataTable GET_ADJUSTMENT_LIST()
        {
            DataTable dt = new DataTable();
            dt = queryCommandDT_StoredProc("[Utility].[GET_ADJUSTMENT_LIST]");
            return dt;
        }


        //For Branch Adjustment 02.28.2019
        public DataTable GET_BRANCH_ADJUSTMENT_LIST()
        {
            DataTable dt = new DataTable();
            dt = queryCommandDT_StoredProc("[Utility].[GET_BRANCH_ADJUSTMENT_LIST]");
            return dt;
        }

        public DataTable GET_DRIVER_LIST()
        {
            DataTable dt = new DataTable();
            dt = queryCommandDT_StoredProc("[Utility].[spGET_DRIVER_LIST]");
            return dt;
        }

        //GET HELPER
        public DataTable GET_HELPER_LIST()
        {
            DataTable dt = new DataTable();
            dt = queryCommandDT_StoredProc("[Utility].[spGET_HELPER_LIST]");
            return dt;
        }


        //GET VEHICLE
        public DataTable GET_VEHICLE_LIST()
        {
            DataTable dt = new DataTable();
            dt = queryCommandDT_StoredProc("[Utility].[spGET_VEHICLE_LIST]");
            return dt;
        
        }

        //CRUD AREA
        public void INSERT_PRICE(string _priceCode, double _priceAmount, string _description, string _userCode)
        {
            using (SqlConnection cn = new SqlConnection(CS))
            {

                using (SqlCommand cmd = new SqlCommand("[Utility].[INSERT_PRICE]", cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;


                    cmd.Parameters.AddWithValue("@PRICECODE", _priceCode);
                    cmd.Parameters.AddWithValue("@PRICEAMOUNT", _priceAmount);
                    cmd.Parameters.AddWithValue("@PRICEDESCRIPTION", _description);
                    cmd.Parameters.AddWithValue("@USERCODE", _userCode);


                    cn.Open();

                    cmd.ExecuteNonQuery();

                }
            }
        }
        public void UPDATE_PRICE(string _priceCode, double _priceAmount, string _description, string _userCode)
        {
            using (SqlConnection cn = new SqlConnection(CS))
            {

                using (SqlCommand cmd = new SqlCommand("[Utility].[UPDATE_PRICE]", cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;


                    cmd.Parameters.AddWithValue("@PRICECODE", _priceCode);
                    cmd.Parameters.AddWithValue("@PRICEAMOUNT", _priceAmount);
                    cmd.Parameters.AddWithValue("@PRICEDESCRIPTION", _description);
                    cmd.Parameters.AddWithValue("@USERCODE", _userCode);


                    cn.Open();

                    cmd.ExecuteNonQuery();

                }
            }
        }


        //PARTNER PRICE SETUP
        public void INSERT_PARTNER_PRICE(string _partnerCode,string _itemCode,string _priceCode, string _description, string _userCode)
        {
            using (SqlConnection cn = new SqlConnection(CS))
            {

                using (SqlCommand cmd = new SqlCommand("[Utility].[INSERT_PARTNER_PRICE_SETUP]", cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@PARTNERCODE", _partnerCode);
                    cmd.Parameters.AddWithValue("@ITEMCODE", _itemCode);
                    cmd.Parameters.AddWithValue("@PRICECODE", _priceCode);
                    cmd.Parameters.AddWithValue("@DESCRIPTION", _description);
                    cmd.Parameters.AddWithValue("@USERCODE", _userCode);


                    cn.Open();

                    cmd.ExecuteNonQuery();

                }
            }
        }

        public void UPDATE_PARTNER_PRICE(int _ppId,string _priceCode, string _description, string _userCode)
        {
            using (SqlConnection cn = new SqlConnection(CS))
            {

                using (SqlCommand cmd = new SqlCommand("[Utility].[UPDATE_PARTNER_PRICE_SETUP]", cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@ID", _ppId);
                    cmd.Parameters.AddWithValue("@PRICECODE", _priceCode);
                    cmd.Parameters.AddWithValue("@DESCRIPTION", _description);
                    cmd.Parameters.AddWithValue("@USERCODE", _userCode);


                    cn.Open();

                    cmd.ExecuteNonQuery();

                }
            }
        }

        //LOCATION AREA
        public void INSERT_LOCATION_AREA(string _laCode, string _laName, string _userCode)
        {
            using (SqlConnection cn = new SqlConnection(CS))
            {

                using (SqlCommand cmd = new SqlCommand("[Utility].[INSERT_LOCATION_AREA]", cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;


                    cmd.Parameters.AddWithValue("@LACODE", _laCode);
                    cmd.Parameters.AddWithValue("@LANAME", _laName);
                    cmd.Parameters.AddWithValue("@USERCODE", _userCode);


                    cn.Open();

                    cmd.ExecuteNonQuery();

                }
            }
        }
        public void UPDATE_LOCATION_AREA(string _laCode, string _laName, string _userCode)
        {
            using (SqlConnection cn = new SqlConnection(CS))
            {

                using (SqlCommand cmd = new SqlCommand("[Utility].[UPDATE_LOCATION_AREA]", cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;


                    cmd.Parameters.AddWithValue("@LACODE", _laCode);
                    cmd.Parameters.AddWithValue("@LANAME", _laName);
                    cmd.Parameters.AddWithValue("@USERCODE", _userCode);


                    cn.Open();

                    cmd.ExecuteNonQuery();

                }
            }
        }


        //STORAGE AREA

        public void INSERT_STORAGE_AREA(string _storageCode, string _storageName, string _remarks, string _userCode)
        {
            using (SqlConnection cn = new SqlConnection(CS))
            {

                using (SqlCommand cmd = new SqlCommand("[Utility].[INSERT_STORAGE_AREA]", cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;


                    cmd.Parameters.AddWithValue("@STORAGECODE", _storageCode);
                    cmd.Parameters.AddWithValue("@STORAGENAME", _storageName);
                    cmd.Parameters.AddWithValue("@REMARKS", _remarks);
                    cmd.Parameters.AddWithValue("@USERCODE", _userCode);


                    cn.Open();

                    cmd.ExecuteNonQuery();

                }
            }
        }
        public void UPDATE_STORAGE_AREA(string _storageCode, string _storageName, string _remarks, string _userCode)
        {
            using (SqlConnection cn = new SqlConnection(CS))
            {

                using (SqlCommand cmd = new SqlCommand("[Utility].[UPDATE_STORAGE_AREA]", cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;


                    cmd.Parameters.AddWithValue("@STORAGECODE", _storageCode);
                    cmd.Parameters.AddWithValue("@STORAGENAME", _storageName);
                    cmd.Parameters.AddWithValue("@REMARKS", _remarks);
                    cmd.Parameters.AddWithValue("@USERCODE", _userCode);


                    cn.Open();

                    cmd.ExecuteNonQuery();

                }
            }
        }

        //UPDATE BRANCH SCHEDULE
        public void UPDATE_BRANCH_SCHEDULE(int _schedID, bool _M, bool _T, bool _W, bool _Th, bool _F, bool _Sa, bool _S, string _userCode)
        {
            using (SqlConnection cn = new SqlConnection(CS))
            {

                using (SqlCommand cmd = new SqlCommand("[Utility].[UPDATE_BRANCH_SCHEDULE_SETUP]", cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;


                    cmd.Parameters.AddWithValue("@SCHEDID", _schedID);
                    cmd.Parameters.AddWithValue("@M", _M);
                    cmd.Parameters.AddWithValue("@T", _T);
                    cmd.Parameters.AddWithValue("@W", _W);
                    cmd.Parameters.AddWithValue("@Th", _Th);
                    cmd.Parameters.AddWithValue("@F", _F);
                    cmd.Parameters.AddWithValue("@Sa", _Sa);
                    cmd.Parameters.AddWithValue("@S", _S);
                    cmd.Parameters.AddWithValue("@USERCODE", _userCode);


                    cn.Open();

                    cmd.ExecuteNonQuery();

                }
            }
        }
    
        //DRIVER DATA UPDATE
        public void UPDATE_DRIVER_DATA(int _driverId, string _driverName, string _licenseNumber, bool _status)
        {
            using (SqlConnection cn = new SqlConnection(CS))
            {

                using (SqlCommand cmd = new SqlCommand("[Utility].[spUPDATE_DRIVER_DATA]", cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;


                    cmd.Parameters.AddWithValue("@DRIVERID", _driverId);
                    cmd.Parameters.AddWithValue("@DRIVERNAME", _driverName);
                    cmd.Parameters.AddWithValue("@LICENSENUMBER", _licenseNumber);
                    cmd.Parameters.AddWithValue("@STATUS", _status);


                    cn.Open();

                    cmd.ExecuteNonQuery();

                }
            }
        }
    
        //HELPER DATA UPDATE
        public void UPDATE_HELPER_DATA(int _helperID, string _helperName, bool _status)
        {
            using (SqlConnection cn = new SqlConnection(CS))
            {

                using (SqlCommand cmd = new SqlCommand("[Utility].[spUPDATE_HELPER_DATA]", cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;


                    cmd.Parameters.AddWithValue("@HELPERID", _helperID);
                    cmd.Parameters.AddWithValue("@HELPERNAME", _helperName);
                    cmd.Parameters.AddWithValue("@STATUS", _status);


                    cn.Open();

                    cmd.ExecuteNonQuery();

                }
            }
        }

        //VEHICLE DATA UPDATE
        public void UPDATE_VEHICLE_DATA(int _plateID, string _plateNumber, string _vehicleDescription, int _loadCapacity)
        {
            using (SqlConnection cn = new SqlConnection(CS))
            {

                using (SqlCommand cmd = new SqlCommand("[Utility].[spUPDATE_VEHICLE_DATA]", cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;


                    cmd.Parameters.AddWithValue("@PLATEID", _plateID);
                    cmd.Parameters.AddWithValue("@PLATENUMBER", _plateNumber);
                    cmd.Parameters.AddWithValue("@VEHICLEDESCRIPTION", _vehicleDescription);
                    cmd.Parameters.AddWithValue("@LOADCAPACITY", _loadCapacity);


                    cn.Open();

                    cmd.ExecuteNonQuery();

                }
            }
        }
    
    }


}