using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace AtmMachineApp
{
    public partial class OptionsForm : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                Label1.Text = Session["user"].ToString();
                Label1.Visible = true;
            }
            else
            {
                Response.Redirect("LoginForm.aspx");
            }
        }

        protected void LogOutButton_Click(object sender, EventArgs e)
        {
            Session["user"] = null;
            Response.Redirect("LoginForm.aspx");
        }

        protected void DepositButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("DepositForm.aspx");
        }

        protected void WithdrawButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("WithdrawForm.aspx");
        }

        protected void CheckBalanceButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("CheckBalanceForm.aspx");
        }

        protected void ShowPassbookButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("ShowPassbookForm.aspx");
        }
    }
}