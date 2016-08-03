using Blue_Jays_Manager.Models.DataAccessLayer;
using Blue_Jays_Manager.Models.DataModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Blue_Jays_Manager
{
    public partial class Coaches : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Session["login"].ToString() == "loggedIn")
                {
                    Server.Transfer("~/Admin/Coach.aspx", false);
                }
                if (Cache["CoachRoster"] == null)
                {
                    DataRetrieval retrieve = new DataRetrieval();
                    List<CoachRoster> roster = retrieve.SelectAllCoaches();

                    Cache.Insert("CoachRoster", roster);
                }
            }

            CoachRosterGridView.DataSource = (List<CoachRoster>)Cache["CoachRoster"];
            CoachRosterGridView.DataBind();
        }
    }
}