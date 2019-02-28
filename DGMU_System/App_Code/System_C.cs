using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Main
/// </summary>

namespace DGMU_System
{
   

    public class System_C : Base_C
{
    
    public System_C()
	{
		//
		// TODO: Add constructor logic here
		//
	}
        string username;
        string usercode;
        public string _USERNAME
        {
            get
            {
                return username;
            }
            set
            {
                username = value;
            }
        }
        public string _USERCODE
        {
            get
            {
                return usercode;
            }
            set
            {
                usercode = value;
            }
        }

        public DateTime GET_SERVER_DATE_TIME()
    {
        DateTime ServerDT;

        using (SqlConnection cn = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("[xSystem].[GET_SERVER_DATE_TIME]", cn))
            {

                cn.Open();

                ServerDT = (DateTime)cmd.ExecuteScalar();
            }

            return ServerDT;
        }
    }

        public DataSet GET_USER_MENU()
    {
        DataSet ds = new DataSet();
        using (SqlConnection cn = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("[xSystem].[GET_MENU]", cn))
            
            {
                cmd.CommandType = CommandType.StoredProcedure;
               
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
            }
        }

        return ds;
    }

        public bool CHECK_USER(string _username, string _password)
        {
            bool x = false;

            using (SqlConnection cn = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("[xSystem].[spVALIDATE_USER]", cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@USERCODE", _username);
                    cmd.Parameters.AddWithValue("@PASSWORD", _password);

                    cn.Open();

                   SqlDataReader dr = cmd.ExecuteReader();

                    if (dr.HasRows)
                    {
                        x = true;

                        while (dr.Read())
                        {
                            _USERCODE = dr["UserCode"].ToString();
                            _USERNAME = dr["UserName"].ToString();
                        }
                    }
                    else { x = false; }




                }
            }

            return x;
        }


    public int SERIESNUMBER { get; set; }

    //For Transaction Process
    public string GENERATE_SERIES_NUMBER_TRANS(string _prefixCode)
    {
        SERIESNUMBER = 0;
        string PrefixCode = "";
        string AutoNumber = "";
        bool bIsNumberOnly = false;

        //try
        //{
        using (SqlConnection cn = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("xSystem.GET_SERIES_NUMBER", cn))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@PREFIXCODE", _prefixCode);

                cn.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {

                    while (dr.Read())
                    {
                        PrefixCode = dr["PrefixCode"].ToString();
                        bIsNumberOnly = (bool) dr["IsNumberOnly"];

                        if ((int)dr["Series"] > 0)
                        {

                            SERIESNUMBER = (int)dr["Series"] + 1;

                            /*Format Transaction AutoNumber
                             * UP TO 999999 AutoNumbers
                             */

                            if (SERIESNUMBER > 999999)
                            {
                                if (bIsNumberOnly)
                                {
                                    AutoNumber = SERIESNUMBER.ToString();
                                }
                                else
                                { 
                                AutoNumber = PrefixCode +  SERIESNUMBER;
                                }
                            }
                            else if (SERIESNUMBER > 99999)
                            {
                                if (bIsNumberOnly)
                                {
                                    AutoNumber = "00" + SERIESNUMBER;
                                }
                                else
                                {
                                    AutoNumber = PrefixCode + "00" + SERIESNUMBER;
                                }
                            }
                            else if (SERIESNUMBER > 9999)
                            {
                                if (bIsNumberOnly)
                                {
                                    AutoNumber = "000" + SERIESNUMBER;
                                }
                                else
                                {
                                    AutoNumber = PrefixCode + "000" + SERIESNUMBER;
                                }

                            }

                            else if (SERIESNUMBER > 999)
                            {
                                if (bIsNumberOnly)
                                {
                                    AutoNumber = "0000" + SERIESNUMBER;
                                }
                                else
                                {
                                    AutoNumber = PrefixCode + "0000" + SERIESNUMBER;
                                }

                            }

                            else if (SERIESNUMBER > 99)
                            {
                                if (bIsNumberOnly)
                                {
                                    AutoNumber = "00000" + SERIESNUMBER;
                                }
                                else
                                {
                                    AutoNumber = PrefixCode + "00000" + SERIESNUMBER;
                                }
                            }

                            else if (SERIESNUMBER > 9)
                            {
                                if (bIsNumberOnly)
                                {
                                    AutoNumber = "000000" + SERIESNUMBER;
                                }
                                else
                                {
                                    AutoNumber = PrefixCode + "000000" + SERIESNUMBER;
                                }
                            }


                            else
                            {
                                if (bIsNumberOnly)
                                {
                                    AutoNumber = "000000" + SERIESNUMBER;
                                }
                                else
                                {
                                    AutoNumber = PrefixCode + "000000" + SERIESNUMBER;
                                }

                            }

                        }

                        else
                        {
                            SERIESNUMBER = SERIESNUMBER + 1;
                            if (bIsNumberOnly)
                            {
                                AutoNumber = "000000" + SERIESNUMBER;
                            }
                            else
                            {
                                AutoNumber = PrefixCode + "000000" + SERIESNUMBER;
                            }


                        }
                    }

                }


            }
        }

        //}

        //catch { 

        //}


        return AutoNumber;

    }


    public void UPDATE_SERIES_NUMBER(string _prefixCode)
    {
        using (SqlConnection cn = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("xSystem.UPDATE_SERIES_NUMBER", cn))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@PREFIXCODE", _prefixCode);

                cn.Open();

                cmd.ExecuteNonQuery();

            }
        }

    }


        //VERSION 1[
        public void PRE_INITIALIZE_ENDING_STOCK()
    {
        using (SqlConnection cn = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("xSystem.PRE_INSERT_ENDING_STOCK", cn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cn.Open();

                cmd.ExecuteNonQuery();

            }
        }
    }

        //VERSION 2 (Current Use)
        public void INITIALIZE_OPENING_ENDING_STOCK()
        {
            using (SqlConnection cn = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("[Trans].[STOCK_OPENING_ENDING_DAILY]", cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cn.Open();

                    cmd.ExecuteNonQuery();

                }
            }
        }
    }

   


}