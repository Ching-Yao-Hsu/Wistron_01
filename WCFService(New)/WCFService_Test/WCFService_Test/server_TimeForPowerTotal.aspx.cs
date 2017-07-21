using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Text;

namespace WCFService_Test
{
    public partial class server_TimeForPowerTotal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Return_Data();
            }
            else
            {
                Return_Data(Int16.Parse(Request.Form["ECO_Group_account"].ToString()));
            }            
        }

        //撈取
        private void Return_Data()
        {

            string str_conn = WebConfigurationManager.ConnectionStrings["ECOSMARTConnectionString"].ConnectionString;
            string str_cmd_dropdownlist = "SELECT [ECO_Group],[Account] FROM [AdminSetup] WHERE Account != 'Admin'";
            using (SqlConnection conn = new SqlConnection(str_conn))
            {
                using (SqlCommand cmd = new SqlCommand(str_cmd_dropdownlist, conn))
                {
                    using (SqlDataAdapter adr = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        adr.Fill(dt);
                        string[] _conn_DB_english = new string[(dt.Rows.Count)];
                        string[] _conn_DB_chinese = new string[(dt.Rows.Count)];
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            _conn_DB_english[i] = dt.Rows[i]["Account"].ToString();
                            _conn_DB_chinese[i] = dt.Rows[i]["ECO_Group"].ToString();
                        }
                        Session["Account"] = _conn_DB_english;
                        Session["ECO_Group"] = _conn_DB_chinese;
                    }
                }
            }
            string[] conn_DB = (string[])Session["Account"];
            string[] conn_DB_chinese = (string[])Session["ECO_Group"];

            Response.Write(conn_DB[conn_DB.Length-1]);



            string str_conn_float = "";
            string str_cmd_shichi = "";
            StringBuilder json = new StringBuilder();
            Response.Clear();
            Response.ContentType = "application/json; charset=utf-8";

            json.Append("[");
            //json.Append("\"Account\":[");
            //for (int i = 0; i < conn_DB.Length - 1; i++)
            //{                
            //    json.Append("{\"Name\":\"" + conn_DB[i] + "\"},");
            //}
            //json.Append("{\"Name\":\"" + conn_DB[conn_DB.Length - 1] + "\"}");
            //json.Append("],");


            for (int i = 0; i < conn_DB.Length - 2; i++)
            {
                //json.Append("\"" + conn_DB[i] + "\":[");
                str_conn_float = WebConfigurationManager.ConnectionStrings["ECO_" + conn_DB[i] + "ConnectionString"].ConnectionString;
                str_cmd_shichi = "SELECT top 1 [W], [KWh] , ([KWh]*3) as powertotal FROM [PowerRecord]";
                using (SqlConnection conn = new SqlConnection(str_conn_float))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand(str_cmd_shichi, conn))
                    {
                        SqlDataReader dr = cmd.ExecuteReader();
                        if (dr.HasRows)
                        {
                            dr.Read();
                            json.Append("{\"Name\":\"" + conn_DB_chinese[i] + "\",\"W\":\"" + dr["W"].ToString() + "\",\"KWh\":\"" + dr["KWh"].ToString() + "\",\"powertotal\":\"" + dr["powertotal"].ToString() + "\"},");
                        }
                        dr.Close();
                    }
                }
                //json.Append("],");
            }
            //json.Append("\"" + conn_DB[(conn_DB.Length - 1)] + "\":[");
            str_conn_float = WebConfigurationManager.ConnectionStrings["ECO_" + conn_DB[(conn_DB.Length - 1)] + "ConnectionString"].ConnectionString;
            str_cmd_shichi = "SELECT top 1 [W], [KWh] , ([KWh]*3) as powertotal FROM [PowerRecord]";
            using (SqlConnection conn = new SqlConnection(str_conn_float))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand(str_cmd_shichi, conn))
                {
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        dr.Read();
                        json.Append("{\"Name\":\"" + conn_DB_chinese[(conn_DB_chinese.Length - 1)] + "\",\"W\":\"" + dr["W"].ToString() + "\",\"KWh\":\"" + dr["KWh"].ToString() + "\",\"powertotal\":\"" + dr["powertotal"].ToString() + "\"}");
                    }
                    dr.Close();
                }
            }
            json.Append("]");

            Response.Write(json);
            Response.End();
        }



        private void Return_Data(int _count)
        {            
            
        }
    }
}