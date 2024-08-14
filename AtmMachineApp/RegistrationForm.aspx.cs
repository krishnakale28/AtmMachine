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
    public partial class RegistrationForm : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                    get_Quetions();
            }
        }

        protected void Back_button_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoginForm.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(cs);
                con.Open();
                SqlCommand cmd = new SqlCommand("InsertData", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@fname", firstNameTextBox.Text);
                cmd.Parameters.AddWithValue("@lname", lastNameTextBox.Text);
                cmd.Parameters.AddWithValue("@mobile", MobileTextBox.Text);
                cmd.Parameters.AddWithValue("@email", emailTextBox.Text);
                cmd.Parameters.AddWithValue("@address", addressTextBox.Text);
                cmd.Parameters.AddWithValue("@account", accountTextBox.Text);
                cmd.Parameters.AddWithValue("@question", DropDownList1.Text);
                cmd.Parameters.AddWithValue("@answer", answerTextBox.Text);
                cmd.Parameters.AddWithValue("@password", passwordTextBox.Text);

                int result = cmd.ExecuteNonQuery();
                if (result > 0)
                {
                    RegistrationLabel.Text = "Registration Successful !!";
                    RegistrationLabel.ForeColor = System.Drawing.Color.Green;
                    RegistrationLabel.Visible = true;
                    firstNameTextBox.Text = "";
                    lastNameTextBox.Text = "";
                    MobileTextBox.Text = "";
                    emailTextBox.Text = "";
                    addressTextBox.Text = "";
                    accountTextBox.Text = "";
                    //DropDownList1.Text = "";
                    answerTextBox.Text = "";
                    passwordTextBox.Text = "";



                }
                else
                {
                    RegistrationLabel.Text = "Registration Fail !!";
                    RegistrationLabel.ForeColor = System.Drawing.Color.Red;
                    RegistrationLabel.Visible = true;

                }
            }
            catch(Exception ex)
            {
                dublicatAcLabel.Visible = true;
                Console.WriteLine(ex.Message);
            }
           

        }
        void get_Quetions()
        {
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlDataAdapter sda=new SqlDataAdapter("exec getQuestion", con);
            DataTable data = new DataTable();
            sda.Fill(data);
            DropDownList1.DataSource = data;
            DropDownList1.DataTextField = "name";
            DropDownList1.DataBind();
        }
    }
}