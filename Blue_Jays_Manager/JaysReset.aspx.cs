using Blue_Jays_Manager.Models.DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Blue_Jays_Manager
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string value = Request.QueryString["id"];
                if (value == "password")
                {
                    LblReset.Text = "Username:";
                    LblPageHeader.Text = "Request Password Reset";
                    BtnReset.Text = "Reset Password";
                }
                else if (value == "username")
                {
                    LblReset.Text = "Email Address:";
                    LblPageHeader.Text = "Request Admin Username";
                    BtnReset.Text = "Submit";
                }
            }
        }

        protected void BtnReset_Click(object sender, EventArgs e)
        {
            int success = 0;
            if (Request.QueryString["id"] == "password")
            {
                success = AdminUserDataLayer.RequestPasswordReset(reset.Text);

                if (success == 1)
                {
                    ConfirmLbl.Text = "Email has been sent to reset password";
                    ConfirmLbl.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    ConfirmLbl.Text = "Username could not be found";
                    ConfirmLbl.ForeColor = System.Drawing.Color.Red;
                }
            }
            else if (Request.QueryString["id"] == "username")
            {
                //ask for email
                //look up email in database
                //return first and last name, email and username...and send username to email address.
                // show confirmation on label

            }

        }
    }
}