using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Blue_Jays_Manager.Models.DataAccessLayer;
using Blue_Jays_Manager.Models.DataModels;
using System.Data;

namespace Blue_Jays_Manager
{
    public partial class Player : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            
            if (!IsPostBack)
            {
                if (Session["login"].ToString() == "loggedIn")
                {
                    Server.Transfer("~/Admin/Players.aspx", false);
                }
                else if(Cache["PlayerRoster"] == null)
                {
                    DataRetrieval retrieve = new DataRetrieval();
                    List<PlayerRoster> playerRoster = retrieve.SelectAllPlayers();
                    Cache.Insert("PlayerRoster", playerRoster);
                }
            }
            PlayerRosterGridView.DataSource = (List<PlayerRoster>)Cache["PlayerRoster"];
            PlayerRosterGridView.AutoGenerateSelectButton = true;
            PlayerRosterGridView.DataBind();
        }


    }
}