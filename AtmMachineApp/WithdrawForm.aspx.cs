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
using System.Linq.Expressions;

namespace AtmMachineApp
{
    public partial class WithdrawForm : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        int userId;
        double mainBal;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                accountLabel.Text = Session["user"].ToString();
                accountLabel.Visible = true;
            }
            else
            {
                Response.Redirect("LoginForm.aspx");
            }
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            try
            {
                userId = getId_usingAc();
                mainBal = getMainBal();
                int amount = Convert.ToInt32(WithdrawTextBox.Text);

                if (amount > 0 && amount < mainBal && amount <= 120000)
                {
                    Random random = new Random();
                    long randomNo = (long)random.Next(2023023001, 2023029999);
                    string randomNumber = randomNo.ToString();
                    DateTime date = DateTime.Now;
                    double t_amount = Convert.ToDouble(WithdrawTextBox.Text);



                    SqlConnection con = new SqlConnection(cs);
                    con.Open();
                    SqlCommand cmd = new SqlCommand("WithdrawMoney", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@t_id", randomNumber);
                    cmd.Parameters.AddWithValue("@t_date", date);
                    cmd.Parameters.AddWithValue("@t_remark", "Withdrawl");
                    cmd.Parameters.AddWithValue("@user_id", userId);
                    cmd.Parameters.AddWithValue("@t_type_debit", "-" + WithdrawTextBox.Text);
                    cmd.Parameters.AddWithValue("@t_amount", t_amount);
                    cmd.Parameters.AddWithValue("@c_balance", (double)(mainBal - t_amount));

                    int r = cmd.ExecuteNonQuery();
                    con.Close();

                    if (r > 0)
                    {
                        DisplayLabel.Text = "Amount Withdraw Successful!!";
                        DisplayLabel.ForeColor = System.Drawing.Color.Green;
                        DisplayLabel.Visible = true;
                        WithdrawTextBox.Text = "";
                    }
                    else
                    {
                        DisplayLabel.Text = "Transation Fail!!";
                        DisplayLabel.ForeColor = System.Drawing.Color.Red;
                        DisplayLabel.Visible = true;
                    }
                }
                else if (amount > mainBal)
                {
                    DisplayLabel.Text = "Insufficient Balance !!";
                    DisplayLabel.ForeColor = System.Drawing.Color.Red;
                    DisplayLabel.Visible = true;
                    WithdrawTextBox.Text = "";
                }
                else if(amount > 120000)
                {
                    DisplayLabel.Text = " Plz Enter 120000 Bellow Amount!!";
                    DisplayLabel.ForeColor = System.Drawing.Color.Red;
                    DisplayLabel.Visible = true;
                    WithdrawTextBox.Text = "";
                }
                else
                {
                    DisplayLabel.Text = " Plz Enter Valid Amount!!";
                    DisplayLabel.ForeColor = System.Drawing.Color.Red;
                    DisplayLabel.Visible = true;
                    WithdrawTextBox.Text = "";
                }
            }
            catch (Exception ex)
            {
                DisplayLabel.Text = " Plz Enter Valid Amount!!";
                DisplayLabel.ForeColor = System.Drawing.Color.Red;
                DisplayLabel.Visible = true;
                Console.WriteLine("Error " + ex.Message);
            }
        }

        protected void BackButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("OptionsForm.aspx");
        }

        protected void BackButton_Click1(object sender, EventArgs e)
        {
            Response.Redirect("OptionsForm.aspx");
        }

        int getId_usingAc()
        {
            int id = -1;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("getId", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@acNo", Session["user"].ToString());
            Object obj = cmd.ExecuteScalar();
            con.Close();

            if (obj != null)
            {
                id = Convert.ToInt32(obj);
            }
            return id;
        }

        double getMainBal()
        {
            double bal = 0.0;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("getMainBal", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@id", userId);
            object obj = cmd.ExecuteScalar();
            con.Close();

            if (obj != null)
            {
                bal = Convert.ToDouble(obj);
            }
            return bal;
        }
    }
}