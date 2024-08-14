using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Data;

namespace WebApplication3
{
    public partial class Default : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submitbutton_Click(object sender, EventArgs e)
        {
            if (Session["id"] == null)
            {
                string folderPath = Server.MapPath("~/Images/");
                string fileName = Path.GetFileName(FileUpload1.FileName);
                FileUpload1.SaveAs(folderPath + fileName);
                string imagePath = "~/Images/" + fileName;

                int otp = OtpRadioButton1.Checked ? 1 : 0;
                int active = ActiveRadioButton2.Checked ? 1 : 0;

                SqlConnection con = new SqlConnection(cs);
                con.Open();
                SqlCommand cmd = new SqlCommand("InsertUser", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;


                cmd.Parameters.AddWithValue("@user_id", UserIdTextBox1.Text);
                cmd.Parameters.AddWithValue("@Name", NameTextBox2.Text);
                cmd.Parameters.AddWithValue("@Address", AddressTextBox3.Text);
                cmd.Parameters.AddWithValue("@mobileNo", MobileTextBox4.Text);
                cmd.Parameters.AddWithValue("@Email", EmailTextBox5.Text);
                cmd.Parameters.AddWithValue("@otpVerify", otp);
                cmd.Parameters.AddWithValue("@userlayer", LayerDropDownList1.SelectedValue);
                cmd.Parameters.AddWithValue("@Remark", RemarkTextBox6.Text);
                cmd.Parameters.AddWithValue("@isActive", active);
                cmd.Parameters.AddWithValue("@ImagePath", imagePath);


                int i = cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    Label1.Visible = true;
                    Label1.Text = "Image uploaded and data inserted successfully.";
                }
                else
                {
                    Label1.Visible = true;
                    Label1.Text = "Please select a file to upload.";
                }
            }
            else
            {

                string folderPath = Server.MapPath("~/Images/");
                string fileName = Path.GetFileName(FileUpload1.FileName);
                FileUpload1.SaveAs(folderPath + fileName);
                string imagePath = "~/Images/" + fileName;

                int otp = OtpRadioButton1.Checked ? 1 : 0;
                int active = ActiveRadioButton2.Checked ? 1 : 0;

                SqlConnection con = new SqlConnection(cs);
                con.Open();
                SqlCommand cmd = new SqlCommand("UpdateUser", con);
                cmd.CommandType = CommandType.StoredProcedure;


                cmd.Parameters.AddWithValue("@Id", Session["id"]);
                cmd.Parameters.AddWithValue("@user_id", UserIdTextBox1.Text);
                cmd.Parameters.AddWithValue("@Name", NameTextBox2.Text);
                cmd.Parameters.AddWithValue("@Address", AddressTextBox3.Text);
                cmd.Parameters.AddWithValue("@mobileNo", MobileTextBox4.Text);
                cmd.Parameters.AddWithValue("@Email", EmailTextBox5.Text);
                cmd.Parameters.AddWithValue("@otpVerify", otp);
                cmd.Parameters.AddWithValue("@userlayer", LayerDropDownList1.SelectedValue);
                cmd.Parameters.AddWithValue("@Remark", RemarkTextBox6.Text);
                cmd.Parameters.AddWithValue("@isActive", active);
                cmd.Parameters.AddWithValue("@ImagePath", imagePath);

                // Execute the stored procedure
                int result = cmd.ExecuteNonQuery();

                if (result > 0)
                {
                    Session["id"] = "";
                    GridView1.DataBind();
                    Label1.Visible = true;
                    Label1.Text = "Updated successfully.";
                }

            }
            UserIdTextBox1.Text = "";
            NameTextBox2.Text = "";
            AddressTextBox3.Text = "";
            MobileTextBox4.Text = "";
            EmailTextBox5.Text = "";
            OtpRadioButton1.Checked = false;
            LayerDropDownList1.SelectedIndex = 0;
            RemarkTextBox6.Text = "";
            ActiveRadioButton2.Checked = false;
            FileUpload1.Dispose();
            GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

            int selectedIndex = GridView1.SelectedIndex;

            if (selectedIndex >= 0 && selectedIndex < GridView1.Rows.Count)
            {

                GridViewRow selectedRow = GridView1.Rows[selectedIndex];


                if (selectedRow.Cells.Count >= 10)
                {
                    Session["id"] = selectedRow.Cells[1].Text;
                    UserIdTextBox1.Text = selectedRow.Cells[2].Text;
                    NameTextBox2.Text = selectedRow.Cells[3].Text;
                    AddressTextBox3.Text = selectedRow.Cells[4].Text;
                    MobileTextBox4.Text = selectedRow.Cells[5].Text;
                    EmailTextBox5.Text = selectedRow.Cells[6].Text;


                    CheckBox otpVerifyCheckBox = selectedRow.Cells[7].Controls[0] as CheckBox;
                    if (otpVerifyCheckBox != null)
                    {
                        OtpRadioButton1.Checked = otpVerifyCheckBox.Checked;
                    }


                    LayerDropDownList1.SelectedValue = selectedRow.Cells[8].Text;
                    RemarkTextBox6.Text = selectedRow.Cells[9].Text;



                    CheckBox isActiveCheckBox = selectedRow.Cells[10].Controls[0] as CheckBox;
                    if (isActiveCheckBox != null)
                    {
                        ActiveRadioButton2.Checked = isActiveCheckBox.Checked;
                    }
                }
                else
                {
                }
            }
            else
            {
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Session["id"] = "";
            UserIdTextBox1.Text = "";
            NameTextBox2.Text = "";
            AddressTextBox3.Text = "";
            MobileTextBox4.Text = "";
            EmailTextBox5.Text = "";
            OtpRadioButton1.Checked = false;
            LayerDropDownList1.SelectedIndex = 0;
            RemarkTextBox6.Text = "";
            ActiveRadioButton2.Checked = false;
            FileUpload1.Dispose();
        }
    }
}