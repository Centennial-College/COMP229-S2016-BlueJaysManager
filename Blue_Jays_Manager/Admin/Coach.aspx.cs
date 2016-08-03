using Blue_Jays_Manager.Models.DataAccessLayer;
using Blue_Jays_Manager.Models.DataModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Blue_Jays_Manager.Admin
{
    public partial class Coach : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Cache["CoachRoster"] == null)
                {
                    DataRetrieval retrieve = new DataRetrieval();
                    List<CoachRoster> roster = retrieve.SelectAllCoaches();

                    Cache.Insert("CoachRoster", roster);
                }

                AdminUser user = (AdminUser)Session["AdminUser"];
                if (user.Role == "coach")
                {

                    CoachRosterGridView1.Columns[0].Visible = false;
                    
                    
                }
                CoachRosterGridView1.DataSource = (List<CoachRoster>)Cache["CoachRoster"];
                CoachRosterGridView1.DataBind();
            }
        }

        protected void EnableUser(object sender, GridViewCommandEventArgs e)
        {
            string name = e.CommandArgument.ToString();
            string[] names = name.Split(' ');
            string firstName = names.First();
            string lastName = names.Last();
            int unlocked = 0;

            List<LockedUser> user = AdminUserDataLayer.GetLockedUsers();

            foreach (LockedUser lockedUser in user)
            {
                if (lockedUser.FirstName == firstName && lockedUser.LastName == lastName)
                {
                    if (lockedUser.Role == "coach")
                    {
                        unlocked = AdminUserDataLayer.EnableUserAccount(firstName, lastName);
                    }
                    else
                    {
                        Label1.Text = "If you are a manager you will need to contact IS Department to unlock your account";
                    }
                }
            }

            if (unlocked > 0)
                Label1.Text = "Account unlocked";

        }



    }
}