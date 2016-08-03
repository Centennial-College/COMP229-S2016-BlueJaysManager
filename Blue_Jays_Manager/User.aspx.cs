using Blue_Jays_Manager.Models.DataModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Blue_Jays_Manager
{
    public partial class User : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                AdminUser user = (AdminUser)Session["AdminUser"];
                LblName.Text = user.FirstName + " " + user.LastName;
                LblEmail.Text = user.Email;
                LblRole.Text = user.Role;
            }

        }
    }
}