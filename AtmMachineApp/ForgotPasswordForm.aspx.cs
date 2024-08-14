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
    public partial class ForgotPasswordForm : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                    dropdownList_question();
            }
        }

        protected void Back_button_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoginForm.aspx");
        }

        protected void Submit_Button_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(cs);
                con.Open();
                SqlCommand cmd = new SqlCommand("CheckQuestionAndAnswer", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Question", DropDownList1.Text);
                cmd.Parameters.AddWithValue("@Answer", AnswerTextBox.Text);
                cmd.Parameters.AddWithValue("@Mobile", mobileTextBox.Text);

                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    dr.Read();
                    con.Close();

                    con.Open();
                    SqlCommand updatecmd = new SqlCommand("UpdateNewPassword", con);
                    updatecmd.CommandType = CommandType.StoredProcedure;

                    updatecmd.Parameters.AddWithValue("@NewPassword", NewPasswordTextBox.Text);
                    updatecmd.Parameters.AddWithValue("@mobile", mobileTextBox.Text);
                    int result = updatecmd.ExecuteNonQuery();
                    con.Close();
                    if (result > 0)
                    {
                        ForgotPassLabel.Text = "Password Change Successful !!";
                        ForgotPassLabel.ForeColor = System.Drawing.Color.Green;
                        ForgotPassLabel.Visible = true;
                        AnswerTextBox.Text = "";
                        mobileTextBox.Text = "";
                        NewPasswordTextBox.Text = "";
                    }
                    else
                    {
                        ForgotPassLabel.Text = "Please enter valid details!!";
                        ForgotPassLabel.ForeColor = System.Drawing.Color.Red;
                        ForgotPassLabel.Visible = true;
                    }

                }
                else
                {
                    ForgotPassLabel.Text = "Please enter valid details!!";
                    ForgotPassLabel.ForeColor = System.Drawing.Color.Red;
                    ForgotPassLabel.Visible = true;
                    AnswerTextBox.Text = "";
                    mobileTextBox.Text = "";
                    NewPasswordTextBox.Text = "";
                }
            }
            catch(Exception ex)
            {
                Console.WriteLine("Error ", ex.Message);
            }

        }

        void dropdownList_question()
        {
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("exec getQuestion", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            DropDownList1.DataSource = dt;
            DropDownList1.DataTextField = "name";
            DropDownList1.DataBind();
        }
    }
}