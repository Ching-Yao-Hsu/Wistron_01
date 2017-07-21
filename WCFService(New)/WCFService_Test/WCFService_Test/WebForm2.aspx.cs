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
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Return_Data("twenergy");
        }

        private void Return_Data(string _ECO_Group_account)
        {
            string str_conn = WebConfigurationManager.ConnectionStrings["ECOSMARTConnectionString"].ConnectionString;
            string str_cmd_TreeView = "";
            StringBuilder json = new StringBuilder();

            str_cmd_TreeView = "SELECT M.LineNum,M.InstallPosition FROM AdminSetup AS A";
            str_cmd_TreeView += " INNER JOIN ControllerSetup AS C ON A.Account = C.Account";
            str_cmd_TreeView += " INNER JOIN MeterSetup AS M ON M.ECO_Account = C.ECO_Account";
            str_cmd_TreeView += " WHERE M.LineNum != '' AND A.Account = @Account ORDER BY M.LineNum";

            Response.Clear();
            Response.ContentType = "application/json; charset=utf-8";
            using (SqlConnection conn = new SqlConnection(str_conn))
            {
                using (SqlCommand cmd = new SqlCommand(str_cmd_TreeView, conn))
                {
                    cmd.Parameters.AddWithValue("@Account", _ECO_Group_account);
                    using (SqlDataAdapter adp = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        adp.Fill(dt);
                        json.Append("[{\"id\":\"" + dt.Rows[0]["lineNum"] + "\",\"child\":[],\"remark\":\"" + dt.Rows[0]["InstallPosition"] + "\"}");
                        for (int i = 1; i < dt.Rows.Count; i++)
                        {
                            json.Append(",{\"id\":\"" + dt.Rows[i]["lineNum"] + "\",\"child\":[],\"remark\":\"" + dt.Rows[i]["InstallPosition"] + "\"}");
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