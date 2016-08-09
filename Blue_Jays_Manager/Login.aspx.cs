using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Caching;
using System.Web.Security;
using Blue_Jays_Manager.Models.DataAccessLayer;
using Blue_Jays_Manager.Models.DataModels;

namespace Blue_Jays_Manager
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (Session["login"].ToString() == "loggedIn")
                {
                    FormsAuthentication.SignOut();
                    Session["login"] = "loggedOut";
                    Session["AdminUser"] = null;
                    Server.Transfer("~/Default.aspx", false);
                }
            }
        }


        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            var user = AdminUserDataLayer.LogIn(UserName.Text, Password.Text);

            if (user.GetType() == typeof(AdminUser))
            {
                AdminUser admin = (AdminUser)user;
                Session["AdminUser"] = admin;
                FormsAuthentication.RedirectFromLoginPage(UserName.Text, checkboxRemeber.Checked);
                Session["Name"] = admin.FirstName + " " + admin.LastName;
                Session["login"] = "loggedIn";
            }
            else
            {

                if (user.ToString() == "Account Locked. Please Contact Administrator")
                {
                    DataRetrieval retrieve = new DataRetrieval();
                    List<CoachRoster> roster = retrieve.SelectAllCoaches();
                    Cache["CoachRoster"] = roster;
                }
                InvalidLabel.Text = user.ToString();
                InvalidLabel.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void PasswordLinkBtn_Click(object sender, EventArgs e)
        {
            Server.Transfer("JaysReset.aspx?id=password");
        }

        protected void UsernameLinkBtn_Click(object sender, EventArgs e)
        {
            Server.Transfer("JaysReset.aspx?id=username");
        }
    }
}
