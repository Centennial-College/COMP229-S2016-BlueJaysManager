using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;
using Blue_Jays_Manager.Models.DataAccessLayer;

namespace Blue_Jays_Manager
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["login"].ToString() == "loggedIn")
                {
                    Server.Transfer("~/Admin/User.aspx", false);
                }
            }
        }

        protected void BtnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                int returnCode = AdminUserDataLayer.Register(Password.Text, FirstName.Text, LastName.Text, Email.Text, UserName.Text, Role.SelectedValue);

                if (returnCode == -1)
                {
                    UserExists.Text = "Username is already in use. Please try again";
                    UserExists.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    Response.Redirect("~/Login.aspx");
                }

            }
        }
    }
}