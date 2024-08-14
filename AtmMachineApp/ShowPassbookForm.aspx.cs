using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace AtmMachineApp
{
    public partial class ShowPassbookForm : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                try
                {
                    userIdTextBox.Text = getUserId().ToString();
                    display();
                }
                catch(Exception ex)
                {
                    Console.WriteLine("Error " + ex.Message);
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


        void display()
        {
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("getPassbookData", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@id", userIdTextBox.Text);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable data = new DataTable();
            sda.Fill(data);
            GridView1.DataSource = data;
            GridView1.DataBind();

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
            if (obj != null)
            {
                id = Convert.ToInt32(obj);
            }
            return id;
        }
    }
}