﻿using Blue_Jays_Manager.Models.DataAccessLayer;
using Blue_Jays_Manager.Models.DataModels;
using System;
using System.Diagnostics;
using System.Collections.Specialized;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

namespace Blue_Jays_Manager.Admin
{
    public partial class Players : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Cache["PlayerRoster"] == null)
                {
                    DataRetrieval retrieve = new DataRetrieval();
                    List<PlayerRoster> playerRoster = retrieve.SelectAllPlayers();
                    Cache.Insert("PlayerRoster", playerRoster);
                }

                PlayerRosterGridView1.DataSource = (List<PlayerRoster>)Cache["PlayerRoster"];
                PlayerRosterGridView1.AutoGenerateEditButton = true;
                PlayerRosterGridView1.AutoGenerateDeleteButton = true;
                PlayerRosterGridView1.DataBind();
            }
        }

        protected void PlayerRosterGridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            PlayerRosterGridView1.EditIndex = e.NewEditIndex;
            PlayerRosterGridView1.DataSource = (List<PlayerRoster>)Cache["PlayerRoster"];
            PlayerRosterGridView1.DataBind();

        }

        protected void PlayerRosterGridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            if (Cache["PlayerRoster"] != null)
            {
                List<PlayerRoster> roster = (List<PlayerRoster>)Cache["PlayerRoster"];

                string playerNum = PlayerRosterGridView1.Rows[e.RowIndex].Cells[1].Text;

                PlayerRoster player = roster.SingleOrDefault(x => x.PlayerNum == Convert.ToInt32(playerNum));

                if (player != null)
                {
                    roster.Remove(player);
                    Cache.Insert("PlayerRoster", roster);
                }

                PlayerRosterGridView1.EditIndex = -1;
                PlayerRosterGridView1.DataSource = (List<PlayerRoster>)Cache["PlayerRoster"];
                PlayerRosterGridView1.DataBind();
            }
        }

        protected void PlayerRosterGridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            PlayerRosterGridView1.EditIndex = -1;
            PlayerRosterGridView1.DataSource = (List<PlayerRoster>)Cache["PlayerRoster"];
            PlayerRosterGridView1.DataBind();
        }

        protected void PlayerRosterGridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            if (Cache["PlayerRoster"] != null)
            {

                List<PlayerRoster> roster = (List<PlayerRoster>)Cache["PlayerRoster"];

                IOrderedDictionary rowValues = e.NewValues;

                int playerNum = Convert.ToInt32(PlayerRosterGridView1.Rows[e.RowIndex].Cells[1].Text);

                PlayerRoster player = roster.SingleOrDefault(x => x.PlayerNum == Convert.ToInt32(playerNum));

                player.Name = rowValues["Name"].ToString();
                player.Position = rowValues["Position"].ToString();
                player.Height = Convert.ToInt32(rowValues["Height"]);
                player.Weight = Convert.ToInt32(rowValues["Weight"]);

                roster.Add(player);
                PlayerRosterGridView1.EditIndex = -1;

                PlayerRosterGridView1.DataSource = roster;
                PlayerRosterGridView1.DataBind();
                Cache["PlayerRoster"] = roster;
            }
        }

      
    }
}