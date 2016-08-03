using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Blue_Jays_Manager.Models.DataAccessLayer;
using Blue_Jays_Manager.Models.DataModels;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

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
                else if (Cache["PlayerRoster"] == null)
                {
                    DataRetrieval retrieve = new DataRetrieval();

                    // list of rows of players
                    List<PlayerRoster> playerRoster = retrieve.SelectAllPlayers();


                    Cache.Insert("PlayerRoster", playerRoster);
                }
            }
            PlayerRosterGridView.DataSource = (List<PlayerRoster>)Cache["PlayerRoster"];
            PlayerRosterGridView.DataBind();
        }


        protected void submitButton_Click(object sender, EventArgs e)
        {
            //SqlConnection conn;
            //SqlCommand comm;
            //SqlDataReader reader;
            //string searchCriteria = searchCategory.SelectedValue;

            //string connectionString = ConfigurationManager.ConnectionStrings["BlueJaysConnection"].ConnectionString;
            //conn = new SqlConnection(connectionString);

            //switch (searchCriteria)
            //{
            //    case "Player Number":
            //        comm = new SqlCommand(
            //                "SELECT PlayerNum, Name, Position, Height, Weight, DateOfBirth, SkillOrientation FROM PlayerRoster " +
            //                "WHERE PlayerNum=@PlayerNum", conn);
            //        break;
            //    case "Name":
            //        comm = new SqlCommand(
            //                "SELECT PlayerNum, Name, Position, Height, Weight, DateOfBirth, SkillOrientation FROM PlayerRoster " +
            //                "WHERE Name LIKE '%' + @Name + '%'", conn);
            //        break;
            //    default: // position
            //        comm = new SqlCommand(
            //                "SELECT PlayerNum, Name, Position, Height, Weight, DateOfBirth, SkillOrientation FROM PlayerRoster " +
            //                "WHERE Position=@Position", conn);
            //        break;
            //}

            //int playerNum = 0;
            //string searchText;
            //if (searchCriteria == "Player Number" && !int.TryParse(searchTextBox.Text, out playerNum))
            //{
            //    NoRecords.InnerText = "Please enter a valid number!";
            //    NoRecords.Visible = true;
            //    myRepeater.Visible = false;
            //}
            //else if (playerNum < 0)
            //{
            //    NoRecords.InnerText = "Please enter a positive player number!";
            //    NoRecords.Visible = true;
            //    myRepeater.Visible = false;
            //}
            //else
            //{
            //    searchText = searchTextBox.Text;

            //    switch (searchCriteria)
            //    {
            //        case "Player Number":
            //            comm.Parameters.Add("@PlayerNum", System.Data.SqlDbType.Int);
            //            comm.Parameters["@PlayerNum"].Value = playerNum;
            //            break;
            //        case "Name":
            //            comm.Parameters.Add("@Name", System.Data.SqlDbType.NVarChar);
            //            comm.Parameters["@Name"].Value = searchText;
            //            break;
            //        default: // position
            //            comm.Parameters.Add("@Position", System.Data.SqlDbType.NVarChar);
            //            comm.Parameters["@Position"].Value = searchText;
            //            break;
            //    }

            //    try
            //    {
            //        conn.Open();
            //        reader = comm.ExecuteReader();
            //        myRepeater.DataSource = reader;
            //        myRepeater.DataBind();
            //        reader.Close();
            //        if (myRepeater.Items.Count < 1)
            //        {
            //            NoRecords.InnerText = "No Records Available.";
            //            NoRecords.Visible = true;
            //            myRepeater.Visible = false;
            //        }
            //        else
            //        {
            //            NoRecords.Visible = false;
            //            myRepeater.Visible = true;
            //        }
            //    }
            //    catch
            //    {
            //        NoRecords.InnerText = "Error retrieving player data.";
            //        myRepeater.Visible = false;
            //        NoRecords.Visible = true;
            //    }
            //    finally
            //    {
            //        conn.Close();
            //    }
            //}
        }

        protected void PlayerRosterGridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            Server.Transfer("PlayerDetails.aspx?playerNumber=" + PlayerRosterGridView.SelectedRow.Cells[1].Text);
        }
    }
}