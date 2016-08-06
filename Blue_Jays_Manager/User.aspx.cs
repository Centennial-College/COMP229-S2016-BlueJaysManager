using Blue_Jays_Manager.Models.DataAccessLayer;
using Blue_Jays_Manager.Models.DataModels;
using System;
using System.Web.Security;

namespace Blue_Jays_Manager
{
    public partial class User : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                AdminUser user = (AdminUser)Session["AdminUser"];
                LblName.Text = user.FirstName + " " + user.LastName;
                LblEmail.Text = user.Email;
                LblRole.Text = user.Role;

                PasswordPanel.Visible = false;
            }

        }

        protected void LinkBtnPasswordChange_Click(object sender, EventArgs e)
        {
            if (PasswordPanel.Visible)
            {
                PasswordPanel.Visible = false;
            }
            else
            {
                PasswordPanel.Visible = true;
            }

        }

        protected void BtnChangePassword_Click(object sender, EventArgs e)
        {
            AdminUser user = (AdminUser)Session["AdminUser"];

            string currentPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(currentPass.Text, "SHA1");
            string newPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(newPass.Text, "SHA1");
            int rowAffected = 0;

            if (user.Password == currentPassword)
            {
                rowAffected = AdminUserDataLayer.ChangeUserPassword(user.Id, newPassword);
            }

            if (rowAffected > 0)
            {
                LblConfirm.Text = "Password successfully changed";
                LblConfirm.ForeColor = System.Drawing.Color.Green;
                PasswordPanel.Visible = false;
                currentPass.Text = "";
                newPass.Text = "";
                confirmPass.Text = "";
            }
            else
            {
                LblConfirm.Text = "Password could not be changed. Please see techinical department.";
                LblConfirm.ForeColor = System.Drawing.Color.Green;
            }
        }
    }
}