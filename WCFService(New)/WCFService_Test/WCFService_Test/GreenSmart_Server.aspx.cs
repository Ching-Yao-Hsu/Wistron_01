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
    public partial class GreenSmart_Server : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Return_Data();
        }

        private void Return_Data()
        {
            string str_conn = WebConfigurationManager.ConnectionStrings["GREENSMARTConnectionString"].ConnectionString;
            string str_cmd_dropdownlist = "";
            StringBuilder json = new StringBuilder();

            str_cmd_dropdownlist = "SELECT US.Account, US.ECOGroup FROM UserSetup AS US WHERE US.Account != 'admin'";
            Response.Clear();
            Response.ContentType = "application/json; charset=utf-8";
            using (SqlConnection conn = new SqlConnection(str_conn))
            {
                using (SqlCommand cmd = new SqlCommand(str_cmd_dropdownlist, conn))
                {
                    using (SqlDataAdapter adr = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        adr.Fill(dt);
                        json.Append("[{\"ECOGroup\":\"" + dt.Rows[0]["ECOGroup"].ToString() + "\",\"Account\":\"" + dt.Rows[0]["Account"].ToString() + "\"}");
                        for (int i = 1; i < dt.Rows.Count; i++)
                        {
                            json.Append(",{\"ECOGroup\":\"" + dt.Rows[i]["ECOGroup"].ToString() + "\",\"Account\":\"" + dt.Rows[i]["Account"].ToString() + "\"}");
                        }
                        json.Append("]");
                    }
                }
            }
            Response.Write(json);
            Response.End();
        }
    }
}