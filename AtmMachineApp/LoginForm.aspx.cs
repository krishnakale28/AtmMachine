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
    public partial class LoginForm : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login_button_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(cs);
                con.Open();
                SqlCommand cmd = new SqlCommand("CheckUserNameAndPass", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@UserName", UserNameTextBox.Text);
                cmd.Parameters.AddWithValue("@Password", PasswordTextBox.Text);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    Session["user"] = UserNameTextBox.Text;
                    Response.Redirect("OptionsForm.aspx");
                    Response.Write("<script>alert('Login Successful !!')</script>");
                }
                else
                {
                    Response.Write("<script>alert('Please Enter Correct Username and Password')</script>");
                    UserNameTextBox.Text = "";
                    PasswordTextBox.Text = "";
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
           
        }

        protected void Register_Button_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegistrationForm.aspx");
        }

        protected void ForgotPwrd_Button_Click(object sender, EventArgs e)
        {
            Response.Redirect("ForgotPasswordForm.aspx");
        }
    }
}