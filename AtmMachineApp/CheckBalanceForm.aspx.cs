using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


namespace AtmMachineApp
{
    public partial class CheckBalanceForm : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                try
                {
                    accountLabel.Text = Session["user"].ToString();
                    UserIdTextBox.Text = getUserId().ToString();
                    AcBalanceTextBox.Text = getBalance().ToString() + ".00";
                }
                catch(Exception ex)
                {
                    Console.WriteLine("Error "+ex.Message);
                }
                    
            }
            else
            {
                Response.Redirect("LoginForm.aspx");
            }
        }

        protected void BackButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("OptionsForm.aspx");
        }

        int getUserId()
        {
            int id = -1;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("getId", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@acNo", Session["user"].ToString());
            object obj = cmd.ExecuteScalar();
            con.Close();
            if(obj != null)
            {
                id = Convert.ToInt32(obj);
            }
            return id;
        }

        double getBalance()
        {
            double bal = 0.0;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("getMainBal", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@id", UserIdTextBox.Text);
            object obj = cmd.ExecuteScalar();
            con.Close();
            if(obj != null)
            {
                bal = Convert.ToDouble(obj);
            }

            return bal;
        }
    }
}