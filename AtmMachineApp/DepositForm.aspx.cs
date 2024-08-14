using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Diagnostics;

namespace AtmMachineApp
{
    public partial class DepositForm : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        int userId;
        double mainBal;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                AccountLabel.Text = Session["user"].ToString();
                AccountLabel.Visible = true;
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

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            try
            {
                userId = getId_usingAc();
                mainBal = getMainBal();
                int deposit = Convert.ToInt32(DepositTextBox.Text);
                if (deposit > 0 && deposit <= 120000)
                {
                    Random random = new Random();
                    long randomNumber = (long)random.Next(2024102011, 2024109011);
                    string randomString = randomNumber.ToString();
                    DateTime date = DateTime.Now;
                    double t_amount = Convert.ToDouble(DepositTextBox.Text);

                    SqlConnection con = new SqlConnection(cs);
                    con.Open();
                    SqlCommand cmd = new SqlCommand("depositMoney", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@t_id", randomString);
                    cmd.Parameters.AddWithValue("@t_date", date);
                    cmd.Parameters.AddWithValue("@t_remark", "Deposit");
                    cmd.Parameters.AddWithValue("@user_id", userId);
                    cmd.Parameters.AddWithValue("@t_type_credit", "+" + DepositTextBox.Text);
                    cmd.Parameters.AddWithValue("@t_amount", t_amount);
                    cmd.Parameters.AddWithValue("@c_balance", (double)(t_amount + mainBal));

                    int result = cmd.ExecuteNonQuery();
                    con.Close();
                    if (result > 0)
                    {
                        DisplayLabel.Text = "Amount Deposited!!";
                        DisplayLabel.ForeColor = System.Drawing.Color.Green;
                        DisplayLabel.Visible = true;
                        DepositTextBox.Text = "";
                    }
                    else
                    {
                        DisplayLabel.Text = "Transaction Fail!!";
                        DisplayLabel.ForeColor = System.Drawing.Color.Red;
                        DisplayLabel.Visible = true;
                    }
                }
                else if(deposit > 120000)
                {
                    DisplayLabel.Text = "Please enter 120000 bellow amount";
                    DisplayLabel.ForeColor = System.Drawing.Color.Red;
                    DisplayLabel.Visible = true;
                    DepositTextBox.Text = "";
                }
                else
                {
                    DisplayLabel.Text = "Please enter valid amount !!";
                    DisplayLabel.ForeColor = System.Drawing.Color.Red;
                    DisplayLabel.Visible = true;
                    DepositTextBox.Text = "";
                }
            }
            catch (Exception ex)
            {
                DisplayLabel.Text = "Please enter valid amount!!";
                DisplayLabel.ForeColor = System.Drawing.Color.Red;
                DisplayLabel.Visible = true;
                DepositTextBox.Text = "";
                Console.WriteLine("Error " + ex.Message);
            }

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

            if(obj != null)
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

            if(obj != null)
            {
                bal = Convert.ToDouble(obj);
            }
            return bal;
        }
    }
}